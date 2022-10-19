Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F5C43219
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 10:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnSh36r7M54zpqQzBpuzAduCn7k4JBslsY8g1QsxbUc=; b=KG8Jht1li2C/4g
	XqBZr5HlnF31iH4Jp2o+w0TxRYlVE6T3q4YAKiqBUW27VVXC/mMO7CzJ49+/QlMVLtSFFQEe0iT7T
	fXjOTo0nP3EwfdTwSDad4TcrY+QPtEjJlVnU4zeZHLD3AYskF8izIAQmfHmRiLaw+7qAemDt0SLXj
	kNVIENdxC2/9zS3MJAdX4WGMwyG/sCyjUc2UW4WO8neYn+btYCBHh1Vx3H/kqJuuX4oXVtOS85PN/
	xfeTI4MQ/QKRMni2vKBo8dEHlDIbEmVPRdPbej7UKKWbibTyPdOJfQVAi58u9u7Ug4WbbFjTaR0Vi
	htOHG7wsf4Ex+jFTNwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6Zg-000TYz-7B; Wed, 19 Oct 2022 10:45:24 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol6Zc-000TQ7-PO; Wed, 19 Oct 2022 10:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666176320; x=1697712320;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=93p6LX+Ewu3rCVdZcsXWSNEp7EfDushKgpEKzPy47FQ=;
  b=bonBlwRv3GsR116v19aiCj8aYsUB62Afu6qKmzJlK53+z0oxSDTGzijM
   p5au3k3ZF6ebZBbxmyJI/4FqSZBcBGeeXKe4/DTCQN6t17GGtribiPwd0
   ebp8FXilUMHnwp95/+3Z26wHlNSyWxl3J7vh95ptBwDJtcyPp4Wm2hLsq
   E73jkjXzoiS5enrnI8zQ9niYFCdWIBQwCNrtDLZRgG9JuO9aR/wcmEVKD
   szy1eWDrXyk5t7oVXh9kfAzL9YiAzTMs/41RT9yMQfdJZVyXVCNDpMrkR
   iQ1u8diY8jEw5spLxbDbZLFYJnU1SmGm2LnLTn4ey5WtH1BHCFYIYJ6nu
   A==;
X-IronPort-AV: E=Sophos;i="5.95,196,1661810400"; 
   d="scan'208";a="26842869"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2022 12:45:13 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Oct 2022 12:45:13 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 19 Oct 2022 12:45:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666176313; x=1697712313;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=93p6LX+Ewu3rCVdZcsXWSNEp7EfDushKgpEKzPy47FQ=;
  b=L641wtOtlNmC+t2Uqkw+LRpWIYhfg7cGAAsCvRqQAaqwB+/WCGUhSntp
   u60ot7ftL8SUt4I0OjPi3jzS6guL5fVeAD//pOS/w3+gbbv1/Fh7LCtKC
   LdhuAvM3QauGBd0BtlCqIwz5FgYr/AHzBnBXMcyryBEl3d68q3CxKj51J
   OdCqbW1UeaueZ1U6YP/fXRZjdky1KaeUFoJkaQUr+XSLlsN1L5DxG/d8V
   Bk+bLLHEw+6xEaCDn6hcm9zLlPn26snWLmI1YojULfA77vU5UlRppcYZ2
   /w2kwMzuqq3ihHGlJy0Esqz7KMhrqFA5YkbsG2GKo4Ou+ROJhTY5TnpWU
   g==;
X-IronPort-AV: E=Sophos;i="5.95,196,1661810400"; 
   d="scan'208";a="26842868"
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on Odroid
 N2/N2+
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Oct 2022 12:45:13 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C62CB280056;
	Wed, 19 Oct 2022 12:45:12 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Date: Wed, 19 Oct 2022 12:45:10 +0200
Message-ID: <7193025.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221018195122.8877-1-linux.amoon@gmail.com>
References: <20221018195122.8877-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_034521_252155_42B96715 
X-CRM114-Status: GOOD (  18.60  )
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

Am Dienstag, 18. Oktober 2022, 21:51:19 CEST schrieb Anand Moon:
> Odroid N2/N2+ support active cooling via gpio-fan controller.
> Add fan controls and tip point for cpu and ddr thermal sensor
> on this boards.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi index
> fd3fa82e4c33..e61a4285a910 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
>  		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
>  	};
> 
> +	fan: gpio-fan {
> +		compatible = "gpio-fan";
> +		gpios = <&gpio_ao GPIOAO_10 GPIO_ACTIVE_HIGH>;
> +		/* Using Dummy Speed */
> +		gpio-fan,speed-map = <0 0>, <1 1>;
> +		#cooling-cells = <2>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
> 
> @@ -410,6 +418,40 @@ &cpu103 {
>  	clock-latency = <50000>;
>  };
> 
> +&cpu_thermal {
> +	trips {
> +		cpu_active: cpu-active {
> +			temperature = <60000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&cpu_active>;
> +			cooling-device = <&fan THERMAL_NO_LIMIT 
THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
> +&ddr_thermal {
> +	trips {
> +		ddr_active: cpu-active {

I suspect this node name shall be 'ddr-active', not 'cpu-active'.

Best regards,
Alexander

> +			temperature = <60000>; /* millicelsius */
> +			hysteresis = <2000>; /* millicelsius */
> +			type = "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map {
> +			trip = <&ddr_active>;
> +			cooling-device = <&fan THERMAL_NO_LIMIT 
THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
>  &ext_mdio {
>  	external_phy: ethernet-phy@0 {
>  		/* Realtek RTL8211F (0x001cc916) */
> 
> base-commit: aae703b02f92bde9264366c545e87cec451de471





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
