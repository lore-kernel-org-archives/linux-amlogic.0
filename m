Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B581FECAAD1
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Aug 2022 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Peyw2GU0NmZZ/7osP0oaQ/YitbG2Fo5DgRGZ9OxplTs=; b=qxdT3PWEPHT6d7
	rTz1w0v3IFOJAMSn6jyoE2cb4Y/JW+/vMKT/FLVzvqgUwqgeBo9gKzJF+kf7MQWHHSs7U2uypyIoD
	3tx3CAqvx5NU9oUN7kd3s8biRHsYQgQjJIK0TCQ1qEz0twv1rZrjXD+WcxPRJ199+fK0QN0FUzBIY
	F0Dgr/b/ZfdO+hJYwX1zra27KCYXUxLeNStYChRxXErNYLg47NVWfJZ4ViePpguyX6x7xp67m3eid
	n8tVffnXiM1HAzIMGGDzm+8GKEUTN5sC0w+PvJc0ZfpsfORCXq0aPZV031gyki3EWH3m8rGodtW6k
	7/5RLU8Q+4JMTEXsj0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJYs-0057C4-67; Wed, 31 Aug 2022 08:59:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTJYW-00574N-J8
	for linux-amlogic@lists.infradead.org; Wed, 31 Aug 2022 08:58:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id m16so17300864wru.9
        for <linux-amlogic@lists.infradead.org>; Wed, 31 Aug 2022 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=e13u68xBA/884vkkk4hl8IEeHqfdkMVHWzvg7KEAuu8=;
        b=Ll6Ls79aDg8y4FBDvZMGk6AsYZKzyoqsgqxo06YXtqQwNrVwa1bx2d8WatirR7fLNu
         6/747nudXT+T95hBecp4FekeN6NvJFHUYsW3SgUTcJT5rW1jExWVRvTA/z4FZ+kxSjRf
         zvAl2jaXyHFZCPbzZHzcU82/rWhj4uYvM7nqwr0yVJmEFuVctOiQ9xvxGdxMkVGPoH3p
         bhDzZQ+mWEn6NIYnRPBjtZp+BkSl50hNDgcEGzBB1g+t5tB9Z4iFT/YERKtXzaGOZc3l
         owWrxInXyfNQ037nJiX6J/j4IQ3TO8jsi4qfuN1EAYcXNRMpm+dicCDpTkR55/hN4ceB
         x0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=e13u68xBA/884vkkk4hl8IEeHqfdkMVHWzvg7KEAuu8=;
        b=UHK/oeJ9WQ+PnUKcao9dhN4ht5RkHlnFyZwNxw7fcmEaei0StEThQec/V4iG4iMX7W
         x2e2WiCBQ7bvjrJEIdOQjy7K6+bY6WvOj14utDcuxJKNydDlvyeETrMX+yA2StbZBvtT
         eGoTMcZ8QFMLlJJFO0jxcWDh9AImJnzSG7Tqjruj9ccv1c2V/RVo3j5y/sRih1j5/xGH
         OlLgtZFmwSJpgsEqUnw/+Tzc4QptinV2q20+eCXfUQIIthe7gkeUQ6y3lHQL511YmxFA
         E3K3Obf6zVCxNTstm2WZ6Z5I171NVmVdGb4vxk+74nBRKEH7Jy0V33kgmzOfEvMuYVjp
         nc+w==
X-Gm-Message-State: ACgBeo0saBeqztvgXjWfBHPzip7GtTNXkHGrZ4FC2OnPo7986VXfxrRM
	TwwY3RhopHyNV5kWxtT/jRq48A==
X-Google-Smtp-Source: AA6agR4SC2plsuJcbvAOZMQp+tP5/RDS2VO/E+uiA+DVqSs6lCOoVgUD7JcovfqIfWa/Yj1FXEMWWg==
X-Received: by 2002:a5d:6d0e:0:b0:21e:fc95:3dfc with SMTP id e14-20020a5d6d0e000000b0021efc953dfcmr11380292wrq.112.1661936317609;
        Wed, 31 Aug 2022 01:58:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:2250:ae7f:b88d:ddcd? ([2a01:e0a:982:cbb0:2250:ae7f:b88d:ddcd])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdd4e000000b0021f131de6aesm11629994wrm.34.2022.08.31.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 01:58:37 -0700 (PDT)
Message-ID: <9bd9e5d6-462a-b72d-0bed-980f5743af09@baylibre.com>
Date: Wed, 31 Aug 2022 10:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] phy: amlogic: use devm_clk_get_enabled() to simplify the
 code
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <9308a2a3-e828-bd9d-ab83-a68376aab5c3@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <9308a2a3-e828-bd9d-ab83-a68376aab5c3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_015840_976269_71A8A358 
X-CRM114-Status: GOOD (  16.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30/08/2022 19:16, Heiner Kallweit wrote:
> Simplify the code by using devm_clk_get_enabled().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 32 ++++---------------
>   1 file changed, 6 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> index 54d65a6f0..d2a1da8d9 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
> @@ -388,7 +388,6 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
>   	struct phy_g12a_usb3_pcie_priv *priv;
>   	struct phy_provider *phy_provider;
>   	void __iomem *base;
> -	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
> @@ -408,43 +407,24 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
>   	if (IS_ERR(priv->regmap_cr))
>   		return PTR_ERR(priv->regmap_cr);
>   
> -	priv->clk_ref = devm_clk_get(dev, "ref_clk");
> +	priv->clk_ref = devm_clk_get_enabled(dev, "ref_clk");
>   	if (IS_ERR(priv->clk_ref))
>   		return PTR_ERR(priv->clk_ref);
>   
> -	ret = clk_prepare_enable(priv->clk_ref);
> -	if (ret)
> -		return ret;
> -
>   	priv->reset = devm_reset_control_array_get_exclusive(dev);
> -	if (IS_ERR(priv->reset)) {
> -		ret = PTR_ERR(priv->reset);
> -		goto err_disable_clk_ref;
> -	}
> +	if (IS_ERR(priv->reset))
> +		return PTR_ERR(priv->reset);
>   
>   	priv->phy = devm_phy_create(dev, np, &phy_g12a_usb3_pcie_ops);
> -	if (IS_ERR(priv->phy)) {
> -		ret = PTR_ERR(priv->phy);
> -		dev_err_probe(dev, ret, "failed to create PHY\n");
> -		goto err_disable_clk_ref;
> -	}
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy), "failed to create PHY\n");
>   
>   	phy_set_drvdata(priv->phy, priv);
>   	dev_set_drvdata(dev, priv);
>   
>   	phy_provider = devm_of_phy_provider_register(dev,
>   						     phy_g12a_usb3_pcie_xlate);
> -	if (IS_ERR(phy_provider)) {
> -		ret = PTR_ERR(phy_provider);
> -		goto err_disable_clk_ref;
> -	}
> -
> -	return 0;
> -
> -err_disable_clk_ref:
> -	clk_disable_unprepare(priv->clk_ref);
> -
> -	return ret;
> +	return PTR_ERR_OR_ZERO(phy_provider);
>   }
>   
>   static const struct of_device_id phy_g12a_usb3_pcie_of_match[] = {

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
