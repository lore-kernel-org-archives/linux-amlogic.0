Return-Path: <SRS0=/Mmf=OD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FB2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:59:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D189960F92
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Sep 2021 07:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D189960F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nToGyx8NhmbSG//qIuX1XZvkwmsjbL8KRuNLF25/NkM=; b=4+xasQ0r827gZvK+aB9HUPPOv8
	KAUDf9DogmEz0AfJ+RvJvRQmsQ+nxFg57tlEHojKUWRHkypELW4k2iiCi98uOuGq6Cu0h1pX0GccJ
	xZ0bKHUBEGo5gCE6Z7wNXYzGqFczPumiaDRCr6uKgPQIuTf5VjYNKz1NMgp4tqUUHowuQjxcd419q
	qjfpcVz8QAqEv8Xkqe23uC+l8OOPd7TGMTmUgiUU1840Acd44Ijk8/HLdbgpqqI68+FJEJ+9+Tloq
	iogxEClEb+L99CHcq3SQNFQozGBBRWnOCJH//uO1kIxNP9ANiLB8CH8BJVSQr0zrpq2JcsSdJVEYj
	B9Dlmmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPgsA-000bhJ-07; Mon, 13 Sep 2021 07:59:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPgs5-000bgT-Dq
 for linux-amlogic@lists.infradead.org; Mon, 13 Sep 2021 07:59:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id d6so13155776wrc.11
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Sep 2021 00:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Slbdck4Oox3BuAWU/xoGeuvQr4K3e0JpfLAX1oLndyY=;
 b=TV5CbZddrBKX78P7nI2kjJ2q2ioIuhK43xq0rydDNWRPh1Rjbr2WHKlwq6gpB//woi
 HGSjYbGL4u3wwBMN2D8J4FFbWmDrwi0sryOQHhTqydUZ9xfGnEOfUPOzUz+9hgLr/rUV
 WnemKQBkXLQQYpTkrMFJztckAXbVlCiJqjxFCnuCBzLvPZ/rmhZKCbPme+B6b6iC06G7
 LSTuoNj9RD/+UuNvZB3B+oYC5XzcsipRnf7awdmBPsvyZ5fcAzA18T0Q4PZSgF/XoY3g
 jEVnXVce+uX0XXPSGN2ahWgPsBIS6AJGn7X4tLfJlRvQKTz7yZOlsj5lNGQEidDvH6mE
 iqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Slbdck4Oox3BuAWU/xoGeuvQr4K3e0JpfLAX1oLndyY=;
 b=5CpBwvzCYvB3ZzwD8CR+Mo5XRRtCHxxBdcovScJKAtsp3TkNPmSsVL6NCVTAI4EIw/
 dHjVzUccLk7xGY/K1Et92460dfhAK2PUa3DI1x/a3xpRcpOjDuyFm0BXJjgkkh9D4X2q
 MYvC6vkLyFGxUKJpdUhOgpFxkoXIx/byCJZS3Tc9C9ToSFYP/BNWlr19YIzzrg8tgdia
 UPmSbAW6YRrMMphb2BK7xBACkHkeJIG/gtANA3RPr3rdtfPQvk6tp/0YFz6l8iSn83AX
 2MF1hQNbK638jC5CeSRZ1u+0Tr7prJdfhE1TCNqmHrrGeMb7Imm4sHyDbHBvbvNPnQBR
 KReg==
X-Gm-Message-State: AOAM531XAswrzkkm3aP4PvlOqyg9I4GsU5tK0zfmPtIC6vE9Gp06rCww
 YeNJxt1l2jUIJ52f3iLmf5biQg==
X-Google-Smtp-Source: ABdhPJzLylWQRDNBgfIjIiWs6WzrTIDLfdTUHuZk9A1smafDzalNo2zuhd1U5ya8RC0ug93NkAUJAA==
X-Received: by 2002:adf:aacb:: with SMTP id i11mr11103227wrc.296.1631519959679; 
 Mon, 13 Sep 2021 00:59:19 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9ebe:26f1:5acc:c894?
 ([2001:861:44c0:66c0:9ebe:26f1:5acc:c894])
 by smtp.gmail.com with ESMTPSA id y24sm6989408wma.9.2021.09.13.00.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 00:59:18 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Make use of the helper function
 devm_platform_ioremap_resourcexxx()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210831135644.4576-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <58b26fbf-b491-3290-0192-f10d2d8df092@baylibre.com>
Date: Mon, 13 Sep 2021 09:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831135644.4576-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_005921_546050_4C54C0EC 
X-CRM114-Status: GOOD (  18.14  )
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

On 31/08/2021 15:56, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c     | 3 +--
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 +---
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index bc0d60df04ae..7f41a33592c8 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -206,8 +206,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	priv->compat = match->compat;
>  	priv->afbcd.ops = match->afbcd_ops;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "vpu");
> -	regs = devm_ioremap_resource(dev, res);
> +	regs = devm_platform_ioremap_resource_byname(pdev, "vpu");
>  	if (IS_ERR(regs)) {
>  		ret = PTR_ERR(regs);
>  		goto free_drm;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 2ed87cfdd735..0afbd1e70bfc 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -978,7 +978,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	struct dw_hdmi_plat_data *dw_plat_data;
>  	struct drm_bridge *next_bridge;
>  	struct drm_encoder *encoder;
> -	struct resource *res;
>  	int irq;
>  	int ret;
>  
> @@ -1042,8 +1041,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return PTR_ERR(meson_dw_hdmi->hdmitx_phy);
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	meson_dw_hdmi->hdmitx = devm_ioremap_resource(dev, res);
> +	meson_dw_hdmi->hdmitx = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(meson_dw_hdmi->hdmitx))
>  		return PTR_ERR(meson_dw_hdmi->hdmitx);
>  
> 

Applied to drm-misc-next

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
