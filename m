Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7A8C44536
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jan 2026 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC53Ldk18BPb3AaAoUfUzswucUGDoKE14imEmJFEEqE=; b=J8RDIYksp6Mga6W1SWp4I5q5dY
	N5fD3UtdQKwQkWOjstUf7Aeqg8+ottCKqZ5nTDUH8+W8uk+LChUaELbonBCw/j1Z2Z4KBTjfWZ/SP
	yhALSFIMJ3WUoJWe87AAD1LwB4rVfb8H2Xr2/ZPvYTozKQACMOd+iJglMAI3zMwfa0CgcOTbXUwpA
	8PTUftkfEyiMzYp748uTWHyu7OlX33qxMh0YxzsfjLboDgYfXA9Tse5uuif+rAfwWY1d5l8foUbnW
	4nzZrXi3N3ib85VO1wQm7t038tCfqw4KrTLjBQ0cKMeB8/WtkQa0zePCUKAo2m4/wPhDxqsbuN3DC
	4bdATSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibJR-00000005oiH-0BaR;
	Wed, 21 Jan 2026 16:44:09 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibJO-00000005ohA-0HAC
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jan 2026 16:44:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-435a517be33so22878f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jan 2026 08:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769013843; x=1769618643; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1myAXTRCFyNcgADPfwfjEtstkbzJqQQ7A3560oXOVyw=;
        b=k5quDuoowOjihqOxC8yyUvbb14eABYkoMciuTaDXBp7/r+Uqm8mlCYKSSbae38IIoh
         zeXaIeNKbo2KU5Fcmus+YmUT/My/lzYGYSxciz34XfvBdEh0QitlK+R2gJS60FukZhjV
         RBCQE1LWMvh6bMZDe3u6spCUZoFF8FPY5MjLPWiraebE+HqaKPyjEHlwGezzZBqDR0e9
         lC5CiCZQxRtjHuV3AF/JS9KyFl9K+KkcQrV216YtarkETWY8ABVvOEmW76dpTreqhziN
         aPXec3qz933SorW4T3bZUMSFJ+2WsCPfwstGp6STFytrihESK5a3U3Fkmtu9ODL3WKBi
         lEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013843; x=1769618643;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1myAXTRCFyNcgADPfwfjEtstkbzJqQQ7A3560oXOVyw=;
        b=wPi/C17aE/on8ykTdYNUI4DfwOcfBfLJz+m0vkJJkePaxO0wDEE64jPuwmOqXJI964
         nX/Al+Di4tjSDjjUnu8NStGgev+l68Muslgh7QZuik/At5cNIkAVX7WZ/XLu1t6OA/LH
         Hf6jFVrF1LD+4+CjmiFjtEx+bKPeda8wh9DTqdFNL0HXG2jIC8CfTplLfX6Y0c7nyX2Y
         vic6BG23jS/VsVeZyxtXXIhb4opZ+9yxHCVarxile/wwtG5iiA/lM0nsGy+Xjvb5nfur
         7qmTwx/z4OdbPCVGZkkzGdfGp7f5OSB6MK52XyncnDJv3sYDETzs3ZFfv621Tx5vpgRT
         ZhpA==
X-Forwarded-Encrypted: i=1; AJvYcCXfR+/cCkQZMJ9ojbjeJucWTyqm8DQ5j/IwMFrZ7XOkUb81CHvD0H7dFuprxfuvOdiQEtC35ui5ctG1Hm3v@lists.infradead.org
X-Gm-Message-State: AOJu0YwXntO+sHCL7kmmBXDBPual3WsOmrb9r7sDRWV5+MMd+LN1CT6D
	rj5hQQd6wVKvrcXkMd1eJ64FKUKfZgCDgZ3NI+sQMtUadqB/r8j3+E9jeX/USpKtFEY=
X-Gm-Gg: AZuq6aJMNTWIRJJkpQA9FIoYWkK8fg+NVa2rpjcnfvmU3wuz/5RRNASYbBwx+tnPwbo
	bhYNCZZEtokf95kneQ1r1xZBk5PIuGwbLOIOZ+rCLkQEInjERuu3CqJFDIlx4KBaMLgFyrhHQq0
	mCinyiJhrmqckxpp/3BeRHGK3NLFoqDkEiWtT3bjvVZ9hheqLioqNFUI1RxMtgnE9jT+qqIRCdE
	UM4bUpttNaw9jmDVGfYG/59ggQ4Cqy53fNmOwq1X25NAHIe1oIs/mljXgnaaN5vgB3kUzEn1Q69
	AAVxtACk52OYCfle1k1Q/N8zluShx0STtrENR7TpwNdCub4iV7dVIhWdrSbqDwjHSpL1KBlkvNb
	FWRFa++uQ1UyTlNC5yuA/qmDSB/hQOPzkVcIuokIt2JGdCtAkm5IJTMuQpf3mfvz7YPftuQCpkB
	cWWtguOSmWjgQ6kf6WJ/TurbLUbNglXoynRiJT5C7wGCA6GKP2XMRP/VSk9x62lwQ=
X-Received: by 2002:a05:6000:310e:b0:435:99d5:9d8f with SMTP id ffacd0b85a97d-43599d59f09mr5736496f8f.19.1769013842720;
        Wed, 21 Jan 2026 08:44:02 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:8ae8:f59d:ae95:f372? ([2a01:e0a:3d9:2080:8ae8:f59d:ae95:f372])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm14755862f8f.11.2026.01.21.08.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:44:02 -0800 (PST)
Message-ID: <49b62589-111d-4d4b-b693-466e0a2f81eb@linaro.org>
Date: Wed, 21 Jan 2026 17:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 enable SDIO interface
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 xieqinick@gmail.com
References: <20260121014725.122722-1-nick@khadas.com>
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
In-Reply-To: <20260121014725.122722-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084406_128505_A916A547 
X-CRM114-Status: GOOD (  12.27  )
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

On 1/21/26 02:47, Nick Xie wrote:
> Enable the SDIO controller interface connected to the on-board
> AP6256 WiFi/BT module.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
> Changes in v2:
> - Dropped 'amlogic,dram-access-quirk' property as it is not required for S905Y4.
> - Updated compatible string to specific "brcm,bcm43456-fmac".
> - Link to v1: https://lore.kernel.org/all/20260116023900.2036657-1-nick@khadas.com/
> 
>   .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> index 4a66c1bec965e..27d0f6134ea9d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> @@ -220,6 +220,33 @@ &sd {
>   	vqmmc-supply = <&vddio_sd>;
>   };
>   
> +&sdio {
> +	status = "okay";
> +	pinctrl-0 = <&sdio_pins>;
> +	pinctrl-1 = <&sdio_clk_gate_pins>;
> +	pinctrl-names = "default", "clk-gate";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	max-frequency = <50000000>;
> +	non-removable;
> +	disable-wp;
> +
> +	no-sd;
> +	no-mmc;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	vmmc-supply = <&vddao_3v3>;
> +	vqmmc-supply = <&vddio_ao1v8>;
> +
> +	brcmf: wifi@1 {
> +		reg = <1>;
> +		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
> +	};
> +};
> +
>   &spicc0 {
>   	status = "okay";
>   	pinctrl-names = "default";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
