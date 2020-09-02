Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49091C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 12:39:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0452820767
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 12:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TNKYGdAT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtRYkKVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0452820767
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4SkNYCglSv9J8cje1XU9eygAcBnBzQsopfiulO90AeI=; b=TNKYGdATkPLfKTH2+cwbmpNW2
	crRFc2zcIU0Nl5HPVF1QCp4qAiTbhwTvupkIID9anYqtibn3sWINRHCviIiOi0DSu0NJZo11QOpEY
	tDWTsXnsrW431hPgUo7pE4Oxqq7BDv/SgOJOQzy7v3Zmc3CZQTbJSLEs8yIHZwszvWm5UEojeKd4X
	4vfrkFXj96pTJI1dhK8WpiC6u7BxQLuNiq16XR3OvW0WAmncQ/NNOIZabVeGkbdCi40oc2n+0jN69
	TzuHWQw8dnla6IlytfI3AW1FuJoABFwtTveyq75oOXLwg8TLaFTVHomoR6TARKoGNNo5wFHoTSbFG
	6YwlonsCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDS2e-0002xH-E0; Wed, 02 Sep 2020 12:39:08 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDS2Z-0002wN-SK; Wed, 02 Sep 2020 12:39:04 +0000
Received: by mail-il1-x144.google.com with SMTP id p13so4812481ils.3;
 Wed, 02 Sep 2020 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zRLk/FVIgnkiAFw6VnkIOm9Nv1tk0FDj+F7At4enkEg=;
 b=MtRYkKVHqC+VWYXYYLmZjSimMPm3gqryGZqZFIRF+5HVd/jnVuPNULKoaPpEtFFIyd
 KpH5fdcOLe9Tsv6YCzel6W2kFhp82VT0Q27i6WrBm97quuXHKftwRqXd9Ns9g0jWgvwF
 IznXdMRs/Ge8sWsOJu0BuDJpqOCYc5jaWvayEXVbKgbli6kAvCk3EGdbheKIjLBbHcCo
 afG17q/J6t4nWIw2D8ohqMGijNhPoolHaaY4nGPE5FGi5rOlGRs4VsZiLzUfO5kigKTE
 n4+gbC5DAhyXuZRxJolelPg8GYKDvzGvhTaStzcIx/WjjBW4/HBd9QbnZkd7tRPaZjLw
 10sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zRLk/FVIgnkiAFw6VnkIOm9Nv1tk0FDj+F7At4enkEg=;
 b=g+O+IKC8iDfaAS06bm3FHbmBosuwaBsFQG9blHVInTu1a9WJR0ZdHNstT0VpUAhUHO
 TJaJKFXJx/xOP/vkh54LmxP9of06xNSbiTVfvgnAOVHA0wt5xwBtNwbf4S6Q9W814Mhv
 FNnVy56VRlbVwAOx7+NX9OOZ/o7hLOXzE0dkTLEbG05z0zdJ/tFfGvnE4DeP+v8Ce4k+
 mg+9Bf4Ex2W/xAxACmuRqSks/8e3vWW45zFz5SW5bI7DT4iFUy3npw3c0f4A5WAuL2ae
 PsDONY5tTQz5Kfte3lGOXSRijf4Q1ilSrJ+eRoOPCsMg5rSPiIilB8vR0CG4rGtv8T//
 OmIQ==
X-Gm-Message-State: AOAM530wb7WWjU3NuE8of3n1yr8X49Kqg74ekBBo5uh3nyBY2QJqN3Aw
 IqduNm6SqkhqMKeDmDpR1qwdO22ehmQo1/buPps=
X-Google-Smtp-Source: ABdhPJwASUwfRhdBE0t0pdzOgOsbUkqg8oaupuBR22h6Rpw3I60+ZiGo0m/hRqXgp+cZzxKBDiUBnrf4CQdniBWqx44=
X-Received: by 2002:a92:4184:: with SMTP id o126mr3764559ila.6.1599050340215; 
 Wed, 02 Sep 2020 05:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200831075911.434-1-linux.amoon@gmail.com>
 <20200831075911.434-2-linux.amoon@gmail.com>
 <7hpn767f6x.fsf@baylibre.com>
 <CANAwSgSjSU3wrgSkg+vE1u7JZKr3-8KHXHbMarvhSGKHXR0Khw@mail.gmail.com>
 <d944e388-8112-4490-bc6d-d7bfc5ee0762@baylibre.com>
 <CANAwSgRyV_Sz3GbLZ__-Ed8nhw5WCbChULVX8hhFLmgSs1tb-A@mail.gmail.com>
 <0845cbc4-cf95-5c00-4294-1b98b159727d@baylibre.com>
