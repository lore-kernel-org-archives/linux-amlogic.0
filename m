Return-Path: <SRS0=PfKa=NX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38526C432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0055A60C3E
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Sep 2021 08:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0055A60C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gJOiP77HG6IirL62MXORkbc5n+fQ7UNZgJBQV7JQW04=; b=aNMql00S7L1Gh0O8vePEc8tXZ0
	Zz13b7VjaOma1y9TPdXu+UFOcvxF5ssx+CRTKM338Bj+51MzZrCORTwFpOUft7uh3sq4+zoHuq+Wc
	KrggmDsaK4P2j4dEqQh3ZgJugwKgNtuH8jv6BBoTFVSavOdEmHeCcbiTekPje1n/2AiGzPk8XT7hp
	1lzYVxleGlTO9EG0B/s8lfdEgh5nxWpXEVqKX8KHYykorSp1aIH2XRvjdiPDyJzihUu8PVmhdRkmb
	ri37Iph+7ckooiHGc2FBFuCiAU9IrjjNWEQpANmMYTzRaGsmI7KBwW/PXHahEI6f9LDjymteXyZ86
	Z1DufF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLLzq-004g0z-TN; Wed, 01 Sep 2021 08:53:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLOV-004WYb-6e
 for linux-amlogic@lists.infradead.org; Wed, 01 Sep 2021 08:14:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id v10so3142651wrd.4
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Sep 2021 01:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0kNi+lHjT7XSbTIRmVqe8NrtAKLHSCB9511ZIsHzw8c=;
 b=Xk/9LzB/mLcmSdOGB85ZKeBG/oBz6bm38CwERpRHUUJ9AaKuMsCwhkgLCG/+X5i3AK
 EIZmCVrrTF5rVnqiL//gSzJcTyed9aBeMW/ySQbiPqWnVisNDoFUtbgFWSq04YBzBA6G
 VJ9+xAt5UnHDNSI1qsIuUBTU+G66rVMHY8VUj2u04wca76ogcfkX0RI4LgbE0eQRBOMg
 /6wpLebSIHUkpsD/TFuzRqYf93nhprwpP27S3iyarcyyvSi/6zvj6kWL/JWSUBY81+wl
 S/fMlaFJfSzvh/4SNPZo2cVhEV5isuofxeahTxn0ECQYFU4DMSU5G6h6D1lvFe+LuZEe
 M+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0kNi+lHjT7XSbTIRmVqe8NrtAKLHSCB9511ZIsHzw8c=;
 b=tf+Piyu1ujCOu7EDdtbOK7yQCahq9Ym0cACzebjRP7pwpiDKq8EOx5TA/HqAZkZPfr
 WNBF1vjzzTpEHnomVy/F18jBdOXF2g8/xP3fvE0FNTqsNVqfgtBhi8x/LkF/4W1prpXd
 SndGGMcvOAPizxZ5NJcdqerF67TLxh3/QbdIxZ0bYm38eUTnV+7bOfX2v7BH/SfoRmgw
 cZHKhCJkDP2jxTpZlJnb12XhGQYgUMHpypBrSig6IJSu7HBPCZ2jPM23HEor6GTzlW/r
 VOSEerSD9IYS/uOY7jnodA97yWUch9qmgPH6qSzBEBCWNBGbfz+Dt5xvTOUI+hnsqlNR
 knPw==
X-Gm-Message-State: AOAM531vwYmbrvklICNgoFswQdO/+2YEe9Zl/2+v0lSvDi3d0mHgpePu
 T8wMIiPJhwSJtVnDAgsSWH28Hw==
X-Google-Smtp-Source: ABdhPJyxbURZu+cLTiD/wlnG7JzpRrfrVGAn3YWSSrKy3Nz3G7pMEs0idSjVO2BC50bYQzXi63uBLA==
X-Received: by 2002:a05:6000:18a:: with SMTP id
 p10mr36999170wrx.40.1630484089188; 
 Wed, 01 Sep 2021 01:14:49 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:dc57:bccf:6106:11d1?
 ([2001:861:44c0:66c0:dc57:bccf:6106:11d1])
 by smtp.gmail.com with ESMTPSA id t7sm22625455wrq.90.2021.09.01.01.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:14:48 -0700 (PDT)
Subject: Re: [PATCH] media: meson: ge2d: Make use of the helper function
 devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210901055154.6829-1-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <afd73707-2bbd-611a-2498-df8c7f109275@baylibre.com>
Date: Wed, 1 Sep 2021 10:14:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901055154.6829-1-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_011451_316225_640D5E83 
X-CRM114-Status: GOOD (  18.55  )
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

On 01/09/2021 07:51, Cai Huoqing wrote:
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/media/platform/meson/ge2d/ge2d.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
> index 9b1e973e78da..ccda18e5a377 100644
> --- a/drivers/media/platform/meson/ge2d/ge2d.c
> +++ b/drivers/media/platform/meson/ge2d/ge2d.c
> @@ -922,7 +922,6 @@ static int ge2d_probe(struct platform_device *pdev)
>  	struct reset_control *rst;
>  	struct video_device *vfd;
>  	struct meson_ge2d *ge2d;
> -	struct resource *res;
>  	void __iomem *regs;
>  	int ret = 0;
>  	int irq;
> @@ -937,8 +936,7 @@ static int ge2d_probe(struct platform_device *pdev)
>  	ge2d->dev = &pdev->dev;
>  	mutex_init(&ge2d->mutex);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	regs = devm_ioremap_resource(ge2d->dev, res);
> +	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
