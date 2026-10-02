Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06540CA5FE0
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2026 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBWa81gJHsL7oVlHwYB4GfgJwdbO9Io54//J+zYC0z0=; b=hk+kJTagoLgjSiXTEuFSReEcR4
	8H79YmfItXkjV7iQUysLIk+9t+lQa7QibI6lHObPOwVuBwgVQolTJHYeO1m1bSj11y77hMo3UZt2d
	7QDRx4BB2kTPsW8gzpaaAvRjAN7HnS7milgsnJbkT5NzQWl8Q59RngX8NZbEgHZ94vvHrDgOAQgJJ
	mojXZnPqKWLdg/N69ZsjnBk8DUMAuUsiyuB4ugvBWVZUMEJRj+E0O8Ptn3gyQDNt0KACems8rvqwP
	8T2+64XLCZwd+01I978BQ4X8q1kR8ir4VmJgUM01yx5ThKVfApGs/t62drxkTFwqCn/99Cnn1Io5D
	7LD2X5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCix8-0000000COhM-0AOn;
	Fri, 02 Oct 2026 19:29:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCix5-0000000COgf-0qjw
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Oct 2026 19:29:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso285398f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2026 12:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790969389; x=1791574189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=OU7jueguB4fbi2qYPQ5cjNTOI47nhjs+tgAmAePzUp/mEI8eZ06eSwuNEaCac33N2P
         W8AmwkKZIBqdCBAIgVhalWUy4r7Iemuf05pZQiYK4ZrQvY6xSfrO3rn1dZzFdBQZ2OPm
         7IKUTzmAgqX67W+Dg7L0ALTh8JsqBjkVb0qBpVJetpBVI68vebZjNGTYuNaPMV9xKa2B
         RMNIlkwBd9joSd2MZ50vQn8ffLix7RrMy3ex/ZqZ/Lz3H29f6PDZmp7UrwhMimsQs3bE
         AX1BlXbX0PFY8g/Y/SC48wTJliU7qW/jMIgeoJGP23dP6Aznra9X46qhSpGdK1p0YOfR
         fbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790969389; x=1791574189;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cztgwljGD8oX4kZgQ1gsJ1QSEaSYmGWQ7py1olDlbuE=;
        b=jAcLs5kV9dXMTGgjKebWYc1zaKLzb4MqbkBvIoZdQeStrHJJrocvb0kHX7p/Sk2jKP
         yobhz1cpM25rFeTO2TF0sgAMBYkLibiZqeD3Vo3Go/e+sw9DfTsBh3EM76jPIOy/lrFc
         EYx8R/dS2Dgc9eq1f2ehtPpfqvcng0t4liJW2hGxejo0+GJIKSmafluN5rZIMxlQg7z2
         IIM9XMCUxmAszwqW6nh0LPQV1TFKwYNRQ+EXOKuIdo8qA8gOeWPSPH+jYsRusLfoN4Y0
         4IMpW2ZaboIR/ySkQcjS0wfsgWMlrxzNuY/cAQvm0Zwx96H8rMnICVDwQwZ2NYwvvwdu
         Z3+w==
X-Forwarded-Encrypted: i=1; AKwUvBwxyzD8V4lhXhkw2qHiDEA5Gug8li18VlHwVdA1zCrpYqAcmOPEGTXS4JVrYiJOU0KDt1rXwB6D6qVubhdW@lists.infradead.org
X-Gm-Message-State: AFq9FYJ945a0GiJLQ2Bix5I1mV4Aa1QPQ2ys9zHUxOiugd4nO91AC/Ea
	grpC3yz0YUP+c8L2jL16CCFm7c6+Y8PMW/dxaeAAoyLMuJtHe4DhRVOMr4mdY++iqGg=
X-Gm-Gg: AYBFou1Cf0ri9bNo6ZUCvH6eFyLEg1TWX+cghxJzTOLHbjLzOxCNhMfwkquZ4iMxFhP
	yQPst/GqZY1MKSBG7wEdT1Je+0Dp03jkI1sXHIyYd7WlWpGgq8p/TbeP+3MdWYc+Df8AE1qjkXQ
	xdFcDSLL/Tu24mlZWdg14p9w+Ha2y1YB8j5GHYXL1mdOK5zVJAHAo4x+xHQyevYP0neeY6lCyYf
	B+jMvdcaIzc0AZ4ffGsfcubuBIrGMGB8bgzpd2QJtEAxdvBiq+RgOCBP/MiByd5lsogGE0Oaf1B
	OSZFni2Yz9gyM69a9OCt0Z0ieOmQMgwTvrcw7Hlq3RQaXg2DQZ8Ka8b3o/7wDv9NX40+Oh3+n0I
	6M5snAMRqGZPbgmymznJfgC6oQ3d8miCRysjPCQNxh8qhYuehl1HdS0Ka7cvWYIa2r5/AL03fbp
	EhNYaR6LbtOfLZbtZehTjXYPk9zo6V7/12HX4jt6zNptiOXcYLQ013mE7fMKu2LAGCnr9yypiMs
	CbBymlubH5wnIDtx45b9hUxR1AXh5Z+dHXXfBkglwzk8S+ln8g=
X-Received: by 2002:a5d:5d13:0:b0:488:75e4:f5b6 with SMTP id ffacd0b85a97d-48c4801c1aemr625756f8f.54.1790969389014;
        Fri, 02 Oct 2026 12:29:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm8184812f8f.23.2026.10.02.12.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 12:29:48 -0700 (PDT)
Message-ID: <23235204-8e5f-4fa7-a900-66acfcfc593a@linaro.org>
Date: Fri, 2 Oct 2026 21:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the
 SPI NOR HOLD# and WP# pins
To: iav@iav.lv, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
 <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
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
In-Reply-To: <20261002-hc4-spi-nor-v2-1-8366a4f91049@iav.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_122951_280805_FFB9900E 
X-CRM114-Status: GOOD (  19.78  )
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

On 10/2/26 20:36, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The SPI NOR flash uses six lines, but nor_pins covers only four: data,
> clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
> so they keep the boot ROM setting. After a boot from SPI they are in
> the nor function and the flash works. After a boot from SD with the
> button under the board, they stay eMMC data lines pulled low, and
> spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".
> 
> Add them as a separate group in meson-g12-common.dtsi rather than to
> nor_pins: whether HOLD# and WP# reach the SoC depends on the board. The
> HC4 has eMMC disabled and takes both groups.
> 
> Tested on ODROID-HC4: with BOOT_3 and BOOT_7 set back to eMMC with
> pull-down and spifc rebound, the flash fails as above without this
> patch and probes as a 16 MiB mtd0 with it.
> 
> Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 2 +-
>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 00609d2da674..3135566df880 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -615,6 +615,15 @@ mux {
>   						};
>   					};
>   
> +					nor_hold_wp_pins: nor-hold-wp {
> +						mux {
> +							groups = "nor_hold",
> +							       "nor_wp";
> +							function = "nor";
> +							bias-disable;
> +						};
> +					};
> +
>   					pdm_din0_a_pins: pdm-din0-a {
>   						mux {
>   							groups = "pdm_din0_a";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> index 3ece30a0a1ff..c4b93d6619f2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
> @@ -126,7 +126,7 @@ &sd_emmc_c {
>   
>   &spifc {
>   	status = "okay";
> -	pinctrl-0 = <&nor_pins>;
> +	pinctrl-0 = <&nor_pins>, <&nor_hold_wp_pins>;
>   	pinctrl-names = "default";
>   
>   	flash@0 {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
