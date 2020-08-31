Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87440C433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 20:07:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBDD2078B
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 20:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wfYtMIFX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UnJIrKmH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBDD2078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=II8ZymMGM7AbtgIFNbZWybu5bzo6tyihaGg0UuB+89M=; b=wfYtMIFXy3UZHTHm30z9Jgz5U
	YX3JRMXRFSg2B9qghZw4qMFtx5LqSkaS9NAdWIGFxOLwG8FNKSrKHVGQtDYLKKQSFXKpim9oV7ZOn
	h98oyD8PYgc6eXqPOByI9ACYYFyij/Jst+9Gah/FQq6xI1wzOhMO5vGa0pYJIU4PUw0zg7ysPZ2Sh
	yhn0MlGpv5u/N8mTwAzwdnJFZgC/7YIZnHnobYyAzYVWGw7bKU2WJjPp1v+jv8Q4QlnJD0CPz2eBG
	pSord4bG8WW3VKXTVoaAiwDsd+/PcZQldEozElLrduy+Z0I4mHNmRxRX1qQeednvgRW6UcT3x9yw4
	YByw1giJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCq4t-0002qU-37; Mon, 31 Aug 2020 20:06:55 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCq4o-0002pf-Q7
 for linux-amlogic@lists.infradead.org; Mon, 31 Aug 2020 20:06:52 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o16so445266pjr.2
 for <linux-amlogic@lists.infradead.org>; Mon, 31 Aug 2020 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JUW9gm/nl25ik5jwFKwNgsXGCdSG3GrconQ9EVhdMRw=;
 b=UnJIrKmHOKphDtVOTCMa/DRSdcOJMv5hCVZICzCrJmj41LSIJnYOYQiJRRPH96s58M
 EDFB7+02i+2ramMA+tmEpnat2idgwyrZlYEZGfcW0QIGd/mYgBrDBHGJvkl0b+Hvcdbu
 rIU5vPQIkw30plG+hlZrqLqzz8JYZoOW/S++BoBrLBJoxmGkOT7TFbWX6TTh55xdBjZM
 2170othIwMfNYa5bZiVVVQjxWDKfhlxhoHBjbkdtJ6C3RyfxBX5Ig+YuwA+vFyZA1HWM
 d97fXyC6wD0PFzJ9eJ/ZcyvHOp5OBHCzIeWGB/Pjoy92W4eb5xZnK+vpDdpz1sipnS7P
 /UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JUW9gm/nl25ik5jwFKwNgsXGCdSG3GrconQ9EVhdMRw=;
 b=df+MoEUgsUNLQ6zc2e3f8LJ/cPmMZ01moux2dvC67idb/wKUXUT+ypUu7x/8T8V6S+
 qXCE+SpbSFU30Q8995AET7gvYihOb3y+7w5RnPk/OiIqJRbM5C9jRSQ7djajp1OX4S2G
 hyBVMOY4CbXh7TYzv/Hf7CVCJD2mXqk+rpEHkoV4wchCLok9JR8Av93q1GiCa5ihLljw
 v8Fu+qdZ91Hzj+Sv4cqeYHA+PZGuY+V7Y/aCEoNRovvFxD9F3OFiWaHbsjYIw+yBcxWk
 If2POnxrcLzTP+kpIhdhgZprPpaQbStfnvmH2sbgZ4ezU52eAJyCOCqHNsj7lsVs2yI1
 C4mw==
X-Gm-Message-State: AOAM532dXtA+fZyFHop254SrqwkGjLgKAwb8BmqoVlssXJgTxW89A30s
 07z20b7n7OZ3l4/AnyAn1F+gew==
X-Google-Smtp-Source: ABdhPJz5h4x9XPAVBo9ANHEfC5q1GiU88DSNih/MnLipjJR0UHizUYXYRgBPZUcS/1X3OjHGEB9yiA==
X-Received: by 2002:a17:902:a607:: with SMTP id
 u7mr2333711plq.45.1598904407625; 
 Mon, 31 Aug 2020 13:06:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id s129sm8888367pfb.39.2020.08.31.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 13:06:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-Reply-To: <20200831075911.434-2-linux.amoon@gmail.com>
References: <20200831075911.434-1-linux.amoon@gmail.com>
 <20200831075911.434-2-linux.amoon@gmail.com>
