Return-Path: <SRS0=FHOR=NW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7448BC432BE
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 14:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB2C60F91
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Aug 2021 14:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0AB2C60F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6V4rr0qHRSZwi3gMdMeu3roDPz8h390LklHwMOQEIYU=; b=wifqvBp/C6RVPG8AXYB90saLRD
	dibCxx/c5rv1ZFcpGhrG5chuQPR5qOH+ntHDtHRy0lpBiMpRTSmQQfeQlqKJsdVR1CFndlWBk04s6
	L8KOLqwSC3yqc2jeq+0BmlA4sE4csGLSM13UOVyA1FPrwc87Cfq3Mki47A4h+mioNxFEPWnFnUbjT
	1phU+hNt3tlUyGv6775TV72J2XrtsejTRjo4C/2xA7YkrZ8q6qSZhedr+B4nN2I4ErJupOT9/uQ06
	Ut7+ftmbUFR5nD3pFIzP270RtHNMkQvor74HomMLwVkd8sCgoeALS6awfR7arDehttafbLua2Ia2X
	AWuUlbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL4rp-002YfX-On; Tue, 31 Aug 2021 14:36:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL4rb-002YcN-LT
 for linux-amlogic@lists.infradead.org; Tue, 31 Aug 2021 14:35:49 +0000
Received: by mail-wr1-x432.google.com with SMTP id u16so28103012wrn.5
 for <linux-amlogic@lists.infradead.org>; Tue, 31 Aug 2021 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t4rZGwfZEIOrCqcjibED3N9c7CMYt/1s+laPidanJ9U=;
 b=yC/J2IkaFivBRU9NGiW59trje7d4yntYagBVo9vlQoNWteSJIXEi+XV1UN92LQXU6Y
 6X+b1KiPiOuE0hH9FDgslu7r9hvH7P1KkUXuKL+2BDJnLDMtlb7yZkAhciDqUppAOdx9
 cjcp2KWoXQIDBLLoadxkk9MFxIjtU2mFpVIX6OC6Lg1X2zAZFt1mItcD5/zuvAjBsbwq
 Xwrhr6/tGl5uf6t/ImCIhMMM0L9ucBr9VrsuIps+nHNZUa/DJPkvLzRtcXVn8b+XUT7K
 wox/1EqzDbBcObZAKMxZNbe6AC80atzRyp7evrBnWvdIx2ainMfCLIZ/b86bm9k0CO2P
 xrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t4rZGwfZEIOrCqcjibED3N9c7CMYt/1s+laPidanJ9U=;
 b=cvUxDG8VzwKcRJbeQ7DnW2DKiXhD4Ksz/7QHx50UB7LdMkbF3mKU/dHw9MmgSYpfgW
 KWFBumxn4l2Qv0Cj9wwkzj4FERL0eCLqoHqicvlEUv6gEibDfhKMuzdFaagFANTmJPC9
 CG4aSxBJlq+yTHCROeHTwQtAxcmn61k/mJ1w6uvhcn1GujrtSAQ+Hva3H1fYTLwRMb7A
 KhfkFP5iYeSCF8AgN7lSFQV88fqscTqqS5qTHT8LBpepWyXnSWgVYQQv9Njgky4FaExo
 07BmMeg39yNNC7DMFEDJdogLVYRg7D2TNwG+0GaKX17Gaka9iPmi80rq9JTmJINiP2EX
 E3Gw==
X-Gm-Message-State: AOAM533CM96RJ0AgulSbTPAdvpYN3v59Axe1P5KpB8YCcsUjAOAkcMRt
 e2y+moJU0E+Z2Vv74HCrY/l2iA==
X-Google-Smtp-Source: ABdhPJz1pzwOW6HFn9CswPOaXqf3E3MWOvhHxsRINvTlHKrnGPthKiywMBDC/0mPhZNzBg8b+xY76g==
X-Received: by 2002:a5d:490d:: with SMTP id x13mr31431795wrq.412.1630420544859; 
 Tue, 31 Aug 2021 07:35:44 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:fc41:6c:2c4e:2156?
 ([2001:861:44c0:66c0:fc41:6c:2c4e:2156])
 by smtp.gmail.com with ESMTPSA id c24sm18471493wrb.57.2021.08.31.07.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 07:35:44 -0700 (PDT)
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
Message-ID: <896e4f35-f410-41e8-50ad-ed16c65cab45@baylibre.com>
Date: Tue, 31 Aug 2021 16:35:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831135644.4576-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_073547_735505_7CE0C4AD 
X-CRM114-Status: GOOD (  18.34  )
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

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
