Return-Path: <SRS0=+E+O=CK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D5EC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 10:14:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697A7206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 10:14:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a6MPqogc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYg2GFCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697A7206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ERYJwB4Rc856/VCfQskMlN+jBAEsYxLSeXK7hdG+M2o=; b=a6MPqogcP4vcVflVAUZxx3r+P
	7Ftxg4GfuvtDMpvTlXDzxKZxN2EUx4fPZZeTwhyvwQaJBsFa7ElOb+XBhUxl6OIIhfcTg9ENHmKAo
	WPd7K5sFTOd2kF//6UikdzrqRs36TRCVJwcGbgGWgweWGbTl8ZV7Tj+CQwYPOVSYV0Ry1eKqtd1if
	2VGLQ4JqyrftpSbXZRgLUhU1Cf6CrLQjy3gy5tkzv01+M/7QUKEiIHxqIRE5MeFkEeylIVhXD4Vhw
	CU64H8JrlIivUKzoqWKPBAy01PlfgUFCTpA1nY3+7+x/unCF2vBc/9ElGM1YLE5ica84sGGQP3mCM
	ZE07cCGAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD3JP-0004qi-4B; Tue, 01 Sep 2020 10:14:47 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD3JK-0004oZ-If; Tue, 01 Sep 2020 10:14:43 +0000
Received: by mail-io1-xd43.google.com with SMTP id d190so622612iof.3;
 Tue, 01 Sep 2020 03:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bWjnRI+ku2agFF+13aMRdMJ5ObU/dgzO9wVkb/3N7U4=;
 b=HYg2GFCVvW8PwUeJHx46EQu4mMRalVGy0pmGeome9OpxX+p4fs0siqrPD8Z7YGSeVA
 M0Z6sfbxdX1fwy168Atp0HNgMT5UykVWLNLsrVFl0PH29rvNLyqCnIdx7O47sCnYf2ha
 /PF7VL48Z8cUVnGQgyGZ7jv7BpwDGU3SwOfZ2+vvPkTIiODNR4U4uI+nH+d/SXoQ+DB6
 LOhQfeefAFohlMHvCwatI12/oF9D1b44LkJ5BEF0Mv7p1j+epDr+5PENj8nXdHoPd1Uc
 f+x5ZQiSzSLqUxcW1VPLJV30T/JKjzz5zWtKvW3h1dtKYx41IC+aT4veOXG/ZF2APFxy
 u6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bWjnRI+ku2agFF+13aMRdMJ5ObU/dgzO9wVkb/3N7U4=;
 b=n2pb1qAXJyXqtU/qn3uPxoaOXQbFIK3sa2UahXogF8YiuZSFPShjSZcR6XsGwzWtTm
 rUxW4zmwz3omSHae2BGETQc0aUz5avgdi6D9/bpVs4m+sE3nD38Gdiuub0nH++55ipXw
 t8wHEp/jqsMBh7uUYIjoWrLJ/7KgqIz1EL0TjUYPpe15Ba65cPK/+uW4yqos9wQlSKQE
 5eXrHjVYUqyIgIjtjQkUOVkY/fTQkK5JZ51ObbMzpe70Ci4SSn1yTQby8iqQmRWOkX4M
 cC47IuEYrwKhrelAi2Dwg2UGevh2BW9SaNNJF/durbdyf7R4lstMlcgn3wdRGx2aWaI1
 rejg==
X-Gm-Message-State: AOAM531V8sFNNZ9HqPu5prMFtOU9h8ZJUgYxiIxby33crziDsKvQjvFc
 Ajn3ni4jB3RyoDgjGpxbBX/0tIgP7hnZ4fQxiuo=
X-Google-Smtp-Source: ABdhPJxzmq8Wt1eWRxNEqOsg20gMuThCHXCsQZsNqgBBOBbPQFydByVNXYsLIf+X8BpSPYBelL0DIfF9vEwJaEp5d9E=
X-Received: by 2002:a02:3f16:: with SMTP id d22mr674459jaa.30.1598955279256;
 Tue, 01 Sep 2020 03:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200831075911.434-1-linux.amoon@gmail.com>
 <20200831075911.434-2-linux.amoon@gmail.com>
 <7hpn767f6x.fsf@baylibre.com>