Date: Mon, 31 Aug 2020 13:06:46 -0700
Message-ID: <7hpn767f6x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_160651_013649_ABBAA2F1 
X-CRM114-Status: GOOD (  21.43  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> support the RTC wakealarm feature for suspend and resume.
> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> timer device to prevent it being assigned to /dev/rtc0
> which disto userspace tools assume is a clock device.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes v4
> --Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
> Changes v3
> --Drop the INI GPIOAO.BIT7 pinctrl.
> --Added missing RTC alias so that rtc get assigned correcly,
>   as suggested by Chris Hewitt.
> changes v2
> --Fix the missing INT (GPIOAO.BIT7) pinctrl.
> --Fix the missing rtcwakeup.
> --Drop the clock not required clock property by the PCF8563 driver.
> ---
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 34fffa6d859d..3e2aaa6f48e5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -19,6 +19,8 @@ / {
>  	aliases {
>  		serial0 = &uart_AO;
>  		ethernet0 = &ethmac;
> +		rtc0 = &rtc0;
> +		rtc1 = &vrtc;
>  	};
>  
>  	dioo2133: audio-amplifier-0 {
> @@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
>  	};
>  };
>  
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc0: rtc@51 {
> +		reg = <0x51>;
> +		compatible = "nxp,pcf8563";
> +		/* RTC INT */
> +		interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio_intc>;
> +		wakeup-source;
> +	};
> +};

There's still no pinctrl definition for the GPIO pin being used as the
IRQ.  It looks like you discussed this with Martin and he pointed you in
the right direction in your v3 series, but I don't see it in this
patch.  

You can see the GPIOs that the kernel knows about using the GPIO
debugfs.  For example:

/ # cat /sys/kernel/debug/gpio                                                                                                            
gpiochip1: GPIOs 412-426, parent: platform/ff800000.sys-ctrl:pinctrl@14, aobus-banks:                                                     
 gpio-414 (                    |enable              ) out lo                                                                              
 gpio-420 (                    |regulator-tflash_vdd) out hi                                                                              
 gpio-421 (                    |TF_IO               ) out lo                           
 gpio-423 (                    |n2:blue             ) out lo                  
                                                                                           
gpiochip0: GPIOs 427-511, parent: platform/ff634400.bus:pinctrl@40, periphs-banks:
 gpio-442 (                    |PHY reset           ) out hi ACTIVE LOW                    
 gpio-447 (                    |usb-hub-reset       ) out hi              
 gpio-448 (                    |regulator-hub_5v    ) out hi                               
 gpio-449 (                    |regulator-usb_pwr_en) out lo
 gpio-464 (                    |reset               ) out hi ACTIVE LOW              
 gpio-474 (                    |cd                  ) in  lo ACTIVE LOW


Also, I tested this on my odroid-n2, and it does not fully wakeup[1].
At the end of the log, you can see the "resume rate" of the big and
little cores, which suggests that the SoC has woken and trying to
resume, but it never makes it back to the kernel.

Could you be more specific with exactly what u-boot you're running
(mainline version and Khadas version.)

I'm running an older version of mainline u-boot:
U-Boot 2019.07-rc3-00029-g47bebaa4a3-dirty (Jun 04 2019 - 17:16:32 +0200) odroid-n2 

Kevin


[1]
/ # dmesg |grep -i rtc                                           
[   14.799773] meson-vrtc ff8000a8.rtc: registered as rtc1   
[   14.871365] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
[   14.871519] rtc-pcf8563 0-0051: registered as rtc0
[   14.873536] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
[   14.886474] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock
/ # rtcwake -d rtc0 -m mem -s5                              
rtcwake: assuming RTC uses UTC ...                          
rtcwake: wakeup from "mem" using rtc0 at Mon Aug 31 19:58:15 2020
[  119.297633] PM: suspend entry (deep)
[  119.297722] Filesystems sync: 0.000 seconds
[  119.300330] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  119.306667] OOM killer disabled.
[  119.309828] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  119.317184] printk: Suspending console(s) (use no_console_suspend to debug)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 1200000000
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
WAKEUP GPIO FAIL - invalid key
fffffe71
use vddee new table!
exit_reason:0x03
Enter ddr resume
ddr resume time: 125us
store restore gp0 pll
cfg15 3b00000
cfg15 33b00000
Little core clk resume rate 1200000000
Big core clk resume rate 50000000



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
