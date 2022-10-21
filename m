Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A66C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyvG0a9bilvwv+wGO2/YWO6MFgzEFNKdsH8pWh2ifQw=; b=I16L3Do8LVp3avf5McOaDZ0c1q
	YNqD9vKlt6sYmVwjBdoqx1VAcw+Ixqh40tS0NR2IopRNQhcxBqi8PikXcIulTTJFP7VI1AvNr87BS
	NYVfqtUG7hkqh4ayoRjkvIN2S5ZxfdiEIOtXXFMtF4N81In1zfETcO4w9AaRnQxWdwDg3MXJKl5ZS
	jS+/PtOAN79C4wtC8LMEHkaRbT3X66Gc1JCChrNe4LrA37lOGNTjJoqOv/i8gURNrIpeJe1ovmGtz
	Kip/a0Rol3idvH44z9Cud0PkF2pR8LTqnTHRwzDKG/rMMiyx4W1FSaitEhmsrMaXCD0R2FL8X2Oyw
	jmVkH46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols1Y-007vrL-1z; Fri, 21 Oct 2022 13:25:20 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols15-007vb7-GT
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:24:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id v1so4779432wrt.11
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihwjot/dYV8gpdncYn3dxDmC63eFQdqeYLHCPOfEipg=;
        b=tm6RE9W9SJfdGyaDYoyiP6dvRI1bG01hT9T7vOUAR/6SCfAUIf/dniBAdoXacXYEO0
         11+qXcvgk+8fXBxhGzAIz/Ztv2drf1js03K1OQyqi0cDxE29rgQEia7t8Rc9/dMnIkH+
         8dizoYr25a77m9AqcCAkUJM+8SvOqmnt5hb9tWxS5GykyBx0Wy5M4fu2Zlmflyalycbi
         RQ38cnfSgbNZn3Dmm2/VG0QUC21UpuoU5n0bu1e8yq16VxFFMN5QWyB3P2v8UIxbtGqw
         svOBAC0rS06KAPBfApjJnSJZNnfnQVLOAFtN99nJSvIXm+nRUvSpdragj8RRAdPyocil
         c65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ihwjot/dYV8gpdncYn3dxDmC63eFQdqeYLHCPOfEipg=;
        b=DlicxOKkrTzQ3JnYfgoA1KWPAXh9xaUg4hJuDlNKwQYzkHaLpaF0WVeGEVNbMLYtec
         kPznZRX3Xpj1hvMSKYWiiSmOC7PpXQAP0eqqvOJEL/+hzvkk9FHLUTnopJ+hFbO1gsHw
         ncrQ57WHzciXngf/8q7s9Alb06mjeQhpFJhQpqd/Ih7Jr1B+yMHjXU2xRO+uvTrd/5sz
         ZfRJXs0XnnAPmgb2pdsCnwy00mna/Gay9zDsUklK4jrGbLNz+3mcUfn7y5Vv8pRMmq/y
         XMbpwaJ9SMezYJsJFqm7gdGOE2xiJJaOtecl85ZlNXw4xKPI/mMcG+v+aWKTe4Vd04o1
         hNwg==
X-Gm-Message-State: ACrzQf1aRNdVpo5pjCeDCFgiqzohhXjyzhaLnvqgQfRHgIZNw1wOxk+f
	3onZ7XcctgTlQBO9ohA1qMPcVQ==
X-Google-Smtp-Source: AMsMyM5LAMpg+wQ8yeHpWlL27GjaAM7iPFACl30NQbSdsxzQ4u5vm8tvdXI3CordRzKGlvVAJRB2Bg==
X-Received: by 2002:adf:e189:0:b0:22e:cbf4:1148 with SMTP id az9-20020adfe189000000b0022ecbf41148mr12173858wrb.47.1666358688360;
        Fri, 21 Oct 2022 06:24:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050? ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
        by smtp.gmail.com with ESMTPSA id z23-20020a1cf417000000b003c6b874a0dfsm3132370wma.14.2022.10.21.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 06:24:48 -0700 (PDT)
Message-ID: <21631637-6313-550e-dfd1-94b0c318a9ec@linaro.org>
Date: Fri, 21 Oct 2022 15:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_062451_595064_00D6E60F 
X-CRM114-Status: GOOD (  17.94  )
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

On 21/10/2022 15:18, Matti Vaittinen wrote:
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> seemingly unused struct member 'hdmi_supply'.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> ---
> v3 => v4:
> - split meson part to own patch
> 
> RFCv1 => v2:
> - Change also sii902x to use devm_regulator_bulk_get_enable()
> 
> Please note - this is only compile-tested due to the lack of HW. Careful
> review and testing is _highly_ appreciated.
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
