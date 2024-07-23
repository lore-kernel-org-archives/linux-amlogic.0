Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CA0C3DA63
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Jul 2024 07:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xS5fmez6UEmNecmeNvDzQi022Ta3z0ZyzIVbVB0p4E=; b=aTZDYT7tc68eDFzUSXPFDfrOuV
	YZd6kTdEJd5SUUtvBa2BNuUGrnjOBcP9CsoOv2p/wzCd+DkpU1BI+EkGi/ZRlwb2uQd4b+yVg5EXc
	SC6/QJh4jXDkgrJWz1hT9Wlh3fL81oQ0Hc7FkTldPzuOpVVHL1SlPb+FT17mJUrSEPFYoSk8QHc6l
	7+1uNj//hWw8DvxNeZZkAlswCrANBEVpc+CA7UFQyoHpddefv5yjXjsFufGdPygV+V/WKnsr4zQpm
	w1sREtHZaDbg+j8YD/5MH2jCis0O24SZ29uOXbYW6Annb96qUaNICtckf0vvcipDL5uJCholwBJSp
	Jtk3ar1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9nF-0000000Bh0N-1Tre;
	Tue, 23 Jul 2024 07:18:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9mZ-0000000Bgl1-3EkU
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Jul 2024 07:18:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4266fd395eeso36879215e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Jul 2024 00:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721719077; x=1722323877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEzKhKkmBYXTdhjYaBlSuqId8UatDTOuzDSqNIi2wrM=;
        b=Vr6UgCEyEAsOapxkNyh8dDV9FKqEVtrVZDsR9oFTc+uhdN95kE+0DX6oGYjzX9Lcph
         7+gjKRuNpQW9u87SA8AcqM0J0LY20m1hM4PhgtiTr1Nydf81qXLXXzj9U3JELebzk8tt
         Vj5IYUwdR+jwjB8UHane5o4G9XEdhYgHoE7x9jVO6SLJtapp4mPck7Ujdq0nQBbXJyJ7
         TjkQkUKASck2ogcUQl25Ii9JxJnEtyg5Uf2ub/0bZW/BCe0Bm//GiCqfz1+RrL/oj2rd
         t6198oayDUcpUF3k8O6vefxKeNnf+j5NkVb10k5uf4RMPo31A2Ahbgk3WhtbaZ29DAS0
         LdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721719077; x=1722323877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SEzKhKkmBYXTdhjYaBlSuqId8UatDTOuzDSqNIi2wrM=;
        b=uOlokEO2WRMUkOmoN7vlXC+ruQBKs4UcRs17XdHkY5o/23zUqtS8EBfuc6sPVCkXaW
         LhBU9DrFI/A3TO1oEcajOSlOoC4QPEOz4MfJyttgOh84QtU5u3ZSaC/GNSyH1b7gAuz4
         bpH/F4JR4uCG6oYH5egYjGhDSCrA3ypiYfFTZwTK5zeu24vQ2BzvaSLmzUbkwYTB1qib
         VAXnOWtPllwls1ifVmu4oQg6e9U3jsAXsYqSiG2D0LX52kQ1ZKIMFjdxfoB71uZUAlbY
         viwGKmiIwoRrTn1s11n+LJX10oiljgpRM7xIoGLB/xnTgdoMKBiVH9Z6UqtFAk5TXbp8
         5KYA==
X-Forwarded-Encrypted: i=1; AJvYcCXBdcHsIzfQzDBsL7OYqBQAxVywXFvmMaIifFr47jnbIlkByTzYQaHG2IWjIcT7FmhK8MdkEBvqQ3OVPjz2CCqVmuMx4d3KqmKBgJC1n3cg6TQ=
X-Gm-Message-State: AOJu0YxotWEHIDvIL36m8uOtbgEXOn83u60m9VcUTld8tOAcf1oQ6Xy0
	9ojRfZm/v+0FZgMixg5l6c+3glEyumj8FEY8wmiOpIsnReLYJvUeLhii/zn9KBQ=
X-Google-Smtp-Source: AGHT+IG5n+S9PIM/0u5fM2WVXGS+r2GwBeka2nKCjJ0cyEzqu/DQBNvtsgFCLCrhKI64ABkCE5H93A==
X-Received: by 2002:a05:600c:3547:b0:426:6c70:dd9c with SMTP id 5b1f17b1804b1-427dc58f1f3mr60943655e9.31.1721719077311;
        Tue, 23 Jul 2024 00:17:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c? ([2a01:e0a:982:cbb0:f9d3:b429:5f14:dc9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6936e1esm158776455e9.44.2024.07.23.00.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 00:17:56 -0700 (PDT)
Message-ID: <e5dc20d1-3cd7-41ee-955d-f7ba4d80c607@linaro.org>
Date: Tue, 23 Jul 2024 09:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/6] arm64: dts: amlogic: c3: add ao secure node
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
 <20240719-soc_info-v3-4-020a3b687c0c@amlogic.com>
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
In-Reply-To: <20240719-soc_info-v3-4-020a3b687c0c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_001759_870102_CE74AE91 
X-CRM114-Status: GOOD (  12.66  )
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
> following information for board with Amlogic C3 SoC:
> soc soc0: Amlogic C3 (C308L) Revision 3d:a (1:1) Detected
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index f8fb060c49ae..c913dd409e64 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -129,6 +129,13 @@ uart_b: serial@7a000 {
>   				clock-names = "xtal", "pclk", "baud";
>   			};
>   
> +			sec_ao: ao-secure@10220 {
> +				compatible = "amlogic,c3-ao-secure",
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
