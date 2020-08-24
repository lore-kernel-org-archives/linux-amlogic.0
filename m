Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91735C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 14:30:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5099F205CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 14:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/8kCFu/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L0s0KaAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5099F205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEfJT1ihIb9RVaSa2qsaSAGIzF6Niz5MrPsdFf2HRnU=; b=P/8kCFu/GKDP0rUCklnM+LSNj
	ImOkcIyfEDyboS902eik0Wl6zBOQBgbSt+eFYgK2qwOgZqBwmsroQQJ7vKXE1BRsjCBJIV41SK7dC
	PpRZ60NvUyqLYTlispt7Vm+uORYR4OWqIqqbHWcoLopNFKcCde8CX4pKuidZor2dPsm2k3grY4BJQ
	0OFMVYZovXgSfXN6vt70xzvKClUzZ+UnhMkbhmJStiOYTeA+Ytv7iEHBnMLXWXIzD2ldSc/AfLD6m
	Vqu6PtfA+sPYOvIfIFG11i/lX3cM+5IjTI3mld/9Dq6+rnnBpEjgEucy6S7xRz1XR5jccbawXJdI1
	jSYtoLOkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kADUk-0002Dk-Rl; Mon, 24 Aug 2020 14:30:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kADUh-0002Bs-9p
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 14:30:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id x7so2849984wro.3
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=RHuBLgC0m+LUiNwXMCDSGu7Z90iRqwpC4kBmEQcAFEk=;
 b=L0s0KaAKzKwULpNbDdSiI9Q3TRXfy00ZIao1905z6D4bKbTqFwNrUTg+B0AQH3dsIr
 e22hXrwQ/mUBRQIPcEJGJCtUNXGjee0uIF8tBuYsR5A7H2NWnQuk9PtIzT5G7DlxOumJ
 H9DtDu56rTXVInVsgHPqulRMJ3BdmDMN0M2p79zsnNoCxEvOfE20Wf3XKf+XL9etUtt9
 t5eOUfdzUomowEG977CMEp9qBGUJjromG1+ONs8QZaCRGhN0+gzUMRm9FNYEvR5U/A0F
 ndmkZtr2jvYrz4QNMp73Co4oY8JlODx/Bq1at2aHuXhNAntcv59TcZumdpqBK/UkSs/m
 aOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=RHuBLgC0m+LUiNwXMCDSGu7Z90iRqwpC4kBmEQcAFEk=;
 b=ryh+jJVA3RCWkjgxe50MUV+30DaOU7peiuVbocswkpQg7msv2oBVTpwdYF0/B04nX8
 4OW1HSJSIVvTwS4qfQ+FTC+PBxob2YBAihc3Bna/CX5Y4dYWL69jMT4efIDinP5/2J9r
 iESCvLzLEF0++7pO74Q7dw8qeJTVeX0sLWjkn9cW3oT6nwvxVur0bGTqJmQkiIRGoSuA
 GQgLNca5F4PXW/8M2ivOS+GthZazO56STouvQJ3Sn1Yj9RPatXIv2S9yDrVBzs52AwpI
 MTIRnOqktUGmvRz4qmA0LmRVtp2oC8ExjUv40eLvScfkMIgxGqnE+ruanbcreg0EWPTM
 vQRQ==
X-Gm-Message-State: AOAM5332ygSzPWA39J8dMGh96WjqnF9gj8yrkxmz3Hw/Wu6qEIstyxqe
 gYjxOJfQS7+zAFfK/8h4OW8Qj2V5iLh5lw==
X-Google-Smtp-Source: ABdhPJyntYozy+eUWWxM9WVIe9x6/Pwd+iThG/oXBKu5qtdzRPHghDUR5kEkyemUzw0ZfVo4uLm6mg==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr5989121wro.43.1598279442159; 
 Mon, 24 Aug 2020 07:30:42 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o125sm26178299wma.27.2020.08.24.07.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:30:41 -0700 (PDT)
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com> <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-reply-to: <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
Date: Mon, 24 Aug 2020 16:30:41 +0200
Message-ID: <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_103043_370795_F8B28F5C 
X-CRM114-Status: GOOD (  15.97  )
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
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 24/08/2020 15:41, Anand Moon wrote:
>> hi All,
>> 
>> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>>>
>>> Hi Kevin,
>>>
>>> Thanks for your review comments.
>>>
>>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>>>>
>>>> Anand Moon <linux.amoon@gmail.com> writes:
>>>>
>>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>>>>> support the RTC wakealarm feature for suspend and resume.
>>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>>>>> timer device to prevent it being assigned to /dev/rtc0
>>>>> which disto userspace tools assume is a clock device.
>>>>>
>>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>>> ---
>>>>> Changes V3
>>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>>>>
>>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
>>>> wakeup the system?  If so, this should be included as part of this
>>>> patch.
>>>>
>>>> It probably still works because the bootloader configures this GPIO as
>>>> input, but the kernel should not rely on the booloader for that, so
>>>> please include as part of this patch.
>>>>
>>>
>>> Ok I will figure out the correct pinctrl need for this settings.
>>> looking into the Odroid N2 schematics.
>>>
>> 
>> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>
>
> Simply add:
>
> interrupt-parent = <&gpio_intc>;
> interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>
> to reflect the interrupt connection.
>
> No need to setup pinctrl here since the GPIO input is always connected
> to the gpio irq generator whatever pinctrl mode is set.

It is actually better to setup pinctrl. Yes the irq controller can work
whatever the pin setup but if an output function is active it can mess with
what the irq controller gets.

Think about applying/removing bias if necessary too.

>
> Neil
>
>> 
>> So from the schematics it is seen below.
>> RTC INT  GPIOAO_7 (AV46)   GPIOAO_7 (JTAG_A_TMS // TSIN_A_DIN0 //
>> TDMB_FS // TDMB_SLV_FS)
>> 
>> But the S922X datasheet this pin *AV46* shows to following settings,
>> AN16    DVSS    AV46      GPIOAO_7    BD19    BOOT_11
>> 
>> From the schematics it BOOT_11 is linked to
>>               BOOT_11 (NAND_CE0)      BD19
>> 
>> So can I conclude that BOOT_11 (nand_ce0_pins) pin linked to the RTC INT setting
>> Please can somebody help me with correct pinctrl settings.
>> 
>> Best Regards
>> -Anand Moon
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
