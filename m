Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89D5C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 10:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oUT375nTc3/s1oZjXDrpM946cZ+O3VbgmpYKsSp9XDc=; b=OyP6nNp+BxV6Rd99QMD0TnkDRp
	B61C9Xcc+FnQBIv4xKof5UlYvDytzXW5Znr27zb3N8oft0EGrsD57gjPwXtVI0A8K6KR50EvuWFnF
	HmzfINlCc+qw+OYBWYRVZnHYISWh1bD8KTPKbDaODWzwOdtcIzm0yBtPiCBxzWetuqXyGefHb4yO0
	iYEHrR5UAs/0FBeM1aFbG4IoeVsmH5ZrgTCIB8iFLojVbmQDBG3XK09hhkEmbduHEXZllkEZBfEsL
	N1V+lX/H4eLD9CgZBQT5pG5rqsv6BTCZOAGJ3dsp//H+PKCVU/cSESV0fwsDKOhzVKFfdYhT69Noi
	pPlRPevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0ZK-004gNl-Iy; Tue, 30 Nov 2021 10:41:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0ZH-004gLg-RM
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 10:41:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id d24so43431667wra.0
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svu1vK4AHKyxZI5PFom9ScvanpNnAunnYWG5xr2hHV0=;
 b=gna0wbdNmsoRp3T86JmoocKgknU5P/d/QskEj3H6wSIPG6G0ECnxiZArcewdK3xp+R
 xN4pHa8GSCoBJTcnooa4sWsrmAu8kaHSr+BQcgz00NVwZan9iAS8aZnU51hA8jtbgAGv
 V3tuNMHOyZ21XrH+WoY+EuUAIN3PhNtEJFoiCAyjkTwvQiz/6St70sEzo3qHoWV57LiX
 t3Htgyus4E0Y31udJkXcJRe39kSxbgG+tfSF7TioOKYWCc2kPc5ep1ur31vhQI+ff7sk
 vuHo7tnpIhKl7RJHfj/Cee5gU+y9yOgO6G+GzxFnVMrNHqRXUInpGbBkW0/A3ncihRTv
 1O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=svu1vK4AHKyxZI5PFom9ScvanpNnAunnYWG5xr2hHV0=;
 b=Xgfnu44RCpF9tV0PKSMNa7T+I28DVvT3+lTCA39BufqEQJP+ZGuyYBRPETsZuo9mfd
 AMCmF/urSzalojVyDNfTDHKtJslw01fytPp8Lcgn7pChl6elXk0bmUoOyHoGX4E6NJWV
 7hF0/jW10XyD/yeOsAscXS6073zhd9EOEghH6fwSKwPB/t1nF5qWfhGoNUbNMid7fAB7
 17Rcc7IQqQurq3Ftaua73hjr2iyvhlmQrXDAFN5xve9bcvtRwijHr2nmdu2KJaSnxJ+b
 hWBu4LuePOqivbqFWxtNxYV++5PAjo3wdmFFsQdwGMVCQw5DLtyCoFFlDzfIkQ9oAsYM
 Rg0w==
X-Gm-Message-State: AOAM5332xE6UshOwBgJFuQo9QFUpkc70wlAcfxlSGjWKmUCkXQmqYKnP
 pL139FmHMdbGHdOdA9/ojRnXL3GmbfO9pvaC
X-Google-Smtp-Source: ABdhPJxjhf7qvZcuAHdKIhJj5GEIO1KvQOMDC7R/51CRADIrDDTdlTPGgxJ/1bsjcYy5yLi2/HhiIA==
X-Received: by 2002:adf:f990:: with SMTP id f16mr38552589wrr.128.1638268857932; 
 Tue, 30 Nov 2021 02:40:57 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a?
 ([2001:861:44c0:66c0:f80b:b9bd:4d6e:b61a])
 by smtp.gmail.com with ESMTPSA id f19sm2316115wmq.34.2021.11.30.02.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 02:40:57 -0800 (PST)
Subject: Re: [PATCH 1/2] arm64: dts: meson: p241: add vcc_5v regulator
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211130100159.214489-1-jbrunet@baylibre.com>
 <20211130100159.214489-2-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <36761ab4-d5d6-ffdc-cca8-bcc845e10b9e@baylibre.com>
Date: Tue, 30 Nov 2021 11:40:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211130100159.214489-2-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_024059_918991_0AA91A10 
X-CRM114-Status: GOOD (  14.74  )
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

On 30/11/2021 11:01, Jerome Brunet wrote:
> Add the VCC_5V regulator, which feeds the HDMI, USB and audio amplifier.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> index eb7f5a3fefd4..9d0684a8264b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> @@ -84,6 +84,14 @@ vcc_3v3: regulator-vcc_3v3 {
>  		regulator-max-microvolt = <3300000>;
>  	};
>  
> +	vcc_5v: regulator-vcc-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +
>  	emmc_pwrseq: emmc-pwrseq {
>  		compatible = "mmc-pwrseq-emmc";
>  		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
> @@ -136,6 +144,7 @@ &hdmi_tx {
>  	status = "okay";
>  	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
>  	pinctrl-names = "default";
> +	hdmi-supply = <&vcc_5v>;
>  };
>  
>  &hdmi_tx_tmds_port {
> @@ -220,3 +229,7 @@ &usb {
>  	status = "okay";
>  	dr_mode = "host";
>  };
> +
> +&usb2_phy0 {
> +	phy-supply = <&vcc_5v>;
> +};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
