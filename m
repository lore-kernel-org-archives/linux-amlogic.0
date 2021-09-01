Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862B3C4320E
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E62961057
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E62961057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hITDMivZi2Q8j946yvRlKLBPxHot1aJHpN+cRg7ubpU=; b=lDpyiOvzHurko40SlIplyGa1P/
	oU3OfJJzI0jCRnj4/GIKViNkoFgKthVzPBb4rb8wRaSoKTeSJMbi/qW9Kq8V3FMa9G5uzeH3o6v8a
	B7o2MiHhZkxuAXzRHUb6T5cOdRuhmMUyUa1Fdenseleq9/IJjtW10PCDDYA4EMuquF9U6jrbmBkAU
	0/hpf3m5N8EvHdty1BTBahXvrk0Xfz5DnqLX51WQGrltVSsc85vYMIQ1uXzYUUdkvY7OsAzHI9y+M
	f4zoHOvKeL+K6yRQ5B1dJv5I3xJSjBlGzYLI4Y6Ug6XcqrM9kHtFRed3DoiFuXmf5WK4eyRB0wprF
	Q2xZFeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLyS-004fcQ-3I; Wed, 01 Sep 2021 08:52:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLOP-004WWr-BP
 for linux-amlogic@lists.infradead.org; Wed, 01 Sep 2021 08:14:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id g138so1213167wmg.4
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Sep 2021 01:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rXb4cGIZn6Gdm/5BqKVC12dJx5JJGvLKFEx8SKKKyuQ=;
 b=kZ5l50Zne0I2QYElYM2Ts4GrCDwGZLNXT/NczUEQ6qLa5fU537DXvqfzW0hrQ1OokU
 r9TQF/XmVD+akIjSJU9meYZedrhLpCNRtCup+/3UMiCf+dPll1pYcWpa+Yg2G5krWvfv
 3Z+NbJk2WGyxUQauLD0oamStiP2Qy4itn/q8ZPUULWNcupbhQzxnzPIbgJOxhbF7VyYX
 rFZiq34NOLqqjw5DrS8mkF2j7/b/+Yp+D5koVuloGflrybGHyY+pAaqplx/7lORmT6Fe
 qwo1BTSpfq285lerc8si2xyOkj4IEfpt0o6SAsXVKKx1dy45bVQ+IMG2K/0tCC2qOh8v
 7tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=rXb4cGIZn6Gdm/5BqKVC12dJx5JJGvLKFEx8SKKKyuQ=;
 b=A2W9BRlEF0Wr2Lwsl5JobWF3FCwtyipbdKuqosrk8Y512M+oMjkD+DxZ3dBaT3Mw6a
 B6MN5LESvojVQPu1NydNFPHbWtaGcXyWWF8GJrI68YGp6rRZN+Y3+3z7aNQht7K1o3kH
 FhvMb5/Aq5e7csIEIhnvdkOUclRZXvHp+2a7ToEX85HbCeLa7Ue09tTVlXVj5N+C1fya
 CIpHnWc/j6mpQyAIDEG96WWTRATocqa0IDwot+ynzMhdU4HV890BLSrIhtH4xCHTn+Ht
 Cqzukw0D1VLpFiLFXHCSOyCQBvmq7+C6mdCCZAIzZQBh/YP2D/GUwwuzYEEVA3GWCYI1
 Cq+A==
X-Gm-Message-State: AOAM531NsggQSX28fnDlpxB5rxc7NzxjkGuH9/wLSMHcbby+h4hykApr
 +dmBqRZ+AFKx0Td4WsdoUJ1NJg==
X-Google-Smtp-Source: ABdhPJzYxHE8weTllEHo+KjrzjPaX6EX9pjHZ/VPL4c0s4ptMTyp6/+yI1E02sHi8tFTziVAjvtYIg==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr8504168wmd.34.1630484083419; 
 Wed, 01 Sep 2021 01:14:43 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1?
 ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
 by smtp.gmail.com with ESMTPSA id l35sm2409757wms.40.2021.09.01.01.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:14:43 -0700 (PDT)
Subject: Re: [PATCH] media: cec: ao-cec: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901054535.6215-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4b41b556-b2cd-5ffa-0462-5f41f2d33f85@baylibre.com>
Date: Wed, 1 Sep 2021 10:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901054535.6215-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_011445_503576_B7E37E27 
X-CRM114-Status: GOOD (  18.91  )
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

On 01/09/2021 07:45, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/cec/platform/meson/ao-cec-g12a.c | 4 +---
>  drivers/media/cec/platform/meson/ao-cec.c      | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> index 891533060d49..68fe6d6a8178 100644
> --- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
> +++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
> @@ -633,7 +633,6 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  {
>  	struct meson_ao_cec_g12a_device *ao_cec;
>  	struct device *hdmi_dev;
> -	struct resource *res;
>  	void __iomem *base;
>  	int ret, irq;
>  
> @@ -664,8 +663,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
>  
>  	ao_cec->adap->owner = THIS_MODULE;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base)) {
>  		ret = PTR_ERR(base);
>  		goto out_probe_adapter;
> diff --git a/drivers/media/cec/platform/meson/ao-cec.c b/drivers/media/cec/platform/meson/ao-cec.c
> index 09aff82c3773..6b440f0635d9 100644
> --- a/drivers/media/cec/platform/meson/ao-cec.c
> +++ b/drivers/media/cec/platform/meson/ao-cec.c
> @@ -602,7 +602,6 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  {
>  	struct meson_ao_cec_device *ao_cec;
>  	struct device *hdmi_dev;
> -	struct resource *res;
>  	int ret, irq;
>  
>  	hdmi_dev = cec_notifier_parse_hdmi_phandle(&pdev->dev);
> @@ -626,8 +625,7 @@ static int meson_ao_cec_probe(struct platform_device *pdev)
>  
>  	ao_cec->adap->owner = THIS_MODULE;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ao_cec->base = devm_ioremap_resource(&pdev->dev, res);
> +	ao_cec->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ao_cec->base)) {
>  		ret = PTR_ERR(ao_cec->base);
>  		goto out_probe_adapter;
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
