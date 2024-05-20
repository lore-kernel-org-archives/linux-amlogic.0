Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F1CC25B7A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgAHPw8cUOa3X64T7Z9gCs/Yw8GaxmDiiK6xurlnK2w=; b=WCseHvE2sG6fT0
	Dwgrk/bdRQZz0xY/lptD+kZ5+N7fCB3Wp5HEw4VfOYxrTKMcuVOcE7yHfqsy4J+zya4N31Ib42nHn
	+S9Jd2QxEd1vJ2W3x2bdNtLib4VhVrTguvlUjcMNaG2iaOE7wa5N/kFeD9HZmll0xMF7k6CekmSHZ
	iAFZ8uGpov3333DONFSuXS4cTjH+s/0ehmqHQ/5AwX6hYXi0rxEFbSi3DPTEVwiEhmZSR0yeSYiRr
	0sFXCsKHU2CF+JkhyNSUKnC/Ji9+WBUCs4qXL2yWII0VdsPf53lwCsC9tcgkFlZkmolnMsznHb6Xa
	3YELtqa7ralqZLGPrayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90nT-0000000EEUA-1HcU;
	Mon, 20 May 2024 11:03:15 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90nQ-0000000EESj-41EZ
	for linux-amlogic@lists.infradead.org;
	Mon, 20 May 2024 11:03:14 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-51fdc9af005so5175784e87.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2024 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202991; x=1716807791; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=bmHpPXdUSwJ6cBQ5LYw9062E5m4tONJNOP+8WyCY9lMj2tTa/5BSy1GxIVnWkW2qPw
         pY5we+ekpPcKqXZOKv7J+pX1F5ifyNFWFxLGV0PErRCgQ6yZ/vt4vSOE6kuPumxTne5K
         7AOU8iGoT4zuUlS1X5ZGkWjXqfR6mYCwBGfBgqdf4xWKz/FnfMgx+T2GF6J/PLNgcEgp
         6X/+Mpo4k6NdR5+t1N+kSAU7JZ348wr15JO4OwGCkRI2qzUNzrWVUzF1iqd/TOxNkFtF
         g240WPuB4eqtn4UKK/ZuowHQbtncIx3wxkq/64jkhwUlIJkOe7Of3kaYuQQGTA+3raC2
         gVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202991; x=1716807791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDt5zL9HqHL0LNTVxzu6RK9k/3ub+zUe1M1krBVr+UI=;
        b=TkshaH8nImPx1SCiCWOpBq5uPK6DuKcdbckbCHEyGZsiBKh7ee5v8ADefotFJoA1qc
         Oit6p8Sdj6qMmgOQZEt3WW1QTmMdpNshv8ksn+tt1+v0iUpzu1LEn68SD0sXxH4l8mVN
         CruHZe3d9M9QGxBHGu4pIb2i3GQZ9yrtMfqjNLFInl2poM06+MVemBMbLg95QvGtKr/R
         FK07S31Gomqxy9ZXhODk11p8RDNS/4lXZf3/yqG3UGP+OhBlSB+zKFWlc2AnrJ9RkkV6
         UPHYOsAm+qEVbgaNcjlhyZ2DYJG4h3GCz1Lpnouh7UYqeCo70ucKdlJpTiOVSNpJcSac
         3C4A==
X-Forwarded-Encrypted: i=1; AJvYcCVseYUnOPPWfpf5pyvG8EhAo3v1sOjQRNa3w3Z+PPYeAO7WSRxWQc1PMpZf3ZxQ25vkR5VGhKiww+K6bfs8muYJiulMQgDSPrwC/sYMKsH9rg8=
X-Gm-Message-State: AOJu0Yy60LE42ND6YRw9NDpFieSFVQn6s+e18BS09wqu7BijI5zeJG1b
	nLQoGUC1MapS1hCBzeW8XeyvA8g+XdFSwYSBTUyIgLObmoh6w/fpMUsFPmb9GhE=
X-Google-Smtp-Source: AGHT+IEACx6wIZ/owZMa9fgLdIORVLGiIVgPJ5CApXgwF8B9qZycal7wPuLLAhEdV381KLhAEa79fg==
X-Received: by 2002:a05:6512:33cf:b0:51d:9291:6945 with SMTP id 2adb3069b0e04-522102785abmr29386158e87.44.1716202991332;
        Mon, 20 May 2024 04:03:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5225132505csm3241339e87.116.2024.05.20.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:03:10 -0700 (PDT)
Date: Mon, 20 May 2024 14:03:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] drm/ci: uprev IGT
Message-ID: <4hnd6bznqsp3ve7dh6uhz3ygs7yyapqcrainnqlhfejomcdbvo@htlnfpqb3jg3>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_040313_044404_2172485C 
X-CRM114-Status: UNSURE (   9.98  )
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

On Fri, May 17, 2024 at 02:55:00PM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets.
> 
> This is fixed in igt-gpu-tools. So uprev IGT to include the
> commit which fixes this issue. Disable building xe driver
> tests for non-intel platforms.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
