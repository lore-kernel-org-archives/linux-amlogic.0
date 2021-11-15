Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D498C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8A561BD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E8A561BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lbmYxRz3swQ7jZB7iFKeib8WGxV8PXD9OEdLwSUxqqY=; b=TecLQaPS6QbtABQqhZNJItZxsb
	oqTkpQqVGXfldulf1bLBcExl7fjS6c0xcjQhql5vnCYguzKwweU5vOt8NeI+oy/9lWFB5/QCYTcdm
	fERyTip0Ul+LJTSsL8lGNTNeKpSQ8J12Q1CUliPSwFKGioLbJEF1NQPusPHeGzspQpK35KT5v/+cm
	qBlSzn0tpYYiyCaCTv1XQtzqGrQn1DFMmVgmfzSOJp4JQ9N42dfhwG5Zvu7k2npZFJtX5q+AXY4ud
	avoFEYaXGEXt5bhc9AMsbGh+lSdBFKUwozjlvpAo0Q6vELX08q8Hr1acSX2cYqjNkIZUVR63pWVAH
	XpAkRnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYcz-00F0WJ-Fo; Mon, 15 Nov 2021 09:50:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYB5-00Etp3-Q0
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:21:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso15196968wmc.2
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gCK8Nd17obdPp1MpQ7JQuUtyWLHCJ1CvIZmrjxDGQkI=;
 b=yqgWpZ6Nqy+Wr2ABqvxUqnlnPKK5HXVBhQCePFW1A2L2Cu9BdWqsiGgI8ZBqvaJsiU
 B9RAszc6kr9XBOSaDtBVhK4FLq9rDUD4mZZopxP1y/9JaKimhgdgyDpAHmvyoLzefoQX
 q66KSRCIDnEwQxzMyzr6VEk8hZMa5Wxi5N0cPSq+7q1wujWCI0mbpZ/Adk5/HgEY+T+a
 cEgtCIpI29DePxaxZGgkQsPpEqse6jmTd7D+tkfRLpunvCwcVAsmD2cAcUeVc3Y+m3tR
 jrzbgj7rxDbtH78NnDrF+225Qqb8YnlKgr/hl6xTz6I2PAg09ePzl0JMZOh2xBddUtge
 /Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=gCK8Nd17obdPp1MpQ7JQuUtyWLHCJ1CvIZmrjxDGQkI=;
 b=y80YWScVLYdRB5+9vfN1WtO1kUKe6yuFhbatbEZKIMl1dXEJMmo7rUbgSMm17pusYt
 wmrcOH/xlBQwMnFwGNRw9xoPk7SAZDsGk/2d/SuaS50iJq8w7EYPhTEILDEXY3HWnxqo
 kRWsx76pE0lE0M4YdYNxqJN+82KKREjkdZ9P39iWPK8xCQAuzIVYnpH57a/aN3ItZTIF
 RcUehCmY9PzHFz74vuzEOp3DOslk2sUYY+R7md8TgBHgwQyOfUzyZd512D9EWOEn5uza
 7siyEOAWTc0JE+x1osm8p9zyTbcIXhFmYHYJPsHCTYp7qxjn0Krau4FA3SHZIR9aBN0k
 r55Q==
X-Gm-Message-State: AOAM531M3+RwO88/uv6vy/4ZfbxVWiL3ZCfEX5gmjVjSaxf58ZeZ8GEB
 vjBg1TmeX0FFMbpeYuBYgaNU95jBtx/kqLYL
X-Google-Smtp-Source: ABdhPJzMxu5bqzjRq8fAtSPHVY8IXjeVoxkY572Trq9ZHoy/wRUquZYkG7mX+7rIYNzBRrSAfsIPFA==
X-Received: by 2002:a05:600c:4e4a:: with SMTP id
 e10mr35667590wmq.176.1636968084784; 
 Mon, 15 Nov 2021 01:21:24 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f56f:2409:301:93ad?
 ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id x21sm18783254wmc.14.2021.11.15.01.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 01:21:24 -0800 (PST)
