Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A9AC433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 05:10:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813DD20738
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 05:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IaHJvxaL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF+kmdUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 813DD20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PxIk6BKDM8Z/lk3cQC5FB9Qq1MGe1UIDQCQ2IY5A0WI=; b=IaHJvxaLAuO//kv2g5boHPes/
	rkw/GZ7O5Zcx9nfIl2b7ZnI6WguQ8wccLr7v93CjnQkIUizs/KfIYZ3PpWL792WNozjGY3M2/3HPS
	J3uGZTCxqmWQl6rHlS35mEo5BAoMySwx1XRtKStEqOTAyQZkC/9zPjprAzlv6UMX/YdOeHdXCRza0
	W6PxjvrIGwG5gqrFN6K+bVVCHiPGv7SyJpv1ZLoaUeLnQJRjT38WNgv88bMfsHiFJm7X+A7UnrLRp
	jjosSLo6UwngPKnioYmcv2BjtL62bhnsTCAVMiFN5EPIipmIHYUgzlt+dwXYtdQNSaWDJFD32nZsF
	t11XWmrfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ttD-0003xW-Bc; Tue, 18 Aug 2020 05:10:27 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7tt4-0003w9-7N; Tue, 18 Aug 2020 05:10:20 +0000
Received: by mail-io1-xd41.google.com with SMTP id b17so19947780ion.7;
 Mon, 17 Aug 2020 22:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDeuI2at4DUnP5ePYzs4nh4EYYaqUTPmHOeGx+LVl8c=;
 b=lF+kmdUdd834Mkv9Nobn/W7Ww3ZsZFCdqIW0uWFWan/uei+LuYY2Azljs52L6GN46g
 +CM59rYvJBcvgnyi+IZre5Jqf9x69UeMaUO8LLJvwWPaCj1TbTrXL0cPywWr61VEOMQm
 DogPx+HLT8TuUsalQNCX44Q4WSpwtZWPzYeqnyJrS31TbB3dQ6akMrDTvO5+pkXSB0jo
 7PqPBJ+hC2qH2l2boMIT+fl+slhHq0bfeil9NiCrV9reOwMJezbUkArVq8DadcHipLHE
 FsJRgqqotGrV71uwJ0em1+zCGJh/ZLhgG3OmEMRPI4OMcPFPFX7HF5QKQzAEIYT5fkq3
 p9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDeuI2at4DUnP5ePYzs4nh4EYYaqUTPmHOeGx+LVl8c=;
 b=JI38RL9+mq20radSAPptZY3Wt14xe3Hrh8ZY2Ht+AomXYJCJRY2vJFFsqivWLihkbQ
 UIQbaZPSo7efGa3pXLQOjyt5HtyzzSX0xykh0eNHwsRnRZw+bfH/rDwt2yvgZUgsYnXx
 E1aVtCYM2YyNIot/lPuEJDxgOM/SCJXtoJF5DYevVbD8mwbHJrSrAII2oeJ4amdsAukF
 mLpkDo9gXvVBq7tqfzPzrjYAId8IR2mx+ozEmX03V4fd6hhUsjVsY59Ddm1jqeKrxnao
 rTLr/eruVUZdwOOx5DOQpKGqIGDwTghq9aV+wNZgvFp3sD+hYOQnKPaB7EK1RWxu5NwN
 +3sw==
X-Gm-Message-State: AOAM532qo9orMWVVpjD6913CVkr16C+jlMXP6Qrl3WxOHqrIrNoJOG2q
 IK64izfS9P3VymYc8XSGIt3zhjNauTBZ5mBteck=
X-Google-Smtp-Source: ABdhPJzlUMXFreLoLp9ldnImjq6T5h9bRsmZOZhfAkQQJ1NbB9rXaoytPT1YBx+ICz0ihvTUdkDmvHu+ioxe/BknC9M=
X-Received: by 2002:a6b:f801:: with SMTP id o1mr14969666ioh.43.1597727416068; 
 Mon, 17 Aug 2020 22:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
 <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
