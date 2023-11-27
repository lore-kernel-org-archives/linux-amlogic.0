Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D193C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUwrvboXweTb+1GPiESRYWXX4pwEggGVufb6JZwmHJQ=; b=zKHHkEwnELtCLksG/Nz7t9kW2d
	JHr7FfTAcQ/txdYYFhrdhOv6ogIUwkmq5uStX35aYimH/zl+h/L/tD49q4v2Oqbjt3fTs/r4FG0NN
	THxG1Vnpkz7FdH9yJjMtTCmZC5+v1KhaKWm2Ath0hbv0hLYrFAMIYw1oJuH+yY5bdb8HzY1rm0GAj
	3Ey3xgqpjsMNZXQ+ALM740boVL+xRC7HVCWJm7T6MqACb56XxRCAF8hzVDE619wMtek9saaYe9PV5
	iwFO641WwKk/VqLA+8MOX/pV8G8IqhFClPc/+atY8yrVZNYMEZ5+RG0naxU2t267ZPFzPucsHHPqP
	hKfwpGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WgQ-001nMw-0s;
	Mon, 27 Nov 2023 08:09:34 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WgN-001nLz-1F
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:09:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50baa1ca01cso2167440e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701072568; x=1701677368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rn+UYaLR9UVBQ3OHWhJmg5Nn5FxMaUWGGdZVxwhJ9eE=;
        b=B5MT1sPDe00053cPoheL6AgcsZVXNUqA1uxdR0bdYyY0OgTmfq+k6nx8OAmIU//L23
         w69cBlL8YChkp9Cjo78D+sPRbP4ZvKBdnZHrHV2lAASdLj4QEbOQboutwbkeQSR/E/4N
         /97e3CWdYELMYp5V8D5QMRTehdSN0k9JKOxK9Utbd/7zqfqXMkYT2JFD4CmID9s3tQfC
         9JTdsYdYYttyAs08Gvy1mCIwIi3Not3hcYsbLo74k70JYfPitL/K1s9+lEu3WKNNboIj
         46jQ2h4ciIv6XfO8G0IY8tinWUVjpDXGRikXCv1QVxvrJRkwrn0tPYqrJIjNgroe38Uw
         miVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701072568; x=1701677368;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rn+UYaLR9UVBQ3OHWhJmg5Nn5FxMaUWGGdZVxwhJ9eE=;
        b=NfdqXLt+9E4yXX/4vfG+PxZHlYMJ3KIzp8qA2UO1vUuXrjyp1YbNiRJ/EXgg3NBcbm
         zRlbWVDjkOonYs4uRfOht2gPldZTH6Yuj87TJwgJir70Iag8/Fe+RFHMIUNlkkB3As7R
         8zOhuDbCpaUclxYD8y2EuERpHb7JF7tkSus42TgoDbe+//4Q/fktViQ4bFlPB0cAhesv
         czLWObggaaaW/BinMhHHVvfWwAB5U3NYzwBJw3+l58TW+Vmvj6kgGg82uphtwCBp1JEL
         uOvNXTc1BX7KbUazqA8dyqDsUq4nQRWQ7+u/DqfTZ23A8I7q9Rr7nvRx8bvt8tSr3IIs
         oijg==
X-Gm-Message-State: AOJu0YwRgFD69csgyZdRPN9plscdM+aC3LodGd3xANsONaRftvBC12am
	BFCLO+Q088L4hHGKeVk2mdI70w==
X-Google-Smtp-Source: AGHT+IFrYeQJFDL7FWcFShdrCH4BBQIFmmfj0xNDZKBRQ2tGG+FCLSghCsphxVaO5/hi0/LcfJ/t9Q==
X-Received: by 2002:ac2:44ca:0:b0:50b:aa9a:6691 with SMTP id d10-20020ac244ca000000b0050baa9a6691mr3902883lfm.51.1701072568408;
        Mon, 27 Nov 2023 00:09:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id z11-20020adff74b000000b00332f74ffdd9sm5200377wrp.30.2023.11.27.00.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:09:27 -0800 (PST)
Message-ID: <1dd87851-25d3-4f85-99ca-5c072675efec@linaro.org>
Date: Mon, 27 Nov 2023 09:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-axg: pinctrl node for NAND
Content-Language: en-US, fr
To: Arseniy Krasnov <avkrasnov@salutedevices.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com, kernel@sberdevices.ru,
 Liang Yang <liang.yang@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231109094504.131265-1-avkrasnov@salutedevices.com>
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
In-Reply-To: <20231109094504.131265-1-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_000931_430575_37F2766F 
X-CRM114-Status: GOOD (  11.42  )
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

On 09/11/2023 10:45, Arseniy Krasnov wrote:
> Add pinctrl node for the Meson NAND controller.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>   Changelog:
>   v1 -> v2:
>    * Rename node name 'nand_all_pins' -> 'nand-all-pins'.
> 
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 23 ++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index a49aa62e3f9f..7e5ac9db93f8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -432,6 +432,27 @@ mux-1 {
>   					};
>   				};
>   
> +				nand_all_pins: nand-all-pins {
> +					mux {
> +						groups = "emmc_nand_d0",
> +							 "emmc_nand_d1",
> +							 "emmc_nand_d2",
> +							 "emmc_nand_d3",
> +							 "emmc_nand_d4",
> +							 "emmc_nand_d5",
> +							 "emmc_nand_d6",
> +							 "emmc_nand_d7",
> +							 "nand_ce0",
> +							 "nand_ale",
> +							 "nand_cle",
> +							 "nand_wen_clk",
> +							 "nand_ren_wr";
> +						function = "nand";
> +						input-enable;
> +						bias-pull-up;
> +					};
> +				};
> +
>   				emmc_ds_pins: emmc_ds {
>   					mux {
>   						groups = "emmc_ds";
> @@ -1913,6 +1934,8 @@ nfc: nand-controller@7800 {
>   				reg = <0x0 0x7800 0x0 0x100>,
>   				      <0x0 0x7000 0x0 0x800>;
>   				reg-names = "nfc", "emmc";
> +				pinctrl-0 = <&nand_all_pins>;
> +				pinctrl-names = "default";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   				interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
