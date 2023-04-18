Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2758DC77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsKwxVwXR1swBAwmJcrdC3RWOmmob+6Tu9ifZ3lGNA4=; b=ul8x/y9pqr6fm1XVxwgYbBNnGs
	eYx6IGIE5J7ZqXsqrXfKR1rSFy4kRa09wS4WZGb/6WUyH5QCKao4fNTjIctc/aMwdxdINsVqV8Am9
	kTfAAIK5+STyj/iqQT2tDTps9e0SIa1199YScUgaFVqFhmfZgNtaOw+R8SzxcJMguLLQfOZvZJKF+
	2Bn3y2FZ11Eos1etlslGTpJHgq6+VrWuWf+7TXAaoQ3RMYHyNC8LofHfeZFNCAWWyVkUz2rgdKDyg
	fhLK6iKt+MAVNuxy7I/tZ0k8At1TuF3SCEckVhqoKF+iwlxUlPYjQFEQ/6sEqzGiktexvX6WF89Gd
	kmPbUx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjX-001zoI-0S;
	Tue, 18 Apr 2023 11:42:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojjU-001zmA-2C
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Apr 2023 11:42:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-2f917585b26so1853402f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Apr 2023 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681818167; x=1684410167;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcagkLGH6ZUHuOuJsg0XYh/tLtTQW2kywcT7xAak0Uc=;
        b=VJEGSliUJ1jFsZaOXkFd/SM8WredewL8AjConyayXoQxCNk20QUGuLMOfp3swmk5Fe
         JDMy/qOSpRdvtAbJR7xvUT5gOjb+dSVn70RtfNd1dZSucxOVyRBiGcsR1NT+Yq9MxoRB
         cnQ45noXCIfwbJjSxO6CIfJKfq6lyjUaVI0OOfWBtGBfNSucJXP42DnEIVMGNoswo77+
         y5ByQMquNDeCgupZ563LDkMBUZ4IzFXINMdCDfNwsMd47Dr0ScYbS5lFqiXHH+ZymK/e
         HsVITJf0UHwf1KIv8DpFoiDKozeKHnRnLoKCh/syKQU8268PwvfkWx8fePVReTvjyOE6
         Iaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681818167; x=1684410167;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcagkLGH6ZUHuOuJsg0XYh/tLtTQW2kywcT7xAak0Uc=;
        b=CwOo2NOLKdqmINL5HRU3d/Cag57RTdyGSokaBKPS1WwF2LAZjQRO6JZS8rte5+FTe6
         QSsnVp/TAdXhtadX86LaXLz9qGYb4Tp52eTJfaaNMmEJwLMmY4iVWrh3pxR5dOgx0jpV
         J9l0nlG80F6j07oiUY6Trd14fJf3ns8rxb3vuzjCBv13zBsYWkJg4RxLmU4JR5hrmsFY
         IeaijLWU5eAu8lz0q7T/m9y8nA5rXiWIKxSRSV6PgY/1ziY36KDmtt3sXAWnN2dePCDl
         uzUQ5iRJxDMNoWWMw0s0Q54+f2pKevEBEEh2rx+xp8lDcUQmmb+Ck6Mk1WrY1oKm7Y1i
         fb8A==
X-Gm-Message-State: AAQBX9duTSzaAMRK5re7Fl5wgBomsvWo8u0Ec6UhqDl43qXbQrknKHhx
	XOQkTczOeJenyR7jmPqFwzWu+A==
X-Google-Smtp-Source: AKy350ackhhCBc0yds/Ze67p3i/fZipb9ZS+j9xLtF86Se+PsHLaBshzI4clUNbRHKIJ+qzXbbGuVw==
X-Received: by 2002:adf:ea4f:0:b0:2da:2aa0:13e8 with SMTP id j15-20020adfea4f000000b002da2aa013e8mr1680346wrn.26.1681818166847;
        Tue, 18 Apr 2023 04:42:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:7a02:f867:7c56:79a0? ([2a01:e0a:982:cbb0:7a02:f867:7c56:79a0])
        by smtp.gmail.com with ESMTPSA id q17-20020a5d61d1000000b002faaa9a1721sm4614584wrv.58.2023.04.18.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:42:46 -0700 (PDT)
