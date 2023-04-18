Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328BEC6FD18
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yT8CmYzMWRvZXukkTHXeqXgY4t8RIygYQ9kC0GsVm4=; b=wl7UL7lGvKUeqVStKR/ogGpbBb
	H+qAwcPYR+3Evum+Vrjr1xRH1vsKtCB72oaUvwd7gXSmUqjxWAXwVVJRYWBOXFrQ2OhRJ9eLDgMFO
	pb0WI1EDFnMKBJ5iKHCkhmKotqLL8mJ5tzMywY9ztptzo+V8z9LUN1c9W0bynXvZBOhEB7K79x/X4
	wQUNX6ov43V1M6bWmSDZ3aS5wmyBxxq+nffmDbyhebdSkg4ni2L2YKDwY8AwDB84tB/EPwIhmULCA
	fQ+SmluHNQTvtJjlFHutW7TVzArjL8Adk16NM4hRUjKcinBSEKXnvct55ldt1hBbgmBtJfqIXc2p0
	2coEfpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjN-001zjC-0Z;
	Tue, 18 Apr 2023 11:42:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjK-001zhT-1T
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Apr 2023 11:42:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id he11-20020a05600c540b00b003ef6d684102so13534318wmb.3
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Apr 2023 04:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681818157; x=1684410157;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uf1nCJGusTAIOpEPNj5fpve7PAaHYQTZE2JQsmwt9QE=;
        b=w3nI2CDX9CeRVgn1dRxz2X4TSiIDruazqTgdqI1sA7z9a7Y8jyin1MVYqucWkaOKvZ
         BFPDITjKQ2HL6usuqGssWtCL82IXyslu1ebFHM1uPsuDu8Yl0prht6fumyR5mRzFscor
         Vaxeasi8y7/R8NAMifCwJvWRg94rN2x7IMBZd4yjUFApJAYFVSkPY7nfT6fbivBsNFLf
         GAeee9q4MtcgEebqt3Gvl0olQU8QWkSCu1iW79baFgWfymVIEbK2kgYP4VvddWfcB8NE
         5bZcgUYajFel7635QhHI3v5CulDxgzol5KHO5A719p2q1MPYyuTryk2mzvCKQtlH7px5
         OGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818157; x=1684410157;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uf1nCJGusTAIOpEPNj5fpve7PAaHYQTZE2JQsmwt9QE=;
        b=FktHPZb2qTMXlf7SX7Ki9KcK4quWUzGkGgUhDknwYQQ0PPmb9OKGeVCcicEMFuX1af
         SO8qhdudXn0A0Q7ICr6oq1OMbxLW/k/0zsfCwoB9gEeL4f0PhW/SX+wJbE3/oia8S9ZI
         m7N2sy05/qOkqSoEeb8gyPKlllYGzzsjt7g7czdfseunQLttOEgJS4a4B+slBeAKuOk5
         6VS5NuzF1w+AGRZF6yWlQ4H675qZlDdIxpF6EtaXwoLNxuR8a+vKpukSJWfefhIaccmZ
         /sKaKnDPP3zn2PEKAqNWwZVibSOXAzW+TbvV1w1jkBg1Yw1va2RIj4z8p5YZ9Fqb2jA6
         Q+rQ==
X-Gm-Message-State: AAQBX9eSirB3zOeU42FDIBE4kvsER2JoMM2TvUyAkiMiJiuzYgxNQw0F
	SHh+5WOo2CnwoQETncJZkW9/ag==
X-Google-Smtp-Source: AKy350Yn5hCJE11Ubo7BR00id4iO5r+7lkv33PiTuxH90oyrI5SyibVgb9voWIQK+uDeNtimhqUY7g==
X-Received: by 2002:a1c:f315:0:b0:3f1:6757:6245 with SMTP id q21-20020a1cf315000000b003f167576245mr8650275wmq.7.1681818157128;
        Tue, 18 Apr 2023 04:42:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a02:f867:7c56:79a0? ([2a01:e0a:982:cbb0:7a02:f867:7c56:79a0])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003f07ef4e3e0sm2665744wmn.0.2023.04.18.04.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:42:36 -0700 (PDT)
Message-ID: <1acdf7b3-cbe4-5689-7c35-5146bc1f07f4@linaro.org>
Date: Tue, 18 Apr 2023 13:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/5] phy: amlogic: enable/disable clkin during Amlogic
 USB PHY init/exit
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 mturquette@baylibre.com, vkoul@kernel.org, kishon@kernel.org,
 hminas@synopsys.com, Thinh.Nguyen@synopsys.com
Cc: yue.wang@amlogic.com, hanjie.lin@amlogic.com, kernel@sberdevices.ru,
 rockosov@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-phy@lists.infradead.org
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru>
 <20230418111612.19479-2-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230418111612.19479-2-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_044238_494391_A12BA615 
X-CRM114-Status: GOOD (  19.12  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/04/2023 13:16, Dmitry Rokosov wrote:
> Previously, all Amlogic boards used the XTAL clock as the default board
> clock for the USB PHY input, so there was no need to enable it.
> However, with the introduction of new Amlogic SoCs like the A1 family,
> the USB PHY now uses a gated clock. Hence, it is necessary to enable
> this gated clock during the PHY initialization sequence, or disable it
> during the PHY exit, as appropriate.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/phy/amlogic/phy-meson-g12a-usb2.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> index 9d1efa0d9394..80938751da4f 100644
> --- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
> @@ -172,10 +172,16 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>   	int ret;
>   	unsigned int value;
>   
> -	ret = reset_control_reset(priv->reset);
> +	ret = clk_prepare_enable(priv->clk);
>   	if (ret)
>   		return ret;
>   
> +	ret = reset_control_reset(priv->reset);
> +	if (ret) {
> +		clk_disable_unprepare(priv->clk);
> +		return ret;
> +	}
> +
>   	udelay(RESET_COMPLETE_TIME);
>   
>   	/* usb2_otg_aca_en == 0 */
> @@ -277,8 +283,11 @@ static int phy_meson_g12a_usb2_init(struct phy *phy)
>   static int phy_meson_g12a_usb2_exit(struct phy *phy)
>   {
>   	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
> +	int ret = reset_control_reset(priv->reset);
> +
> +	clk_disable_unprepare(priv->clk);
>   
> -	return reset_control_reset(priv->reset);
> +	return ret;
>   }
>   
>   /* set_mode is not needed, mode setting is handled via the UTMI bus */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
