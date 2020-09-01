Return-Path: <SRS0=+E+O=CK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10596C433E7
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 15:32:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7511D20866
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 15:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PtJNBJRP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhxT9fIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7511D20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/0uFS15e3u7IO+8JplLPAtwLO79gp+7Ah/Tj804lotg=; b=PtJNBJRPHOCTWY/NpptwThp6g
	pDusRE2Jl7mURerS5zY69+7DO/n9QV4XbUNCeSiNYa7JvrSd/2uov+ymin6kPEAWplxzlQ3ptcZRA
	FWresTrLL7CoTLBKkg0nwHNL/nxMR/j/A2kaMkIf/zE5Kp1xmFsqb2YRmyb2kAu/SI8NTI5LaV/sz
	8D2iY+EVf3iHZXol0gHQBR4DOKcsF16klOcjMw3GuL9z4H27J0Q5O6qj5a9CveJWhn0ASzFWvJOjD
	1cYSRxua7x8NJnAmmgtUrJ5KhYqFIDpP4gddBEGbkCLSJ8bRmIgbkgByxWbxc4beGRaszT/Yek42h
	25fz1q8BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8Gl-0004BN-7k; Tue, 01 Sep 2020 15:32:23 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8Dt-0002N1-Qa; Tue, 01 Sep 2020 15:29:28 +0000
Received: by mail-io1-xd44.google.com with SMTP id r9so1694333ioa.2;
 Tue, 01 Sep 2020 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pHxjuSV9NUzS/wJaT9o8NUKofpfERj3ovhpXmxzBlOw=;
 b=MhxT9fINlZVmPLEYgL0EIrm38OZ2GJ+bOJdK4EkEBk8uVXVoxNzKWKSRCnZ+hQTk++
 kC2jXW0z86WBrXhnlDoOz6SPqwG15swO9G8pzOXo1JS0VQzVfb0MPmOqDe5avkJRPu1s
 Qd70DrCCdUzFDqxK3jbAZMkA0c4TpcPh+YZjc6MdNTVfGyoh5q9KBzRxN5QOKoveRQOT
 tGwMQo5B3E3+LJmNWjpETuZvMkS5bNiKw+VDud3h+7VjzRQESczpmXHqS9e81c5ySLam
 GsAq/VyViCPpfBn44P3xdUJvYjxeDCOdNiObeEq+YIDOMbajpcqPktzyZbEGsCMnNMSi
 MtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHxjuSV9NUzS/wJaT9o8NUKofpfERj3ovhpXmxzBlOw=;
 b=QO1jHKvI1ZYU0XjT0xIMkrB2m7yFx5QS6sAou3m+uOGM3yCQrTyV/M1VnSsQ67i3BC
 2oc2HVuT1ztX3KB3JOoSN4dXgG3X/ZykTaTEl2mFTlDaI173Ag1Th4DtwLaELs+bjUXn
 o/9ZC8W8xIS00Ej6dsW6QXyN6M7lLBK4IzKoVTJ17RXVmpWLYec7wkZn5biskNaS/FjJ
 Q+6Yae5VcKT466FE2L+zT976J/JerRPQFL0N+rKCDytI32m4ROd/WMaO/O8nD8jmH7Sr
 Ov0i5M2C05SOiqeUYytdpBshdUBnVSqtOPl7MnoGd6/rofhxwb+DfsZbPGEmBrhoRhAf
 niUA==
X-Gm-Message-State: AOAM530o9gu5h1iKO9Hdax14MjifYaFhmkku+IwKI0bSSkMgxvdzHwfv
 3ZDFEjZOHJt5GI90aPnOhG4n1lAAlC43MxVE3+E=
X-Google-Smtp-Source: ABdhPJyFdViTJqc5756mey3f2srm+eK8JehZ/mane868jiiGbeUQEZx6IFVHx/nprrNwJ/g3cqElGynC47LDYIBKVrs=
X-Received: by 2002:a02:3f2d:: with SMTP id d45mr1920165jaa.120.1598974163299; 
 Tue, 01 Sep 2020 08:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200831075911.434-1-linux.amoon@gmail.com>
 <20200831075911.434-2-linux.amoon@gmail.com>
 <7hpn767f6x.fsf@baylibre.com>
 <CANAwSgSjSU3wrgSkg+vE1u7JZKr3-8KHXHbMarvhSGKHXR0Khw@mail.gmail.com>
 <d944e388-8112-4490-bc6d-d7bfc5ee0762@baylibre.com>
In-Reply-To: <d944e388-8112-4490-bc6d-d7bfc5ee0762@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 1 Sep 2020 20:59:12 +0530
Message-ID: <CANAwSgRyV_Sz3GbLZ__-Ed8nhw5WCbChULVX8hhFLmgSs1tb-A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112926_286511_E81672BE 
X-CRM114-Status: GOOD (  29.61  )
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

Hi Neil,

