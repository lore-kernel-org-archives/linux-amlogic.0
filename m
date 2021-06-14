Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC48C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:08:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA706124B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 13:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA706124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fXZQaapsHaF6TyqsLqOcjE+Cf2HgI7Zxx4Z6BejNBBc=; b=Q/KRLppyTniIb69j3jn87kJnXD
	HpsqJ6WnJr6hoO/4pOuJU5UTgRrk5Bv0apKcIri/MzaAoY+8Kweo8X4ZYpJBf3BP73HhRmt8VUIRk
	ilQQ3Pdr6rpuMMKjFMYTXYZ+qZ/aZbjq2GObmL+3dI4knnzhfIW40Bv+1S9qw2mHXtkj0RpRKtvIo
	BrxHN572wRKDSO3FHY819QY41t38QMMX+HXovxuX0ZZw3tTRL9LagHpjrSGbh8relSJNB09fLMT3T
	MK8JddWez/KdcKo1DNhj/3MRx76UtmXB4cERiVAMm3KFCD7eLlYsXnQoWkEpIoaFX1tPCUU5g6Foy
	t4LGWNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmK9-00ECv3-0u; Mon, 14 Jun 2021 13:08:17 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmK5-00ECu1-Ot
 for linux-amlogic@lists.infradead.org; Mon, 14 Jun 2021 13:08:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id c5so14471995wrq.9
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jun 2021 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hStNeExndAJKlr2+D1oBe+je+9Di+B0AKJsmhmeHTHQ=;
 b=zIfPjNFCiHxfObTFs8ltCt7sZ9oD7I2SfVX1afkSlrtXayb9culO2R5WYKq/e+R9/+
 gZJ08pzrH9I/bNRndmH6uhaFMZhakSpKCZWtdV/RsA8AntfFXpi6mykw6LyjOMI1R2lL
 OiCPiyg6YL0rjkobE198CFEKdvLW/3mvr/n7CGkrPAAQg3Ox+m6qk1YjRBq0g+yVESPH
 PiqvzF8Ws8MVwVNhz46e+j0MRL31iAAP7wtdT0U42M3EXjkkB7ZGHiUROoxO/adSSOVQ
 EPdAymMh0bgA3s0q/5Gj7eqf/kby/SrINUTUwWE7hs4avz+4JTko1aGxDExjjf+lwLuo
 Bwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hStNeExndAJKlr2+D1oBe+je+9Di+B0AKJsmhmeHTHQ=;
 b=XpyntOLxp/Hm+/LjPIo4KeYQps45WJLT3pqQFPp5yeI1mzCib0Bo3DAkN4qLzIkckL
 FEoQdJvTheoOofVwWsWKtNm4tXY6QioKldyGmbi7PMiDxViNLQbr9SMQ916CfGDSenwD
 5bMoEGaXJLGjv49xJKWCBe+EZ5oAi6Pty4hAA+bm6wrd13IpyQw681/efGJPUK5M+hTc
 GSC0o7LRSiIp1fjiENwnatIu1/ot8zh19pkkXmHZi+Ma2WiNByoP6GW59QquNgiKobim
 pEwdpyZ6urLRdjk+JYojnQO6X2r09EEaeQoFUn8asu9hCmKzlO5C6HPHDzjn/4qJ1b7b
 ulow==
X-Gm-Message-State: AOAM530OWLoF3zZriPxselfLBVglAG50aE2R5P3Rt35G83xb1+wSWHmR
 nvnP0lCFJH2EAkq6JWAGvjf5fA==
X-Google-Smtp-Source: ABdhPJzhrbsLUQYWmMLMpZ5iObfaCDIXTZ3flWw2olgqdOuaNg4kbgxCwgzzFk8AtkZqvNIeEdQSAg==
X-Received: by 2002:a05:6000:1847:: with SMTP id
 c7mr18646898wri.368.1623676092087; 
 Mon, 14 Jun 2021 06:08:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb?
 ([2a01:e0a:90c:e290:f0d4:3c02:f06a:77bb])
 by smtp.gmail.com with ESMTPSA id r7sm25083457wma.9.2021.06.14.06.08.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 06:08:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] spi: meson-spicc: fix memory leak in
 meson_spicc_probe
To: zpershuai <zpershuai@gmail.com>, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1623562156-21995-1-git-send-email-zpershuai@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <8317e3b1-120a-eb55-95bc-7cb3cd1777c5@baylibre.com>
Date: Mon, 14 Jun 2021 15:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1623562156-21995-1-git-send-email-zpershuai@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_060813_895747_D3B52234 
X-CRM114-Status: GOOD (  17.34  )
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

On 13/06/2021 07:29, zpershuai wrote:
> when meson_spicc_clk_init returns failed, it should goto the
> out_clk label.
> 
> Signed-off-by: zpershuai <zpershuai@gmail.com>
> ---
>  drivers/spi/spi-meson-spicc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index ecba6b4..d675334 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -752,7 +752,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
>  	ret = meson_spicc_clk_init(spicc);
>  	if (ret) {
>  		dev_err(&pdev->dev, "clock registration failed\n");
> -		goto out_master;
> +		goto out_clk;
>  	}
>  
>  	ret = devm_spi_register_master(&pdev->dev, master);
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
