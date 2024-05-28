Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE17C27C44
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 13:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04t54y9R86Uq+kar+RetsbAnTzODnnhsgKcyoz4jNeo=; b=eIeLU+Syl5iOZyR2CuT92ln5Yu
	yb0ZRK/C+XY+WuMV5QgN/6nyiP20lJCsMEOWa4uSNgNjDGpIQdh97XtM4KqE0F8yuFxoQX8QDtmjR
	/GOFwbgggXENIpEhh4Al8hJOfQHlGox4R3OjVSWl9guYDiWACQw73R+ylWMIXYhpjLAGL5Leoqrgc
	HW04XVVj+8tFfk7VrHfMBRc/Wt1lylLuPNs2RelBz8CFm0X8oXOFf9gLEE37xQLyy83+rKUhkSqiw
	8fW7/LBnzl4UxrTXlQTUZ/IDwHz2uEIcgv2mD7hGYoy3yrSpkmSaHdG+0oRqNjb1EfzJcszCuH0nh
	5wPqCNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwy3-00000000pTh-1ZmF;
	Tue, 28 May 2024 13:34:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwxy-00000000pPr-3JZt
	for linux-amlogic@lists.infradead.org;
	Tue, 28 May 2024 13:34:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4211b3c21d6so6644805e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2024 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716903252; x=1717508052; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtaRbzBW2FmBq00uLRNYJrl9av0hwx9CNWB6QXoBHec=;
        b=fWZdN87CdV1aiMuoT8maXmLWaDaFywslGPuOHA+tyBVUJ0nxJy6JHCTSx4pQgvwFbU
         4cwMSLCXfYXRanpJyUM1xaOmPm7zFddkoERC4V7VM4xiTvxKbXfwwPT1u1AeGO+Bm384
         z/HpiByfPRmkoIm3i7h85ewUB20dCOmwTn5eyzfCCt24ce1BEUU64zwkSo/0W5VSQZ7r
         yI+KP1GBXnzd45xeUXB7/M6bNx+0baexcgGgAWcaLGBs/R1Ii06d1FA9/LtXG0+xI41l
         vGGpkTfCVOfT7zMSwfeB0azXprz/YyYmn0dCqT0Gr1JSB5h6/KgQwMJ9JkvPQOq5g9fB
         gkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716903252; x=1717508052;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xtaRbzBW2FmBq00uLRNYJrl9av0hwx9CNWB6QXoBHec=;
        b=wgzzOtgO3Gv72TY5Fviuab4M6b73sYawkCKZAX0eVS4IxUCMEMm4gM7StRSsrszlNd
         LJebG+FBfP+gmsoocdVZA85vm5tUh8+HdoqX+Ugkyc4TE+qeUAF5AXfB7T44kKBiLWZ5
         vYtrlnqJflcRVgtGUck89FCdVVCPMoe0lbAnQpi0nJTNfWQx5VvMPxFDPUE7V6FXalIt
         i/uO03d3Ez0WEiX5a8ku745fm4B9hHByP8nyLg7r9LfqkD1+Bk4Bk7EmYZMOmR19NLq8
         a8b69wHwUjOuCaxiWaPojWmxM7khF/npfLLaYDtRlCYFNQJACr6JSE+Wu6tWqkvqne/n
         f5eg==
X-Forwarded-Encrypted: i=1; AJvYcCXRwKeOIO+Se78YKZt3FhprNEwvTJ1vt2ZFGrEUvBXTwDvzj/xS5BQ8fNkgAEP+sCBJyNO3K/SwzF61rN20yhQbbiEPwrn/Bq21Eq/TYL3VAT0=
X-Gm-Message-State: AOJu0YzIUiyEvPost6Fb263XRqAZ8bh/BH8Uke1+ccapdVwlOJGsinYu
	Epx8Sby6MboUCQmx8DvoDQYu6kVjcYDDBQTcbA0oetq6gDXgdIAY2M9IJkK4SCI=
X-Google-Smtp-Source: AGHT+IHHeRm/5PPbzVOg65qBFrOHryVw+fWU5RzhUNglYGlZLjg3MKIhQAyFz6f7vlPAODV6LnnStw==
X-Received: by 2002:a05:600c:558b:b0:41b:d8ef:8dcd with SMTP id 5b1f17b1804b1-42108a1c620mr80958335e9.28.1716903252257;
        Tue, 28 May 2024 06:34:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385? ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421212c487csm7821565e9.9.2024.05.28.06.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:34:11 -0700 (PDT)
Message-ID: <4765cd08-c105-4a48-ab00-4c44fa104d7f@linaro.org>
Date: Tue, 28 May 2024 15:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: move thermal-zones to top
 node
To: Arnd Bergmann <arnd@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@salutedevices.com>,
 Igor Prusov <ivprusov@salutedevices.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240528133215.2266419-1-arnd@kernel.org>
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
In-Reply-To: <20240528133215.2266419-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_063414_913302_FB8F74D1 
X-CRM114-Status: GOOD (  14.72  )
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

On 28/05/2024 15:31, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> It appears that this accidentally got added into the spi node, causing
> a warning.
> 
> arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts:119.16-161.4: Warning (spi_bus_reg): /soc/spi@fd000400/thermal-zones: missing or empty reg property
> 
> Fixes: 593ab951232b ("arm64: dts: amlogic: ad402: setup thermal-zones")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 62 +++++++++----------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
> index c8579b6e67cf..6883471a93b4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
> @@ -84,37 +84,6 @@ vddio_1v8: regulator-vddio-1v8 {
>   		vin-supply = <&vddao_3v3>;
>   		regulator-always-on;
>   	};
> -};
> -
> -/* Bluetooth HCI H4 */
> -&uart_AO {
> -	status = "okay";
> -	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> -	pinctrl-names = "default";
> -};
> -
> -&uart_AO_B {
> -	status = "okay";
> -};
> -
> -&saradc {
> -	status = "okay";
> -	vref-supply = <&vddio_1v8>;
> -};
> -
> -&spifc {
> -	status = "okay";
> -	pinctrl-0 = <&spifc_pins>;
> -	pinctrl-names = "default";
> -
> -	flash@0 {
> -		compatible = "spi-nand";
> -		status = "okay";
> -		reg = <0>;
> -		spi-max-frequency = <96000000>;
> -		spi-tx-bus-width = <4>;
> -		spi-rx-bus-width = <4>;
> -	};
>   
>   	thermal-zones {
>   		soc_thermal: soc_thermal {
> @@ -161,6 +130,37 @@ map1 {
>   	};
>   };
>   
> +/* Bluetooth HCI H4 */
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&uart_AO_B {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +	vref-supply = <&vddio_1v8>;
> +};
> +
> +&spifc {
> +	status = "okay";
> +	pinctrl-0 = <&spifc_pins>;
> +	pinctrl-names = "default";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		status = "okay";
> +		reg = <0>;
> +		spi-max-frequency = <96000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +	};
> +};
> +
>   &usb2_phy1 {
>   	phy-supply = <&vcc_3v3>;
>   };

Oops thx for figuring that out


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
