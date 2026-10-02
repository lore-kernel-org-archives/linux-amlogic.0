Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70115CA5FD4
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODlGZPRBbwAeoWopA/ALfS0YepSQmnnSKGSf6olaSV0=; b=x4z6vmZKcM22i30zZF3qHFk0EY
	jK1fHpa8M5LWFAibgM/RahOWsNIE43Gf45Asv7TvUDkzd/hq9XqkC/gRw6TYz0SC+p9uAYQWZ4oOJ
	qIQxwrcpUilL8HZ/+CsVGPGajg2GrP6d3Q0r6Y5jwX/etM/APbdTIPDcZ4RAAE4Got4MRqZyhEYif
	hnCQ0qhIoD0DKP6L94z8m7Shy1ggIyhwNVqIRcHTA/nu0I6VZTF/zaVX9C+KZTRJQN1prv0S6Cssh
	UNwvN95R5cJMKQCp2rbxq8XpM1T/S/g01I0+F0eb60wSp6HPsJRHCiJNEoum3lZg5ct3wBDf0OS0Q
	Q5Xz20tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZUO-0000000B8Am-498D;
	Fri, 02 Oct 2026 09:23:36 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZUM-0000000B88t-06xa
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Oct 2026 09:23:36 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so15636825e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2026 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790933012; x=1791537812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=ns/GFQW9kNb3syXhq7acYFEQoJRr1ftGvn3B+Tr8NURTTAdvQsEjIUR/2+LCROw/1W
         IlNsdG7A9Y4rYxcLCDAornWzSXHm0XPFXKXeQ5YLUSJS7rcu92RzQZhoutESoIfOctHt
         FKP+Xjv+7+ahGWr9+7XbrWQsKRZebkWztGIi6ODurVr1mCW3dtYqTt0GfbgpbJL6G7XT
         9wnqlveiHk8RZihyvByRCfQiYN5EDLu8iqF7buq5PPBqHrh2YgV3KkMjoyaCfD2vLYF+
         w7/LRq1JEPr2iRGzI8+6yp8sSJTxXCK+3/n+13BvvoFGYc74pyb++woxTyfBTOl2BsBI
         L6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790933012; x=1791537812;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KH+uJZ38NeAYqKlocKuGqs/9s/QvL8xhydhkHOyMLZ4=;
        b=lXlpKxfOJDKbw8Q6kA9NRrg+FPrEVLdL0Go+RZH2flwt+N81l0aXjS1cTUMzQ2+VTN
         e/9S2aHFuqGCDwTlkgBapkWuXbaI83ug4oN5y1MrQYlDy+JyflmTi8W1oVDCimzTuowV
         ZbtDvxhNWPgcBN99VbZO6xqwrx/f+EnM9zDj5QzfY4I8cGM6X6DVsdpnY2/fonQjJ820
         xJrxbAl7WKRBnm/M6TaHVJJDT7ohWeIBfCPxqP0ZawHVLwqPGsx/Tb7T51cXbu/jVnNU
         U4LqV/OHK8LIr1bYlAJdPbeDOXInN4eTzL3+HY1XSjAxJBs9+pLw8pT+fQEU+GkMmFgx
         GNvA==
X-Forwarded-Encrypted: i=1; AKwUvBwpaSGWQR+Z6WJGyqA48tGA8Babt2wG0lzCy5PvUbATlA/YVzJBRhV2oDZ3VrO3a+0N70tOVULNM2vVcfFW@lists.infradead.org
X-Gm-Message-State: AFuF++mGchSxm8hIInYZ4Y5LHU4kCadgAB0K6LVYID+nySVe04c+jrJ8
	zNkYldR4PGEIbea/36GuBSNoQiYkiB1+G29nVwGxdzpvR8qZUmxPVLLUSovvlNeiuYDz8fiDhxD
	o6+oM
X-Gm-Gg: AYBFou3CXFHGsAQJhit7mod53yP1wtSV9adqXkxstnF17V44i4TTHf/3EPpXvoG4D10
	pLNPn+MbTa27LtJYHMYAI7c6ZFBCqrAtx27pnyzolwGgz23Soc6X/U+Uvk6jWC879/Jdw0Ibnn0
	/kOQxN8LV0Q0Hhjo7NqMAN2SeP0gwu73/Cbodsw5vjBPFs1983M03xhSvKC38OTTC3Yz8hJt0aw
	KZIwrrOIZIWuDM4UQkGISK8BXQW6Ggi3IOZm0sCb7Fa4QwCS02j1hYPjaUvhwCNncy7HEe2rDdF
	B1uY86/eKicD8MPLc+gO45JJL9ayJAb8ichl4z6hsTFGdT03UXe7BCLTI6AypDREsh5cQ2GgLj0
	cwzAyJvX07yOsSuWYZ+CGfelBIW+l1rwRViXH5MU2sxJfut08CxtOO7n5Gg5RQi+WLo8t6MYkmK
	EeU6ZkIC9vBhoaxu7yXJYJg/S4hK98tCHVemAo90aSTn0RBgWZLI07K7d9ii4GGzx9gMfpJOobi
	4B1/8024D7i7887F4bLxhMaunSNOoHB4ZvgAk5/poDa1RIZbgJ93sZJSxcLnw==
X-Received: by 2002:a05:600c:19cd:b0:4a0:22d5:21af with SMTP id 5b1f17b1804b1-4a027564f48mr41402045e9.15.1790933011804;
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0276fa954sm68526245e9.3.2026.10.02.02.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:23:31 -0700 (PDT)
Message-ID: <143f8d6b-7c11-4a63-9c9b-36758b3ef635@linaro.org>
Date: Fri, 2 Oct 2026 11:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
 <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
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
In-Reply-To: <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_022334_108827_3515E8AE 
X-CRM114-Status: GOOD (  19.05  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/30/26 18:52, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Mux them in a board-local group. nor_pins is shared with boards that
> use BOOT_0..7 for eMMC, and the HC4 has eMMC disabled.
> 
> Tested on ODROID-HC4: after a boot from SD past the SPI, the flash
> probes as a 16 MiB mtd0 and reads back correctly.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..5ce76a1bfe02 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -124,9 +124,19 @@ &sd_emmc_c {
>   	status = "disabled";
>   };
>   
> +&periphs_pinctrl {
> +	hc4_nor_hold_wp_pins: nor-hold-wp {
> +		mux {
> +			groups = "nor_hold", "nor_wp";
> +			function = "nor";
> +			bias-disable;
> +		};
> +	};
> +};

Could you move this to meson-g12-common.dtsi instead ?

> +
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&hc4_nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
