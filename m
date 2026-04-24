Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C927AFE51F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpSjC0I2T3X2+ncMFo99laZdymw8UNpbwX+hcX95bgM=; b=l4l7Lfpm0tQAHj+Sf7Gy1qoQjq
	2DF0M6j7Ww6XuKp5h6Ec98mFt7w7hKoaVxzPdIHMWCbk6A7OfOTbaXjEZQ0lU/jFlcckLMI4wJ+6D
	JUKwt1PbLtIfnKXd4LY46O7aAYHa4QRfPrkLnw5GFmycWg6GvIb40huPyVbS5HAlifQJDiaFFEP1O
	wu0SFFa9PAEuyKKwH7YNQujkhGvvDX8iACLVynrPR4W+Z5CyARSWCjiu8+gxRc/8/zGA7iwnDQb8U
	A3NYtI4hZ2DeVbu2Mvnt7vw6cVkpz0iJv2bjYb+hM+C99xoG+LPsbbZk6oa0UEWdeG1Pdzf6wPoNV
	i/bYEK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDt-0000000CxxP-2DCP;
	Fri, 24 Apr 2026 09:53:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDDq-0000000Cxw3-0KBE
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:53:19 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso35645505e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024396; x=1777629196; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBpa+OY6Vx3uYT0JNDbcMHz2F1hz9Z/Yh2ubTX1Ek2I=;
        b=Sv2INVYfvz2uHHWTI3WRobz29iT5sQ1eEewFH3PTNuUOGNxFXE3qk374UetAAH0hpX
         /yeM/EnVV7r4aJmav8qtOq1ODrAAITAhw4ssM0NDAdGioLkMgVEGoMLvpJf6V3Q2PvjV
         9K4y51cK4Rw/aEoE6raeIvXgDQnJ6H+vIJ4MlhgEFg0lF+RUM/4PV0bZD8OqUFLfI4Vw
         u41IVhhcMjP5a0kaS/mWmA5SCPxMF6fs+aoBVXw5uSNraxI01tIxsmAZxo0uJqcQuMLp
         9D/tGzwIlTPYFbTNezF3TC/HhF3618stxX1OQEr+MV+OOKz6hxeZ8nGg9HnEF5oX2O9W
         FEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024396; x=1777629196;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBpa+OY6Vx3uYT0JNDbcMHz2F1hz9Z/Yh2ubTX1Ek2I=;
        b=gRnBs9wK/xKK18NI6hMfoiSxYef5Ujt4WN/Kyu1EUMNbAH1sQpcDElS4rzoelxyDpR
         hkO95ARibB7mJ3GIRistr8H0+Sl1C1ER/OfeQ0VyaLz0euB3mauh7wH+H7XJnmZTHA5l
         5MT4UTre6KN/JooJYyH7zmU2WcH0FuB7Ygac2TVdIMLGCfnneH9RpQzdI8beuZFpT74D
         YVPMxn/Sq+j10Ux580T8Wjkmj9rxy/BCxJSXd1PFDHzyT6B+CrVXf2IR8i/qexGahb7v
         bBSSWzCmFxF94Cu5V6G5RsnIl3Ax7xBaNchNaUMYVNkGgjdmwVjNPzbOLzj7Hi2k4g7M
         Uz2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ev4vHH3gth3nbDiXr6y29KWNYwIdhvv09XIjocqgN8fnSFnpDheWF7Wfr2mU8/yUkFtk3bi+/QMdVLR1N@lists.infradead.org
X-Gm-Message-State: AOJu0YztXyRl8E+gNv7v5bZP0Sj1AA4VPctDl7Va/eiosf6uJgpyoe6e
	B0Cq6GQrLu+jvJxTgLXo5EqsZrHbYwx1FWzVbiAOd8XDyqye0DX04N2wiRG8FAF02AY=