Subject: Re: [PATCH v2 1/3] arm64: dts: amlogic: meson-g12: Fix thermal-zones
 indent
To: Alexander Stein <alexander.stein@mailbox.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20211026182813.900775-1-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a26532a5-b509-59c9-9eaf-968632eeebea@baylibre.com>
Date: Mon, 15 Nov 2021 10:21:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026182813.900775-1-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012127_926211_473ABAB1 
X-CRM114-Status: GOOD (  19.76  )
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

On 26/10/2021 20:28, Alexander Stein wrote:
> This node is currently at /soc/thermal-zones, but the later introduced
> bindings in commit 1202a442a31f ("dt-bindings: thermal: Add yaml bindings
> for thermal zones") put this at /thermal-zones.
> Fix dtb_check warning by moving the thermal-zones node to /
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> Changes in v2:
> * Separated from DT bindings patch in v1 (PATCH 1/4)
> * Dropped the Fixes tag
> 
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 110 +++++++++---------
>  1 file changed, 55 insertions(+), 55 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 00c6f53290d4..ff987e7ccff2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -159,61 +159,6 @@ &clkc CLKID_PCIE_COMB
>  			status = "disabled";
>  		};
>  
> -		thermal-zones {
> -			cpu_thermal: cpu-thermal {
> -				polling-delay = <1000>;
> -				polling-delay-passive = <100>;
> -				thermal-sensors = <&cpu_temp>;
> -
> -				trips {
> -					cpu_passive: cpu-passive {
> -						temperature = <85000>; /* millicelsius */
> -						hysteresis = <2000>; /* millicelsius */
> -						type = "passive";
> -					};
> -
> -					cpu_hot: cpu-hot {
> -						temperature = <95000>; /* millicelsius */
> -						hysteresis = <2000>; /* millicelsius */
> -						type = "hot";
> -					};
> -
> -					cpu_critical: cpu-critical {
> -						temperature = <110000>; /* millicelsius */
> -						hysteresis = <2000>; /* millicelsius */
> -						type = "critical";
> -					};
> -				};
> -			};
> -
> -			ddr_thermal: ddr-thermal {
> -				polling-delay = <1000>;
> -				polling-delay-passive = <100>;
> -				thermal-sensors = <&ddr_temp>;
> -
> -				trips {
> -					ddr_passive: ddr-passive {
> -						temperature = <85000>; /* millicelsius */
> -						hysteresis = <2000>; /* millicelsius */
> -						type = "passive";
> -					};
> -
> -					ddr_critical: ddr-critical {
> -						temperature = <110000>; /* millicelsius */
> -						hysteresis = <2000>; /* millicelsius */
> -						type = "critical";
> -					};
> -				};
> -
> -				cooling-maps {
> -					map {
> -						trip = <&ddr_passive>;
> -						cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> -					};
> -				};
> -			};
> -		};
> -
>  		ethmac: ethernet@ff3f0000 {
>  			compatible = "amlogic,meson-g12a-dwmac",
>  				     "snps,dwmac-3.70a",
> @@ -2415,6 +2360,61 @@ mali: gpu@ffe40000 {
>  		};
>  	};
>  
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&cpu_temp>;
> +
> +			trips {
> +				cpu_passive: cpu-passive {
> +					temperature = <85000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "passive";
> +				};
> +
> +				cpu_hot: cpu-hot {
> +					temperature = <95000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +
> +				cpu_critical: cpu-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		ddr_thermal: ddr-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&ddr_temp>;
> +
> +			trips {
> +				ddr_passive: ddr-passive {
> +					temperature = <85000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "passive";
> +				};
> +
> +				ddr_critical: ddr-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map {
> +					trip = <&ddr_passive>;
> +					cooling-device = <&mali THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <GIC_PPI 13
> 


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
