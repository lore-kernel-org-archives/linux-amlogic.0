Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC528C432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:55:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD8860C3E
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AD8860C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LiaPkeO9RYB5EuJrFR785D2InhlxRwqmkEkjUpkj1ro=; b=f6LUtsEaWTcG24eC5elfjz36cp
	pLjNjHNdDQJQZoLTd9DQ8vBQqgKICRQT8WVtIX5Yvi8uEb1J4Tlnscky+xJ0sh8qXLJKKLNcQV9Gy
	SF78glsQ//pbd2kPNKR2AcjBDFgyBYQSDDZ0ExASSbbNoOFb+hE3m9Eld4b1sLFMWv89A1kJU0s0u
	C85tiXwT631C5E79XKRWjKE6CGpuBlMLIqkXL317YYBwe25saqGTIlLZVjeANaGRoWhKOL9S6zZ4U
	cnWkEKqIaYb6I61K7lJSvk+icd22o3qkdnSOpiqzyV0Yw9Fv4furHP4PN0/D/PJjan91Tg51xbSSW
	k/rMgy2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLM1P-004gXW-VV; Wed, 01 Sep 2021 08:55:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLOZ-004WaW-Vl
 for linux-amlogic@lists.infradead.org; Wed, 01 Sep 2021 08:14:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id v10so3142988wrd.4
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Sep 2021 01:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cFYWmSVza/PDqmeG9+mx1DB+NWXTWb3lrfYbe+Cf8H0=;
 b=MLrEW9JLxfB6p+wAyuTPj6dSuKUhqYV2DIIcmmqqQXSdgNZgeWa19wk4Z42umtT+C0
 KSGP6E93x+6FOJP5foOpfKL9JwClHiYl/Y937aO5gZxezRL3g50OeppPRXdPcRLACy/e
 t0PgyB+L54MPEoMxpI/kAi3i/5Qqbeyo/IuKQtdsgYTHt3jVCt+Tkf2OZx7vVt3yb3mr
 SrPtVHeXjXMG7pHeGIkUfp56qhVLXFnuMLvfgdlMZ0rMyy8gY3044o5dd/682PaRMKML
 3NEfo//PRsnBpIe4gqr63OZLY5ybBZBUk2TQufzPRCqkpXEaq9Lq7CBRNzZZoWV45kGB
 VcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cFYWmSVza/PDqmeG9+mx1DB+NWXTWb3lrfYbe+Cf8H0=;
 b=D26rIBox+vXWgwr6x4XL95htiSIgaRA+/pQ+7ZEi1V3X2bfgdursv+RSBdEmR8sFRV
 ghSJIyv1HXqEs2UH5ftTrjFU8lP8cCx84wBlctL8z15fi5+BOq2AJ4V/XhskK2efSl3O
 UMyFXsBSZ3sCov/ECKvHY0Gmq4vbZxs5iNjSnARpNWtGI5q0kJDJ8T5ttVOdbnhRQOXP
 lu4zpeTNmvZkGqkBkeZx3wSDcrKTP8ZRXzni3sRiZ8SwvgPI1w/qYMMfRPaIPu9Ge5zj
 J+4Fqg4wURmjKUAftV9+7ilEMCkVWzHabrSYTpiqTUQTyHulzwEBloicSzy9gkFaNBnT
 c9/g==
X-Gm-Message-State: AOAM531TVpd18qjUCKYf3220A3ysFwr97PGwoypuKzSuzSkeJDsz8v4b
 ZdrYPDQDhez0OEVkfFlpayaTkw==
X-Google-Smtp-Source: ABdhPJxLni/w6zWQomeDOrFtWu/rq9Z2RFy8vK4jBYwFD7uQ/9lPOEPwsdlI8KL0b/AnY3L7iVV1zw==
X-Received: by 2002:adf:df0c:: with SMTP id y12mr35443384wrl.155.1630484094200; 
 Wed, 01 Sep 2021 01:14:54 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1?
 ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
 by smtp.gmail.com with ESMTPSA id d6sm18556934wra.5.2021.09.01.01.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:14:53 -0700 (PDT)
Subject: Re: [PATCH] media: rc: meson-ir: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901055440.7079-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c8b8f064-7887-9608-573c-525799641c6d@baylibre.com>
Date: Wed, 1 Sep 2021 10:14:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055440.7079-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_011456_121608_60933CC5 
X-CRM114-Status: GOOD (  18.35  )
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

On 01/09/2021 07:54, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/rc/meson-ir.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
> index dad55950dfc6..4b769111f78e 100644
> --- a/drivers/media/rc/meson-ir.c
> +++ b/drivers/media/rc/meson-ir.c
> @@ -102,7 +102,6 @@ static int meson_ir_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
> -	struct resource *res;
>  	const char *map_name;
>  	struct meson_ir *ir;
>  	int irq, ret;
> @@ -111,8 +110,7 @@ static int meson_ir_probe(struct platform_device *pdev)
>  	if (!ir)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ir->reg = devm_ioremap_resource(dev, res);
> +	ir->reg = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ir->reg))
>  		return PTR_ERR(ir->reg);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
