Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1CDC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 12:07:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E07A60F0F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 12:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E07A60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GIcEo/PYqcH4tr355hrdYL+/8xsFU8ZhzTZ4qjnrWEA=; b=kR38DK1zZBT5PR0GwjGvDZFSY/
	Ldqh994rE5J0bhq/S64jlrxN4h9UakTBQk8kinVkAeo5hRvl34p/YZYWTi6uilGh3Cc7fZCfTVsuV
	Fd7tOfD1V40VEX1EsnDmeJRxIa8374rs/wWRgzq059bTj+hzxTR6rvtxa69ezL2D4fBgwKTi9oMbL
	bCzN5ORAsygn+zt83eduCRvRsEEao/XmZtoVoj4mF85vAV4ZghspPOR/9lXKIuYW0buoHyluULVHc
	82znHRbdyKA//VoZuBydCcJu4RHCOZ7PwWrEBojCLq2wVitAtdh4ro/mxMLYuffIzLvgLVkpKuJO9
	4Py8qoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNwMl-006dou-Cr; Wed, 08 Sep 2021 12:07:47 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNwMg-006dlJ-TJ
 for linux-amlogic@lists.infradead.org; Wed, 08 Sep 2021 12:07:45 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u16so2935934wrn.5
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Sep 2021 05:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xKkXisCl2vIi7OCx8uRGfHdsX0k2dDIgnIlUiuL+Z/Y=;
 b=JnOw9NpBCJWVZZ7iNJI979Pib4l2Z6LsNopyLTg13EkvXDZAZIYHBf6alkeJ3CcUUo
 E2j1KcTKOXOZfAKgihAk+9zTUEEFYiE1rAobG1mL5rZeSpc8UrXH+ZTovHtTnf6WxHoj
 tuA5dqHmYrEDw1X0kDL0RrmzYSVcHj/vGDLXjsGDcYh34STSoxnW7tTtgcGLxqErs/OI
 vdXTqAk37kFohJoydya+FyqMLoaOnFaD9MXkycdCoFembCzxhKJLKKeFnAeVyQkX331w
 pl4cI6FX0etmJvwWgGeyN4wtfsIXtT9evwlq0AOj5gN34Qcuq2UXdEKacySWTvhaLIH4
 O04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xKkXisCl2vIi7OCx8uRGfHdsX0k2dDIgnIlUiuL+Z/Y=;
 b=z7Y6sHwX0zEKjzHQ6S5/uh6OL13MTS41kI2sdVKsUiqI0JLd3Qt05vUIcrV9A6Zl8E
 WB4iViwYlKHYXjmaITky94EaIYm/P6Tix9qcnZI0/4wNqMQ/ibZO4REAlzW/3HSGzsn4
 r9wsHAV8CJUOpqHEItPzG2dYF0xfy5ov4/jZg3xBx/be0kKdGN+ga8uWIjUecoa+sPPR
 JISxrA46VFBGko2Lig6zpezbzXdqy8Fr3H+J+fk9EfTUXrNLr2XqXMC7SHqtkAwpTeO7
 0vAGk1IW9CNyfVtdoUEwx+x4qxRu7mcqKnRgiHMCyYS5S+eeygQbgb4Fb5Gx+pt7t0WY
 Rzcw==
X-Gm-Message-State: AOAM5329XBrQ3khUUsjEddR/h8OkCbUi6/gcBxXpwhIuuVi5U/g1HRB/
 CkClAwdnJe8NzgPK8ipSpLKIbg==
X-Google-Smtp-Source: ABdhPJwSSpAail5nl9T9TWoMaDxdil36KbTbvhFE3B+c19tOhhcm0J3vdXa3Hm58ilTQjL+kaX6kYw==
X-Received: by 2002:adf:c44b:: with SMTP id a11mr3748453wrg.416.1631102857845; 
 Wed, 08 Sep 2021 05:07:37 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19d:2e13:ec0a:9d59?
 ([2001:861:44c0:66c0:19d:2e13:ec0a:9d59])
 by smtp.gmail.com with ESMTPSA id l15sm1739951wms.38.2021.09.08.05.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 05:07:37 -0700 (PDT)
Subject: Re: [PATCH] staging: media: meson: vdec: Make use of the helper
 function devm_platform_ioremap_resource_byname()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210908105730.1882-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4cd6453f-8b0e-a438-0e97-53e3962d652b@baylibre.com>
Date: Wed, 8 Sep 2021 14:07:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908105730.1882-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_050743_061047_18768F41 
X-CRM114-Status: GOOD (  18.76  )
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

On 08/09/2021 12:57, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index e51d69c4729d..8549d95be0f2 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct video_device *vdev;
>  	struct amvdec_core *core;
> -	struct resource *r;
>  	const struct of_device_id *of_id;
>  	int irq;
>  	int ret;
> @@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
>  	core->dev = dev;
>  	platform_set_drvdata(pdev, core);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
> -	core->dos_base = devm_ioremap_resource(dev, r);
> +	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
>  	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
>  
> -	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
> -	core->esparser_base = devm_ioremap_resource(dev, r);
> +	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
>  	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
