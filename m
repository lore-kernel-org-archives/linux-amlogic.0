Return-Path: <SRS0=+E+O=CK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F023C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 13:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 032682067C
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Sep 2020 13:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DbxC6o+0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G4aR+xGT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 032682067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i6vAnCRbfoZYzlb5gVcPQD0jf0zpOQNwolazD/ZGqrI=; b=DbxC6o+0gEbIiOrqfr9Ms2C8M
	qbe/jPK0x3wbMbqHK85N9p9pGb+9iarwrAeyq17QIRjgafx4GSo3XEYz9P3vSqspLRTGwCRGlL/X/
	s5lGZaRYzlq5g/7ktpPjwf+L9W+BQFVL6zJBUFAtH7jizUrc0edw3u4hlEg91MNYmQ6Z8TPO8ibDn
	dpMuCO1A2wP+aSIZXePmm2F0vYObtEMYLquYiTO5WF2BsP4ErnbrmmyiE9kRfFgYmMbIBPDKmp9BH
	Th77fj8EOJ8UfFSfmriMIhaCVAWPoC4w2ZpM7GFiDdw8M9TKJ5K/QGv4Fm4akjYbVk9HyM1/din+M
	28DKSZv2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD65U-0000hO-9W; Tue, 01 Sep 2020 13:12:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD65P-0000gX-50
 for linux-amlogic@lists.infradead.org; Tue, 01 Sep 2020 13:12:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id a9so1111931wmm.2
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Sep 2020 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rhtiTWMAVlWZErpYY0mTYPqYOXmC11xpGP/xEwuDuPM=;
 b=G4aR+xGTE6NN1GT7S706+VNvn74+wt1AICDahhVSVeyLAszumq311Np9UCnK/C/V/p
 +/f+P3ogoiTqbBnAbZQHWhssPJDkQdMXfG3ZKRPQLy39G1jGijLE/pl8IPBmEQVuJXyK
 MCMeSm/W+ZwZYwCptKLLLFZyyk5aDRfsZQXxWni/jLLSAMEncsPbvvhspVlYgvD7pxc8
 xpSiADuWUFaplYrK7TfYbq6WGNTKl5dh6LdAVXKnkJxphc3wUd265Hek2k5b2iNTl1uv
 XngSHmX1raURolsTQ7N+B86oX09ZZ2l6OYUa/Dy7vmBJufSpd5x9XFvExKBzz0/qQ0KE
 V+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rhtiTWMAVlWZErpYY0mTYPqYOXmC11xpGP/xEwuDuPM=;
 b=KbZ+SiAUN4usRqxvzkhOcbkbjXdQDcLjvjn36P3UCaRfq1MullTVuW36OBbsOwvfoZ
 fWiCM507goFfbx0AUgUrnB+Eu7gMEQ/7AdowbE8eJhy7BjgFOd8WbWCBMXrA/UMhPOeL
 L2pKzHIZCBZ7rUXYlTr13DFWI8LroXGR1O8RDpmt2YJpiXgnudvsLP0Li1bJbkZ9rk1J
 4Tewi8SegLKMYW03flyyx5n/s3A1xkV8VWtWSshX/LEkLX9Wgfr7xgWA8ydLu0LREPie
 hfHwbDa1ULQA178OuASmDWYTbgDxS6/gMHZWN+3YV/0V5v2d//mWnEkUPdalob115ssd
 puBA==
X-Gm-Message-State: AOAM530/3YeMA4SAkQe2sJdm1rgtLaGcX13B0tHvnG1j9eee4WXeKpJa
 a/H0RCHLVJuomEfmg43kZKGGnQ==
X-Google-Smtp-Source: ABdhPJyDfOV22VKtdD63onxjiMtow3G5PG5x06gbMBez2qx91HMJ4MgVBlkMnK3NV1dOrAtrxAgPlA==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr1737635wmb.170.1598965949367; 
 Tue, 01 Sep 2020 06:12:29 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id h185sm1961318wme.25.2020.09.01.06.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 06:12:28 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>
References: <20200831075911.434-1-linux.amoon@gmail.com>
 <20200831075911.434-2-linux.amoon@gmail.com> <7hpn767f6x.fsf@baylibre.com>
 <CANAwSgSjSU3wrgSkg+vE1u7JZKr3-8KHXHbMarvhSGKHXR0Khw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <d944e388-8112-4490-bc6d-d7bfc5ee0762@baylibre.com>
