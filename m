Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E55C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4h00J6JPfcvgj6V98apr321lArE/VqTO/VESGsN6jU=; b=cdGuxhd1Af8/rv2r+V6ft1GuRQ
	VLtDXsPYUB9y6VHtkrD4EMZBeEpttJvNxe5RklUbO1JsrW4B1l3KsaV99Wp16Qic3iXCFxGl7/rLH
	ZxCuOhWJU0wwd45dRC4CK7O+HijH6sbk4YxkMQ3VJmCMFBKrGM9M0dJEoZbZCB2k9GFTj1tHL1LrD
	+NRrzAdjxRudxFmZ9QXFF0/yClCe3Eu51t21vrYu9hKEab2jqt8HMomziqTgji7e4Vc0GgYDvVCg1
	oovP+qa7ETK4Bo73VDnEgAGTlgQcJITnVhErr9BKYe6I91kq23Uacta+qjSIcCuBXPgkl3+H8DH1V
	Z8pvhQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHU8-00DgjT-Q4; Mon, 04 Apr 2022 07:50:48 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHTw-00DgfM-GY
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 07:50:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id w4so13060129wrg.12
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9KLUE1NHtEsDFtRjMM1zL7+bD86TSrQIC2LDIAuynOc=;
 b=Fx7T7OoM6yT56hzAxLIOfsn5EYaVjPRxqC5cOUY+DxBFXzSO8N05P+jEOPJdEHuGvl
 yD6zkibXVdGuk6wsZoPi4sU69B09ODb7VYQ+bEULD85UKQEiLVkDemiJh+YcwsGPx8zE
 5PwNCgDhgOc8KqWGlCOJitKrta5XLL1TFhl24+NA26JGWBIxp5MaraKMrmAUUZYMO5Rz
 KX8uoUYuDoqfpLL+L+0efnmxpxRPpr6O0wn8sbEt1gzKSeT9fZwRjwKjlQHLW3NQ2Ysi
 WCC3EIW8tHdhTl2DcAFCf3BuR7pRYY/X8MjPU1Ra8kHXV/y0GIV7jLkEpYvL2096PrDe
 5wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9KLUE1NHtEsDFtRjMM1zL7+bD86TSrQIC2LDIAuynOc=;
 b=acbKLq2wnwI/mgyaTePdOnVP62fUzv0QvBoKAKP4TryGWgHt1IBFVrmnQoB0k1f0Yp
 zr8sWFi4tYFmhWl7RGTqoCTS4BjBpQplEozGJ5Bx31GsqcpMmZqJc6TR/LSmHJ0+ybhl
 xzcd+PCBgYgvD5XKTfN+h/+R4QuiiU9JtQEFzTY8YuhghlZ0V1Lc8Hza727s3e2DamDs
 oVDd3XpoHAN06J48zYySvJRjWucQWqj6//iZckVfWPJxO3cU6cHhAR3td/Tb4fncihOF
 GuTu5/JSsQ/om+xUa7KLQ+ShDQ31f3qoyNdNgI6YtHGCgRZU2ocp1giJTzWa/ER2cbNy
 rHCQ==
X-Gm-Message-State: AOAM5333xV0BxiHHCEOtjhcDsIfVILdLqX3bLjih7mA6WU5oH7EmtshK
 d1pTFlZ99Rvm8m1/m++0ctWs4w==
X-Google-Smtp-Source: ABdhPJw7zPtSFEMQcbZ44jylQLyS8h2higOBBCEDhyCqGau9g39TY5y+sEjRqQ9F+Fwxv68AQcGaOw==
X-Received: by 2002:adf:e2cc:0:b0:203:e8ba:c709 with SMTP id
 d12-20020adfe2cc000000b00203e8bac709mr16065391wrj.713.1649058632571; 
 Mon, 04 Apr 2022 00:50:32 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00205820686dasm9781330wrd.5.2022.04.04.00.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 00:50:31 -0700 (PDT)
Message-ID: <ddcc31b1-2123-2d7b-5334-b4545569e287@baylibre.com>
Date: Mon, 4 Apr 2022 09:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] arm64: dts: meson: remove CPU opps below 1GHz for
 G12B boards
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220210100638.19130-1-christianshewitt@gmail.com>
 <20220210100638.19130-2-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220210100638.19130-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_005036_578005_2A524150 
X-CRM114-Status: GOOD (  15.43  )
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

On 10/02/2022 11:06, Christian Hewitt wrote:
> Amlogic G12B devices experience CPU stalls and random board wedges when
> the system idles and CPU cores clock down to lower opp points. Recent
> vendor kernels include a change to remove 100-250MHz and other distro
> sources also remove the 500/667MHz points. Unless all 100-667Mhz opps
> are removed or the CPU governor forced to performance stalls are still
> observed, so let's remove them to improve stability and uptime.
> 
> Fixes: b96d4e92709b ("arm64: dts: meson-g12b: support a311d and s922x cpu operating points")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   .../boot/dts/amlogic/meson-g12b-a311d.dtsi    | 40 -------------------
>   .../boot/dts/amlogic/meson-g12b-s922x.dtsi    | 40 -------------------
>   2 files changed, 80 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> index d61f43052a34..8e9ad1e51d66 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi
> @@ -11,26 +11,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <761000>;
> @@ -71,26 +51,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 1e5d0ee5d541..44c23c984034 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -11,26 +11,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <731000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <731000>;
> @@ -76,26 +56,6 @@
>   		compatible = "operating-points-v2";
>   		opp-shared;
>   
> -		opp-100000000 {
> -			opp-hz = /bits/ 64 <100000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-250000000 {
> -			opp-hz = /bits/ 64 <250000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-500000000 {
> -			opp-hz = /bits/ 64 <500000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
> -		opp-667000000 {
> -			opp-hz = /bits/ 64 <667000000>;
> -			opp-microvolt = <751000>;
> -		};
> -
>   		opp-1000000000 {
>   			opp-hz = /bits/ 64 <1000000000>;
>   			opp-microvolt = <771000>;

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
