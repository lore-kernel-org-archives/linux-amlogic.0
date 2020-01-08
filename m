Return-Path: <SRS0=zLcP=25=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D04C00523
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 08:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99044206F0
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 08:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ceF49SBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VE4ZD9nA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99044206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ8Zpo0uHc9nCTMWTUZaT7Ff+qpjfC3jpE6EpMVliiA=; b=ceF49SBE3tmTzs
	iGCb2rQ43i9IQHASqiUEcMN3liTjEHu0UvGURIDjZ7unBOLBiOZCMULYHodyY8DSZjC3uPt0l3Fjv
	7AYIKUUc3+XeyNYS/xQB4cxqKBB8/fDRf2cNXesv9B88j93Dk8/LezpRGUKcue4pu9AS4Ql0KBBpn
	Rjrzlk7t+L2PjuP+jdN9y+EO4oPPgUzB0oUC1YQv1BxQO/q4O5ROmYAIQGcLYKN52uf0NUNUCl4vK
	6OUvAN9jPVX8GXfvFFj5FyK6vfRy3UFzb6B4jjjiQc6eC5My7pGQuEt31kwTxBuXZNRjnzn3uLkMh
	lZIl5mOOVXa0wqoAifdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip6lT-0001OM-Fu; Wed, 08 Jan 2020 08:32:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip6lQ-0001NF-2D
 for linux-amlogic@lists.infradead.org; Wed, 08 Jan 2020 08:32:30 +0000
Received: by mail-wr1-x441.google.com with SMTP id w15so2399375wru.4
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Jan 2020 00:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QyaK8TNAyKYsqFavvmrTJIkDR4ChcLf8CpQgZ0ze5FU=;
 b=VE4ZD9nAjHrpIUEvz6iRpBl3TY2dLUZUWRvSp9N+UcUmYgO9RMnFFJgc3pmvIPmgwV
 Bx1flIQO2tjMs1d+2I4s7Lsak10dyZeQgXf5UH3m5Vk21Xz6U/YPX2RwsGDhK7yvFUNw
 dAuiMiLyUF9z7x7HA+0s7ENlOmX69QS56MX9a0RgXKcGgi/XFmcSomkuurq3Ov9B96rO
 7l3iEuCgbHXoy/T1bFyXZsER89MSF6y7/KfTeL/C1p2L4AHkYS0YoEf6krXXmY5JnYXh
 xZuqGTbp4jPwP/FnHZ3Q0O1LYN2mRkhCETCSyE7tH76mpGQ7ePh8WVx8vTyG0Dni/VfR
 FIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QyaK8TNAyKYsqFavvmrTJIkDR4ChcLf8CpQgZ0ze5FU=;
 b=KWOKtPyeaDKIulAQaM+Np4JbmyQVz24fDc6fc+OMJV6YiJJXWGEJ8yceF8lZraTxRI
 CyM3nOI0tcxmDfOJQ4YF8Ih9yMlVSoSAiM5BOys3zklZnm/QEH/548Vu/uzjscyRuHjr
 JG4KyeF4y1tsGV6TwzWTCwPl3unoDjDou0u8mi+tlQSazn051ucb70JczTEGKncC7qI3
 vaMT4qbtZapDDRpHbEGlEgzNE3pVEpYooW0AIqtu0wvnR1IP7WWcdtrICWom/5XFhc40
 Imib3Kq+Y1ubRXyDTdaGQLJro23tg6dj+2tT/GqkBTArSAsOYKY9sFxKHQNSkIWsGl17
 aIZQ==
X-Gm-Message-State: APjAAAUhL+czxfy8GgB6zJACODPnznyZ/RSvjotD97MvRo1AX1ktW51b
 TRL1bbeH6VXxrGU9Z/9H0h6hUQ==
X-Google-Smtp-Source: APXvYqz60XYF5QTvuIs11T8+hbE7ocmRr5ST6hJGwukLmhWCNwaOwNOKnOUpdLPArdkoSqpAg+lspg==
X-Received: by 2002:adf:ea4e:: with SMTP id j14mr3162970wrn.101.1578472346579; 
 Wed, 08 Jan 2020 00:32:26 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u14sm3182562wrm.51.2020.01.08.00.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 00:32:26 -0800 (PST)