Date: Tue, 1 Sep 2020 15:12:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgSjSU3wrgSkg+vE1u7JZKr3-8KHXHbMarvhSGKHXR0Khw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_091231_326615_38E2428B 
X-CRM114-Status: GOOD (  35.16  )
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
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/09/2020 12:14, Anand Moon wrote:
> Hi Kevin,
> 
> Thanks for your review comments and testing.
> 
> On Tue, 1 Sep 2020 at 01:36, Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Anand Moon <linux.amoon@gmail.com> writes:
>>
>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>>> support the RTC wakealarm feature for suspend and resume.
>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>>> timer device to prevent it being assigned to /dev/rtc0
>>> which disto userspace tools assume is a clock device.
>>>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>> ---
>>> Changes v4
>>> --Add gpio interrupt for GPIOAO.BIT7 as suggested by Neil.
>>> Changes v3
>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>>> --Added missing RTC alias so that rtc get assigned correcly,
>>>   as suggested by Chris Hewitt.
>>> changes v2
>>> --Fix the missing INT (GPIOAO.BIT7) pinctrl.
>>> --Fix the missing rtcwakeup.
>>> --Drop the clock not required clock property by the PCF8563 driver.
>>> ---
>>>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts   | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
>>> index 34fffa6d859d..3e2aaa6f48e5 100644
>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
>>> @@ -19,6 +19,8 @@ / {
>>>       aliases {
>>>               serial0 = &uart_AO;
>>>               ethernet0 = &ethmac;
>>> +             rtc0 = &rtc0;
>>> +             rtc1 = &vrtc;
>>>       };
>>>
>>>       dioo2133: audio-amplifier-0 {
>>> @@ -477,6 +479,21 @@ hdmi_tx_tmds_out: endpoint {
>>>       };
>>>  };
>>>
>>> +&i2c3 {
>>> +     pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
>>> +     pinctrl-names = "default";
>>> +     status = "okay";
>>> +
>>> +     rtc0: rtc@51 {
>>> +             reg = <0x51>;
>>> +             compatible = "nxp,pcf8563";
>>> +             /* RTC INT */
>>> +             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
>>> +             interrupt-parent = <&gpio_intc>;
>>> +             wakeup-source;
>>> +     };
>>> +};
>>
>> There's still no pinctrl definition for the GPIO pin being used as the
>> IRQ.  It looks like you discussed this with Martin and he pointed you in
>> the right direction in your v3 series, but I don't see it in this
>> patch.
>>
> Yes I had followed the approach suggested by Martin on previous email and IRC.
> but it really did not work out for me in the testing.
> 
> rtc-pcf8563 driver does not handle such gpio configuration.
> so the rtc probe will fail if we add gpio pinctl to *pinctrl-0*.

No need for multiple pinctrl-*, simple add a new pinctrl to the rtc node like:


@@ -18,6 +18,8 @@
        aliases {
                serial0 = &uart_AO;
                ethernet0 = &ethmac;
+               rtc0 = &rtc0;
+               rtc1 = &vrtc;
        };

        chosen {
@@ -266,6 +268,17 @@
        status = "okay";
 };

+&ao_pinctrl {
+       rtc_int_pins: rtc-int {
+               mux {
+                       groups = "GPIOAO_7";
+                       function = "gpio_aobus";
+                       bias-disable;
+                       output-disable;
+               };
+       };
+};
+
 &cec_AO {
        pinctrl-0 = <&cec_ao_a_h_pins>;
        pinctrl-names = "default";
@@ -391,6 +404,23 @@
        };
 };