Message-ID: <f8c68794-0588-14e7-27b4-cb53ec257697@linaro.org>
Date: Tue, 18 Apr 2023 13:42:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/5] usb: dwc3-meson-g12a: support OTG switch for all
 IP versions
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
 <20230418111612.19479-5-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230418111612.19479-5-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_044248_719979_B73F3455 
X-CRM114-Status: GOOD (  22.46  )
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
>  From now, the Amlogic A1 USB controller is capable of switching between
> host and gadget modes based on the status of the OTG_ID signal or via
> manual USB role change.
> Previously, only the Amlogic A1 IP version did not use OTG support for
> host only mode, but this is no longer applicable.
> Therefore, the 'otg_switch_supported' option can now be removed as
> it is no longer required.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/usb/dwc3/dwc3-meson-g12a.c | 16 +++-------------
>   1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> index b282ad0e69c6..a13afdb219e8 100644
> --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> @@ -140,7 +140,6 @@ static const char * const meson_a1_phy_names[] = {
>   struct dwc3_meson_g12a;
>   
>   struct dwc3_meson_g12a_drvdata {
> -	bool otg_switch_supported;
>   	bool otg_phy_host_port_disable;
>   	struct clk_bulk_data *clks;
>   	int num_clks;
> @@ -189,7 +188,6 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
>    */
>   
>   static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
> -	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
>   	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
> @@ -203,7 +201,6 @@ static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
>   };
>   
>   static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
> -	.otg_switch_supported = true,
>   	.otg_phy_host_port_disable = true,
>   	.clks = meson_gxl_clocks,
>   	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
> @@ -217,7 +214,6 @@ static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
>   };
>   
>   static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
> -	.otg_switch_supported = true,
>   	.clks = meson_gxl_clocks,
>   	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
>   	.phy_names = meson_a1_phy_names,
> @@ -230,7 +226,6 @@ static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
>   };
>   
>   static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
> -	.otg_switch_supported = true,
>   	.clks = meson_g12a_clocks,
>   	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
>   	.phy_names = meson_g12a_phy_names,
> @@ -242,7 +237,6 @@ static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
>   };
>   
>   static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
> -	.otg_switch_supported = false,
>   	.clks = meson_a1_clocks,
>   	.num_clks = ARRAY_SIZE(meson_a1_clocks),
>   	.phy_names = meson_a1_phy_names,
> @@ -307,7 +301,7 @@ static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
>   			U2P_R0_POWER_ON_RESET,
>   			U2P_R0_POWER_ON_RESET);
>   
> -	if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
> +	if (i == USB2_OTG_PHY) {
>   		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
>   				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
>   				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
> @@ -490,7 +484,7 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
>   {
>   	int ret;
>   
> -	if (!priv->drvdata->otg_switch_supported || !priv->phys[USB2_OTG_PHY])
> +	if (!priv->phys[USB2_OTG_PHY])
>   		return -EINVAL;
>   
>   	if (mode == PHY_MODE_USB_HOST)
> @@ -589,9 +583,6 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
>   	int ret, irq;
>   	struct device *dev = &pdev->dev;
>   
> -	if (!priv->drvdata->otg_switch_supported)
> -		return 0;
> -
>   	if (priv->otg_mode == USB_DR_MODE_OTG) {
>   		/* Ack irq before registering */
>   		regmap_update_bits(priv->usb_glue_regmap, USB_R5,
> @@ -841,8 +832,7 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	int i;
>   
> -	if (priv->drvdata->otg_switch_supported)
> -		usb_role_switch_unregister(priv->role_switch);
> +	usb_role_switch_unregister(priv->role_switch);
>   
>   	of_platform_depopulate(dev);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
