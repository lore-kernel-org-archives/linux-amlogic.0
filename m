Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A60C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50ED560F92
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50ED560F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8+CmXBiPm3k1GbBlJy6YUF2+l73G2/ybBfdX3BJTn38=; b=B3PfwGHS0DoiMwOYM0S8a+AMzg
	MBrppSKmzITi3DINEFUqR3jNN8ecbsZTbsiqUj/nrczn1Dv0ph3p6cM27epevoFLR/nMJ60rCq7JT
	RMbcwNyHeht4RG82+a2TLHV+xWJhRtK1y1CLfsetIpTSzFk2DXw26D2VgEoCq8cCQsgeCiknyNf89
	yknflUw0SIei8fAscioEAbayhFXoxr/zcyV1nZeCgTnchOlFI/qc/sZzoFzMUVTsclWV1i1Ll18iy
	XUS45qNxiFxsvoJgX66ffqBqS0f7I83IAAcx62+7m1NXa6wZhF80rJLTjV5db2WCGsBMMQ0deYKj9
	agJE4Z4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDsD-000p9X-Hk; Mon, 06 Sep 2021 12:37:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDrx-000p4o-Qp
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 12:37:06 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m9so9682605wrb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
 b=q/npCZBG5L3lGLbMSdu4NMX3Ctk6Ad7I+cGARbRcucC/TQNttqexAphG2Xr950+CRn
 lQXjILuqgzrdJANuQpKf4iojCSc53auX2OnwPuSi+KqCDYfm8LdaIykVVprQtKXhqkNh
 ltB11KXTVtIzdjqSsrD/mUehKx6+M2HrJn3Ogh9pIdFf5L02P6z2gCBN/5+GxKU2E01V
 j26omRs5aYCxRy8omLxTP7WK93BvTmx+qVk0puabyNlrtFh56vqbB0Ble1+sZ6AqXF2A
 IvWeHtp8sDfCoqSiiE0KfG1Ruecnf+sckUzReZu1jadnU59cKoyKVkvQmhGvZLnKQglf
 QCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VX21Q1wpGiOpiva+IThVTrifsWOLftr6Zwi9vQzn0VI=;
 b=SECxbILc2bFESRi2gQ0sENgMOyK2FnjrsTcgNN4Hoot4wCu0SLi8bP04hfnqLhZhRs
 8ysx6gW643DVaOm17nITjf+CLanyqk68vp1BbvkiK1VslEtW1t65QBu1iDYIyz2JtEn5
 4gj/+AI3Gg8cmAhFhg1aaht+9VlUwdrBKUEpU4RAoliplZAs19Ne+F2i14C6WWNdjrVj
 FWWC/6EbCbu8iaAUkzGvmnqEZMfOosJHBflAOCuT48UAlUlQ3QLh/Ls5ezQsuZizZeIO
 igW5J33l/9reKWHHX/RrrL30oEYV6gYsSczG8DtbwL6nEqZhXk3RPBeYIVcDpujLG4ih
 7IIg==
X-Gm-Message-State: AOAM530TFaRVLcAkn6JxSDUIPsFept19S1dhqxnjeKE+Qj+7IWNOfrja
 it0Xs7wT7ZrKv8LSzLUA+LH1GA==
X-Google-Smtp-Source: ABdhPJwEMng/N0V1zZ4ZkG+iEuNFlsHHHf1I8nEkBFzbiKlIdgCCQhlygeCfux6P+CO7yWmAtu2tZQ==
X-Received: by 2002:adf:c144:: with SMTP id w4mr13310866wre.398.1630931819430; 
 Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010?
 ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
 by smtp.gmail.com with ESMTPSA id c2sm7744538wrs.60.2021.09.06.05.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:36:59 -0700 (PDT)
Subject: Re: [PATCH] Media: meson: vdec: Use
 devm_platform_ioremap_resource_byname()
To: zhaoxiao <long870912@gmail.com>, mchehab@kernel.org, khilman@baylibre.com
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210906070013.7362-1-long870912@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <1b6f9a78-c648-e8b0-2ae6-1922aad89c49@baylibre.com>
Date: Mon, 6 Sep 2021 14:36:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906070013.7362-1-long870912@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_053701_969782_6334EFA1 
X-CRM114-Status: GOOD (  17.80  )
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

Hi,

In subject Medis should be media

On 06/09/2021 09:00, zhaoxiao wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: zhaoxiao <long870912@gmail.com>
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

With the subject fixed:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