On Tue, 1 Sep 2020 at 18:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 01/09/2020 12:14, Anand Moon wrote:
> > Hi Kevin,
> >
> > Thanks for your review comments and testing.
> >
> > On Tue, 1 Sep 2020 at 01:36, Kevin Hilman <khilman@baylibre.com> wrote:
> >>
> >> Anand Moon <linux.amoon@gmail.com> writes:
> >>
> >>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> >>> support the RTC wakealarm feature for suspend and resume.
> >>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> >>> timer device to prevent it being assigned to /dev/rtc0
> >>> which disto userspace tools assume is a clock device.
> >>>
> >>> Cc: Neil Armstrong <narmstrong@baylibre.com>
> >>> Cc: Kevin Hilman <khilman@baylibre.com>
> >>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> >>> Changes v4
> >>> --Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
> >>> Changes v3
> >>> --Drop the INI GPIOAO.BIT7 pinctrl.
> >>> --Added missing RTC alias so that rtc get assigned correcly,
> >>>   as suggested by Chris Hewitt.
> >>> changes v2
> >>> --Fix the missing INT (GPIOAO.BIT7) pinctrl.
> >>> --Fix the missing rtcwakeup.
> >>> --Drop the clock not required clock property by the PCF8563 driver.
> >>> ---
> >>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> index 34fffa6d859d..3e2aaa6f48e5 100644
> >>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> >>> @@ -19,6 +19,8 @@ / {
> >>>       aliases {
> >>>               serial0 = &uart_AO;
> >>>               ethernet0 = &ethmac;
> >>> +             rtc0 = &rtc0;
> >>> +             rtc1 = &vrtc;
> >>>       };
> >>>
> >>>       dioo2133: audio-amplifier-0 {
> >>> @@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
> >>>       };
> >>>  };
> >>>
> >>> +&i2c3 {
> >>> +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> >>> +     pinctrl-names = "default";
> >>> +     status = "okay";
> >>> +
> >>> +     rtc0: rtc@51 {
> >>> +             reg = <0x51>;
> >>> +             compatible = "nxp,pcf8563";
> >>> +             /* RTC INT */
> >>> +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> >>> +             interrupt-parent = <&gpio_intc>;
> >>> +             wakeup-source;
> >>> +     };
> >>> +};
> >>
> >> There's still no pinctrl definition for the GPIO pin being used as the
> >> IRQ.  It looks like you discussed this with Martin and he pointed you in
> >> the right direction in your v3 series, but I don't see it in this
> >> patch.
> >>
> > Yes I had followed the approach suggested by Martin on previous email and IRC.
> > but it really did not work out for me in the testing.
> >
> > rtc-pcf8563 driver does not handle such gpio configuration.
> > so the rtc probe will fail if we add gpio pinctl to *pinctrl-0*.
>
> No need for multiple pinctrl-*, simple add a new pinctrl to the rtc node like:
>
>
> @@ -18,6 +18,8 @@
>         aliases {
>                 serial0 = &uart_AO;
>                 ethernet0 = &ethmac;
> +               rtc0 = &rtc0;
> +               rtc1 = &vrtc;
>         };
>
>         chosen {
> @@ -266,6 +268,17 @@
>         status = "okay";
>  };
>
> +&ao_pinctrl {
> +       rtc_int_pins: rtc-int {
> +               mux {
> +                       groups = "GPIOAO_7";
> +                       function = "gpio_aobus";
> +                       bias-disable;
> +                       output-disable;
> +               };
> +       };
> +};
> +
>  &cec_AO {
>         pinctrl-0 = <&cec_ao_a_h_pins>;
>         pinctrl-names = "default";
> @@ -391,6 +404,23 @@
>         };
>  };
>
> +&i2c3 {
> +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +
> +       rtc0: rtc@51 {
> +             pinctrl-0 = <&rtc_int_pins>;
> +             pinctrl-names = "default";
> +             reg = <0x51>;
> +             compatible = "nxp,pcf8563";
> +             /* RTC INT */
> +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> +             interrupt-parent = <&gpio_intc>;
> +             wakeup-source;
> +       };
> +};
> +
>  &ir {
>         status = "okay";
>         pinctrl-0 = <&remote_input_ao_pins>;
>
> DISCALIMER: not built or run tested
>
> Neil
>

I have built this and tested, but still this gpio pin

# cat /sys/kernel/debug/gpio
gpiochip1: GPIOs 412-426, parent:
platform/ff800000.sys-ctrl:pinctrl@14, aobus-banks:
 gpio-414 (                    |enable              ) out lo
 gpio-420 (                    |regulator-tflash_vdd) out hi
 gpio-421 (                    |TF_IO               ) out lo
 gpio-423 (                    |n2:blue             ) out lo

gpiochip0: GPIOs 427-511, parent: platform/ff634400.bus:pinctrl@40,
periphs-banks:
 gpio-442 (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-447 (                    |usb-hub-reset       ) out hi
 gpio-448 (                    |regulator-hub_5v    ) out hi
 gpio-449 (                    |regulator-usb_pwr_en) out lo
 gpio-464 (                    |reset               ) out hi ACTIVE LOW
 gpio-474 (                    |cd                  ) in  lo ACTIVE LOW

This change fails on *u-boot Hardkernel*
There is some timing issue, some time it wakes up and
some time it gets stuck.

# rtcwake -d /dev/rtc0 -s 10
rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Sep  1 14:05:47 2020
[   35.565415] PM: suspend entry (deep)
[   35.565589] Filesystems sync: 0.000 seconds
[   72.670162] cfg80211: failed to load regulatory.db
[   72.670164] Freezing user space processes ... (elapsed 0.001 seconds) done.
[   72.676235] OOM killer disabled.
[   72.679418] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[   72.688636] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[   72.709953] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   72.830228] Disabling non-boot CPUs ...
[   72.831157] CPU1: shutdown
[   72.832204] psci: CPU1 killed (polled 0 ms)
[   72.837376] CPU2: shutdown
[   72.837974] psci: CPU2 killed (polled 0 ms)
[   72.843880] CPU3: shutdown
[   72.844742] psci: CPU3 killed (polled 0 ms)
[   72.850925] CPU4: shutdown
[   72.851557] psci: CPU4 killed (polled 0 ms)
[   72.858185] CPU5: shutdown
[   72.858372] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 66700000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 17us
alarm=0S
process command 00000001
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
customer pwrkeys for IR is NULL, use defaults!

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
