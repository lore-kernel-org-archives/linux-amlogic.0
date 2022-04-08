Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C10C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ohl3farbm7dAaHGSnvgQTe+xZw5k2nJPQPfVS5V8Vw8=; b=Jyb5rS3h4Si8pRW9VlGFUgwxU2
	WDjigSSC3zT2Rv9a6aLmGYz6AQrRQlcDxnJ1zv13niZ58D4RdD5wWQ1HBICnDR+p0hS0v5MKKN78t
	f/Yplkr5svPiMkqHHrIzCAUaDjJuqlSx7NMS4U6iLvRoNcnxdBFnbE0PpIZYUZp2yeR19HIdsRtz6
	WD/D3Umwfdyf9lS5lmOWaYYnzUYjBAhnZlna0kvIqwJbOMfjNy6Azp8n+dbW44a7v7Gfl6y/T5J8b
	d9iK0XdrT3pd/odSgsy+qFlBCOACvHNhgUitdavNOJ+iYm/NBmkl0DwsKN9GDXOvgh5RxmGRC40V+
	DnLtXQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncixU-00FVYE-Nb; Fri, 08 Apr 2022 07:23:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nciwY-00FV4T-Lt
 for linux-amlogic@lists.infradead.org; Fri, 08 Apr 2022 07:22:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 k124-20020a1ca182000000b0038c9cf6e2a6so4994709wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Apr 2022 00:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=HwBqnOa1E0VlKqSq871tPPYQ3FcLKgr7WO5uW7Uw2Eo=;
 b=qPq7Ttkmagr0EKp8wlqfUPgVgLcoiaYn151NPeEAixOI0CRtf6dSduscBxufr4uM3v
 KH6eA4pvw+dWR78LOfdNN3ZtNEJvK9JgmWh+P3Id3JnSiC8VHbS2bobN47ktnZqN4erm
 gkjunFOKEuN8yf5oKbBjkvN05FLNImEXRVs+M3d9bSHAS0o6sw8eOUHHsYH4ib2rYcox
 U2WB+xTfDCb08r5MdnH5hAOrC9iKJ0kiGkUPozet3TWbUZ/lcY89Ljhj06OuvuhzHjkg
 wRCx7lS1XnZj1hc7nQ1OUw0t7TR8l+wWoGeOpAOib2Cw8qHXfPhiWeORgGFqh/nCNT7j
 b65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=HwBqnOa1E0VlKqSq871tPPYQ3FcLKgr7WO5uW7Uw2Eo=;
 b=1hIrXGRp8pbxhLQLYaiPBDLxR/j2nm1XgUau3Rqwv1GEhjtFEVZfjMtvuh0nF+v3x/
 Zu70g9/50WbJIHQd+TAa9irRokGn/upfRqciYsl9Z3gubVFp6hq+sf3t/iDCX20aM1ze
 4ODtDV+GV05XJFNcrC3PVFOtP6n208y2a4r51XJALsg6BiY/I6698rma/em89o5LiHZi
 kZY/QemDIiGyzRElTAlrAuDHdmGf2jDvvr9Iz/sbSef9y8HWLSd7WMR/GW9JUzYJsk9U
 0Gw7qsjRWHnJDP+qGHLTejwExENicPMsPjUaJ8+clxM9K5L4+hI5G98A9d/m89Lj3EJ6
 p7Gg==
X-Gm-Message-State: AOAM533gMMDJ+Phasc22rTwGmev8NecWcDcjuhlsakT6cLWu7433VQYI
 +DfZlxjcp7NP18OgwJwh88sPIw==
X-Google-Smtp-Source: ABdhPJww8AuspZpWbFyeaKBTt1PnhZvYHHposZmg6lmxyzorxCgMnc8+vMSOdc3trfi2NWE+I3bmpA==
X-Received: by 2002:a05:600c:3b8c:b0:38c:b365:7220 with SMTP id
 n12-20020a05600c3b8c00b0038cb3657220mr15632000wms.120.1649402523902; 
 Fri, 08 Apr 2022 00:22:03 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm14084506wmb.36.2022.04.08.00.22.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 00:22:03 -0700 (PDT)
Message-ID: <56595ef2-a0fa-a92f-596b-511828295229@baylibre.com>
Date: Fri, 8 Apr 2022 09:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] arm64: dts: meson: align SPI NOR node name with
 dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
 <20220407142159.293836-2-krzysztof.kozlowski@linaro.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220407142159.293836-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_002206_785142_D7695E90 
X-CRM114-Status: GOOD (  12.70  )
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

On 07/04/2022 16:21, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi          | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts    | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts           | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi              | 2 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts            | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> index 2d7032f41e4b..bcdf55f48a83 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> @@ -416,7 +416,7 @@ &spifc {
>   	pinctrl-names = "default";
>   	status = "okay";
>   
> -	gd25lq128: spi-flash@0 {
> +	gd25lq128: flash@0 {
>   		compatible = "jedec,spi-nor";
>   		#address-cells = <1>;
>   		#size-cells = <1>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> index 2d769203f671..213a0705ebdc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> @@ -298,7 +298,7 @@ &spifc {
>   	pinctrl-0 = <&nor_pins>;
>   	pinctrl-names = "default";
>   
> -	w25q32: spi-flash@0 {
> +	w25q32: flash@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> index 93d8f8aff70d..874f91c348ec 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> @@ -284,7 +284,7 @@ &spifc {
>   	pinctrl-0 = <&nor_pins>;
>   	pinctrl-names = "default";
>   
> -	nor_4u1: spi-flash@0 {
> +	nor_4u1: flash@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index 86bdc0baf032..f43c45daf7eb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -374,7 +374,7 @@ &spifc {
>   	pinctrl-0 = <&nor_pins>;
>   	pinctrl-names = "default";
>   
> -	w25q32: spi-flash@0 {
> +	w25q32: flash@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "winbond,w25q16", "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 3cf4ecb6d52e..c9705941e4ab 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -458,7 +458,7 @@ &spifc {
>   	pinctrl-0 = <&nor_pins>;
>   	pinctrl-names = "default";
>   
> -	w25q128: spi-flash@0 {
> +	w25q128: flash@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "winbond,w25q128fw", "jedec,spi-nor";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index f3f953225bf5..e3486f60645a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -121,7 +121,7 @@ &spifc {
>   	pinctrl-0 = <&nor_pins>;
>   	pinctrl-names = "default";
>   
> -	spi-flash@0 {
> +	flash@0 {
>   		#address-cells = <1>;
>   		#size-cells = <1>;
>   		compatible = "jedec,spi-nor";

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
