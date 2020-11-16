Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9DFC64E8A
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 18:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C179A2231B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 18:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opTzGVpQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GpnsUtXV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C179A2231B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3z3+U1LJoRBxYLb5N9NQ7d3j7pRdcWvq66lLTBsNpb8=; b=opTzGVpQoalm/cf+I0+Lie++L
	0fQ06VTSR8/2i8PjbjVIoL+PrCuG6hDzKnHc/6iptSIe3oqF4jWJBPecgbR3eWuuNteeoZFk4XxtD
	rd/dMWx7753WvmIiIDKiJGJO+fRClEm8k6Rr2LSXp36lPorNdnlOsey0sY4FZJoPCWbaetqJ3LLCQ
	21fQosZFuMF6s0+swuunbK7fk6QR2urB5u+jIezFUp8+eziAwR/NZFw/u9jcFgOwU2loVz5Enk7ZM
	rBHViHy2fo3IpvgVoi2WKZYZgLm3qybGTauPhZKerYvgcqWqDxrVFjpz8oE4naZ3gkR5DCXcyr8n7
	0h2umvp2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kejKb-0001tH-SD; Mon, 16 Nov 2020 18:34:25 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kejKZ-0001s3-4l
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 18:34:24 +0000
Received: by mail-pf1-x442.google.com with SMTP id b63so11357932pfg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 10:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=QVvcJdJmpqnlFCLLkW4zJyWf8eFpaM5XCv8ZqOAZ0do=;
 b=GpnsUtXV4YL0rAUZfUERSVnakbTycQixdwQn/hCf72h7cri1fmlDUiNpse79XjaCw2
 g2P6pw+NVIaxFf5IhooVnjLPtIzy6VAdcLReIgAl1KDzlaY+IDcZetkYDD595W4+NKsf
 wgUh1h0rWegX0a2s9q4Zz73YgdlnUWXve3rX9xie55+JTzA6U1dtlOo7Cx2/io/BZQY/
 xc1RbdkWd2Tp3ADIiKEjTz+rkKTTHPIjaZjuOrbMACi4h25rJMElou3zDamd6G/fPyua
 eSv5tt2toV6jHCTL9eQgGyU1CWr675DHtGd2rxlldeYiJP0sp8J6CRp2tQ0x1SWBM5Vs
 QVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=QVvcJdJmpqnlFCLLkW4zJyWf8eFpaM5XCv8ZqOAZ0do=;
 b=cWShmSd91TCoGJQvU2fItu6vYobyAfSv5jgP+4ZRXLkVaQ7MIE/nFGSUp+an5L4UOE
 gy6ybMUiZ+jygm/Y2SxuuOnbhiztw7wZsFsaYBIBlCBH+o1JuZNb8Y15nyDcYsFT5f/v
 gYl6/kNoMnP5hTnfAaQl78nvopEWK4lNcVMSMymJIgCYvNZ478t+URGYZbxYGC6LFqNn
 Ng/tpve/GrjO4+rVLF+wqcG5hS756RgY9uz9OiXumTev6x5AB+6dd//Dw7REKEOSvr9h
 AmuaROkuvtL+Kzq6ufPieljv5MDUYKf9m4LXwoeubVTrBmuucpwilNsZz42XgZ8Dvp9O
 uHGw==
X-Gm-Message-State: AOAM533FbxPUNbbzdSbVaZsrFGXqiz57OmEyy7XLU+w97DiXT7RVBnvz
 HgHU6FFqdlNVWseBdYTVsBpJyncv3voX6qdiv+A=
X-Google-Smtp-Source: ABdhPJx+jGW+KoJEtsBTl+HxuBZ6EhpovPRpR3LhArqlcwWGbl3byEZO0CeKNKnYCF0Ey7VMLWtNog==
X-Received: by 2002:a17:90a:d591:: with SMTP id v17mr261644pju.4.1605551659589; 
 Mon, 16 Nov 2020 10:34:19 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id j19sm20395117pfd.189.2020.11.16.10.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 10:34:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: meson: enable building as modules
In-Reply-To: <1jft5hpq85.fsf@starbuckisacylon.baylibre.com>
References: <20201109233622.23598-1-khilman@baylibre.com>
 <1jft5hpq85.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 16 Nov 2020 10:34:18 -0800
Message-ID: <7hsg9940d1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_133423_312387_AC88CEC7 
X-CRM114-Status: GOOD (  12.52  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Tue 10 Nov 2020 at 00:36, Kevin Hilman <khilman@baylibre.com> wrote:
>
>> Make it possible to build all clk drivers as modules, but default
>> remains built-in.
>>
>> No functional changes.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Depends on series adding new API to get clk consumer from clk_hw:
>> https://lore.kernel.org/linux-amlogic/20201021162147.563655-1-jbrunet@baylibre.com/
>
> and
>
> https://lore.kernel.org/r/20201021163847.595189-1-jbrunet@baylibre.com
>
> Once these notifier allocations are dealt with, I'm happy to take this.
>
> One minor details though ...

[...]

>>  config COMMON_CLK_G12A
>> -	bool "G12 and SM1 SoC clock controllers support"
>> +	tristate "G12 and SM1 SoC clock controllers support"
>>  	depends on ARM64
>>  	default y
>>  	select COMMON_CLK_MESON_REGMAP
>> @@ -110,6 +110,7 @@ config COMMON_CLK_G12A
>>  	select COMMON_CLK_MESON_AO_CLKC
>>  	select COMMON_CLK_MESON_EE_CLKC
>>  	select COMMON_CLK_MESON_CPU_DYNDIV
>> +	select COMMON_CLK_MESON_VID_PLL_DIV
>
> This looks like a fix which could be sent separately with a fix tag,
> doesn't it ?

Ah, yes.  This is a fix which should be sent separately.  I'll split it
out and resend.

Thanks for the review,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
