Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF25C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 11:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lr9/b2rg9lWIVXumGnN1SlM/pBa+G9lQArA6QqUrWE4=; b=3RvhgjmDplV2AT
	CxQPiFfbFWH6mWdS5qjP06CpP2Kl8tB4Z2vRTHUw/wGXk1Qio7h5ZJu/fW0H1WHMwKLcGs5VSGtjk
	+S7Ix8uQf4lj+l4tqK7n32oZm2o1wQdYaosyWcCWzpWDyz8fpeZn3oWrYfAnxZmFNc0GLBWYbrAG7
	OpGBylpt10ftiJk7/zw79DEv9tcSSnS9UuN9K/IhZ1Vq2LHONZh9+G4ksGiR1rpqlGb4m836YpkUM
	YUZ8hu2X90OqLNc0yapFtV4RfV0IH2GiUEIa3kSY4wFgRVgfWOSUN7ZamWUnANguY+lAd3k312h4k
	/K0aUr473oqenMg/CBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90o7-0000000EEga-2PoR;
	Mon, 20 May 2024 11:03:55 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90o5-0000000EEfg-0OHQ
	for linux-amlogic@lists.infradead.org;
	Mon, 20 May 2024 11:03:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-51f0602bc58so2340411e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2024 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716203031; x=1716807831; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=DtdKg7zZcN0qEyrqTOpPFL5ybjFYjIfPoIX1HbgcSqafDpaK9Xnl/218l/iWwRmVbD
         FZTHryg6PFJjK+YSTa9sxCw6FGIdYuBy6aFgm73HgVHd2D5bupwBDBpVbBj5mCq3QN6N
         IljaTWlzf7NswvjaJPhXiJt+UysTb3J/HoPi2R8CEp2bT1ySgzfQfkFLgSqOT0bwxGLC
         uCelGNTpn60swXF5E6q0eXCS/ETHOKSuXWr7NlGkDEw/TnU7u585DysFifST6ESsf2Gh
         EWNFX17GmvA2+K7uLKqv0lOMYbQKEvC3gj36kG+ewPZ/mY6uOCx1AU5rit7sRPYYibPS
         hQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716203031; x=1716807831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrnpWE7dPEJmYiT/RDr1bXYldnFvFFfi6hz3R8sA0hI=;
        b=R0+ND014B6nC74NU3wg5+hVdtjzyr+mrOsjklt/mHvflNietydvnXeP49f+lkroZLE
         CqpZR20aDDiQZKLGhQQRW1w5Iw5sIpb04yg/MBl5fXEpHWURCFWqM7/BKVFizm+rOY7Y
         U28Am1o5BYbUldd+C8vmee4WXSYZ/EFVJE3iYVJud7njmias01bUq2FqnGTsKVtg7TnM
         P6+zhRiVWwrrbZf61bdYi/8VI1BxYwRyDnYE46EvFKyMXTcWlidTA/yENkXCL3yivhHy
         MBY5MbjGRsx2ShbLkl2/sJVicrrD5UMD8w9Mxve+6mlqkzFgVr33+UleLU0liYBtTNgj
         mFzg==
X-Forwarded-Encrypted: i=1; AJvYcCVlO+Yp/kXlzhZ+Rp9s+GGI31agJuStNfc7VbE784uSeIG+zRwI8zaolQr0zlujbIdyCVDMhjhozMO/kCQOxKLrAgzqpSdKnSf5bm9W72xLX8M=
X-Gm-Message-State: AOJu0YwlH/NVQ+t0VOIKWZto7U52q536OuwKHfNDB/1+0z2p8xU0aDp1
	M9J5duEfWtwZfioOWyhH3VvyZLsKS3nPCEdC7ejBGZ5ePuTYm9sAkHovczpen+c=
X-Google-Smtp-Source: AGHT+IHrPX1EE5HJbqIWKfZcM1kS0oKboB5I8XtzpfJrKSrhX0xiWZVBV8AXw8xry+E6Y03ekdH7bw==
X-Received: by 2002:a2e:9d8a:0:b0:2d8:611c:228a with SMTP id 38308e7fff4ca-2e71714cb85mr17078161fa.8.1716203031220;
        Mon, 20 May 2024 04:03:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d0ce30e1sm34354131fa.38.2024.05.20.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:50 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] drm/ci: skip driver specific tests
Message-ID: <mxolwwmi5rjaevuwi7qy6rm5n62rhnpbi7hz4n7xbshmi2hoqq@5uzamkipouek>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-6-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-6-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040353_188217_5F6A439B 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 17, 2024 at 02:55:01PM +0530, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---

I didn't perform a through check, but generally looks good.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