In-Reply-To: <0845cbc4-cf95-5c00-4294-1b98b159727d@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 2 Sep 2020 18:08:48 +0530
Message-ID: <CANAwSgR6air7XtJqzNxtj+ucpt-VTsSgjtRNmc7fnfwUyn6xSg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_083903_925783_DEF550A5 
X-CRM114-Status: GOOD (  35.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

hi Neil,

On Wed, 2 Sep 2020 at 12:48, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 01/09/2020 17:29, Anand Moon wrote:
> > Hi Neil,
> >
> > On Tue, 1 Sep 2020 at 18:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 01/09/2020 12:14, Anand Moon wrote:
> >>> Hi Kevin,
> >>>
> >>> Thanks for your review comments and testing.
> >>>
> >>> On Tue, 1 Sep 2020 at 01:36, Kevin Hilman <khilman@baylibre.com> wrote:
> >>>>
> >>>> Anand Moon <linux.amoon@gmail.com> writes:
> >>>>
> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>>>> support the RTC wakealarm feature for suspend and resume.
> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>>>> timer device to prevent it being assigned to /dev/rtc0
> >>>>> which disto userspace tools assume is a clock device.
> >>>>>
> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>> ---
> >>>>> Changes v4
> >>>>> --Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
> >>>>> Changes v3
> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>>>> --Added missing RTC alias so that rtc get assigned correcly,
> >>>>>   as suggested by Chris Hewitt.
> >>>>> changes v2
> >>>>> --Fix the missing INT (GPIOAO.BIT7) pinctrl.
> >>>>> --Fix the missing rtcwakeup.
> >>>>> --Drop the clock not required clock property by the PCF8563 driver.
> >>>>> ---
> >>>>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
> >>>>>  1 file changed, 17 insertions(+)
> >>>>>
> >>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>>>> index 34fffa6d859d..3e2aaa6f48e5 100644
> >>>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>>>> @@ -19,6 +19,8 @@ / {
> >>>>>       aliases {
> >>>>>               serial0 = &uart_AO;
> >>>>>               ethernet0 = &ethmac;
> >>>>> +             rtc0 = &rtc0;
> >>>>> +             rtc1 = &vrtc;
> >>>>>       };
> >>>>>
> >>>>>       dioo2133: audio-amplifier-0 {
> >>>>> @@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
> >>>>>       };
> >>>>>  };
> >>>>>
> >>>>> +&i2c3 {
> >>>>> +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> >>>>> +     pinctrl-names = "default";
> >>>>> +     status = "okay";
> >>>>> +
> >>>>> +     rtc0: rtc@51 {
> >>>>> +             reg = <0x51>;
> >>>>> +             compatible = "nxp,pcf8563";
> >>>>> +             /* RTC INT */
> >>>>> +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> >>>>> +             interrupt-parent = <&gpio_intc>;
> >>>>> +             wakeup-source;
> >>>>> +     };
> >>>>> +};
> >>>>
> >>>> There's still no pinctrl definition for the GPIO pin being used as the
> >>>> IRQ.  It looks like you discussed this with Martin and he pointed you in
> >>>> the right direction in your v3 series, but I don't see it in this
> >>>> patch.
> >>>>
> >>> Yes I had followed the approach suggested by Martin on previous email and IRC.
> >>> but it really did not work out for me in the testing.
> >>>
> >>> rtc-pcf8563 driver does not handle such gpio configuration.
> >>> so the rtc probe will fail if we add gpio pinctl to *pinctrl-0*.
> >>
> >> No need for multiple pinctrl-*, simple add a new pinctrl to the rtc node like:
> >>
> >>
> >> @@ -18,6 +18,8 @@
> >>         aliases {
> >>                 serial0 = &uart_AO;
> >>                 ethernet0 = &ethmac;
> >> +               rtc0 = &rtc0;
> >> +               rtc1 = &vrtc;
> >>         };
> >>
> >>         chosen {
> >> @@ -266,6 +268,17 @@
> >>         status = "okay";
> >>  };
> >>
> >> +&ao_pinctrl {
> >> +       rtc_int_pins: rtc-int {
> >> +               mux {
> >> +                       groups = "GPIOAO_7";
> >> +                       function = "gpio_aobus";
> >> +                       bias-disable;
> >> +                       output-disable;
> >> +               };
> >> +       };
> >> +};
> >> +
> >>  &cec_AO {
> >>         pinctrl-0 = <&cec_ao_a_h_pins>;
> >>         pinctrl-names = "default";
> >> @@ -391,6 +404,23 @@
> >>         };
> >>  };
> >>
> >> +&i2c3 {
> >> +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> >> +       pinctrl-names = "default";
> >> +       status = "okay";
> >> +
> >> +       rtc0: rtc@51 {
> >> +             pinctrl-0 = <&rtc_int_pins>;
> >> +             pinctrl-names = "default";
> >> +             reg = <0x51>;
> >> +             compatible = "nxp,pcf8563";
> >> +             /* RTC INT */
> >> +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> >> +             interrupt-parent = <&gpio_intc>;
> >> +             wakeup-source;
> >> +       };
> >> +};
> >> +
> >>  &ir {
> >>         status = "okay";
> >>         pinctrl-0 = <&remote_input_ao_pins>;
> >>
> >> DISCALIMER: not built or run tested
> >>
> >> Neil
> >>
> >
> > I have built this and tested, but still this gpio pin
>
> Can you remove the "bias-disable" in rtc_int_pins and retry ?
>
> The default bias is pull-up, removing it may cause this.
>
> If it works, can you try "bias-pull-up" ? if it works, keep it and resend with my ack.
>
> Neil
>

Thanks, I was trying on the same lines, but I wanted to tested
some stable kernel where suspend / resume was working,
so I picked 5.7.x stable branch I observed the following opps (warning)
when the device resumes after suspend, after that the device hangs [1]

I am trying to make this work on 5.7.x tree so that we can test on 5.9.x
      /* RTC INT */
      interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
After this small change the device comes back to command prompt.
despite the WARNING.

Problem is on u-boot (Harkernel) is work it breaks on u-boot (mainline).
I observe after suspend /resume the IRQ count is increasing.

# cat /proc/interrupts | grep rtc
 28:          3          0          0          0          0          0
 meson-gpio-irqchip   7 Level     rtc-pcf8563

Best Regards
-Anand

[1] --------------
[root@archl-on2e ~]# rtcwake -d rtc0 -m mem -s 30
rtcwake: wakeup from "mem" using rtc0 at Wed Sep  2 11:30:09 2020
[  285.299119] PM: suspend entry (deep)
[  285.299318] Filesystems sync: 0.000 seconds
[  285.503588] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  285.506269] OOM killer disabled.
[  285.509474] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[  285.518362] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[  285.532810] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  285.660882] Disabling non-boot CPUs ...
[  285.661343] CPU1: shutdown
[  285.661762] psci: CPU1 killed (polled 0 ms)
[  285.667843] CPU2: shutdown
[  285.668575] psci: CPU2 killed (polled 0 ms)
[  285.674892] CPU3: shutdown
[  285.675389] psci: CPU3 killed (polled 0 ms)
[  285.681862] CPU4: shutdown
[  285.682202] psci: CPU4 killed (polled 0 ms)
[  285.688581] CPU5: shutdown
[  285.689035] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 1896000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 17us
alarm=0S
process command 00000001
GPIOA_11/13 off
cec ver:2018/04/19
CEC cfg:0x0000
WAKEUP GPIO cfg:0x00000000
use vddee new table!
kern log_addr:0x00
cec T: 00
err: tx not finish flag
cec reset
Set cec pinmux:0x11
Set cec log_addr:0x10,ADDR0:10
use vddee new table!
exit_reason:0x03
Enter ddr resume
ddr resume time: 125us
store restore gp0 pll
cfg15 3b00000
cfg15 33b00000
Li[  285.695732] Enabling non-boot CPUs ...
[  285.696098] Detected VIPT I-cache on CPU1
[  285.696139] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  285.696523] CPU1 is up
[  285.707551] Detected VIPT I-cache on CPU2
[  285.707592] arch_timer: CPU2: Trapping CNTVCT access
[  285.707605] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  285.708481] cpufreq: cpufreq_online: CPU2: Running at unlisted
freq: 999999 KHz
[  285.729456] cpufreq: cpufreq_online: CPU2: Unlisted initial
frequency changed to: 1000000 KHz
[  285.738099] CPU2 is up
[  285.740422] Detected VIPT I-cache on CPU3
[  285.740444] arch_timer: CPU3: Trapping CNTVCT access
[  285.740452] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  285.740762] CPU3 is up
[  285.758076] Detected VIPT I-cache on CPU4
[  285.758098] arch_timer: CPU4: Trapping CNTVCT access
[  285.758106] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  285.758443] CPU4 is up
[  285.775753] Detected VIPT I-cache on CPU5
[  285.775775] arch_timer: CPU5: Trapping CNTVCT access
[  285.775783] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  285.776120] CPU5 is up
[  285.793825] ------------[ cut here ]------------
[  285.797760] Unbalanced IRQ 28 wake disable
[  285.801830] WARNING: CPU: 3 PID: 420 at kernel/irq/manage.c:800
irq_set_irq_wake+0x154/0x19c
[  285.810180] Modules linked in: rfkill snd_soc_hdmi_codec
dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl meson_dw_hdmi meson_drm
dw_hdmi axg_audio snd_soc_meson_axg_tdmout realtek cec dwmac_generic
sclk_div clk_phase meson_canvas rtc_pcf8563 crct10dif_ce
snd_soc_meson_axg_sound_card snd_soc_meson_g12a_tohdmitx
snd_soc_meson_axg_frddr snd_soc_meson_codec_glue reset_meson_audio_arb
snd_soc_meson_axg_fifo snd_soc_meson_card_utils meson_rng
drm_kms_helper rc_odroid rng_core dwmac_meson8b mdio_mux_meson_g12a
pwm_meson stmmac_platform meson_ir rc_core stmmac rtc_meson_vrtc
mdio_xpcs snd_soc_meson_axg_tdm_interface
snd_soc_meson_axg_tdm_formatter display_connector nvmem_meson_efuse
drm ip_tables x_tables ipv6 nf_defrag_ipv6
[  285.872542] CPU: 3 PID: 420 Comm: rtcwake Not tainted
5.7.19-00001-g28f8adf17e0e-dirty #1
[  285.880646] Hardware name: Hardkernel ODROID-N2 (DT)
[  285.885564] pstate: 80000085 (Nzcv daIf -PAN -UAO)
[  285.890308] pc : irq_set_irq_wake+0x154/0x19c
[  285.894620] lr : irq_set_irq_wake+0x154/0x19c
[  285.898931] sp : ffff80001310bba0
[  285.902209] x29: ffff80001310bba0 x28: ffff0000c84a0e00
[  285.907469] x27: 0000000000000000 x26: 0000000000000000
[  285.912731] x25: 0000000000000003 x24: 0000000000000000
[  285.917992] x23: 0000000000000000 x22: ffff0000c84a0e00
[  285.923253] x21: 00000000ffffffea x20: 000000000000001c
[  285.928514] x19: ffff0000f2771600 x18: 0000000000000030
[  285.933775] x17: 0000000000000001 x16: 0000000000000003
[  285.939037] x15: ffff0000c84a1270 x14: ffffffffffffffff
[  285.944298] x13: ffff80009310b8c7 x12: ffff80001310b8cf
[  285.949559] x11: ffff800011a91000 x10: ffff800011c8a6c8
[  285.954820] x9 : 0000000000000000 x8 : 3220515249206465
[  285.960082] x7 : 636e616c61626e55 x6 : 00000000000001c9
[  285.965343] x5 : 0000000000000001 x4 : 0000000000000000
[  285.970604] x3 : 0000000000000000 x2 : 0000000000000007
[  285.975866] x1 : efc3665be56abd00 x0 : 0000000000000000
[  285.981127] Call trace:
[  285.983545]  irq_set_irq_wake+0x154/0x19c
[  285.987515]  dev_pm_disarm_wake_irq+0x38/0x70
[  285.991824]  device_wakeup_disarm_wake_irqs+0x44/0xa0
[  285.996826]  dpm_resume_noirq+0x18/0x30
[  286.000622]  suspend_devices_and_enter+0x2bc/0x4ac
[  286.005365]  pm_suspend+0x22c/0x2a0
[  286.008815]  state_store+0x8c/0x110
[  286.012266]  kobj_attr_store+0x18/0x30
[  286.015974]  sysfs_kf_write+0x44/0x54
[  286.019595]  kernfs_fop_write+0xfc/0x220
[  286.023478]  __vfs_write+0x1c/0x50
[  286.026841]  vfs_write+0xe4/0x1cc
[  286.030119]  ksys_write+0x6c/0x100
[  286.033482]  __arm64_sys_write+0x1c/0x30
[  286.037366]  el0_svc_common.constprop.0+0x6c/0x170
[  286.042108]  do_el0_svc+0x24/0x90
[  286.045386]  el0_sync_handler+0x114/0x180
[  286.049352]  el0_sync+0x158/0x180
[  286.052629] ---[ end trace cb15e81a7b13bf49 ]---
[  286.058128] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  286.064731] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode
ttle core clk resume rate 1896000000
Big core clk resume rate 5000[  286.083729] usb usb1: root hub lost
power or was reset
[  286.083982] usb usb2: root hub lost power or was reset
0000
[  286.338419] dwc3-meson-g12a ffe09000.usb: switching to Device Mode
[  286.442707] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
using xhci-hcd
[  286.594290] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
[  286.820893] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 3
using xhci-hcd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
