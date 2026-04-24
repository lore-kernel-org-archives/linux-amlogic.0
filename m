Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9152FE51FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrFCYrvM0+cD19gFJ8n+Hc7Q0KIfhQQTZHfvNJ+/iTk=; b=IFN7lsCk3GJ9/WtiXFYHZboi6E
	lk1aNlobMX5nQZxKSkhhijC1LwBYi4zylMcuaIxylb6O70HnduZMzI6GW+LkT/ssYtR+kP0DQWQxW
	BTsVHFTfWML2A/mNHgUArwcQlk+ytXpwXCndec2jlD809r/GCB0aYkWx38+e+HDjwYlHibUL2eg12
	x6nPiyzTSvgHfrvkVNzt2wWh1XWkk8mXHOzDKRJCURxHdHmjbm06y6w0SWFt4/kf1cyqip8VIarbI
	z7yL+uR8ruREC82/Zlm+HChBvGXcv4Dtt3ZbvjfGdab96sigfqJbfwRVkyRQfxfXMVjVM4o3mGqgw
	R16VVW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDD0-0000000Cxid-0exI;
	Fri, 24 Apr 2026 09:52:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDCx-0000000Cxhf-2I9K
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:52:25 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so96674895e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024342; x=1777629142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dSVP6vW9j9Y0EuiVzA7IMsg/jf0E4hSdGwD0NTLWuI=;
        b=nodNGVJStPlNpcebO0709dShDlaf1E30y5VuJ7zpD1GIAeWlNT0DV6eKRsb3+LcfQk
         +gi4oPgxwOG9HmdmRbhO+Ax8Cy/4wTzCi04V3D2rtEh8QwINRK0jMpqOz/cacFVCgTxo
         vnSFXUNqjRRTgOEt39zMdiEJf8ogBBsJgRV7plYECw5sg0rBXZ42MuY5Fcayfz1MdqPH
         4Nbz+KYrLV3kVvCG2jmdqmczXV0px8lTwYTgsFivaLv9GJmH53Oxrzm7v7PrvcugDIbY
         CJT1o4u/PggAktB87OCArXTzvPAOFIDfHqDEh+5v6suzG9jwfaEoJLrrOjJpBX+Dv9tk
         fhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024342; x=1777629142;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7dSVP6vW9j9Y0EuiVzA7IMsg/jf0E4hSdGwD0NTLWuI=;
        b=WIA10RPa7cVJ1uPTsQGgSpuxhg7q8gkwyq4HzRqbyMqLgc2hBunRRUOtPqUr5I1elZ
         5EpGz4x3K1digGh1wSYnWoYbvdb1BwkRrPYfPVsQfScyvwjPq53uqBfp4hORaBV3eIHE
         lgtxvOKEnyOgAwsHQuJKuZ+dd13WTshJ8TpXc9rLWbrotzSI0hm2IDS3GibpoTBWuKh0
         aps4QpOX0z8sjGdulBMZCAHB1YH4KstUu5OLpkJtknt+KZpU7cjeHOjU/lknPNC/JRmE
         afsEmsneamat4u6OhHdl/lOqDLfLsxsHJq2EZJmbVoQcchLh8c/91vQdtIZeT2Hr3fu+
         mYow==
X-Forwarded-Encrypted: i=1; AFNElJ9ny7w6ZDEk4UCTdMr4ir9hPYm6guqpY/ckKR5he6LGCf+9CXGmfoic7Y3t40rGVsMStQ0THmsN4nS6/UO4@lists.infradead.org
X-Gm-Message-State: AOJu0YzDRc69zvBWoUzx+F8s/yoEu6ovEJzu+6VrUaFOTJLKbDoRD1S9
	DI9H5avQT1tlFneZEj3Gz2icYtMiR08OTKSiC+a7bJWuzT5dc0C+ZLl8ZpzGzBghH1A=
X-Gm-Gg: AeBDievTX+WcW1/h8hueNauPNjtB9cy7eprdmMEIl2poul9KYdnHCGEueKsufAN5Bnd
	dvKtcSnom4xnyuuUW4qciMYhc37miISynMYeZUkuHQk/9qRPSSMBUNtORWCrPUXvlaFXCYLFhtj
	MORPJCl1ATpL5dp15d1BJfkznUI0zQuR3mOrWmD40w1KNu9Oxmtvu/Gu+aVGeXOj3NrbuS3vL3N
	hjeQUTI69Wlxzzmh1KsQA/p7mYomMe7+H7L7vKCXu419uuCMUi6Gl1dig5NlkuP8pAOh2lnRNxS
	aU9s9kQ7cb1zCsH1GzGnr+LajkiY6eCEAd3wO5XaSyVxGSldgBQEPkwcv7sV8bW04AoVj4DaCLk
	o+jWwIp+ilAqQpH3vhuXqkgY6suJqmYKqQHItX+BMO0WfrwaHqF5k/oydWC1Xyo4PZQMidfpsEe
	qfMFfHkeXDXARNMibOhLLcqNSnfhF3295k1Wwu31wZxcK/xqHUSyulJR3vlLR8cG+BWKgXTolCo
	0AEHl4prQBIudVBlA==
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:85f4 with SMTP id 5b1f17b1804b1-48a53cb8734mr195298735e9.24.1777024341572;
        Fri, 24 Apr 2026 02:52:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm389489665e9.10.2026.04.24.02.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:52:21 -0700 (PDT)
Message-ID: <6d734851-6f0b-4351-832c-4ee08dfcc10d@linaro.org>
Date: Fri, 24 Apr 2026 11:52:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 5/8] arm64: dts: amlogic: t7: Add cooling cells to all
 CPUs
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
 <20260423-add-thermal-t7-vim4-v4-5-d4c1528d5044@aliel.fr>
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
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-5-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025223_619534_4B7459E1 
X-CRM114-Status: GOOD (  11.02  )
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
> Add #cooling-cells = <2> to all CPU nodes (both little and big cluster)
> to allow them to be used as cooling devices in thermal zone mappings.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 560c9dce35266..7aec65f036a9c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -63,6 +63,7 @@ cpu100: cpu@100 {
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_l>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu101: cpu@101 {
> @@ -77,6 +78,7 @@ cpu101: cpu@101 {
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_l>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu102: cpu@102 {
> @@ -91,6 +93,7 @@ cpu102: cpu@102 {
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_l>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu103: cpu@103 {
> @@ -105,6 +108,7 @@ cpu103: cpu@103 {
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
>   			next-level-cache = <&l2_cache_l>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu0: cpu@0 {
> @@ -119,6 +123,7 @@ cpu0: cpu@0 {
>   			i-cache-size = <0x10000>;
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -133,6 +138,7 @@ cpu1: cpu@1 {
>   			i-cache-size = <0x10000>;
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -147,6 +153,7 @@ cpu2: cpu@2 {
>   			i-cache-size = <0x10000>;
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -161,6 +168,7 @@ cpu3: cpu@3 {
>   			i-cache-size = <0x10000>;
>   			i-cache-sets = <64>;
>   			next-level-cache = <&l2_cache_b>;
> +			#cooling-cells = <2>;
>   		};
>   
>   		l2_cache_l: l2-cache-cluster0 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
