Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B0BC2BD05
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Jun 2024 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8X9do0bXadP9Gu1wGzTeuaxh7Cmhv7wZhv4DK8174s=; b=igB0w0nY04J9V2u8MS/FXEEUzh
	lspMTq7Du6d3pg6QV45NqEkJajFRDDf6px54nYRGkW8CTCCEdr43ZzGhT1eBXOfEv4Z7I5wbqPgaS
	Os2u/qpOvp9ODytjNqXWUUjkJgpMU7PCb94LXk2U4e84gghd/K5LAZrV7zkFnv4qJEkVUaWbU+125
	ytUo37xcIFd3cv7KjrIhxi5vH7gNyinX6iTN1PfmfLw1pC0C4cghFi2T8feq33HgfYuKnAjLQ0THS
	K9SxT6XEovxShUpLRKKfINt8cek2SJicBlvnHrSL/3PvLXqT2lfXEAMDFjq83f/vWAx6MQQDIQcRG
	wXXPdrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLerT-0000000FzPh-0Oy0;
	Mon, 24 Jun 2024 08:15:39 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLerM-0000000FzN4-2VZq
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Jun 2024 08:15:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3627ef1fc07so2988220f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Jun 2024 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216930; x=1719821730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mc0K6+P9t3aUJfG7qNeZqV06Olc9LiRHaSQx7Iaz24U=;
        b=gJ+f1w+Sl5qdnksXsDk4hPtPji/wujl06nuE+U8jqKjCLaNeCSmjXo+PU9TObOi2AR
         FszfihC/eGI/FgLOO+J6KIFhDz1KrQbN0jTLamSGmyO864we+rjqx/UWfJtCHSsiVY8l
         YCyWh4ObzXdNncgBDrxK6OjzJ0va0ZNipqsImN2NUnuMxd5DVCsfazSqEQvWvXyeV6+n
         x8jaJAARH084gSkv7lKLuwr01m4NW93qqNWIwgKK3uOBlDmjXdf0560Cwr6vC3ONSWPp
         ec8IMbqgYr/pKZg5bT/zt2z90hF1KXpCoG0IuFDYH8xJjdXGy1C7dr+kynVSGjFwNarw
         le+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216930; x=1719821730;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mc0K6+P9t3aUJfG7qNeZqV06Olc9LiRHaSQx7Iaz24U=;
        b=Tg32txJsrAgo5bQ/2ExodbjPnBR0B83kQgl84E0lyqtXWJE2F7UZFZuytTxk+8BFKS
         50CbnaU8VSadekynRtAnfC7aQWRgpvt/T2fgbKB4yopHn7bWkxjKVAa+CB0Xvxkotcma
         w3Wg8Fvyh8AFbOqVWcWCLiy1e7s4WADgRkMB70OzOGXMPlOjuqtvzsQsWxiodLyst41N
         CdWczyWrlaKnup9kQjBf9yACBwB0RPJBaoE0uDCoFytlDIKgBWaLtCaVlMjDMDO9nOaG
         p2CvUXiFN12Fh3ULvj20+A0UHbvMhNTUWuF8AzC4Z5LF8Pb9Uds4Hmv/TUvPSq2S6bwR
         FlsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQn5IRoJdQCM+IS/bRIvc/HA82T2aB2h3B94hUUaPVOE+ev3zJimTdUq4LDFFAgP/577ioNhrEWuxqRt2E4a6xD+TflY4tORaAaPvybCzZqFY=
X-Gm-Message-State: AOJu0YyaRLZ7BogDh8M+sBx7k2mBZFHdinDLrYtsWfEGxPghWDoISoKF
	aUibQb9cSAx0ZmVfM8c5E0zb0dZzPx7B8gm3SIZZ1KmUAn4uERnzlkr9YHucA1o=
X-Google-Smtp-Source: AGHT+IFDKrcUfX+Y67g3G1ua3EmYg/ZDbYtuqcCAm/9/+tELv74l4NHJAJM255rdI93UNdcxLAuZjw==
X-Received: by 2002:adf:f088:0:b0:365:80af:f69e with SMTP id ffacd0b85a97d-366e957309amr2206840f8f.37.1719216929768;
        Mon, 24 Jun 2024 01:15:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cf01:774b:55fd:ab74? ([2a01:e0a:982:cbb0:cf01:774b:55fd:ab74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b863fsm9251064f8f.47.2024.06.24.01.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 01:15:29 -0700 (PDT)
Message-ID: <dbea269e-2de6-470d-96b7-ce1e07c8de07@linaro.org>
Date: Mon, 24 Jun 2024 10:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/2] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid n2
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240613123020.43500-1-linux.amoon@gmail.com>
 <20240613123020.43500-2-linux.amoon@gmail.com>
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
In-Reply-To: <20240613123020.43500-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_011532_700930_0E0F0D10 
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 13/06/2024 14:30, Anand Moon wrote:
> On Odroid n2/n2+ previously use gpio-hog to reset the usb hub,
> switch to used on-board usb hub reset to enable the usb hub
> and enable power to hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v7:none
> V6:none
> V5:none
> V4:none
> V3:none
> V2:none
> V1:none
> ---
>   .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++++++++-------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index d80dd9a3da31..86eb81112232 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -31,6 +31,30 @@ hub_5v: regulator-hub-5v {
>   		enable-active-high;
>   	};
>   
> +	/* USB hub supports both USB 2.0 and USB 3.0 root hub */
> +	usb-hub {
> +		dr_mode = "host";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* 2.0 hub on port 1 */
> +		hub_2_0: hub@1 {
> +			compatible = "usb5e3,610";
> +			reg = <1>;
> +			peer-hub = <&hub_3_0>;
> +			vdd-supply = <&usb_pwr_en>;
> +		};
> +
> +		/* 3.0 hub on port 4 */
> +		hub_3_0: hub@2 {
> +			compatible = "usb5e3,620";
> +			reg = <2>;
> +			peer-hub = <&hub_2_0>;
> +			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
> +			vdd-supply = <&vcc_5v>;
> +		};
> +	};

Why is this nodes under / and not the dwc3 node ????

With this current DT, there's no way for the usb controller
to find those usb devices subnodes in /usb-hub, and it's clearly
not described like this in the bindings.

Neil

> +
>   	sound {
>   		compatible = "amlogic,axg-sound-card";
>   		model = "ODROID-N2";
> @@ -234,18 +258,6 @@ &gpio {
>   		"PIN_3",  /* GPIOX_17 */
>   		"PIN_5",  /* GPIOX_18 */
>   		"PIN_36"; /* GPIOX_19 */
> -	/*
> -	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
> -	 * to be turned high in order to be detected by the USB Controller
> -	 * This signal should be handled by a USB specific power sequence
> -	 * in order to reset the Hub when USB bus is powered down.
> -	 */
> -	usb-hub-hog {
> -		gpio-hog;
> -		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
> -		output-high;
> -		line-name = "usb-hub-reset";
> -	};
>   };
>   
>   &i2c3 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
