Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F60FC4828D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 10:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPTbc3HGQyh+dVfwKz2xWXH+CzseBobgNerFbEiqIqM=; b=2jW/U2raLdROge+aRsEx3vP6EB
	HcIVhVFMleGI0j7jNofS7as+lV/iX2wUZshQIZw/+uISm1KbFCQd7Frn3L5F8Fu2hYuS7mwpXBEd2
	ZNxGoBMrqZCTdNDNnTqoWeJa0lbIGZBX1j+goxnxLwx49A+UaTDPugoju68WcvfaDR2yxovTzz97q
	vo/a0mP1GGlnlpTYmnHC86vswBGKJQgziv94vx4u5AYYqP0gZSbEHZ7Dmwv+ErJ1QpklMVYd2j7Ps
	SCkhPycU8ccp2xtAjgKs5vJEqVhDHk88HhFg1E88dYG2KhrnJoVPZAzXTFllobC2mYuvPoxEk7Vew
	aLRE75qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIUO-00000006xpi-3KJt;
	Tue, 06 Feb 2024 10:15:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHKW-00000006a59-3fdn
	for linux-amlogic@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=/dIUJgwnOyWSt0uclCiKcW3R3F0dsn7PgLN2KshxQ3w=; b=naRMpAsP3NUwiAW9PTxYM3ytSp
	Jqo4HOUzEcFcUwuGKc8gxp7DNc0hV+DlIcDrdJc63ta43EmLEkaOhI9ihWFl+PTBw1/EOEpbUJk4T
	km6DLXMLL8jegh88U3WiEk6Q8oWAszx3f5CAUl4ulKzKigUVtFexdxv43VPbYHZE+ZIUXp6li9aoa
	juu8B9cP2IyShEf89rH6TDu4uOWMg3ulghIaJ1BdzgUdv0JEI1EyYJbbEHKiNPw5CPMH1r2oIT7qF
	qOF0ruOSe2E69WbHIbUhINGIY5OwzbOrowk43Wh/YrE9pOIrPD4FVVNgcMg7lXPI0VYA8oaJEdHB3
	ZR/+19TQ==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHKF-0000000CP6u-2OGh
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 09:01:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40fdf17fa89so1776505e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 01:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707210066; x=1707814866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dIUJgwnOyWSt0uclCiKcW3R3F0dsn7PgLN2KshxQ3w=;
        b=QJE7HgSAP9OPWAgTvSoJzalFCUaEhA3H6cnQgsUW2mPUP+WsVNyOhIyO6bSfrJZdEW
         47aGSuioo5C0olMgs6dMBxml1ehFDO54x8JqqPpgf3pZYA3+YdtAefZm2F3XDFgsqQgk
         EHkB1jLK2iA0nXxG9AQXoqpltE5NpETErzTVpfsf5Exn8ea07GceMmDfuruu5BDU185F
         +kqyAPovseLMzfqP8nBWLHfWfnllVPHTmdmlYjFtQcqYhyskUAPTbxkejz0q7eIyeJ8n
         K82eBsm2k4vazwk/jB/jL7xK+8hDPlHvZNz6JPHyjVWHWKdkxX186+up2Aib8oyCyG5N
         Jmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210066; x=1707814866;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/dIUJgwnOyWSt0uclCiKcW3R3F0dsn7PgLN2KshxQ3w=;
        b=jkNed9dGaMu5fbHXe/YzBggcEPlNL1jnqB4F62MBIr8C8k7OeGmLyCdrBREZbb++X1
         koefFhrurbnDFbz2LoNjWSMYxGIqYYrbQOfBsjuU49AGNqrmVUW0kHYnDXGvRrU+D2tM
         KdcJNeH3seCNWvwUgx6XpFdwnVND3RoNulL3y8agrbaJZzwAGpf8wuD6GT4xgp+jC+cJ
         nLFCp5uQjWUYjz1uSFXjNzp1jaWyLX1OORoKSqSELLNz/xmLCMzJruHtkGUhHHbVRe3U
         HVu6uznI6nzH9frkYXkmG5//BJS5/p+O7P6Ti2EYqfsVwN5f4tKS/tIZO4xyOj/dd8U0
         i2Wg==
X-Gm-Message-State: AOJu0YwreP4+vmrc4VqWm5lqOu6mp+lvV0IE38h9GAjAbKYdDb4hvVOa
	pRauhXcYdRwpZizRakFv0OIPZK1zkfOkH2nPMiREqvfpGUVBwgmCuBKHRIQ+R20=
