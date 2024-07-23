Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE587C3DA49
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jul 2024 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Gv0gCu56btlJ5bT955zCdtLfYapY0vc3uszjYfcJcc=; b=wViNNFRH1K4ZJWLdwajIsKi7Yv
	da15JwlE54EdkxUGDVLaqr8jB8pXi8hs8lZGDF6ZG9yJEk8sQZWwM1JrICw5cXC/X+yF9XX+pLpyy
	HyEM1WiZYFO/apw/N4XU/+k4xp52oJeDSeY92ttX6xh4HUj+1dkyg+OlsdR/pI1ZLa0Z+J3SqaX6O
	XQtbU3NAlFV1zJ6PUGrv0d8FJ7ysDUR8OZ78cHoh2JutZrbnpPU6TyrIBJM/VsGdFxERwQvjHYL8I
	rc4VgJciLpOBOwsk52AJaR9XRtdksBUK9JgYhpvxvfrKx9CLOHoQhZhV0tC5PVB9lRzhSG22Rp4++
	oAFIxvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9nc-0000000BhCA-243I;
	Tue, 23 Jul 2024 07:19:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9ml-0000000BgoY-0wIB
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jul 2024 07:18:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so44668265e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jul 2024 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721719089; x=1722323889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydCuwPfj0pEnlU6AaFBIoa0ru0Br3Df785ipYUCvBEY=;
        b=VK/qRQq6BR8PEG69dUrl6lyKbbz6+/dCeWumdeBP6hOIbiyopVjQ9LtxPnwYnZMGH8
         rg9bkY0L2kmvVGln0s8oKz/Hk/GOJzysRu7MdNubssU0teKsTbSQtMz7xH6JYEdvG7C/
         xGjAYDOf8UIRacU9WCGFfB/5jSMPInO1y+EuhXziTdoj2mqy/1Lneq3zNaY2yIWpBaqL
         P6FoawCnZ+/RX+RJhalgNWuJcG27UrdFQuGHps+YASVVugEwsqjRyVfXtneViGNKRWC5
         wXp71k13XLlzZTKgleJeZ3JfNGhF+RkFr+ZoSwz+kJRyTJwGYuWS16MzsD+yXiiSimbA
         6aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719089; x=1722323889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ydCuwPfj0pEnlU6AaFBIoa0ru0Br3Df785ipYUCvBEY=;
        b=UwoQP6FW2sSCYMvCQM1f9LrCIbryD2R8BFKm8pBJmA3KFp4FIBLfOEDS1aI51SxP2f
         C9fexGdrrK1+lWdTuw9db7SzuC2K/qi0xWL+e3msgqjflljs25xAqFxizoHFxmkcJNEE
         RAYJRchZ7Csqj60Yqef6cQmw9UolSrs+peY1l0XZ7aJWf6QzevM5IeLCVCvPSJ3tXS8q
         Xcq8WiHtKBhH4hs35tcPR6sEbslvHwlUbJaqCYxoSHvYIQaNEirN6+pKud6OvRKNW2G8
         aGE1thl8v8MJI1USMKLvIlvn+fSv+E+RYI9eGZkU+R/irj7wrheIO2LMY+lhO4zYaXiC
         St2w==
X-Forwarded-Encrypted: i=1; AJvYcCWket2RmFz1QuhA9gO9lnQx2D7ljAvoDxX/bhHZTh/TUxks/nhDgLpc1ZX9Wq3HzVb4Vil0FnHMv/o/8feK9E9UPxHP6r00LT8qvVbY3Vofr+A=
X-Gm-Message-State: AOJu0YxQ2JlIUHgO0XypfJyLRQJYD332wnRqw041n61TtW8uxklWYR4L
	XPT7UEF4pHz/qmSK76fhsSv1j28GXjLf64VtAFAh5kvJQgqskcsA3XnBhn6F69A=
X-Google-Smtp-Source: AGHT+IELyNJ5MhVuAdHi2FQf/t2l5VCVjB4hpHHZgvCgFFNLWcDsIdKM0hpiiWJhF8fTDE9KCN0JPw==
X-Received: by 2002:a05:600c:1c92:b0:426:5d4d:d759 with SMTP id 5b1f17b1804b1-427dc55ba36mr76696805e9.24.1721719088523;
        Tue, 23 Jul 2024 00:18:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c? ([2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6936e1esm158776455e9.44.2024.07.23.00.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 00:18:08 -0700 (PDT)
Message-ID: <4c4f2d4a-c748-4158-bb30-a1c22d5a2a34@linaro.org>
Date: Tue, 23 Jul 2024 09:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/6] arm64: dts: amlogic: a4: add ao secure node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
 <20240719-soc_info-v3-6-020a3b687c0c@amlogic.com>
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
In-Reply-To: <20240719-soc_info-v3-6-020a3b687c0c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_001811_314379_5C4404B7 
X-CRM114-Status: GOOD (  12.82  )
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

On 19/07/2024 10:08, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add node for board info registers, which allows getting SoC family and
> board revision.
> 
> For example, with MESON_GX_SOCINFO config enabled we can get the
> following information for board with Amlogic A4 SoC:
> soc soc0: Amlogic A4 (A113L2) Revision 40:b (1:1) Detected.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> index 496c3a2bcf25..54d7a2d56ef6 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> @@ -67,6 +67,14 @@ uart_b: serial@7a000 {
>   				clock-names = "xtal", "pclk", "baud";
>   				status = "disabled";
>   			};
> +
> +			sec_ao: ao-secure@10220 {
> +				compatible = "amlogic,a4-ao-secure",
> +					     "amlogic,meson-gx-ao-secure",
> +					     "syscon";
> +				reg = <0x0 0x10220 0x0 0x140>;
> +				amlogic,has-chip-id;
> +			};
>   		};
>   	};
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
