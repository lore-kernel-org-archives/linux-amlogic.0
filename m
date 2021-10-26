Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B6DC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 07:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9CB260FC2
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 07:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9CB260FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tpleodY5Pr57K6eNXM2AlYgVkoPVYYg2qZYuqPx/Blw=; b=ULuMGMSzd0zXYCnxqVpzdwYEeu
	hIJLsBUKWsi37M4pxYJmSMusFkGZyv9o19RDmdmr3MqzuKkBR4ujTQPdEMahTZ9vHe1MTjRGT+aBQ
	09cuCO6ik8lOrhJDsSgBuP7CoAE0ma6XpWRBd3BwLV1Eay2Xh8A6bRpliZSSJOmarisFBZg+f8/Ig
	ro5pScBiRpllzrwI5YjnA+QC5NNcflO/SG22IoYlsgctlcKA2Wo5QYjSyrFtXPKUKYrW+y16NrcTi
	emY8gRaM9tdjz+2nc1h2jpvkQqynPE9EF+OWgb88UW9sxZ+M4CrZirEugCrDrkfDaorwcItR+T4Tn
	D3qT12/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfGsA-000vuE-Rb; Tue, 26 Oct 2021 07:27:50 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfGs6-000vsZ-NO
 for linux-amlogic@lists.infradead.org; Tue, 26 Oct 2021 07:27:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so742954wme.0
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Oct 2021 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bBJ3JH2WgYnvwuSIXVR2ON5WYrHTE9TEMenRcZaqf64=;
 b=O+0SeHGyFN4W7YLsGBd9f6l/5PyyJ/UFeaBvYxfvG0Vnl+F1CH9azZq0UhDoMDYsWj
 qDbXHwK/KuoAkwzOt+3QBnCFa/GXvFTWeh7r9GvBs6gDQzp65vP9mnbgCirgBzkQyxqq
 5Q1pV6wOkXvF1S15zWga7c4V2p7OwMH/dzTRtEDPgVbIJizRU7/eBM/ZK7oPaM9j98on
 aIcuXLc0krAW8SM7EgGUfbv7zf3DP9EfEj1fGxlSelYDHS3pm/go1z73V8+xHvWuq5lW
 RfEWHhkoaB63lyOTTLeoiUhgpLFN7FB56wVptRdjW+Djo9n4KXBqj/Pr2QY2aRQ6Wy1C
 rZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bBJ3JH2WgYnvwuSIXVR2ON5WYrHTE9TEMenRcZaqf64=;
 b=0KJg6cUWVYKsgNkzLjv0VfBZvXAu6newgyO+QPE30u2OLm7tQCBtpiuF8D7MDt7w6E
 +NtmsWzjuZMeQQQEZBD/z49I1jh8LhZ3LRWqJLTWFsZ+ORvHgYxnQex5GFVQHGk2aiLW
 /Iops66k8rsDM48Np67bSlLtoyaR1vzsTXVBBhGbglZNGVC/Q39JF+EBPDmDS4YW/JaW
 mmajZCaookTHNfI9NCGgDDebBJh/Lupuwl7BltKLanY40csvW4V+8vtRNAim8TUS86ti
 rB6D8l+Rnn4kZN7OGC9O885O7gr6f35IgktHnIc7cgmYhfO79aKdjSYNvmdTxtdOUN0M
 PDsw==
X-Gm-Message-State: AOAM532jiw93Wv37D5B1exty1Hcgi7CpMKfxhZdTQN/IArNE95bs3voB
 pNtAH5onGHLHC+bVNBIDKhVdTA==
X-Google-Smtp-Source: ABdhPJxqOJbVHyzVttUMRIw2o4DLKt4nkv1HGVRnMWVDahphDl4wLHhWq31LDbgwoKyN0kVgIzTKKw==
X-Received: by 2002:a1c:98c8:: with SMTP id a191mr23254257wme.84.1635233264709; 
 Tue, 26 Oct 2021 00:27:44 -0700 (PDT)
Received: from [172.20.10.7] ([37.169.6.193])
 by smtp.gmail.com with ESMTPSA id t6sm12558703wrw.78.2021.10.26.00.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:27:44 -0700 (PDT)
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: meson-g12: Fix thermal-zones
 indent
To: Alexander Stein <alexander.stein@mailbox.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
 <20211023214856.30097-2-alexander.stein@mailbox.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fd76f9e2-f3e1-8520-7569-2390edaa538e@baylibre.com>
Date: Tue, 26 Oct 2021 09:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214856.30097-2-alexander.stein@mailbox.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_002746_849244_2C27767F 
X-CRM114-Status: GOOD (  23.04  )
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

Hi,

On 23/10/2021 23:48, Alexander Stein wrote:
> This node is currently at /soc/thermal-zones, but the later introduced
> bindings in commit 1202a442a31f ("dt-bindings: thermal: Add yaml bindings
> for thermal zones") put this at /thermal-zones.
> Fix dtb_check warning by moving the thermal-zones node to /
> 
> Fixes: e7251ed74ef7 ("arm64: dts: meson: g12: Add minimal thermal zone")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
> I admit I'm a bit unsure about the 'Fixes' tag as at the time when those
> thermal-zones were added there was no schema present. So there was no bug at
> the time of writing. I'm ok either way.

I'm also unsure about it, either you list all commits that must be present for the fix to be applied,
or remove it since it's not a bug.

Neil

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