X-Google-Smtp-Source: AGHT+IGmZv5/ZwUXLZBEWIQriNR+L/Vqpbg2i5djqRd6e6lnmwcyprtpMUMQPA9dZ/hJiHJIQ4x8pQ==
X-Received: by 2002:a05:600c:4f4d:b0:40f:de25:f9a9 with SMTP id m13-20020a05600c4f4d00b0040fde25f9a9mr2756501wmq.15.1707210065859;
        Tue, 06 Feb 2024 01:01:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUP7hpkPQs7XkJMZeboQiQzxcsHpLY+gTBGwCFcvYyYWfB1HXTUMUjZdT3sGA+YwRK7KRZctuePJz8Q8x2E3sy9jf8g8SJfnPfmR5ySJuTCvMoHytOefwnpgh7w5Nve4WKMDPFPRTlzJKB2Z8csbiobrmPe6PTNitRlQLIxmwYxAtGjhySX3d7Y3qATn9a8aYUHt5mkAVmXK3S4Idxell0Hmp+ujPMOTWQlMGSeyX/DIG3rB7OWBNatXmD0tQHIYVN9R83Wfeu4bzR/osbHPvCXCEFitQ+kMlGccXMXb0/6PU+h/Pab5rUGJr6w4vdNkgxaP8M1n43VOFxpBdTjbUArN5G31siq/HVwVlf3wudQLgxMV4tBZ02MSD+z4V7ELMmqHFQqfkka
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c4ece00b0040fe4b733f4sm930244wmq.26.2024.02.06.01.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:01:05 -0800 (PST)
Message-ID: <451adbff-c2b7-4141-990d-73cf869b752f@linaro.org>
Date: Tue, 6 Feb 2024 10:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCHv1 5/5] arm64: dts: amlogic: Add cache information to the
 Amlogic A7 SoC
Content-Language: en-US, fr
To: Anand Moon <linux.amoon@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-6-linux.amoon@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240205171930.968-6-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_090109_889063_28F99624 
X-CRM114-Status: GOOD (  12.63  )
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

On 05/02/2024 18:19, Anand Moon wrote:
> As per A311D datasheet add missing cache information to the Amlogic A7 SoC.
> 
> - Each Cortex-A53 core has 32 KB of instruction cache and
> 	32 KB of L1 data cache available.
> - Each Cortex-A73 core has 64 KB of L1 instruction cache and
> 	64 KB of L1 data cache available.
> - The little (A53) cluster has 512 KB of unified L2 cache available.
> - The big (A73) cluster has 1 MB of unified L2 cache available.

Where did you get those numbers ? I can't find them.

Neil

> 
> To improve system performance.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> [0] https://dl.khadas.com/products/vim4/datasheet/a311d2_quick_reference_manual_v0.6.pdf
> [1] https://en.wikipedia.org/wiki/ARM_Cortex-A73
> [2] https://en.wikipedia.org/wiki/ARM_Cortex-A53
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index a03c7667d2b6..72dedc40f460 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -52,6 +52,13 @@ cpu100: cpu@100 {
>   			compatible = "arm,cortex-a53";
>   			reg = <0x0 0x100>;
>   			enable-method = "psci";
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l2_cache_l>;
>   		};
>   
>   		cpu101: cpu@101{
> @@ -59,6 +66,13 @@ cpu101: cpu@101{
>   			compatible = "arm,cortex-a53";
>   			reg = <0x0 0x101>;
>   			enable-method = "psci";
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l2_cache_l>;
>   		};
>   
>   		cpu102: cpu@102 {
> @@ -66,6 +80,13 @@ cpu102: cpu@102 {
>   			compatible = "arm,cortex-a53";
>   			reg = <0x0 0x102>;
>   			enable-method = "psci";
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l2_cache_l>;
>   		};
>   
>   		cpu103: cpu@103 {
> @@ -73,6 +94,13 @@ cpu103: cpu@103 {
>   			compatible = "arm,cortex-a53";
>   			reg = <0x0 0x103>;
>   			enable-method = "psci";
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l2_cache_l>;
>   		};
>   
>   		cpu0: cpu@0 {
> @@ -80,6 +108,13 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x10000>;
> +			d-cache-sets = <64>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x10000>;
> +			i-cache-sets = <64>;
> +			next-level-cache = <&l2_cache_b>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -87,6 +122,13 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x10000>;
> +			d-cache-sets = <64>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x10000>;
> +			i-cache-sets = <64>;
> +			next-level-cache = <&l2_cache_b>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -94,6 +136,13 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x10000>;
> +			d-cache-sets = <64>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x10000>;
> +			i-cache-sets = <64>;
> +			next-level-cache = <&l2_cache_b>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -101,6 +150,31 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x10000>;
> +			d-cache-sets = <64>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x10000>;
> +			i-cache-sets = <64>;
> +			next-level-cache = <&l2_cache_b>;
> +		};
> +
> +		l2_cache_l: l2-cache-cluster0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x80000>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +		};
> +
> +		l2_cache_b: l2-cache-cluster1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x100000>;
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
>   		};
>   	};
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
