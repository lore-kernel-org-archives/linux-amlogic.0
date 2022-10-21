Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20944C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvvbhEh8FybOy4jAFem2ZB7myf+yonN7nVclxAdPIFw=; b=NOyD/yrMd5THD2
	oT/XpZJe2Fx5xaRuVTqRT7BboZHfhZr6hdtiSeuEjKH4GdLhMYFWukH1kcP3rd/3BL5S9xfhd0pyS
	BNcc/AaCzivTJGZwq3l34OSys9e2ssbUIsqvcVx7rtbC5PHi5UA5xIDBc1hV/izszFKE4gWHV44OZ
	hywSl0cBnxvE9rpzUzQ4pYndAcCEySAEUvL10aMeGHm5o6DJp/cQrywrqEPfKr525C0uqCjHRzC09
	JPB8b3LfHlBDsc809fCEp9fVPHxFaZjrt1KnFDExIBiTRba9LVGfiQ0KPryz/nMHd7qU8hAb2YL6K
	iLJ/t9/UvBBHfuaq6TVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltYL-008coH-92; Fri, 21 Oct 2022 15:03:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltY7-008cm7-J0; Fri, 21 Oct 2022 15:03:05 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B94C7106;
	Fri, 21 Oct 2022 17:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1666364575;
	bh=ATb58ddMIpoRyi2sD7shKGonpro/YdGHJT18hb7PXcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rysd29HIwRd9PyDKrtR97UqfAXJDfS3t+NDhNqFahyBl6UfFnzCK9W4ijbnluxO/E
	 P5/iPxQkmou1RxHIAKzFFC0XmEy8heHB3Zp3YaWC0+Id+JEi1XcSVcuSxtwPa3xFuy
	 EldBggz+kB5ASHhVEMvs+fhfRYrqWFuujw0v5eP0=
Date: Fri, 21 Oct 2022 18:02:31 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Message-ID: <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_080303_811567_B69B8778 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Matti,

On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
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
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>  1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>  	struct reset_control *hdmitx_apb;
>  	struct reset_control *hdmitx_ctrl;
>  	struct reset_control *hdmitx_phy;
> -	struct regulator *hdmi_supply;
>  	u32 irq_stat;
>  	struct dw_hdmi *hdmi;
>  	struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>  
>  }
>  
> -static void meson_disable_regulator(void *data)
> -{
> -	regulator_disable(data);
> -}
> -
>  static void meson_disable_clk(void *data)
>  {
>  	clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	meson_dw_hdmi->data = match;
>  	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
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

As noted in the review of the series that introduced
devm_regulator_get_enable_optional(), the right thing to do is to
implement runtime PM in this driver to avoid wasting power.

>  
>  	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>  						"hdmitx_apb");

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
