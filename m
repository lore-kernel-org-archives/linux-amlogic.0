Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45185C25B75
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 07:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Shsj+0dhMqWgCO3lLUohPJ6NbRhOOnVrTmb9WoJ+sQ=; b=Hq+08FWJWDvm0v
	Hl+LOhpnHcpmN0xK+LQ/7UVhvihQMt9gcz3ZcEinGVzoB0rrPzQLx4kweV1IQFMT6L/P/PWRJvcfR
	ZPQmMqXtx/5gPMSb1VuwNbvlRQHKmHqBsTJlfSzsfhdnGfUpnPSVyA1IW4xE2Lw6K3x3QZV7LA5YK
	n2PQldffusQzyxLHujpSQ1RYn056dGEcq91+wLg/EA19UBBW6KO/ul2gx/bdTJvOD0yupvx+0PdGT
	e1xkSYWI25oS4iq5je+q7uqh/6hMLimmGG9+4+bw56Ktn6xIUExEus+qQX5F7kT6tIAZDN47KeNiI
	IJ7iyoE3YweMqYxGPzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDyd-00000003BwE-11EA;
	Wed, 29 May 2024 07:44:03 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDyY-00000003BuG-41Qq
	for linux-amlogic@lists.infradead.org;
	Wed, 29 May 2024 07:44:01 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-529682e013dso2062411e87.3
        for <linux-amlogic@lists.infradead.org>; Wed, 29 May 2024 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968636; x=1717573436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=br7KtXjf+Q4+V4jKTkURqoCSjRI7FgE30Q93JWJGSGyTX6EAJIZvwD3zUirYWsTvAE
         bzsvpeoBNaZdCbUHJXktG9N8ircW2VNHrY3WYFyVDpVj7N1be+sv8cU2X+VcjL62ACCh
         karxT4Gd0FEqa4Pfha7uj5T3US7VRIAynlhTAkbBWrUdvQZGA9o6WD6CAS7NDzdWLMsr
         O1YTOj56YsAYmxijjWIDtmuUUv4OablaUaQsuFn6Pt8UPY6TCGFEvYRxASlhXUlzSu//
         t87zWvwb1QlsBj+250mk87RzHRvcfzo3A7Xtp6QwV9ePyj6au4C1ze5zLqVtxKxIsrHz
         1OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968636; x=1717573436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka2Maam5Ei5EuRcb2P0MO3/hFv2w3w7reQQ7Fg93ZTo=;
        b=EjZwBVGM++tZAQNKZyvtBIyweESCBwU5lbTjGLciXu8szOrvnvR7zpZaCx76EphS3B
         OdKbMgzMKx7DBQcUg3UEXoqDzvzVBn/zjIH3DRwcYnlWC4qIeZyZR5JA8dSNiCfp9fIC
         nkL8WGLWJKjmkYGSRuPdAkxA50VdoNE3iiENrfBVwGpxrYnDLnzx0VukP/5bP06VK8tC
         itW839HFWQu+CEfBBbapfW3R5H2+1pwUzo2LXAqE+g4NqTN0BWgfubhvodXeXH30rKEj
         Hpy6V3Xo7cXKw1XkAZsXuBgAsztPvcAaTUV24YaM9BN3d8CBFFTPenQpTtF/X2B4j1mw
         zCww==
X-Forwarded-Encrypted: i=1; AJvYcCVJbY8lGJCFKNaYFNuNwi6+H941S/s0wnzC/pTRa/huXoTIa9cDMZtB4lUwEpOwQAZw5yf9NEQzjCBGoCWoDtPBAK2c60cYgA+8xT6cEUo3Sfw=
X-Gm-Message-State: AOJu0YzEpO0RUEWNuimBY1LSLo3rtsKRa2eJlxSVqhDPpYzq8UMKI3cU
	T2eGde5hitruKC90o6MSVrHvYkA0WCmIWAYYgeBVgxkbq2oPO6Ox85wgK4lUmew=
X-Google-Smtp-Source: AGHT+IEpKoJxeYMMRmRHKz19pKO8ijGaGc5T6KYCnRuUNFgdev3K9Yfz0P6oPUoZ1/TYqG8Ww0hnig==
X-Received: by 2002:a05:6512:3241:b0:51c:df1f:2edc with SMTP id 2adb3069b0e04-529644ebe8cmr7988541e87.2.1716968635950;
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a50b1d85sm978336e87.113.2024.05.29.00.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:43:55 -0700 (PDT)
Date: Wed, 29 May 2024 10:43:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] drm/ci: add farm variable
Message-ID: <xhdcswueynlctjznqnxo663v2k6q2lrk55jjdodrkd7ojijaiw@lg3e2e5qcnny>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-3-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_004359_015582_5E55652B 
X-CRM114-Status: UNSURE (   9.60  )
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

On Wed, May 29, 2024 at 08:10:45AM +0530, Vignesh Raman wrote:
> Mesa uses structured logs for logging and debug purpose,
> https://mesa.pages.freedesktop.org/-/mesa/-/jobs/59165650/artifacts/results/job_detail.json
> 
> Since drm-ci uses the mesa scripts, add the farm variable
> and update the device type for missing jobs.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v3:
>   - New commit to add farm variable and update device type variable.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
