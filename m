Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA362C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 20:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD48204EA
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 20:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IOCBVzUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dKwb8xqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD48204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eWEZCaNpvF7FXixAoegIN2MEEGPQvmoKQ8DR5KTFBNc=; b=IOCBVzUZNd1tpi3S7b7VT5CJ/
	CIsjO9OSluTiDAoZ7sARlm/bOgEGXWoKBTXKXI1rPUGXBjTDWsnq2FnzCRcIuryB1fimJfUu85pHk
	s8BcH3dkWNATEughT0FQFf1QVoYqJios13HX/Bap/R8kpAjS2iIO4om+mU1go/lCEkbe9O40YWgdC
	Gc3qwDp8E6QifPjn6MTKfpPA0c9VdX6UBTFc6nQ24bJQ6JgSRKtxM8BbFpRQRnKM91Er3gVt6qG6z
	2WwRPeE+lzGYhyxZrgir84Hf0MY4tIwmWqHsPytww6WijAWHZrPrB4FmZB13jnIUclj+0lLyO3cM8
	DXdMj1jxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAJDK-0004tW-Dc; Mon, 24 Aug 2020 20:37:10 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAJDC-0004pC-FM
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 20:37:03 +0000
Received: by mail-pf1-x441.google.com with SMTP id 17so5528106pfw.9
 for <linux-amlogic@lists.infradead.org>; Mon, 24 Aug 2020 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1KJJoI/nvslv9Gkh89DSDDuviv25t/TeB8gsOO3usDU=;
 b=dKwb8xqaWv5UZ7fpuIXA4NK3AbY3BNKNsCYxa4If/n9+18e6JlHkcck57uguVdS27N
 a2eEO9eATvS0aT06XaLk5j+7+0yl7lw1zcCdq8mwEDbhhrYQ00fdSZTZIhElahL+QC3y
 jLmX+X/A6QjlelCcCHWbn9GlBDUOr8ltSJKXUsnK6qKgBxJ0ti8i428XAJefDDdWh1oM
 LJ850oiIELLwrV8nqVsmpsf7JH0gedYfL3LZwthbQUOw18SrJsE5ke77BPQgrgEfaW24
 169q5TA6ocTCDnmewjw08xEjJvhgUs8aMJqZtf+L9wSOhXpQ/FMTg6C7wFVyt1lOzPJA
 oAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1KJJoI/nvslv9Gkh89DSDDuviv25t/TeB8gsOO3usDU=;
 b=aLmdbP/0U2GtnVGGY3bLqItlWF9wJ61JZvGYWNG24DTxQxiIPCYarfocOt6xWU4yCk
 whMGukuQdL/TYnuir+0mhedPBoUu1Es/uitH1Bcjxqn27RN7+PM8EbUAtAfECTmR5q0H
 YSnFyBzQcX1egL9ZUxprS+M+H0V1zFoAsUtN1FV0huRiWtAylwiEh7+pFWP1ryBViMJx
 HtM0TIsRZ0ht69/gXG63vJbFAvXoR67qdNGtSRqSu7eevdwbq4zxg3WusHg+Y9OL/anV
 GGF6+mUVlLtywR0dVRiLgXV/rR/lZxY20LT+7wSFtZmiOwLRb8ZtEAr9wBMp6e82Jg56
 znrw==
X-Gm-Message-State: AOAM533SWwfwpAgGahaH1/6YZ1AwPvyU2NdjgsdiSiNuH9M1uuyhdRrZ
 J23HVaHolDy2Fe4cb3D+7GlaWg==
X-Google-Smtp-Source: ABdhPJy2Xb5XpgDAC7S92NKuMLFb8qEH8tHvI4xQ2pB0Pt7gkAmYfk0h0dNLVPyr37j4PQLShYUCYg==
X-Received: by 2002:a17:902:8a8e:: with SMTP id
 p14mr1318808plo.42.1598301418731; 
 Mon, 24 Aug 2020 13:36:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v2sm5518805pfn.116.2020.08.24.13.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 13:36:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
In-Reply-To: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
References: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
Date: Mon, 24 Aug 2020 13:36:57 -0700
Message-ID: <7himd7u6fq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_163702_597196_5B1A085C 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The 3.10 vendor kernel defines the following GPU 20 interrupt lines:
>   #define INT_MALI_GP                 AM_IRQ(160)
>   #define INT_MALI_GP_MMU             AM_IRQ(161)
>   #define INT_MALI_PP                 AM_IRQ(162)
>   #define INT_MALI_PMU                AM_IRQ(163)
>   #define INT_MALI_PP0                AM_IRQ(164)
>   #define INT_MALI_PP0_MMU            AM_IRQ(165)
>   #define INT_MALI_PP1                AM_IRQ(166)
>   #define INT_MALI_PP1_MMU            AM_IRQ(167)
>   #define INT_MALI_PP2                AM_IRQ(168)
>   #define INT_MALI_PP2_MMU            AM_IRQ(169)
>   #define INT_MALI_PP3                AM_IRQ(170)
>   #define INT_MALI_PP3_MMU            AM_IRQ(171)
>   #define INT_MALI_PP4                AM_IRQ(172)
>   #define INT_MALI_PP4_MMU            AM_IRQ(173)
>   #define INT_MALI_PP5                AM_IRQ(174)
>   #define INT_MALI_PP5_MMU            AM_IRQ(175)
>   #define INT_MALI_PP6                AM_IRQ(176)
>   #define INT_MALI_PP6_MMU            AM_IRQ(177)
>   #define INT_MALI_PP7                AM_IRQ(178)
>   #define INT_MALI_PP7_MMU            AM_IRQ(179)
>
> However, the driver from the 3.10 vendor kernel does not use the
> following four interrupt lines:
> - INT_MALI_PP3
> - INT_MALI_PP3_MMU
> - INT_MALI_PP7
> - INT_MALI_PP7_MMU
>
> Drop the "pp3" and "ppmmu3" interrupt lines. This is also important
> because there is no matching entry in interrupt-names for it (meaning
> the "pp2" interrupt is actually assigned to the "pp3" interrupt line).
>
> Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
> Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> re-send of v1 from [0] because it was never picked up

Oops, sorry this fell through the cracks.  Now Queued for v5.9-rc1.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
