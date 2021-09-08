Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B947C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 08:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF81760F5E
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 08:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF81760F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lpuW2FCgYxwAfK6fvFPJbRi+7WrWKOr2Sl+/TGDMtfc=; b=jyflsQyhYhMn1D6Z2wXPTRt7q5
	aJk+5TROKX2TjPn+JovwNoHuzEciPZf0WWuMlcRGtwn+cK2DD3R+H90BasLodFtmOPPTvaOMgg939
	xSdJfUFVwq+PMPXl/ymwdgbln2z/Qg84j+RfnXkV2u8OSJvLPcCqGFeunfTFBXpqRphcxhjqhBOjx
	n+MEbMbnTc2vGOKArrvgSkoowTmeKnNL0lvrizohdlmQ4/hbCG0LAQ0C8WSMsvl4IvFA2OrevsvXq
	RharsMy1hd2ZsCn+Cvc9oBQ2jCU/O3cPzVT5bBSiheXNLKf0OKG5Fyi/52jNUIGbhdwVk8pMOc5C1
	bg9krsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNsXw-0063EE-J1; Wed, 08 Sep 2021 08:03:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNsJF-005yyU-EF
 for linux-amlogic@lists.infradead.org; Wed, 08 Sep 2021 07:47:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id i28so1834189wrb.2
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Sep 2021 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8fVr5v0iAW6pw1+B1n4WZvRBXwF+k69xSOMIkGqt2Po=;
 b=bse3DuwPwlB6Qd6cxFfxp6Z9BA4IVFiqOu1j5EqLZASJ5DIkrKZNDtXMc8t18DPX70
 qUzh2Es4khZc1f7ePIJAN8xtPpwjrbdCP4IRxpxtZgjt0eo8vkCBDTsb3Vsx8oEyWYmC
 fHriiT1781mBlE9QBmJelzRRnGf01e/HmcypCeqHKGNLmmlWS9YN+HJR+rE/ZqsHzy0d
 ZPk1grJc51rSnoqiTt9B+aoa5PhGRG+6UOf2Y6q8vw8iaNSnx3bBUQLDV8lbd2Up2I4M
 58evfazyiOy/pAg97GSNg7MP60oyV1kFJF7BzdHXBhEiIuCAn1IbCP0g9Y9/MLJDWqAQ
 r1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8fVr5v0iAW6pw1+B1n4WZvRBXwF+k69xSOMIkGqt2Po=;
 b=L79RbvzXKw7eQGoiKneIkVPMdXEkUMHL/QLJtWbLYYZVB5RXWdWFx1j7vXkn4tzmJd
 hTYJZKqt8tHVjeUaXm0yPg8XO9UFIJa9t4heCLdAJh1jz0Ws40Ul70OMF4uQ2ab1R4yK
 2JEij1YAazgUj6vvdUVss3ItDoqVv1FCnuSUnSvyIL6rW1Qi+VabIduzygU0Uo2S8Uqr
 FErTSzf3C5IrOe0jQZkN0bLZWliW2rg8OK7ZB3GLrGM2g9p93RY9l5Ex8gkw9JjXik5f
 KDBjYTT+v0o+uaE5BiqTdtzCtkGm5hOgyncEP9kZH19zfjWM7skpyJYxE8aTkLpUuXBB
 3xbg==
X-Gm-Message-State: AOAM532CTjm0jp8ZdxZXZEV/RkDa6KOlDanPvlaebNSRA87lT3e+H5zx
 AbbvX+i8PptQ1w5ft94nclyKCQ==
X-Google-Smtp-Source: ABdhPJxqjpFETGMyghSIxLdLr/Wc2YN9wnzACPmeZYTr48VcU+2U/dvy8U42hdVd2oHTk1VKhg2Vgg==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr2444892wru.310.1631087271373; 
 Wed, 08 Sep 2021 00:47:51 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19d:2e13:ec0a:9d59?
 ([2001:861:44c0:66c0:19d:2e13:ec0a:9d59])
 by smtp.gmail.com with ESMTPSA id i27sm1245410wmb.40.2021.09.08.00.47.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:47:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] soc: amlogic: canvas: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210908071544.603-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <dc885d03-7bf5-9441-f2fc-c8b22e725817@baylibre.com>
Date: Wed, 8 Sep 2021 09:47:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908071544.603-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_004753_587474_911F364E 
X-CRM114-Status: GOOD (  17.70  )
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

On 08/09/2021 09:15, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/soc/amlogic/meson-canvas.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
> index d0329ad170d1..383b0cfc584e 100644
> --- a/drivers/soc/amlogic/meson-canvas.c
> +++ b/drivers/soc/amlogic/meson-canvas.c
> @@ -168,7 +168,6 @@ EXPORT_SYMBOL_GPL(meson_canvas_free);
>  
>  static int meson_canvas_probe(struct platform_device *pdev)
>  {
> -	struct resource *res;
>  	struct meson_canvas *canvas;
>  	struct device *dev = &pdev->dev;
>  
> @@ -176,8 +175,7 @@ static int meson_canvas_probe(struct platform_device *pdev)
>  	if (!canvas)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	canvas->reg_base = devm_ioremap_resource(dev, res);
> +	canvas->reg_base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(canvas->reg_base))
>  		return PTR_ERR(canvas->reg_base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
