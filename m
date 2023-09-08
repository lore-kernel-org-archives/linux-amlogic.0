Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC86EE7FE7
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Sep 2023 12:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXlvGp/JL2X5P5VAMxbibwJooZfEKG5PTyFT2Cq6QL0=; b=h5jBFfTingVEhdsEQ64HIz6Mpi
	br1VKgbp3h+sgsTjLDw4PoAWYk9aYPeBtd+TBcoldXkC5hN5i4BcHfk0rGO7yTMiiMen9bY1KgCR8
	zEAO0sUSQX9cZCBZxTYPK6EXc0gQNg8ns8YVzQeln95DHHaV3ptYp5RQTQXxgMBcA/z9p403t/KNU
	0MpcIGZ9bEz8c7AlnMduQcnEmknPcvv/QZbJQf6gWSL3U7hl7SWD4R0NwCzArsfls49BjAV8KOtGa
	dds17G5hxUDz0nUEHu1P3Reb+oKMgBJK6SkPg5u9BXU6pOI1kmWsQpG+babufj/FcFMEIBgYXan04
	L/VJMLAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeajR-00DmLE-2t;
	Fri, 08 Sep 2023 12:37:05 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeajP-00DmJQ-2W
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Sep 2023 12:37:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401b5516104so21745875e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 08 Sep 2023 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694176614; x=1694781414; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Be2k1ZgrDZKG3iK8uhCg66l2zxTQVwhjYtA2BDkGIDQ=;
        b=lfJyTStKljy8P/ksRXN+yJVzywIDuLi9+8KuVBGgKj1pDg6ks72If4CgU4c7QyjkpN
         AIQ/wugaj/lJRINeQsCLikx7ZO5NhPTHV3h+AAHRAw56/c9Vapm4FdaZ3HHq8+abJ1pC
         fLtadziONQ+J28cs8lgYBuU2cMLBPDUbPezYJsRKFkE6K9kHymlQUcdDNdPsooTkXE9r
         w5hklf0xHl53imW4TVZ2XyjlpeOleoHvyRLg8WStNGKRPMDKG8qFWIX9r+3nQg961Vlq
         Tk381N7grj6R4CE5r1o7Sb3EoZ25+s/wVj59mUFIPcPM4jKNrNvRa6GPZKYK0ssrKfa7
         mryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176614; x=1694781414;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Be2k1ZgrDZKG3iK8uhCg66l2zxTQVwhjYtA2BDkGIDQ=;
        b=wRNW2DKalXTqSStrl+DgjDyadz6j1cdaJcP2gfH6FiZ5Hm7/6u02Ajyr4CurE+DX7G
         89GtyQh1Ijqv+ErighFck99V93k6oMRjvqMtCCMGiqI7EK6cZlO2NI9bejk6bqRlTnuC
         Wrc3MQB7zm+4HRFZGGygq4ELbBGkXXaxgKoQQ2Pl7vw5UQC5wvz76UIji80OJHXnqOhu
         CsqF+XlVjZCepiEZWGoSXyd9RndYn5s/8Jay4pPfd58BfDISW/hb1JbX8yd0vX8q6isW
         7yKtvjCjS1wYrTVPSY0f013WDKobzDAvF8cyMW+yX+DZWglNbst4b4+UZmQbKv7szrTN
         gKsA==
X-Gm-Message-State: AOJu0Yz3WdfTeu477oQPCeZPkerrmlInA33/1CHU+Byxi6q3uFRZv7E/
	zwSm81vDChaSSW7SXbbdoJbOEg==
X-Google-Smtp-Source: AGHT+IG9qMiw25Y/hia5vITBIkDc4lQt9y53sSYzYWNjS0uYR1XAAv0nZni37xL449zcerxOyCM/pA==
X-Received: by 2002:a5d:560d:0:b0:31d:cd33:b30e with SMTP id l13-20020a5d560d000000b0031dcd33b30emr2058224wrv.4.1694176613583;
        Fri, 08 Sep 2023 05:36:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4? ([2a01:e0a:982:cbb0:5f1a:ed04:d131:cda4])
        by smtp.gmail.com with ESMTPSA id v3-20020a5d6103000000b00316eb7770b8sm2023056wrt.5.2023.09.08.05.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 05:36:53 -0700 (PDT)
Message-ID: <12521b44-edba-49af-9011-b7850c39b35e@linaro.org>
Date: Fri, 8 Sep 2023 14:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1] arm64: dts: amlogic: meson-axg: Meson NAND node
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
References: <20230828133647.3712644-1-avkrasnov@salutedevices.com>
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
In-Reply-To: <20230828133647.3712644-1-avkrasnov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_053703_822165_9720C820 
X-CRM114-Status: GOOD (  10.81  )
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

On 28/08/2023 15:36, Arseniy Krasnov wrote:
> Add description of the Meson NAND controller node.
> 
> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 768d0ed78dbe..a49aa62e3f9f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1908,6 +1908,19 @@ sd_emmc_c: mmc@7000 {
>   				resets = <&reset RESET_SD_EMMC_C>;
>   			};
>   
> +			nfc: nand-controller@7800 {
> +				compatible = "amlogic,meson-axg-nfc";
> +				reg = <0x0 0x7800 0x0 0x100>,
> +				      <0x0 0x7000 0x0 0x800>;
> +				reg-names = "nfc", "emmc";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				interrupts = <GIC_SPI 34 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc CLKID_SD_EMMC_C>,
> +					 <&clkc CLKID_FCLK_DIV2>;
> +				clock-names = "core", "device";
> +			};
> +
>   			usb2_phy1: phy@9020 {
>   				compatible = "amlogic,meson-gxl-usb2-phy";
>   				#phy-cells = <0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