X-Gm-Gg: AeBDievhXfnsUMASJJCDRu77yiTIDra282PNcNO4uFPaFZ7xl2yOt+nEbiI3cqxslTM
	MaT54f7CrRpE+YoMl0v9mEcuVGn/siPQnn8a/2Xa2jutnE54P4/DsPC8O2mcErqqRagKosWmr/J
	5jDIHwHaGia0pvN+7U3XFKMhv4hV+BjB9rKgzG6pQwqk73ZAWve1aUIRCTVOGcMWLOAcVYWOvho
	7PAi73iySPcRp4HgiBqCCvyvWaZB/PIuHhGW6emCu6z5XO0/kRSYwj5ooCmeuVU8IjeIQGpwG21
	WRM+/N0Cg2I8yeSyB4w5yDG9Sli3sdf6UgqwlfHRbgLcgNDuJ7KDTDSIWwsLtxXrWSoxMjrbRmP
	KF7VKNzTGtdERM90I1973bBI57ew/1wci58B4aOVS8n6n37LQvEHsln/9ipjA6P+VPKJzRQKCZ6
	5p6zQOjJBaiweFWGZkDDniOVvEp/u5eGlsY+V3ukUwGQpgolnpZbB+DABG1qj6Qx54KO3NrDOEv
	hnNLtdbDkgtllotGw==
X-Received: by 2002:a05:600c:34c3:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-488fb792dd0mr421536775e9.23.1777024395930;
        Fri, 24 Apr 2026 02:53:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm106060925e9.23.2026.04.24.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:53:14 -0700 (PDT)
Message-ID: <3768fc2a-ae1b-4e58-a1a5-1b49d0f0c90c@linaro.org>
Date: Fri, 24 Apr 2026 11:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 7/8] arm64: dts: amlogic: t7: Add thermal zones
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-7-d4c1528d5044@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-7-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025318_151699_5E746A01 
X-CRM114-Status: GOOD (  11.87  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add thermal zones for all six sensors: a53, a73, gpu, nna, vpu, and hevc.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 179 ++++++++++++++++++++++++++++
>   1 file changed, 179 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 62f259b2b17d2..c6ea0f20a879f 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/clock/amlogic,t7-scmi.h>
>   #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
>   #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
> +#include <dt-bindings/thermal/thermal.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -829,6 +830,184 @@ hevc_tsensor: temperature-sensor@9a000 {
>   				amlogic,secure-monitor = <&sm 5>;
>   			};
>   		};
> +	};
> +
> +	thermal-zones {
> +		a53_thermal: a53-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&a53_tsensor>;
> +
> +			trips {
> +				a53_passive: a53-passive {
> +					temperature = <85000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "passive";
> +				};
> +
> +				a53_hot: a53-hot {
> +					temperature = <95000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +
> +				a53_critical: a53-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-a53 {
> +					trip = <&a53_passive>;
> +					cooling-device =
> +						<&cpu100 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu101 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu102 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						<&cpu103 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		a73_thermal: a73-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&a73_tsensor>;
> +
> +			trips {
> +				a73_passive: a73-passive {
> +					temperature = <85000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "passive";
> +				};
> +
> +				a73_hot: a73-hot {
> +					temperature = <95000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "hot";
> +				};
> +
> +				a73_critical: a73-critical {
> +					temperature = <110000>; /* millicelsius */
> +					hysteresis = <2000>; /* millicelsius */
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map-a73 {
> +					trip = <&a73_passive>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		gpu_thermal: gpu-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&gpu_tsensor>;
> +
> +			trips {
> +				gpu_passive: gpu-passive {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				gpu_hot: gpu-hot {
> +					temperature = <105000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
>   
> +				gpu_critical: gpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		hevc_thermal: hevc-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&hevc_tsensor>;
> +
> +			trips {
> +				hevc_passive: hevc-passive {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				hevc_hot: hevc-hot {
> +					temperature = <105000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				hevc_critical: hevc-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		nna_thermal: nna-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&nna_tsensor>;
> +
> +			trips {
> +				nna_passive: nna-passive {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				nna_hot: nna-hot {
> +					temperature = <105000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				nna_critical: nna-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		vpu_thermal: vpu-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&vpu_tsensor>;
> +
> +			trips {
> +				vpu_passive: vpu-passive {
> +					temperature = <95000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				vpu_hot: vpu-hot {
> +					temperature = <105000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};
> +
> +				vpu_critical: vpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