+&i2c3 {
+       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+       pinctrl-names = "default";
+       status = "okay";
+
+       rtc0: rtc@51 {
+             pinctrl-0 = <&rtc_int_pins>;
+             pinctrl-names = "default";
+             reg = <0x51>;
+             compatible = "nxp,pcf8563";
+             /* RTC INT */
+             interrupts = <GPIOAO_7 IRQ_TYPE_LEVEL_LOW>;
+             interrupt-parent = <&gpio_intc>;
+             wakeup-source;
+       };
+};
+
 &ir {
        status = "okay";
        pinctrl-0 = <&remote_input_ao_pins>;

DISCALIMER: not built or run tested

Neil

> 
> So there could be an internal way the wakeup gets triggered for the u-boot.
> _This is the reason I have opted for Neil's suggestion._
> 
>> You can see the GPIOs that the kernel knows about using the GPIO
>> debugfs.  For example:
>>
> 
> Yes I had already checked this /sys/kernel/debug/gpio
> it's not reflecting at my end as well.
> 
>> / # cat /sys/kernel/debug/gpio
>> gpiochip1: GPIOs 412-426, parent: platform/ff800000.sys-ctrl:pinctrl@14, aobus-banks:
>>  gpio-414 (                    |enable              ) out lo
>>  gpio-420 (                    |regulator-tflash_vdd) out hi
>>  gpio-421 (                    |TF_IO               ) out lo
>>  gpio-423 (                    |n2:blue             ) out lo
>>
>> gpiochip0: GPIOs 427-511, parent: platform/ff634400.bus:pinctrl@40, periphs-banks:
>>  gpio-442 (                    |PHY reset           ) out hi ACTIVE LOW
>>  gpio-447 (                    |usb-hub-reset       ) out hi
>>  gpio-448 (                    |regulator-hub_5v    ) out hi
>>  gpio-449 (                    |regulator-usb_pwr_en) out lo
>>  gpio-464 (                    |reset               ) out hi ACTIVE LOW
>>  gpio-474 (                    |cd                  ) in  lo ACTIVE LOW
>>
>>
>> Also, I tested this on my odroid-n2, and it does not fully wakeup[1].
>> At the end of the log, you can see the "resume rate" of the big and
>> little cores, which suggests that the SoC has woken and trying to
>> resume, but it never makes it back to the kernel.
> 
> I feel the RTC wakeup is handled by the u-boot bl30
> since virtual RTC we pass the seconds as sleep
> is reflected in the logs.
> 
> # rtcwake -d /dev/rtc1 -s 5 -m mem
> ...
> bl30 get wakeup sources!
> process command 00000006
> bl30 enter suspend!
> Little core clk suspend rate 1398000000
> Big core clk suspend rate 24000000
> store restore gp0 pll
> suspend_counter: 1
> Enter ddr suspend
> ddr suspend time: 16us
> *alarm=6S*
> process command 00000001
> GPIOA_11/13 off
> cec ver:2018/04/19
> CEC cfg:0x0000
> WAKEUP GPIO cfg:0x00000000
> ...
> 
>>
>> Could you be more specific with exactly what u-boot you're running
>> (mainline version and Khadas version.)
>>
> 
> On u-boot Mainline
> U-Boot 2020.10-rc2-00133-g60d5402950-dirty (Aug 16 2020 - 20:25:26
> +0530) odroid-n2
> 
> [0] https://pastebin.com/GGUM7k8Q
> 
> On u-boot Hardkernel
> U-Boot 2015.01-10 (Dec 08 2019 - 14:54:07) Arch Linux ARM (Hardkernel U-boot)
> 
> [1] https://pastebin.com/WbHGFmH2
> 
> Note: Yes I have observed there is some off sync in sleep timeout.
> 
>> I'm running an older version of mainline u-boot:
>> U-Boot 2019.07-rc3-00029-g47bebaa4a3-dirty (Jun 04 2019 - 17:16:32 +0200) odroid-n2
>>
>> Kevin
>>
> 
> Yes I have observed this at my end on Hardkernel u-boot.
> This message is because you have not sync the hwclock with the timezone.
> 
> # sudo hwclock -w -f /dev/rtc0
> # sudo  hwclock --systohc
> 
> Once you sync with the timezone these messages are resolved.
>>
>> [1]
>> / # dmesg |grep -i rtc
>> [   14.799773] meson-vrtc ff8000a8.rtc: registered as rtc1
>> [   14.871365] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
>> [   14.871519] rtc-pcf8563 0-0051: registered as rtc0
>> [   14.873536] rtc-pcf8563 0-0051: low voltage detected, date/time is not reliable.
>> [   14.886474] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock
>> / # rtcwake -d rtc0 -m mem -s5
>> rtcwake: assuming RTC uses UTC ...
>> rtcwake: wakeup from "mem" using rtc0 at Mon Aug 31 19:58:15 2020
>> [  119.297633] PM: suspend entry (deep)
>> [  119.297722] Filesystems sync: 0.000 seconds
>> [  119.300330] Freezing user space processes ... (elapsed 0.003 seconds) done.
>> [  119.306667] OOM killer disabled.
>> [  119.309828] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
>> [  119.317184] printk: Suspending console(s) (use no_console_suspend to debug)
>> bl30 get wakeup sources!
>> process command 00000006
>> bl30 enter suspend!
>> Little core clk suspend rate 1200000000
>> Big core clk suspend rate 24000000
>> store restore gp0 pll
>> suspend_counter: 1
>> Enter ddr suspend
>> ddr suspend time: 17us
>> alarm=0S
>> process command 00000001
>> cec ver:2018/04/19
>> CEC cfg:0x0000
>> WAKEUP GPIO cfg:0x00000000
>> use vddee new table!
>> WAKEUP GPIO FAIL - invalid key
>> fffffe71
>> use vddee new table!
>> exit_reason:0x03
>> Enter ddr resume
>> ddr resume time: 125us
>> store restore gp0 pll
>> cfg15 3b00000
>> cfg15 33b00000
>> Little core clk resume rate 1200000000
>> Big core clk resume rate 50000000
>>
>>
> 
> Best Regards
> -Anand
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