In-Reply-To: <7hpn767f6x.fsf@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 1 Sep 2020 15:44:27 +0530
Message-ID: <CANAwSgSjSU3wrgSkg+vE1u7JZKr3-8KHXHbMarvhSGKHXR0Khw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_061442_635627_E24BCC57 
X-CRM114-Status: GOOD (  33.76  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

Thanks for your review comments and testing.

On Tue, 1 Sep 2020 at 01:36, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> > support the RTC wakealarm feature for suspend and resume.
> > Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> > timer device to prevent it being assigned to /dev/rtc0
> > which disto userspace tools assume is a clock device.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Changes v4
> > --Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
> > Changes v3
> > --Drop the INI GPIOAO.BIT7 pinctrl.
> > --Added missing RTC alias so that rtc get assigned correcly,
> >   as suggested by Chris Hewitt.
> > changes v2
> > --Fix the missing INT (GPIOAO.BIT7) pinctrl.
> > --Fix the missing rtcwakeup.
> > --Drop the clock not required clock property by the PCF8563 driver.
> > ---
> >  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > index 34fffa6d859d..3e2aaa6f48e5 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > @@ -19,6 +19,8 @@ / {
> >       aliases {
> >               serial0 = &uart_AO;
> >               ethernet0 = &ethmac;
> > +             rtc0 = &rtc0;
> > +             rtc1 = &vrtc;
> >       };
> >
> >       dioo2133: audio-amplifier-0 {
> > @@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
> >       };
> >  };
> >
> > +&i2c3 {
> > +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > +     pinctrl-names = "default";
> > +     status = "okay";
> > +
> > +     rtc0: rtc@51 {
> > +             reg = <0x51>;
> > +             compatible = "nxp,pcf8563";
> > +             /* RTC INT */
> > +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> > +             interrupt-parent = <&gpio_intc>;
> > +             wakeup-source;
> > +     };
> > +};
>
> There's still no pinctrl definition for the GPIO pin being used as the
> IRQ.  It looks like you discussed this with Martin and he pointed you in
> the right direction in your v3 series, but I don't see it in this
> patch.
>
Yes I had followed the approach suggested by Martin on previous email and IRC.
but it really did not work out for me in the testing.

rtc-pcf8563 driver does not handle such gpio configuration.
so the rtc probe will fail if we add gpio pinctl to *pinctrl-0*.

So there could be an internal way the wakeup gets triggered for the u-boot.
_This is the reason I have opted for Neil's suggestion._

> You can see the GPIOs that the kernel knows about using the GPIO
> debugfs.  For example:
>

Yes I had already checked this /sys/kernel/debug/gpio
it's not reflecting at my end as well.

> / # cat /sys/kernel/debug/gpio
> gpiochip1: GPIOs 412-426, parent: platform/ff800000.sys-ctrl:pinctrl@14, aobus-banks:
>  gpio-414 (                    |enable              ) out lo
>  gpio-420 (                    |regulator-tflash_vdd) out hi
>  gpio-421 (                    |TF_IO               ) out lo
>  gpio-423 (                    |n2:blue             ) out lo
>
> gpiochip0: GPIOs 427-511, parent: platform/ff634400.bus:pinctrl@40, periphs-banks:
>  gpio-442 (                    |PHY reset           ) out hi ACTIVE LOW
>  gpio-447 (                    |usb-hub-reset       ) out hi
>  gpio-448 (                    |regulator-hub_5v    ) out hi
>  gpio-449 (                    |regulator-usb_pwr_en) out lo
>  gpio-464 (                    |reset               ) out hi ACTIVE LOW
>  gpio-474 (                    |cd                  ) in  lo ACTIVE LOW
>
>
> Also, I tested this on my odroid-n2, and it does not fully wakeup[1].
> At the end of the log, you can see the "resume rate" of the big and
> little cores, which suggests that the SoC has woken and trying to
> resume, but it never makes it back to the kernel.

I feel the RTC wakeup is handled by the u-boot bl30
since virtual RTC we pass the seconds as sleep
is reflected in the logs.

# rtcwake -d /dev/rtc1 -s 5 -m mem
...
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 1398000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 16us
*alarm=6S*
process command 00000001
GPIOA_11/13 off
cec ver:2018/04/19
CEC cfg:0x0000
WAKEUP GPIO cfg:0x00000000
...

>
> Could you be more specific with exactly what u-boot you're running
> (mainline version and Khadas version.)
>

On u-boot Mainline
U-Boot 2020.10-rc2-00133-g60d5402950-dirty (Aug 16 2020 - 20:25:26
+0530) odroid-n2

[0] https://pastebin.com/GGUM7k8Q

On u-boot Hardkernel
U-Boot 2015.01-10 (Dec 08 2019 - 14:54:07) Arch Linux ARM (Hardkernel U-boot)

[1] https://pastebin.com/WbHGFmH2

Note: Yes I have observed there is some off sync in sleep timeout.

> I'm running an older version of mainline u-boot:
> U-Boot 2019.07-rc3-00029-g47bebaa4a3-dirty (Jun 04 2019 - 17:16:32 +0200) odroid-n2
>
> Kevin
>

Yes I have observed this at my end on Hardkernel u-boot.
This message is because you have not sync the hwclock with the timezone.

# sudo hwclock -w -f /dev/rtc0
# sudo  hwclock --systohc

Once you sync with the timezone these messages are resolved.
>
> [1]
> / # dmesg |grep -i rtc
> [   14.799773] meson-vrtc ff8000a8.rtc: registered as rtc1
> [   14.871365] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
> [   14.871519] rtc-pcf8563 0-0051: registered as rtc0
> [   14.873536] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
> [   14.886474] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock
> / # rtcwake -d rtc0 -m mem -s5
> rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using rtc0 at Mon Aug 31 19:58:15 2020
> [  119.297633] PM: suspend entry (deep)
> [  119.297722] Filesystems sync: 0.000 seconds
> [  119.300330] Freezing user space processes ... (elapsed 0.003 seconds) done.
> [  119.306667] OOM killer disabled.
> [  119.309828] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  119.317184] printk: Suspending console(s) (use no_console_suspend to debug)
> bl30 get wakeup sources!
> process command 00000006
> bl30 enter suspend!
> Little core clk suspend rate 1200000000
> Big core clk suspend rate 24000000
> store restore gp0 pll
> suspend_counter: 1
> Enter ddr suspend
> ddr suspend time: 17us
> alarm=0S
> process command 00000001
> cec ver:2018/04/19
> CEC cfg:0x0000
> WAKEUP GPIO cfg:0x00000000
> use vddee new table!
> WAKEUP GPIO FAIL - invalid key
> fffffe71
> use vddee new table!
> exit_reason:0x03
> Enter ddr resume
> ddr resume time: 125us
> store restore gp0 pll
> cfg15 3b00000
> cfg15 33b00000
> Little core clk resume rate 1200000000
> Big core clk resume rate 50000000
>
>

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
