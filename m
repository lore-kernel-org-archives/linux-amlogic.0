Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104BFC4363A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 15:28:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F8B2222D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 15:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jTWpJg6M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nozQxSm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F8B2222D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0iAKn+DWntlC2mCAI6F/5Lg5jYwlxyLlUimqntqdmoI=; b=jTWpJg6M0R083IcE/X0WCH+XE
	hITw4Nq4pCWewkvz91XHuHkgbbcP1/JPh3/ghMtpU6LTrmWVF2v0UugEgloGs9/D2RPxTy5V0XNtc
	eJDYCKobQAPZ6GaBfyNVWKu0QUXBcLUl0g4BuulQRnmGBFkkiMC5nqQZLhhOlMvQBsIc3e5Pm8Zbn
	Aj/LVELi3+huUIzmDODFptE3LlX8BfepgfSQlXIJ5EMjDOXHHEClZv/ddFktCcBrEOUrmUpLZeN1c
	qc52c+ppIqhjVzE5PYCQWiRQ2MYyOCvQyYYqmdIDaeDx0GDE8w+//4+RSeb9gcmCLAUaHfo3sjp5o
	qv5GSLsKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtYq-0006fk-O3; Tue, 20 Oct 2020 15:28:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtYm-0006eN-Sy
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 15:28:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id c77so2222793wmd.4
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Uni4zU2UKq83r3GssjKIzqKjG0Dp20lSmVCKXMSU8kM=;
 b=nozQxSm8nIYAYkI27iZ/rdaOTggYEMik8PvvYYJ8mB2YwC3yotFQs6IvxosEXi5rkG
 hQzJQDdkzwQIQ5G411496IXZ6k0kCnUPOg4kGPDy29+RvsogwkrQfekFEH4tSX7VEfky
 aZZZS0vdg87DzaSG11NYZoxPz2iho6R3M/UW/iROR4cmE+9FXdaQj4ArDFY5yjQcL84s
 Wj2xFOSUVhWWChyb3G/lwt0aY97YpFY7qJ3Z4vCB2Odm+W0vhLu/fiZOt1CIeoRgOYBQ
 TyX3yPYBD8CteAmiChWok1jlWeXxjYUOUlHeKYg44u+oTS+7ogJOBn8IfnSFPcT1cJOt
 FOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Uni4zU2UKq83r3GssjKIzqKjG0Dp20lSmVCKXMSU8kM=;
 b=Mg/bf5nRe++TYH7tq3h9VwemA9z1wyJzB1U241HwkxIfjrjjUcZSJFKyfHLcMBf7wv
 3TDyHwdboCT2QI2aTf/rUAbiFOPn6rZhqxtiMK/+LXbEMnWEipb1fbNfCi69okqTmiow
 8TjdTTsNUIDiHA4Ce1DhuGPLLjaHT+EXsv3KMgSWusmy1fCg/dlIBkrUYzrnmn63/v0i
 D1eOvBCKixY7NlKNTGZBcrH5ehh5UesweydW6qaV4OERhaoErpyaqNgyEt/8AeAJxxws
 BnlQsjTQpdK/PmDlYjDg41uatsii3W3Ib9T7DtuoAV8+6LRYfNmzLTU+Rpe6T5K4uZqb
 5OXA==
X-Gm-Message-State: AOAM533FY+y2L50HI3ruF+r2PzDGexXKhwxYyw0P7EKoydgcHsQ9fqAe
 Ixm6hvjPKaklUKLIz1PkzmX9YQ==
X-Google-Smtp-Source: ABdhPJwogFQKebYSRpB5PhLi5QRgWT6BJZxuYP49ltOyGEszk0WxYbYVl7uKMV8tweFiKjYhTLJIFg==
X-Received: by 2002:a1c:cc:: with SMTP id 195mr2068187wma.52.1603207703778;
 Tue, 20 Oct 2020 08:28:23 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id s1sm2943781wmh.22.2020.10.20.08.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:28:23 -0700 (PDT)
References: <20201020075034.172825-1-jbrunet@baylibre.com>
 <7hblgxkki3.fsf@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: meson: ship only the necessary clock controllers
In-reply-to: <7hblgxkki3.fsf@baylibre.com>
Date: Tue, 20 Oct 2020 17:28:22 +0200
Message-ID: <1jimb4nch5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_112824_991480_69584F76 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 20 Oct 2020 at 17:03, Kevin Hilman <khilman@baylibre.com> wrote:

> Jerome Brunet <jbrunet@baylibre.com> writes:
>
>> There now the menu entries for the amlogic clock controllers.
>> Do not select these when ARM64 is enabled so it possible to ship only the
>> required.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  arch/arm64/Kconfig.platforms | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index cd58f8495c45..b22d1bdd6eb6 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -154,9 +154,6 @@ config ARCH_MESON
>>  	bool "Amlogic Platforms"
>>  	select PINCTRL
>>  	select PINCTRL_MESON
>> -	select COMMON_CLK_GXBB
>> -	select COMMON_CLK_AXG
>> -	select COMMON_CLK_G12A
>
> This patch alone will break boot when using the default, upstream
> defconfig because these options will all now be disabled and we'll have
> no clock providers.
>
> I think you also need a default value (e.g. `default y`) in
> drivers/clk/meson/Kconfig for each of these entries to keep the same
> defaults.   But these defaults could be overridden by SoC-specific
> defconfigs leading to more flexibilty.
>
> So, assuming you queue up a drivers/clk patch to go in when this
> lands...

Indeed.
Please wait till the clock PR lands during the merge window, you'll see
that it is already taken care of.

I was not expecting you to look at it so soon ;)

>
> Acked-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
