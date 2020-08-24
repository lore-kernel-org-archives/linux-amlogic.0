Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB75C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:50:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB8B206B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 13:50:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXtGRDOW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CVbecjjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB8B206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WY/EBRTA03+JsMtYHYWt2XwazlDlgbVdVz/7CfiCFMQ=; b=EXtGRDOWRpTsCROyC3fimxUSF
	we5/wDyho1Q8EZX02/AthE4qi6PFUIYEr/UX15bjQpvINOU4ct/pqNttDh3lffj0f++mCdBV+uiyl
	Fg1aOufq11FbstUXqJGAOij/N/lZl4UzWbbdt0sxWTypODsm0n5hgVgLct+Wpvl92O7YKPJVlxCO+
	JOHXWfPwbOLFq4Q2xQgLRwIZ6oaqonICo+vPDOEfAr1H/VY5Rhcuakk2tIh3Jq76ljWYKfjGqwKuy
	osrPciwrsE+Qq6QI/QczDgRFeii5HtI55wIPFNvFpGwri8MNRJP78WXTPbmynPfr391b8oKZCL+MU
	3tJkET14w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACrn-0005uW-B1; Mon, 24 Aug 2020 13:50:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACrl-0005tn-Dh
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 13:50:30 +0000
Received: by mail-wr1-x443.google.com with SMTP id l2so8773117wrc.7
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 06:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBYxvdNaVIpezme39Sbr+G11My/oddCijKTEXyzMCzs=;
 b=CVbecjjoVHyuuZWAoD40VVlQbfTvj9idNc9kkph6Mf3YOHzy9fzjxT8Fi6JmeREKK/
 5sKlaLULmBBE1kXcNM3slHWzP/QKWvgW9Q5uwIVdvgbsU3a3XRt1jdh8Bn7FGkBlc6Xb
 F2+t4HPnCdrDKQeSGsPvV6jeDd9tPM5qi5O8SxrTTB08KUkORv+2X9wJIXOHHe4M/ebd
 JtmnrRr43Dv5jevuB8dbhKg7JklqbTKeExA6ctRZtAB0mCAslO1UgMbfPnM77RNU9PLv
 NnMU0PeeV6OfWq3UvDyDpuTS+REqQcJaA9GFDXGJiVubfJh5rL5Rp7MlxvwFpery/b5e
 8v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NBYxvdNaVIpezme39Sbr+G11My/oddCijKTEXyzMCzs=;
 b=CyVG+Ai5vPtdPqrFp6T15ntk+f6VpxfzneKGHUrc2LLNn/xYQYcikvcSYjnlC90Ji9
 7SegbBZCGcal9rv+UMt9UEAAg/oe8/kn5gtB/VyVe6ier7fcwU+xgt/FbasgLoXTncx4
 0L9wjxtHXajss9WMmKDe1A5tZiyDarARaeza3O8bHaSmvSBowHQfRaBRrYgOsDefSXLF
 FXZyzrXPlxehTRwd6/mm5qckXP8U3jEICN9uI7MGkoxBJ/EZDvaBZfyzwI9+IaOPgpkt
 UZwn9Kt+vuWkoipE8KLY5LBbOyX3lrigyFvi2dIWPY2O5n9sMfx8Qa4+aCf/t90d5kH8
 A2Og==
X-Gm-Message-State: AOAM533ySRXLu8yvRlZ9E5FIGSmSJbMcpEyFE7cEgeFH1FJkqXwtkiiC
 VJRr7Ix1h8WAf08xq9Kxwb0Xhw==
X-Google-Smtp-Source: ABdhPJwh0zJv/zlRNN8hP/qyxVYKTEzIYJvmXtvAj0Q7fle2D4LKo6fi1XQRNc9x2e08MDkWgAqYfg==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr4680611wrt.286.1598277028188; 
 Mon, 24 Aug 2020 06:50:28 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:c02:85df:32ef:2826?
 ([2a01:e35:2ec0:82b0:c02:85df:32ef:2826])
 by smtp.gmail.com with ESMTPSA id g9sm4629157wrw.63.2020.08.24.06.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 06:50:27 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com> <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
Date: Mon, 24 Aug 2020 15:50:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_095029_638524_0F9F769A 
X-CRM114-Status: GOOD (  20.95  )
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

On 24/08/2020 15:41, Anand Moon wrote:
> hi All,
> 
> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Kevin,
>>
>> Thanks for your review comments.
>>
>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>>>
>>> Anand Moon <linux.amoon@gmail.com> writes:
>>>
>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>>>> support the RTC wakealarm feature for suspend and resume.
>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>>>> timer device to prevent it being assigned to /dev/rtc0
>>>> which disto userspace tools assume is a clock device.
>>>>
>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>> ---
>>>> Changes V3
>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>>>
>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
>>> wakeup the system?  If so, this should be included as part of this
>>> patch.
>>>
>>> It probably still works because the bootloader configures this GPIO as
>>> input, but the kernel should not rely on the booloader for that, so
>>> please include as part of this patch.
>>>
>>
>> Ok I will figure out the correct pinctrl need for this settings.
>> looking into the Odroid N2 schematics.
>>
> 
> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.


Simply add:

interrupt-parent = <&gpio_intc>;
interrupts = <7 IRQ_TYPE_LEVEL_LOW>;

to reflect the interrupt connection.

No need to setup pinctrl here since the GPIO input is always connected to the gpio irq generator whatever pinctrl mode is set.

Neil

> 
> So from the schematics it is seen below.
> RTC INT  GPIOAO_7 (AV46)   GPIOAO_7 (JTAG_A_TMS // TSIN_A_DIN0 //
> TDMB_FS // TDMB_SLV_FS)
> 
> But the S922X datasheet this pin *AV46* shows to following settings,
> AN16    DVSS    AV46      GPIOAO_7    BD19    BOOT_11
> 
> From the schematics it BOOT_11 is linked to
>               BOOT_11 (NAND_CE0)      BD19
> 
> So can I conclude that BOOT_11 (nand_ce0_pins) pin linked to the RTC INT setting
> Please can somebody help me with correct pinctrl settings.
> 
> Best Regards
> -Anand Moon
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
