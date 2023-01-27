Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95151C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6stlrb+kD8o9ADpfhc0kypOG8Pg4ixvlLDGIznD1/08=; b=NhPpLmvgGaZpb5Kiy5TTgl5sKe
	aXRX5NPpXNDbnhnT3DbAtPzw89vg0cznskrb3+9dQFZvbXkSqhyARXr6C5JXKsX93Imx25Z9RHmxR
	wD16kY6EKwcZIXAdSAzjc6r57HX7uWgr9Jboi0/oAEofmVD6W3UW3EBt+0/b639Djb69HCYq3odwG
	P2onLl8OWMHdnnDFfaiGcPO55LO0GJV9kjBjXoKQ/QXDIY/WqMaYMf6rFa9ttoDvZ1sPfjD7JKWhu
	3LV+7L7y84Y4unzFl2qrLYynZwBlSKkYdqurXXR0hM0+6rTISb6ItggM19JKPfvehyWr3vKVz8Z1d
	boqh7CcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRXq-00Ffvy-Ea; Fri, 27 Jan 2023 16:25:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRWU-00Ff7D-Gi
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 16:24:20 +0000
Received: by mail-wm1-x32e.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso5766708wmc.4
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s4SjPb+KQCCqXt5+UJSzCKnKOLQs9qLMQKD+w6awmLE=;
        b=aRo1LKtcLmlW7AqzdJ5P5K1H2cIVYIMH5rPcShdIajmE6UxnjjzGtP2X8/YLWL4f4J
         Elc1YEqHQK3XdceTc4l2ma6z8o0tkGOFZza5fxDiXdO1tF02bhR9SUNRGkSfWvftlWj/
         75IllQ5jN9q1jkZ/1u+cE6yDodU85IngsldPbBDpE7FkR/YmR9P6Ytz5RyOJtNYWOwp6
         X3LPDhXo4xGAA9FmWQt+CiQFK/mddsQv5+OQZsOMv376MvbxXtD8qMkywIC9f+Dysu8K
         tYtED7sOdZO1GJri4cGFU6I8oHw9EDXT3duhzlyf/qd9GAoRzMJ2rL8MXCQAfPdJWlkF
         laCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4SjPb+KQCCqXt5+UJSzCKnKOLQs9qLMQKD+w6awmLE=;
        b=jB1thDOF5+f9nMYn1ai9vALopzkhlVFvdzPgNq59w14tVP+IEXtJ61A1t+GrX4pHAN
         lHJY9iRqSPgtwhNla/uqm6Cnzn5y5syqCsN9fYthe442KB+S3rXxxQdEvEFFiVlTVSJV
         ZoG4jVmfaQq+Yo6gAD0NqZMs9k5gLSZGnL52OG0A/Ovfb66vKG0lkM7GX2FWvDhtYPME
         sQLfcpLK5Q27K713tQKkc0QreHJdOfqZbGRQVNaS9VxGkKHV9cPEvtTEAZCnUicx0efE
         KeuB2+3y8wObbwUmVQuo+6wySJPyhQOauF3C5FwZ8n1yR3sT9hqnBS7ct9JzEbagXP5M
         EQCw==
X-Gm-Message-State: AFqh2kqJ0aASrspLGc6tswh4VuT/CBPeDcL0Cb3jSfPXLucMsxkt7a0+
	bbOl0i1ECYrvUfraICCD8KDqCQ==
X-Google-Smtp-Source: AMrXdXuUKdqqIKA07OvubLoaqaeRIp3n4iTBC8331/4YrW210N0wx/YITmlKvn+2iYN2nxY7NvdFlQ==
X-Received: by 2002:a05:600c:198e:b0:3db:1d7e:c429 with SMTP id t14-20020a05600c198e00b003db1d7ec429mr33088183wmq.40.1674836657969;
        Fri, 27 Jan 2023 08:24:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c19cb00b003d9fb04f658sm8988854wmq.4.2023.01.27.08.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:24:17 -0800 (PST)
Message-ID: <fa2d056d-d261-4974-621c-35a39c5aec44@linaro.org>
Date: Fri, 27 Jan 2023 17:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson: add support for BananaPi M2-Pro
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
 <20230127142221.3718184-6-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230127142221.3718184-6-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_082418_615409_F3ED0FB9 
X-CRM114-Status: GOOD (  15.99  )
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

On 27/01/2023 15:22, Christian Hewitt wrote:
> BPI-M2-PRO is based upon the BPI-M5 design except for a different
> physical board layout and the following changes:
> 
> - USB 3.0 ports reduced from 4x to 2x
> - 3.5mm Combined CVBS/Audio Jack removed
> - RTL8821BU WiFi/BT module (internal USB connected)
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>   .../dts/amlogic/meson-sm1-bananapi-m2-pro.dts | 97 +++++++++++++++++++
>   2 files changed, 98 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 97b42e2100e0..644451794aca 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -60,6 +60,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> new file mode 100644
> index 000000000000..586034316ec3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2021 BayLibre SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-sm1-bananapi.dtsi"
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
> +
> +/ {
> +	compatible = "bananapi,bpi-m2-pro", "amlogic,sm1";
> +	model = "Banana Pi BPI-M2-PRO";
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "BPI-M2-PRO";
> +		audio-aux-devs = <&tdmout_b>;
> +		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};
> +
> +		/* 8ch hdmi interface */
> +		dai-link-3 {
> +			sound-dai = <&tdmif_b>;
> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-4 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&clkc_audio {
> +	status = "okay";
> +};
> +
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
