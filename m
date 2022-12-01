Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE99FC43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tUOsFz7WdT97UibR+WwPGNHHkNGU9UYpzPHhTN6Du8=; b=hGMlct5xn+4kTdeSpuSUaOUixi
	T2jIv0IwebYn+5HPhgDVN5qva1OD1XdIHdyvZwMqYjtOx51scwA2z1jFNoNPD4WicVljxLMjy9bQc
	wz2A1XrzzCbXvEgFwNmx8yPcDVxu30XrQzqRYQMBVQ62syp1CIFJeYYlZKkVx36E1xXaNtKnF1wPb
	78EmV2r24b0HDFG9IjgH/MPTeYTA1pSfVG99AU6hrI7rEsJl2l2iSGfoDpFk2HV+dklLJiu0aCxCt
	ef12aD9kt95ISaxz99zD470ETHWX1TAZgNNfGC+Q/xszSmD6bH04rbJqBvrtS7jzqxOMAFZvEBTr1
	QvtfPomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f5V-005wEH-QR; Thu, 01 Dec 2022 08:38:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f5S-005wBc-HI
	for linux-amlogic@lists.infradead.org; Thu, 01 Dec 2022 08:38:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so950166wms.0
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Dec 2022 00:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KiIz3+tb5zv7p7JFple9ARBjQPwBUaGHUgkQfj8cO3Y=;
        b=G0uvG+UozMloOv4hJ2f4eRDg2VXq9xUMtPyoelMSC/3wCA1HAoHAMYHzLZZUfOYI0z
         7ms6BGLp5zKK7TW7Aklt14VVxMcsAWJvoS8UEZpfqX9TVNcQExVmUlqyFGQXoVP4b7cO
         ILsYLXREzwL3vYwHCNVjMOtsxMaAKXk4kMR23EJ8eYLzxxd75lrwmIyz9BSu4ETNvZTu
         NTEjl+hreNOUAu7aMvc1etdC6jmMKcUEezYelGnpD5dPE+AxwtVf5cEkHmHKd4XBHtzf
         qgJpHNSxrUsVwBOiWs2v5bUB8UPcFoKBKKEwSSgUC9hmWRVZj5PIriG2HHfFINs1zEp0
         /2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiIz3+tb5zv7p7JFple9ARBjQPwBUaGHUgkQfj8cO3Y=;
        b=UtLhawhxSp3w6jpbvQmcBtxldyBFWyXEQ+HIy5ZTRi6ei1OtvtZV+lDkRcHEQ2HnGT
         AR7YPe+nTikK05qTFsiQHksNeJP12TirxhNOKm6YBACyJMt2l33ZFmnioHwZ0fOKsHu4
         c2R86UNOPdpl7YpjZQxVyPhOloy6/6C1Zz7q7vIFbO5LrUE+2ZXaWydL4sy7I+e8ZjUD
         oa6+nGAsMsBKg2b3Bboq7MH432X00MKuGUayEGcK6mk9MBYQXcatY5/doyGiMVTNMkA8
         HS45PAjD2tJtKTT73zs0dyABc4vbLtOpkEI0Ac7pGczXyGsAK9vETM0onazEQpCtZU5j
         KN+Q==
X-Gm-Message-State: ANoB5pndTiZgr0ZoV3dnEq//Pu5ijas1sLdLcPTIks03mIIjyS/glk28
	MHMkYnsd34AOYJWigxQnyA5KLA==
X-Google-Smtp-Source: AA0mqf6vKwxrLoekKlS7jsHZjr1A/9hOVYcrZDL6KM2Yio2b2pW7B7Keg7XYP+2wYu9j+JJollwTBA==
X-Received: by 2002:a05:600c:548b:b0:3cf:b0e4:30d9 with SMTP id iv11-20020a05600c548b00b003cfb0e430d9mr40406640wmb.66.1669883907845;
        Thu, 01 Dec 2022 00:38:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f? ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
        by smtp.gmail.com with ESMTPSA id m188-20020a1c26c5000000b003c83465ccbfsm7551042wmm.35.2022.12.01.00.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 00:38:27 -0800 (PST)
Message-ID: <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
Date: Thu, 1 Dec 2022 09:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND2 v4 2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1669799805.git.mazziesaccount@gmail.com>
 <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_003830_626491_31C9C76D 
X-CRM114-Status: GOOD (  19.80  )
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

On 30/11/2022 10:23, Matti Vaittinen wrote:
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> now unused struct member 'hdmi_supply'.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Missing Acked-by, I'll add it while applying.

Neil

> 
> ---
> v4 resend 2:
> Respinning unchanged code with the commit title changed as wa suggested
> by Robert Foss and commit message changed as was suggested by Martin.
> 
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>   	struct reset_control *hdmitx_apb;
>   	struct reset_control *hdmitx_ctrl;
>   	struct reset_control *hdmitx_phy;
> -	struct regulator *hdmi_supply;
>   	u32 irq_stat;
>   	struct dw_hdmi *hdmi;
>   	struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_regulator(void *data)
> -{
> -	regulator_disable(data);
> -}
> -
>   static void meson_disable_clk(void *data)
>   {
>   	clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi->data = match;
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		meson_dw_hdmi->hdmi_supply = NULL;
> -	} else {
> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -					       meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +	if (ret != -ENODEV)
> +		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_apb");


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
