Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E710F9961
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et9DgSFm2gDN7xtXQGZOEQTY/Vo4FU2KCUUxkVIaSwI=; b=Jz1SBnJy/axr8l
	8W7ky2+/QkNIT7714FC+/KVh30Owjv+ejd7AbqozvZK/sLb9y1ueq5PU1htSWUMHgnFG/ciQgc0PA
	7ssI9jA6rd4AIUdm4t1q4pg8GArL74K81uJb+xh1xK9S44zkCH2fEcAb0Jc1jv8SkiORUZ7U8BvMS
	O7xbsTkQvbnVwPSxoh6YNYV0qx41X3PXW2BVAmiaWKRxsLEwZqIyzCXX3sWf1fbV00U0LyEXnIRb5
	OpBP84r2mn6faKoNW0nmE1lYxDdel2aHvXWE00boydjwHN8rwI2izhDEOVHxwL4Bix2Upkw++NrdB
	9Cp7JDlsWraGlJhKyVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWnJ-00000009CDT-2MUN;
	Wed, 08 Apr 2026 17:34:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWnG-00000009CCz-0QTF
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 17:34:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43ccda008cdso64667f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775669660; x=1776274460; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPKJoXcFiZEHjruKbVgJ9S6J16xuB0veaEwyiyvCi0=;
        b=Tc5oWQ7cgX/NJADrP3Gq0lIOr2TOyKVvAYYyHz10txAvEdN3H63USQjd+MZSxbQZGq
         mn/CQu2t5T4FeQX1+dfLxX1qM4+8hMSBNd7L5JJ1Zk+dtHQVXuNyYsiPh5cUaOyUjQu2
         KtDp7hthSaRuyShe22ns+FO3x9s9Vf0zmqCRqlXxKdx+8tfVmXmZfYp7xQOFozuJeu+l
         8TuQDcHmCuhpHk+eBYZ5CL1sSuKWUqDAZ5xGI8wuZXaIx1tSajtikXk1LRRZ9c0BOkK6
         tQzsFKyh8SmTpcKdfsioZtl7a+XCY/7vRt4/XLl1htkhAVm8DbtLInan+Y3vhP3Obw0G
         vV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775669660; x=1776274460;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qbPKJoXcFiZEHjruKbVgJ9S6J16xuB0veaEwyiyvCi0=;
        b=CPrs7GsKybCnA9KsglEjrOh7wVr2A0idduh+FxDTtXWX4pTWYjDjvNtagqyTJbJLa7
         VKpaysnvKxSfr69xqPuB768QuyTSgzBR+FrJdNPmeeCiju6lK3ZmvMxP1Jc6GUE65Uq7
         vDAKNazlBHW2eG/LWgHLNgOB84McfPFOUxXZrEKas+FTx1rYfH3hewShJ/aL0pcaaizX
         cbDTgSFXVIko4FqxFt20NB6pm2TYUQZB1DsKfhCozJpbcF+Kia/hkUE7EV8H59rbp9ww
         EtPticrNusCFec43XgOGnfHQJX5nKur5ruN6OMtXQgvTUvfSdP6ploKLtcgYCtIY54SZ
         cvEg==
X-Forwarded-Encrypted: i=1; AJvYcCV3vjegZNze6qYmHtUtzdPSDR4rAVoUFkxixaZpAZHH6ZZjk6hXQaXrYlIxbXO1QStgvZ9tx8JcW1StQ1uJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxsgzaCZKqVhDQ5+AABQGvJpt3dL+ceZadcIxevThODJLWZyTvy
	XVSWwD+jvMsP8cCMyrZjAznF8/RNnIkhM6ETVjtpYczGDFxWohJMk+s1imVK7JO78KFh169pZdy
	KWQCp
X-Gm-Gg: AeBDiev1xuXoNhlqs2uPLGHirtwa6zGarZqb0dzrLdINNLg/IIL+rB88jmoFL6Mxekp
	1tXNotIo0vgSuDUyfEENNz4g4XlfDsqbNS6UkXgB44q2bfd+x1TLmomqJYd4bztsFIMj0HRtzN0
	1uCRDk+psVQgjWaGM37KVY9W7hKlQt6oTzgpi90QsA0RfWGCxSTmG9/FC6vh9nrPm8oWKiluWs8
	RSIQyK0fmZl2vJJQJk/mwbBDEQu3r3uiVWUN9YXY5aPV/UsGx8/tRvpcNJHWl4D7rg68asnGhUe
	1R7xmyiW65QiV+u5q+MPzD+Lant8VFjKEKSbeDWwzjSm723CUWBXL3pdDYRPyIlyUuCWkEaz8Ke
	rdkn7HIPIij4FIeuuFTl3ESJjL+daPZdIHqO4NKZ78L7fsYFHhlXhF5XOKUrQedtuF0+RlLWxEm
	MFDdPLAZDk51j1MYkGeGE=
X-Received: by 2002:a05:6000:4b0a:b0:43b:a16b:ee69 with SMTP id ffacd0b85a97d-43d595cf8c2mr485116f8f.24.1775669659987;
        Wed, 08 Apr 2026 10:34:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d54d:290b:e0:25b6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e4d27a8sm60840731f8f.17.2026.04.08.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:34:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Michael Turquette <mturquette@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
In-Reply-To: <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com> (Chuan Liu's
	message of "Wed, 8 Apr 2026 22:32:56 +0800")
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
	<20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
	<89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
	<76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 08 Apr 2026 19:34:18 +0200
Message-ID: <1j7bqhtkyt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_103422_287569_14C9F179 
X-CRM114-Status: GOOD (  18.97  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On mer. 08 avril 2026 at 22:32, Chuan Liu <chuan.liu@amlogic.com> wrote:

> Hi Krzysztof (& ALL),
> Thanks for review.
>
> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>
>>> Implement core clock driver for Amlogic SoC platforms, supporting
>> So how did all existing Amlogic SoC platforms work so far without basic
>> clock driver? Really, how?
>> You are suppose to grow existing code, not add your completely new
>> "basic" driver just because you have it that way in downstream.
>> 
>
> Firstly, apologies for the delayed response. I had intended to consolidate
> the V1 review feedback and come back with a clearer plan for V2 changes. In
> the meantime, Martin has provided many detailed and valuable suggestions -
> much appreciated.
>
> The original goal of optimizing the HW based on A9 and introducing a new
> clock driver is to reduce unnecessary complexity in the driver. On A9, we
> optimized the Clock/PLL controller HW to simplify driver performance,
> complexity, memory footprint, and reusability. Improvements on the HW side
> can also help drive corresponding enhancements in the driver:
>    - Performance: Encapsulates sub-clock functions, reducing call paths
>    - Complexity: Standardized register bits eliminate a large number of
> bit definitions (~1/3 of original code is defined register bit [1])
>    - Memory: Object-oriented design avoids copy/paste for repeated clocks
>    - Reusability: Same controller works across SoCs without driver
> changes (or with minimal changes)
>
> The old meson driver required compromises to unify legacy controller
> characteristics and driver styles. On A9, we want a fresh start.

I thought I was clear on the cover letter, apparently not.

*This is not going to happen*

You've provided no technical justification for such "a fresh start".

There no reason for A9 HW to be supported by different drivers than the
rest of the Amlogic SoC when it is quite clear it can fit with the
current drivers.

At lot of work by a lot of different people has gone into stabilizing
and maintaing the current driver. That's valuable too. If you are not
happy with current level of "performance" then make your case with
actual numbers and submit changes against the current drivers, making
improvement available to all supported SoCs. That's how upstream works.

>
>> Best regards,
>> Krzysztof

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
