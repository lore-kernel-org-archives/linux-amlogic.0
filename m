Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60610C88E5C
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kobBl0zHqjGdfKBLw1+GXvrEv/c8ta18CgLlzXB43uI=; b=oD9SXVJQ3bqHhK
	aFAB9g0lwT8OKIxPHhbeOBs32fZJcKxc0xWltNDnJvxd+MyaBXKspRZSkQS2hZOgl8+7c0zcCQwpi
	Ofbtmtk2cmQTrcmzot7hmf7YpqlHOD7cngrhCsGzAh7maAY7zvPq3NohZTsWAOSaQnkbnQuWuiqhq
	Bod80MwQvf5+7NeV6En2chG5mCchRbXgP3aIM8GwZXRiNMLpi7GxTqB44QQ/okgTSRDjhnVikWz8v
	81Hxp5nvIRuCkPoCDp7ebD9zNA8SoTtAH86ALXTdvHhmTjk1k//3p8NC733VXB9lKuoGcb1WQDR2c
	rYRsV8aslXaQYipHCAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hgl-00000008KpP-2ozE;
	Wed, 16 Sep 2026 04:56:07 +0000
Received: from mail-pj2-x2b.google.com ([2607:f8b0:4864:39::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hgi-00000008Kp3-26IJ
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 04:56:05 +0000
Received: by mail-pj2-x2b.google.com with SMTP id d9443c01a7336-2d8fe517774so6291685ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 21:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534562; x=1790139362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NH5SR9jg7eNT12/RBDArov96uanRr4HR7KrIlDgUX+4=;
        b=IJSXTY5rAV317P0ecQp3RjNd3w4dfvFoVtuJCyJGoSzwGNdjS1Es/mC+pY0Q2wwQz0
         LvMtoGA4D0xLLa0LanBLR2yp5Pz9knmUXN+BDk9a/CPlrirAhMGGiit903zcSqnFBW1n
         QpVnKZxKpgvoLuoVIcEFYBktN6cNueyknilZc48gOfVkkUFMA12txPDmHEZlsQVFkDE1
         EY9BE4bwm5plpk0j3q9r/h64n8FPofNv/OlDW0i4RZ9l4cdmlJZoXCexJt0GjqjI2037
         8e5lsNxb/xbr2ePDVdEp1aVcZtr4MOoOQe7R2J7WZkXsuxQda3KEo5fIBSDEY8YPjnPy
         Ghlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534562; x=1790139362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NH5SR9jg7eNT12/RBDArov96uanRr4HR7KrIlDgUX+4=;
        b=gy7p6PNbIxUDWY9o/sNcOVpx/TMiOMaHnQzIr2mtz9+OFAdAXzJinNMBNtr1AGUd3e
         qAIg0UWTn99+T8GdbdxiOd2gBC7SHphqLuwPOPht7PJtwQ068MGIlN7KkYelPVkgbP0v
         9ncwVPi3Toz+SJPAgvZvQm/bSjbU1XfqhOABmm2LrEhEXluQd0okLT/qA5unRaIRxAhk
         OBY06uC+z2IAEieoS39dWRXd00SLJ8UgjHUeq6dO//Td117mpyijEXwD2jaTR5q9jhI7
         Tg8uFL3w7OSsa4vl9nzecvwOSFzaFJv0Vnu7GxWf4OYG+vFAaeBhAD4aw+iCJAU5EodY
         VNeA==
X-Forwarded-Encrypted: i=1; AKwUvBxuu4Jhr/8VfW3OMtajfnM4rOnehREFhZC7Ga/cCuN5nE4rKYSadFoVhYbBlKfKE7cyk+1o0uMPiaMImSSe@lists.infradead.org
X-Gm-Message-State: AFuF++nSyma9Hvp0rrDgPqefksv5xVut/HYXgMPRKC7eYp4OkY04GMjX
	9++AUCS3EYKd0agXHKkGrEZW/P3kxr3MQOmQexXI+ypQylKRr4RZAMxo
X-Gm-Gg: AYBFou1e+4C2sMqMow5ck7lboQBLA/hK+fPziGtkSF7TQtgY59WHUAw7LArZRDSDTbc
	jXVI/qjAJnczta3W0sn0sq9dy3Zqn4+TxHGw5NvPc7vRbcrznwpeg8im+A8ZBfPTFfrG2qLuGpz
	DX1TqmBNGXpyg/y9/P7CT7wQC1/H+NmDmjMDmy+6B7BXbBfQ5qBk9mUSr+sgy7NF9xR5r1oQ3A9
	PdiK52284L4xqiNuDI98S88L4dewpuiHYFFo6weST0o+R9GvHHkHSxoZbyzpIUBfydMJQFbou/u
	vxntNk9IKQ7xWQ6GyiX6aABIl7ncW7M6p9q2X5ywV4rjDpB8REyei36bHl0MEe9bmnYgQ9vpWRe
	sQd3pVKWj5THEyRcH9yisQANUkNtHhNdD8/p5VNd62cwDj908C/15IVn9sCQBGQAWTrH356lV+V
	k7qlXCedrYNhzwN2p26bOFuT8/9wo+URd0SRbf30aycGt16biR1q8wd+gRaEdSWim3gJZBZ6lQa
	iUZ+dAozPCQdOu0QA==
X-Received: by 2002:a17:903:2f91:b0:2dd:9112:c4c9 with SMTP id d9443c01a7336-2dd9112ca94mr10220955ad.7.1789534562517;
        Tue, 15 Sep 2026 21:56:02 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aee8b0sm9261930eec.23.2026.09.15.21.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:56:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:25:54 +0530
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: clabbe@baylibre.com, herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl, lkp@intel.com
Subject: Re: [PATCH v2] crypto/amlogic: Use devm APIs for clock management
Message-ID: <aqohWhV8HLW_J9AY@kernel>
References: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260901024302.5407-1-raizudeen.kerneldev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_215604_567335_4754369B 
X-CRM114-Status: GOOD (  24.72  )
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

On Tue, Sep 01, 2026 at 08:12:52AM +0530, Mohamad Raizudeen wrote:
> The driver currently gets the core clock and manually enables it using
> clk_prepare_enable(). This requires matching calls to
> clk_disable_unprepare() in the error paths and remove function.
> 
> Switch to devm_clk_get_enabled() instead. This lets the kernel handle
> enabling and disabling the clock automatically, which allow us to drop
> the manual cleanup code and keeps the probe function simple.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
> Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
> ---
> Changes in v2:
> - Dropped the devm_crypto_engine_alloc_init() change due to build
>   failure reported by the kernel test robot.
> - Kept the devm_clk_get_enabled() clock cleanup as the sole focus of
>   this patch.
> - Link to v1: https://lore.kernel.org/linux-crypto/20260821151303.8150-1-raizudeen.kerneldev@gmail.com/T/#u
> 
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 169c6eeb51e5..6f4c62ddaf89 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -243,10 +243,10 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  	if (IS_ERR(mc->base))
>  		return PTR_ERR(mc->base);
>  
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> +	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
>  	if (IS_ERR(mc->busclk)) {
>  		err = PTR_ERR(mc->busclk);
> -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> +		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
>  		return err;
>  	}
>  
> @@ -261,15 +261,9 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  			return err;
>  	}
>  
> -	err = clk_prepare_enable(mc->busclk);
> -	if (err != 0) {
> -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> -		return err;
> -	}
> -
>  	err = meson_allocate_chanlist(mc);
>  	if (err)
> -		goto error_flow;
> +		return err;
>  
>  	err = meson_register_algs(mc);
>  	if (err)
> @@ -290,8 +284,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>  error_alg:
>  	meson_unregister_algs(mc);
>  	meson_free_chanlist(mc, MAXFLOW - 1);
> -error_flow:
> -	clk_disable_unprepare(mc->busclk);
>  	return err;
>  }
>  
> @@ -306,8 +298,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
>  	meson_unregister_algs(mc);
>  
>  	meson_free_chanlist(mc, MAXFLOW - 1);
> -
> -	clk_disable_unprepare(mc->busclk);
>  }
>  
>  static const struct of_device_id meson_crypto_of_match_table[] = {
> -- 
> 2.53.0
>
Hi, 

Just following up on this patch. Please let me know if you have any
feedback or if further changes are needed.

Thanks,
Mohamad Raizudeen

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
