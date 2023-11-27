Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A0EC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tocbvbTe4DU2GsIpcEAZAbq+nFEsZ/BnFSreF9tSwRc=; b=EgAQBxXxwFFj39HoIoia3cMeU+
	FwQfSXrRWn5UE3jRHnmAEHidCKHqwiNXb6R/WftwBzBssMNKNkQf0l4RAgsqaCvkiN0wnD3LugwpU
	u20Qtkz4LAGyHUIMnTRx+qDN0NHhSSCn1JRMc09UN3y7UqCDwZC11mNbBMUI6DEEDQgDWsbTwK697
	Ha9y+tTJG8/o4NIarhv6vctMbdd/a+lo5tEuP2WTsCi9x/tN1QEv2sY8hGpRmfLwWW6fcI5Cs92zo
	JgPpppnPtP3pTcDHg7kvFBrxfMgV2MVWnVAgbuFaAs1jEpNge5A4XmxXx1bcs7LYisn4BtT27lApB
	2mBvMEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WjZ-001nkK-2a;
	Mon, 27 Nov 2023 08:12:49 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WjW-001nic-1D
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:12:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c8880f14eeso49374751fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701072762; x=1701677562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oDZtUi7jbhZiZ6gFrIVGS7Pc6EtiVEZLQbo/dnLHNT8=;
        b=gj0T1Czo8LZ8UkZI39TIrjw7SVyNQyObsV+EjmmFVd5HmsBugt2wioafb47WoiXhq/
         nlX0plKQvU8k7pSKpwuix3T/ygoZXfcObQdgfwBLxvsBd88a7XDZN6SiwH1Frjds0VvX
         9I/cmQcsf/JyqvZ71argHA8Yz0vgwlcdsBfjVexfGyKK1CBHMaCrL+IN+trrlu9NuaHM
         Ax0uGavILkD7OtVONRkCpbIkXhHa2wB2VaGvFdHI5qAjn+l0F97i6iFNjgqrPf67NS1F
         8pNSog+vzRKsle/H0ly7keZCOruxFUapFfJKNRj8U0toxkzEAL3GjX11UUZ+s33n42Bz
         i9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701072762; x=1701677562;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oDZtUi7jbhZiZ6gFrIVGS7Pc6EtiVEZLQbo/dnLHNT8=;
        b=BgvrlPsh+aAEahSbzFA+67o6tRlWQsdvesYOg79gY7U1USZmZTYeJGZH7KHS0OBsSb
         n8cnESVqvDkG3W6CMP7McLO1BgS9duOpmYlQk82sIbmvhtjWc1Cl6yq6Mr+sRokLNQr7
         BF8/nVglnkT7knDuk9LG1CHd7SbPnffmcACuCLz4sgUkyk2vFUQ1v3YlEwouZTysGWQS
         30QOBD6mjP0xnn0OgaOLde5uSekBPxEc/2Du+Y4/enaq93ajDnDiV7XqJeevkHTERdhU
         4d4FIKkDvHi/jTv0+QfFNK/y5diHWoJI/j6gQNaEa4LabNuPKlYeAZkTCpnLrqeTycBd
         KvhA==
X-Gm-Message-State: AOJu0Yy30Ub+0hAIqj0t3Q7R0njRFTvOn3TW1BAK40wRAQ/xczCxw+t8
	1Gbzyv5RiJwC+FljfnkvYIl+bA==
X-Google-Smtp-Source: AGHT+IHUzFg3nwVkI3fr+ES71VeklRqkXC9pJMV7pMTwEUnZrWkKltvjw2FWrd5nOiv2l/Ei+7HdxQ==
X-Received: by 2002:a2e:545d:0:b0:2c9:a191:92e with SMTP id y29-20020a2e545d000000b002c9a191092emr1525037ljd.15.1701072760871;
        Mon, 27 Nov 2023 00:12:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff? ([2a01:e0a:982:cbb0:5a15:ac68:b4a4:85ff])
        by smtp.gmail.com with ESMTPSA id fl8-20020a05600c0b8800b004030e8ff964sm13704060wmb.34.2023.11.27.00.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 00:12:40 -0800 (PST)
Message-ID: <eda3c1a8-b241-4016-9878-6e4c88b56b50@linaro.org>
Date: Mon, 27 Nov 2023 09:12:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: meson: radxa-zero2: add pwm-fan support
Content-Language: en-US, fr
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Yuntian Zhang <yt@radxa.com>
References: <20231028075445.3515664-1-christianshewitt@gmail.com>
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
In-Reply-To: <20231028075445.3515664-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001246_462861_2FFE562B 
X-CRM114-Status: GOOD (  13.59  )
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

On 28/10/2023 09:54, Christian Hewitt wrote:
> The A311D on Zero2 needs active cooling and the board includes a header to
> connect a simple fan. Add pwm-fan support with basic thermal properties so
> the fan runs when connected.
> 
> Suggested-by: Yuntian Zhang <yt@radxa.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   .../dts/amlogic/meson-g12b-radxa-zero2.dts    | 27 +++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index 890f5bfebb03..895b6ea67180 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -33,6 +33,15 @@ memory@0 {
>   		reg = <0x0 0x0 0x0 0x80000000>;
>   	};
>   
> +	fan0: pwm-fan {
> +		compatible = "pwm-fan";
> +		#cooling-cells = <2>;
> +		cooling-min-state = <0>;
> +		cooling-max-state = <4>;
> +		cooling-levels = <0 64 128 192 255>;
> +		pwms = <&pwm_AO_ab 0 40000 0>;
> +	};
> +
>   	gpio-keys-polled {
>   		compatible = "gpio-keys-polled";
>   		poll-interval = <100>;
> @@ -286,6 +295,24 @@ &cpu103 {
>   	clock-latency = <50000>;
>   };
>   
> +&cpu_thermal {
> +	cooling-maps {
> +		map0 {
> +			trip = <&cpu_passive>;
> +			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};
> +
> +&ddr_thermal {
> +	cooling-maps {
> +		map0 {
> +			trip = <&ddr_passive>;
> +			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +		};
> +	};
> +};

You should instead add a new active trips, and use them for the fan cooling-map.

Look at how it's done on the Khadas VIM3s or Odroid boards.

Neil

> +
>   &frddr_a {
>   	status = "okay";
>   };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
