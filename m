Return-Path: <SRS0=23Bv=N6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417B4C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 08:05:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B8060F5E
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Sep 2021 08:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09B8060F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vkCq/OiXAMFbuaGtdmLeozUsFVcjTm0/A1OEA5NnXTE=; b=cSQvd2acKxLnAqQ9cpodjPAGXa
	ftgFx+U6FwyE7MwBVi626Q5nt99MkbTFJ1jgFcWgu3Zd8sSiwgqODlestxnGLdU6AZWhhT6KqxcuD
	6/KrbJC2hd9Fi0YJW5GLYlMam3s5y16U7iawO4nmmkKCTRkawa3cQApPmZtnRs/FZV/O/SZNgX3E+
	p0LqOB7CgEHHCyjR4iqwxVRG6nLi/zxelf+HyCvw5xcUtAcMXCcSJBmVMGU0KkESb6QOLubOki35a
	XPllssou7DS+kCQnU4BMTYcFBuMHagAurt3aaPktoKUhpoeflpb82Xhwkyzh2/cjDmjAh2OQRC0ib
	WbvKWnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNsa7-0063td-6U; Wed, 08 Sep 2021 08:05:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNsJM-005z09-Qy
 for linux-amlogic@lists.infradead.org; Wed, 08 Sep 2021 07:48:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id s24so966008wmh.4
 for <linux-amlogic@lists.infradead.org>; Wed, 08 Sep 2021 00:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iD5JAWMZKf4nhnTOd/3EZmehWhVW0/THDtH48VyDTSY=;
 b=y9Dfimdpu8K4LyP3jFYqVM9nQdIJBlz2+nDcK2LsdViVJLLfaQGKFNNhgmNhqb3ZYj
 rH9A1QTsmX9r/rp3K49tx6IFUXYQfQi5peBCyvZfnMNsG1clq+CJyWEcWTPwXiekz7um
 8fv2gie28kGYspTs+pBxIdo2Sw/t6w7V68fsyT9HoSInD4qVjz+MHWLGm2YH+HYpZvXZ
 vKLfIGUswyk2sIe67VWCvLrluElvuSpYCWHY58uW9NwgaT8P1j8wUKXq7QpJTYoLTfH+
 Y+oHAqzF2ESbhJyrZ2hSZJQQZ/bfxea7/W8hG3Le+vrc95ul7nFSsvnTCaCBPaNCQb+A
 /PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iD5JAWMZKf4nhnTOd/3EZmehWhVW0/THDtH48VyDTSY=;
 b=Q2IiBNDbfhwpEJTlV5vpbZN6A3fOVAHyAU183ilv9umrnFvZPUO85yNf8RyHM0JfRN
 wjT80TyxJVTOkZ6QNELt2/Oy6GkdcY26flmChlq8o/dPIOG+5wQudK2Zvq3dCqfSwQ8M
 AbaHrHQ5mVYdcq4q0G8q61/KA0JURKG1uFcPaJ4Zte2TBe1GqA8jUaFFVb0v3ARwRQd+
 QFsCt0spun5/31kd3lx3AEsjTyHw7/W1rxeeQ+DodLmxHHfQUXQUDgdyjiNFXS9qN5nk
 Zz/lOJjALleRlO1ScAaBBH610DEjOt1xn5xtRfaXOwNu95HBe5c2nmd71U1WhPztKXb0
 QuLQ==
X-Gm-Message-State: AOAM5322NJsGva5raKcBNa5/vqd26nJJ9YsKkdcdkzBN3hcvZvs2g+RL
 xUdFAUHzPpxt6yBvzlJag0f1ig==
X-Google-Smtp-Source: ABdhPJwrYc0Tyg5rrojfsiaH/VOzUTLDvtXfCohm3UjsJul/5gg30FEzSZlUzWia0ECjM/Mjo1F9RQ==
X-Received: by 2002:a05:600c:3b15:: with SMTP id
 m21mr2126503wms.162.1631087278059; 
 Wed, 08 Sep 2021 00:47:58 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:19d:2e13:ec0a:9d59?
 ([2001:861:44c0:66c0:19d:2e13:ec0a:9d59])
 by smtp.gmail.com with ESMTPSA id z7sm1474364wre.72.2021.09.08.00.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 00:47:57 -0700 (PDT)
Subject: Re: [PATCH 2/2] soc: amlogic: meson-clk-measure: Make use of the
 helper function devm_platform_ioremap_resource()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210908071544.603-1-caihuoqing@baidu.com>
 <20210908071544.603-2-caihuoqing@baidu.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <85221044-5d7c-5b33-7704-5558b7992fa6@baylibre.com>
Date: Wed, 8 Sep 2021 09:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908071544.603-2-caihuoqing@baidu.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_004800_977279_2FC95E66 
X-CRM114-Status: GOOD (  16.94  )
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
>  drivers/soc/amlogic/meson-clk-measure.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 6dd190270123..3f3039600357 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -606,7 +606,6 @@ static int meson_msr_probe(struct platform_device *pdev)
>  {
>  	const struct meson_msr_id *match_data;
>  	struct meson_msr *priv;
> -	struct resource *res;
>  	struct dentry *root, *clks;
>  	void __iomem *base;
>  	int i;
> @@ -624,8 +623,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>  
>  	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
