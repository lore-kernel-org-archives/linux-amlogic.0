Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE93FE51F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQ4UWjQhmmKGy963ug6pX0vX0RO7KCtgKWO1a6aO2VI=; b=uQjnLn9oKRLTXFhTzWXKcpjTHz
	P/ctUtnPXHND2WXidoHggGYhmYOVvgKxefYGEvwIy8I/GnAG04EaLANIWcNJMCl+mF+mOk4wzl5LJ
	2rjnfUvmSnuhiJxIAGLRCcsF6QACldcUlMFYAYpjoh4WSeHbhPHG0j1muOdqcEmUfsjDJoZj4FkG9
	bNLFxPzxDFAWWfOPHanzhdynJGzf0Xg507FWhHdnVklbkEnG9b2ADQOEaWMziPpZT2olfOtmKqN5Q
	Ps5ntbzXBMqcVp+aPIrXhZaTC3JD8BodsvE2mX4KuMAMuFCLEpjyXlu7aZzmy8xaBON8A1FtxhwNl
	P1AIUsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLK-0000000CyuS-3d8s;
	Fri, 24 Apr 2026 10:01:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDLF-0000000CyrQ-2UAP
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 10:01:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso71476675e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 03:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024856; x=1777629656; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=ZhiWgtYDglV+VnPo8+8lw2ZRLYbhasobfAHSHWyernX7kctLuE2y449Uh2HJJz3bNh
         eC4LZjcshBCArPJSLPaOw0i+Wfa/+1sWGd+k1w0yiZyizxUjp40guufy2dRtHWoi95wE
         cNTH7zcvX0ArH7JkZ3RjaZteWE96KaJ9eBf0PSgRA+MMh0lQtJaHSYItAOVa9t7gVCv3
         Vnzt81pv8n8JaO6fgSM3wi5GsHSgL9FSsKj2yn/IZxXA0nVYKkCovjrKQ34wfmBnGygA
         w6CR0FP7kMbCwwk9C19TSPfdH6UZP/UbsM9hOOV2PIwJxizEbg2mxS/RVN1O9R/nRTGr
         6JiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024856; x=1777629656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq07QUD8xIc4JRSL4PxKVMWxBFYSl0vshdBEVj4c9kM=;
        b=G2p1NFIkVeu9sep+98lHVkLCXiegM0TsOh3ReHCjWiknuOorbmlfljLStC0BVGgy/L
         /nbUDXexzI66jQ23hYbzPvU0arc0E8W7f5wV7Mqa9kqxyHsmzSb89zd4EiLaxcbTNOf4
         3tkWsIlHJuYy0fENIm/S0qrSJnr9Y1J22mqQJ4MnpACxcoMm+L/khW0WnxleNd9LJlox
         o5dSwb4R6gwTuwX597KZqZBnW3SkwutYo7g7g36wCRrkATPZN3eBU2X/rg7WbzNOgXBo
         riBAYGMsqSs0uyDX04qbE2hjY7q/30lHyin1sTQkGChDwXUH09k8bZm9fsGSE7RWpt1o
         sqXg==
X-Gm-Message-State: AOJu0Yxb9qLJiMoGEMFvk3Hqrdc40n/Trgz3Qrto41EdbX+vfjmaFYVa
	FQzaqOmyotDSsKf7v5EEkHol/DwUIoDQLbwrWOkcWDyHNNDstcd6gxfxv0/Jp7ch7GM=
X-Gm-Gg: AeBDievy6Ptx6GOiMJwbFOPJYDY8dBNJLWJAszmcOMGBlgrGDLJcQN0Hwx7iLFb7DJE
	h8/gyu8VJr2D2soED+u3ut9nQoOJKlEBzDGD2kEcswyV6lYGdR9szBJCn1ZmKJDZherrCyLv/p+
	wKcVB8fcyMXQ/rfxd7cfoe9utiDtTQxzuvRbp9ZHtXfjp03djAqLSyWg9uXXWoDD52c0Q93HNxy
	MKvNBnHDPOnqn5qsZOP4rwRnSjIiWG/3aPPZ+j2RmpbRPX3PJAxJX7xVtxvLnM3y+EvszmHGBcs
	Qgmj2MOGGHH0IkamzHuQ0LocoxEv8Xws2R44QGQT0ZvbAhwdaRQaUGVtaCCubGoKbnxqE4qnZLG
	jbfygNJqKaKSOeEtiEiskFe+ougS2wVGKZ9yyrYbe/yn58UgXS+LzC/BGjUZoep7Df95hRxZNS1
	OGYdarjMDTi3aPyLgZIgFp0kFVeZ1laEZW3263dI9EwHQWl+PeaQ+rQvUMQXdzgG8my9DaIMQBw
	a2KzihWd0lcHgacyg==
X-Received: by 2002:a05:600c:b90:b0:488:b99b:4177 with SMTP id 5b1f17b1804b1-488fb78ee4emr429943265e9.25.1777024854110;
        Fri, 24 Apr 2026 03:00:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a0b60sm169961765e9.17.2026.04.24.03.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:00:53 -0700 (PDT)
Message-ID: <e65c3933-996a-4ab8-8431-3f6ae18e44bc@linaro.org>
Date: Fri, 24 Apr 2026 12:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/8] arm64: dts: amlogic: t7: Add i2c pinctrl node
To: linux-kernel-dev@aliel.fr, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260421-add-mcu-fan-khadas-vim4-v4-0-447114a28f2d@aliel.fr>
 <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
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
In-Reply-To: <20260421-add-mcu-fan-khadas-vim4-v4-6-447114a28f2d@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_030057_639925_35F1DFE5 
X-CRM114-Status: GOOD (  10.63  )
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

On 4/21/26 13:49, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Add the T7 pinctrl used by the Khadas VIM4 for MCU communication.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed623..e96fe10b251a0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -376,6 +376,16 @@ mux {
>   					};
>   				};
>   
> +				i2c0_ao_d_pins: i2c0-ao-d {
> +					mux {
> +						groups = "i2c0_ao_sck_d",
> +							 "i2c0_ao_sda_d";
> +						function = "i2c0_ao";
> +						bias-disable;
> +						drive-strength-microamp = <3000>;
> +					};
> +				};
> +
>   				pwm_a_pins: pwm-a {
>   					mux {
>   						groups = "pwm_a";
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
