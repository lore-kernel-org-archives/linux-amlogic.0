Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FC5C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:06:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A5D660FEA
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 18:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A5D660FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VRCk9w6PaoSG4SAhpmXkLWzfS41b9a+ALTi9p/QhBnM=; b=lYg3D48eZWumQiSunDAJgtzH+
	Ai/YmkW/63Dqngbuo600y1/l2/NGsv5zyigF5WbB3XPXm4MeRxznYCQ292VUHm1eVHUCZmqOlQatb
	MienELO7IXAjveAORZ03FqAklYuBff/ZiMNGBBe47YMwIAgloCQVsp6wV28eyOTCD3XUkDZ3g7Tcl
	+FK3rSr8NEGDfn2FURPESVeTJLsueGEaJmEYlB4xGAevs1AW1MoJAoclR6FbbNqmyv7pnWfC45HI8
	KYDJlhjTlbwDa1YIx0M1Vtv2hoQzv0mU7KSIRLNsZL38hCL/zRRD4ZaE9PoA21gXzaUWD6xCgt775
	Kevbk/TxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5cM-008FAN-1r; Mon, 26 Apr 2021 18:05:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5c4-008F7r-Rz
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 18:05:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so1184012wmm.1
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
 b=pFmvfHUw2Xc6IYETlM2LNNtATPOTQ7qOqODeMSW5rpBgjncMHgqe6irSOKEOei9ueF
 8Fg0qy8zm0/2CZeZRz3bPZuNX4PtQZmWvgm2YXiJHd04qhm0nB7gZmZKmjqkhYGK1A+8
 qaA40+XWCDSzNyo3lWRkGVmM5NW8sM/46hVfe3VDrmQkztlWr/gLFmWYkcz6fxRSqlK1
 nk6Xmahbo1ODPRDT3+DUgHsPaPiKMfDQDjVKHjfKghPWBijfyLPPpNN0oFZHKBzVj3Ch
 gAgQlhllqE4dhpHOX/WKq8jycyAfJT1bpXlbw+26SpZuCIhG8KHV0Kpb+nV74Cqbys+7
 /Yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z9wgVVjDAXXSJE2ca33a8jal0v2yahV0C8O37SZcpvQ=;
 b=hnUGl4kC2/Emb3xZ5K/gE/Nt75+TR0Am9kYs3ljD1fUjAAIlVQ/hVGU7I1xdTlIK35
 2u22ND674HncszQgMCkzImIL+H1UVXDQmrX3nnjd0WvmQsn2Q9drKWRScijmkQMtt9kG
 xOezU1ZcjoHYv2NwgLYPljgdDqZTtWKRJqoqiwIEERbN91CuDIvUz+io/CLHVotEIXIw
 c0Ctx/70xJF7inNTBlwh1DgBDXHkx2I1+KHvN9NUYdz3jwlQmtQbQbJD6QvH9azY6n9B
 g6v1rHzWnBKQ3tZUVLoJ84wFqwUcWQtuzW4D3HrpE1ShHc2S4lJx1RXwVyCC/qi/mmdA
 iRSw==
X-Gm-Message-State: AOAM532YQ5IQRKIQbROykZNJ8yUST27hhRinDJU/XmtKAvkN1G+SfTUV
 g4SaVwuKh/MbhlhGuv4SjykNnw==
X-Google-Smtp-Source: ABdhPJxJp+6XWXivaWJQgtNlleCFdrEv8YRWrei4fRGW/lK200EqgUguXQtGmn4s4C0b2JUb8aewUA==
X-Received: by 2002:a05:600c:2148:: with SMTP id
 v8mr236741wml.167.1619460220445; 
 Mon, 26 Apr 2021 11:03:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:b76e:7362:77c0:ddc3?
 ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id l9sm1096913wrz.7.2021.04.26.11.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 11:03:38 -0700 (PDT)
Subject: Re: [PATCH] staging: media/meson: remove redundant dev_err call
To: Muhammad Usama Anjum <musamaanjum@gmail.com>, hverkuil@xs4all.nl,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
References: <20210407160921.GA1504294@LEGION>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3fac78c4-189f-57cb-ca81-a97c918e2386@baylibre.com>
Date: Mon, 26 Apr 2021 20:03:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210407160921.GA1504294@LEGION>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_190541_019379_CD991C4D 
X-CRM114-Status: GOOD (  16.21  )
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

On 07/04/2021 18:09, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 5d4db7a5b4b5..e51d69c4729d 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
>  	core->dos_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->dos_base)) {
> -		dev_err(dev, "Couldn't remap DOS memory\n");
> +	if (IS_ERR(core->dos_base))
>  		return PTR_ERR(core->dos_base);
> -	}
>  
>  	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
>  	core->esparser_base = devm_ioremap_resource(dev, r);
> -	if (IS_ERR(core->esparser_base)) {
> -		dev_err(dev, "Couldn't remap ESPARSER memory\n");
> +	if (IS_ERR(core->esparser_base))
>  		return PTR_ERR(core->esparser_base);
> -	}
>  
>  	core->regmap_ao =
>  		syscon_regmap_lookup_by_phandle(dev->of_node,
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
