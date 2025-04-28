Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD4CC369D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Apr 2025 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ob/QW73jNlvXeKJYgvw8sWH74JCYV2jEsr4OL5rElg=; b=TRvIGnYXAOcuemSYmR2yHWnvSm
	FK+J09NqOf4XBXHFy9o38MBiQ0Ydq6SyFAMpWuO+IH4q/agq6s/eq6kFCCoU63fjat4CtQBbPNzDs
	O5SdZDKFY3ZsQQ3aqKPbW6qeImmwrNk9lVNjoex2Wrz9aNbM2fH3uf1RsuzXSrGSBGlLDB0r+e83a
	MdFo8FSs3h3VMpAivOIXOb92s6iYtulPdz+NDHumZdMNZMN3XmKLH2sy2zSGrC57IdXsGDx/HM2St
	z6sHkZrgc9geuShaFvAy4Cx24/dG3kQD5sWhZ33WDywSGjsTOMTmXiRzGahCBlqer1knL0sL15A9M
	g0FCO7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JFP-00000005JJO-2lJg;
	Mon, 28 Apr 2025 07:49:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IyJ-00000005Fwk-1RZH
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Apr 2025 07:32:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d0782d787so27243865e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Apr 2025 00:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745825529; x=1746430329; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=uwN+O49PFhCNigqKXGdskQVYWVp2sKtcshF5pBxHnrr6VP89q5T0hPKNdu77s6fGvG
         Z4us2FBPogFhj6EzBic7L1T1hSCsXS7pvPIFWNuoUhQnwg0piGl00rS5R89oTd/HoANO
         Ga6lSPDFuAPNBs/t2zWc504MFo7/X4PWGV7VTyWYSVZAPfKHT1eqoitb48A4x4h/UTfx
         hIqqS1rkt3Csj9/muZFclL7veUPUXky1OQyC+4NWpS+rJs+vnQhtMJ1GXUw9huV9LGGs
         BbFC3iPULuDtxuYPO7TpHy4pPYqdNAB9mznvGOeMI//BcgHVdWqXPlkRoadfgmWBZcZx
         iiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745825529; x=1746430329;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gGcH0UeKddFKvZzS6VK/UwJ2UKFscoxXJBXhLgGEGFA=;
        b=aB3MmHAJT/k140wJH5vftV24RB/NL/7b98USCidtHnlfmysWtx5MoVIQWuTjLm2BrY
         qk/brupywY9cKcpQWiWnPRIVZKkH3U04k5+Rqa4l6l8BNNRGFXS16+Jo6NWoJsA7q5SC
         C0XbyShrx56OKIi0Mab30t49lipHMwIYS9tTDJQJLmlFfp/mxiMK4hc3i9HF3hX/FARM
         ZhiScwuEgU60WEYVbWuko/wxsTvzO2IODww3CGoQbfMPtyX1GKsOhQhbTqNRsrzQwI/J
         XdaczXmNEy5L5HuHiB2oYiQtVq5Z74ax3a/WG7+xlenbdR79Dhxecs3isCHhM2Ezwx7/
         3lmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvrJJmoqftQYdBvETeHA36aHFpgApqYO1Y8fxpL5Ej01sty7Mz351FjqNk2DZ3xeIvmqLq6mqrqC6UaGpM@lists.infradead.org
X-Gm-Message-State: AOJu0YzyO0KRYjEBvLYCYT1eetu+Bbry4p5QGPrhxwMAvuhSB4+jZAAt
	9iJJ40dIrnnA+v5Csn0S7+tJQC1yDF62NnjGnTlf4LNSWo676g5JD+1m3ljqfGo=
X-Gm-Gg: ASbGncsvumcDjuX5GzrChXIGg0D8vayD0PUC0+3Pgv2lXb86TWS4DmNhCtvIvur/Cq1
	fVElS9M9EmjXejSxOzqWlFUdshhO+oVIyzLEY9fj9aQi2oC7SJnKgWfkRtR5VF4y6fbxsgxhxa/
	BFUhfJ0L/lQAZ55DLPuA9zIziZ1mBFEb1RA6Sg73fd0Zm0EucZ7gn4gvoXO7E/3uUzd2uUtvNt0
	RgHWB91binVxun47bfeEn5Yh6xIwBXj6nh9jGMjAjbEDpaqIIfAWwDUZ3rYVndZpHDK0P4S1Hj+
	UypywuLQouR9yWCPMe7pYyq/ufrzvF2+6ZbC9kame65cfgf6RfzwpHg0bkDYWsYZtQAHU5v5dOO
	h3B+yLT/W472kOzKyRQ==
X-Google-Smtp-Source: AGHT+IE9IxrEQndV7PtNABLrBikOF06TG2rz/qdA9+WaR/LH3kMB0rSX+0YP2PDCf8juRT8QFLptjQ==
X-Received: by 2002:a05:600c:46c8:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a65d8c6emr88097415e9.9.1745825529140;
        Mon, 28 Apr 2025 00:32:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00e3sm149222995e9.34.2025.04.28.00.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:32:08 -0700 (PDT)
Message-ID: <20523c9e-f7de-4355-82ed-380ee03083f0@linaro.org>
Date: Mon, 28 Apr 2025 09:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Da Xue <da@libre.computer>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
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
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_003211_383293_C46B3472 
X-CRM114-Status: GOOD (  15.52  )
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

On 25/04/2025 22:31, Da Xue wrote:
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
> 
> We should set the bias when i2c pinmux is enabled.

So, yes in some cases when the on-board pull-up is missing, the on-pad
pull-up is required, but the whole idea was to only add the pull-up property
when needed.

So I know the real motivation is again about the 40pin headers, where
some applications don't add a pull-up and still want to have i2c working.

So my question is: why can't the pull-up property be added in overlays ?

Neil

> 
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 2dc2fdaecf9f..aed8dbfbb64d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -214,7 +214,7 @@ mux {
>   				groups = "i2c_sck_ao",
>   				       "i2c_sda_ao";
>   				function = "i2c_ao";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -576,7 +576,7 @@ mux {
>   				groups = "i2c_sck_a",
>   				     "i2c_sda_a";
>   				function = "i2c_a";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -585,7 +585,7 @@ mux {
>   				groups = "i2c_sck_b",
>   				      "i2c_sda_b";
>   				function = "i2c_b";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -594,7 +594,7 @@ mux {
>   				groups = "i2c_sck_c",
>   				      "i2c_sda_c";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   
> @@ -603,7 +603,7 @@ mux {
>   				groups = "i2c_sck_c_dv19",
>   				      "i2c_sda_c_dv18";
>   				function = "i2c_c";
> -				bias-disable;
> +				bias-pull-up;
>   			};
>   		};
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
