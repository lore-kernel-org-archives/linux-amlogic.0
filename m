Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E7C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9746206DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gzvYMgY0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CepSTDzt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9746206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkJNqXSk1Cmqk+I6Mr945Afr9NIpS+1mWR/RuSN+CyQ=; b=gzvYMgY0TBzRaJ
	VyFs4dr0myGTobWS43ODyOI42vqHFFH0MAOWXLlFy8dQXcAAf+nlp5uD6evla2cIEVn/cHR4hTZhI
	bMg2s538XIIoWnCXIjId3Gmcy4YdwU9xsnlc/4a5//6PLNJk89jxudvVfBRUi9bXm3VVOvMs4qhod
	aPGvYqpYTvEzi41UGCXogUqMZyBpB+Z2WkyuVN/cJCCH/Sb8jn1+Kf90mALbdZEiXy7rrN76ulFWw
	aL6xdRF0edshe6lRHhoOoYPdjqgIjU7QqmEV7vb7XnRhzZBUP0YwTLRF5mqE/RpLJ2QA5qTnJN5nK
	9qQVuIRUVx5aQ0m4sreg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MQk-0007Nv-QJ; Mon, 25 Mar 2019 10:02:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MQe-0007Bg-TC
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:02:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id o1so9301942wrs.13
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ZESaBp9NpftZA4uZ0kHsrucdZgVgPNyX7p82BbH1GIE=;
 b=CepSTDztojzeMepDgTaZa3965hZn4wd7KWTkC6jR3Rzu+6L933axPSJ76Fjr8Y7F8C
 ONY1f7UagYrNAyr7aYdsXPAwdaCoMK8qu3vWtkZ9OYADUxdM4R3AgDDv7PL0ZQHoXHYE
 zcbA+7vZ7Uu7pQeAIsEFA3vKfyA71dGms9gnuLXeyqKYH1XXL/4BvPlIJbJR7zMdtM7n
 DTuG/2KV8Z99msyonvCz9rDWKENRvPcKEtDX1Snif1X0jxWnJ7l7tKkK84W0WIZ5ogrd
 gUsOKxsnOd2udDBrQPsCDbImvLAcXxhWaUV8aHJ2C9Dzvv/MuKT9r1SRIrzbRyAVi9Tz
 wI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ZESaBp9NpftZA4uZ0kHsrucdZgVgPNyX7p82BbH1GIE=;
 b=CklL4AwvHFdvbTnWfPEnY86ruTV5w70AzA1z7snkHLFHUPmwvrYDyg2Pf1bwO4CRJ/
 7CNbRAR6u8fXVIUZD3iSb6WMVmItarXJ5oy/Y+iEbQK1PK5LpUM8niZZk1mYmszHAjpy
 yKmAO9Q92qag3Qpc7IP9KCKZDySnDoHxltexrhvAbI+xZqJctSTUT5T5Hij0oXwl34+B
 egxICyrwd+QErND7j2NSxT/3p47zrjpTnDcb/pGi07eJPTPCUiJGy68ylkPW15TvxoUD
 fjqqO4srM71nXajEuTr4woywlI7bk827GbQoSenn7ZcImg/Fm/zXBG/bz4OE5Z5YkGn5
 Qr7w==
X-Gm-Message-State: APjAAAW3ldd3WVnFqLxHImITlknSQzEJj0z8BoTwvAd1z/cZS0Bp7nBm
 cQjUrbVYAMwfeMLANSAnWt7/RQ==
X-Google-Smtp-Source: APXvYqwfSXXy1j6IVYlenJpfG0pNEIsFQiM52nteZBH/vDSiaCErR6sTlfuyxvmFFMWiYPcfyKfpfg==
X-Received: by 2002:a5d:6883:: with SMTP id h3mr14684000wru.215.1553508120486; 
 Mon, 25 Mar 2019 03:02:00 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 z19sm9122061wml.44.2019.03.25.03.01.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 03:01:59 -0700 (PDT)
Message-ID: <39732b0ea1d10bd91423ca80b61abf5545965dda.camel@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson8b: add the video decoder clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org, 
 mjourdan@baylibre.com
Date: Mon, 25 Mar 2019 11:01:57 +0100
In-Reply-To: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
References: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030205_001019_9AB05D54 
X-CRM114-Status: GOOD (  15.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-03-24 at 16:14 +0100, Martin Blumenstingl wrote:
> This adds the video decoder clocks for Meson8, Meson8b and Meson8m2.
> 
> The clock tree on Meson8 differs from the one one Meson8b and Meson8m2.
> Details can be found in patch #2.
> 
> There are some checkpatch warnings in patch #2:
>   WARNING: please, no space before tabs
> I decided to still send the patch because we have the same inconsistency
> with all other clk_hw_onecell_data table entries. Please let me know if
> I should come up with a follow-up patch to clean them all up.

A cleanup patch is always appreciated :) Before or after your changes, I don't
really mind. Up to you.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> 
> Testing:
> I have not tested this with Maxime's video decoder driver yet.
> However, I manually enabled and set various frequencies for the HCODEC
> clock and verified that clkmsr reports the correct rate.
> 
> Dependencies:
> This is meant to be applied on top of my other series from [0]:
>   clk: meson8b: add the VPU clock tree
> 
> Changes since v1 at [1]:
> - collected Neil's and Maxime's Reviewed-by (thank you!)
> 
> 
> [0] https://patchwork.kernel.org/cover/10860401/
> [1] https://patchwork.kernel.org/cover/10860513/
> 
> 
> Martin Blumenstingl (2):
>   dt-bindings: clock: meson8b: export the video decoder clocks
>   clk: meson: meson8b: add the video decoder clock trees
> 
>  drivers/clk/meson/meson8b.c              | 312 +++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h              |  17 +-
>  include/dt-bindings/clock/meson8b-clkc.h |   4 +
>  3 files changed, 332 insertions(+), 1 deletion(-)
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