Subject: Re: [PATCH] drm: meson: fix address type confusion
To: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>
References: <20200107214653.1173199-1-arnd@arndb.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <c7f128c3-36a3-7763-7d22-af8a1b533975@baylibre.com>
Date: Wed, 8 Jan 2020 09:32:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107214653.1173199-1-arnd@arndb.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_003228_168496_EE481C42 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: Julien Masson <jmasson@baylibre.com>,
 Maxime Jourdan <mjourdan@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/01/2020 22:46, Arnd Bergmann wrote:
> Casting a pointer to dma_addr_t produces a warning:
> 
> drivers/gpu/drm/meson/meson_rdma.c: In function 'meson_rdma_free':
> drivers/gpu/drm/meson/meson_rdma.c:59:25: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>   priv->rdma.addr_phys = (dma_addr_t)NULL;
> 
> In this case, it's worse because the variable name has the suffix
> '_phys', which often indicates a phys_addr_t rather than dma_addr_t,
> i.e. yet another incompatible type.
> 
> Change it to use consistent naming and avoid NULL.
> 
> Fixes: 63fba242c464 ("drm/meson: add RDMA module driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/meson/meson_drv.h  |  2 +-
>  drivers/gpu/drm/meson/meson_rdma.c | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index f9a0c8e9d4d0..04fdf3826643 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -135,7 +135,7 @@ struct meson_drm {
>  	} venc;
>  
>  	struct {
> -		dma_addr_t addr_phys;
> +		dma_addr_t addr_dma;
>  		uint32_t *addr;
>  		unsigned int offset;
>  	} rdma;
> diff --git a/drivers/gpu/drm/meson/meson_rdma.c b/drivers/gpu/drm/meson/meson_rdma.c
> index 25b34b1e72a7..130382178c63 100644
> --- a/drivers/gpu/drm/meson/meson_rdma.c
> +++ b/drivers/gpu/drm/meson/meson_rdma.c
> @@ -27,7 +27,7 @@ int meson_rdma_init(struct meson_drm *priv)
>  		/* Allocate a PAGE buffer */
>  		priv->rdma.addr =
>  			dma_alloc_coherent(priv->dev, SZ_4K,
> -					   &priv->rdma.addr_phys,
> +					   &priv->rdma.addr_dma,
>  					   GFP_KERNEL);
>  		if (!priv->rdma.addr)
>  			return -ENOMEM;
> @@ -47,16 +47,16 @@ int meson_rdma_init(struct meson_drm *priv)
>  
>  void meson_rdma_free(struct meson_drm *priv)
>  {
> -	if (!priv->rdma.addr && !priv->rdma.addr_phys)
> +	if (!priv->rdma.addr && !priv->rdma.addr_dma)
>  		return;
>  
>  	meson_rdma_stop(priv);
>  
>  	dma_free_coherent(priv->dev, SZ_4K,
> -			  priv->rdma.addr, priv->rdma.addr_phys);
> +			  priv->rdma.addr, priv->rdma.addr_dma);
>  
>  	priv->rdma.addr = NULL;
> -	priv->rdma.addr_phys = (dma_addr_t)NULL;
> +	priv->rdma.addr_dma = (dma_addr_t)0;
>  }
>  
>  void meson_rdma_setup(struct meson_drm *priv)
> @@ -118,11 +118,11 @@ void meson_rdma_flush(struct meson_drm *priv)
>  	meson_rdma_stop(priv);
>  
>  	/* Start of Channel 1 register writes buffer */
> -	writel(priv->rdma.addr_phys,
> +	writel(priv->rdma.addr_dma,
>  	       priv->io_base + _REG(RDMA_AHB_START_ADDR_1));
>  
>  	/* Last byte on Channel 1 register writes buffer */
> -	writel(priv->rdma.addr_phys + (priv->rdma.offset * RDMA_DESC_SIZE) - 1,
> +	writel(priv->rdma.addr_dma + (priv->rdma.offset * RDMA_DESC_SIZE) - 1,
>  	       priv->io_base + _REG(RDMA_AHB_END_ADDR_1));
>  
>  	/* Trigger Channel 1 on VSYNC event */
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applying to drm-misc-fixes

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