In-Reply-To: <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 18 Aug 2020 10:40:06 +0530
Message-ID: <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_011018_473757_746F9010 
X-CRM114-Status: GOOD (  25.13  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Tue, 18 Aug 2020 at 08:33, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> Thanks for your review comments .
>
> On Tue, 18 Aug 2020 at 01:06, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > thank you for updating this patch!
> >
> > On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > changes v2
> > > --Fix the missing INT (GPIOA.BIT7) pinctrl.
> > should I also expect an interrupt property somewhere below?
> >
> > > --Fix the missing rtcwakeup.
> > > --Drop the clock not required clock property by the PCF8563 driver.
> > > ---
> > >  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > index 34fffa6d859d..f08ae1b337ad 100644
> > > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
> > >         };
> > >  };
> > >
> > > +&i2c3 {
> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;

Note: without setting this *pinctrl-1* configuration RTC wake up
feature works as expected.

> > > +       pinctrl-names = "default";
> > why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
> > also I'm surprised to see a TDM (audio) related pin function as part
> > of an I2C controller. if this is correct then I'd appreciate a bit
> > information (for example as part of the patch description) why that is
> >
> >
> > Martin
>
> Opps, I could not figure the difference between GPIOA_7 and GPIOAO_7 pins
> I will try to figure out the correct configuration pin for this node.
>
> Best Regards
> -Anand

I see from the schematics [0] odroid-n2_rev0.4_20190307.pdf section S905D2  IO.
Following pin configuration is used for RTC
RTC    GPIOAO_7(JTAG_A_TMS//TSIN_A_DIN0//TDMB_FS//TDMB_SLV_FS)

As per the data sheets [1] S922X_Public_Datasheet_V0.2.pdf  following
are the pin funtion description.

JTAG_A_TMS                       DI                 JTAG Test mode
select input channel A
TSIN_A_DIN0                       DI                 Serial TS input port A data
TDMB_FS                            DO               Frame sync output
of TDM port B (Word clock of I2S)
TDMB_SLV_FS                    DI                 Frame sync input of
TDM port B (Word clock of I2S)

But I dont observe this configration is linked to the RTC INT (GPIOAO.BIT7) pin.
Without setting the *pinctrl-1*  rtc is getting registeed correcly and
suspend / resume feature is also working correcly see below.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.269079] rtc-pcf8563 0-0051: registered as rtc0
[    5.270948] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T04:52:26 UTC (1597726346)
[root@archl-on2e ~]#
[root@archl-on2e ~]#
[root@archl-on2e ~]# rtcwake -s 30 -m mem
rtcwake: assuming RTC uses UTC ...
rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Aug 18 05:06:05 2020
[  793.341957] PM: suspend entry (deep)
[  793.342292] Filesystems sync: 0.000 seconds
[  793.649621] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  793.652309] OOM killer disabled.
[  793.655514] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[  793.666584] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[  793.686014] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  793.778908] Disabling non-boot CPUs ...
[  793.783712] CPU1: shutdown
[  793.783845] psci: CPU1 killed (polled 0 ms)
[  793.795813] CPU2: shutdown
[  793.795941] psci: CPU2 killed (polled 0 ms)
[  793.807337] CPU3: shutdown
[  793.807465] psci: CPU3 killed (polled 0 ms)
[  793.819110] CPU4: shutdown
[  793.819235] psci: CPU4 killed (polled 0 ms)
[  793.833682] CPU5: shutdown
[  793.834614] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 100000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 16us
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
ddr resume time: 124us
store restore gp0 pll
cfg15 3b00000
cfg15 33b00000
Little [  793.845285] Enabling non-boot CPUs ...
core clk re[  793.846900] Detected VIPT I-cache on CPU1
[  793.847250] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  793.850966] CPU1 is up
[  793.858728] Detected VIPT I-cache on CPU2
[  793.858825] arch_timer: CPU2: Trapping CNTVCT access
[  793.858851] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  793.860784] cpufreq: cpufreq_online: CPU2: Running at unlisted
freq: 999999 KHz
[  793.880028] cpufreq: cpufreq_online: CPU2: Unlisted initial
frequency changed to: 1000000 KHz
[  793.889018] CPU2 is up
[  793.891578] Detected VIPT I-cache on CPU3
[  793.891609] arch_timer: CPU3: Trapping CNTVCT access
[  793.891617] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  793.892276] CPU3 is up
[  793.909048] Detected VIPT I-cache on CPU4
[  793.909077] arch_timer: CPU4: Trapping CNTVCT access
[  793.909084] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  793.909896] CPU4 is up
[  793.926797] Detected VIPT I-cache on CPU5
[  793.926827] arch_timer: CPU5: Trapping CNTVCT access
[  793.926834] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  793.927609] CPU5 is up
sume rate 100000000
Big core clk resume rate 50000000
[  793.971976] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  793.974405] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode

[root@archl-on2e ~]# dmesg | grep rtc
[    5.269079] rtc-pcf8563 0-0051: registered as rtc0
[    5.270948] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T04:52:26 UTC (1597726346)

Schematics [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.4_20190307.pdf
Datasheets [1] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
