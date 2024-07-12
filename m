Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111FC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jul 2024 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpzUXFDr/U6SQPIvxGmliDG/Exp06r73TJ5izUF+Ea4=; b=ZjkBxErx4XBjbb11aCHCw0InD3
	QPJZhLe6Zs56H1n1HzrGia5Eowd07/nVKt+7Qbj11zPLBugcIvJ7QTCj7aR6E+dgZxZ4jA0LzsOxe
	+AHWtrNU0aFofVLMG2JrVWmVLVtO/4zAzznhj/xn8Z+SRQp1F0NCTNIqRygH2kdXixzC9B8c80aoT
	/TuTIKtuvzpehvvldWLfbMZ3ON1hKoBRAmyWMhZ2CvZFphyksFr5xHjsVnNOjMXCR2Vw5FgmI5BHA
	n7iU2kKIkWl+fsNNXkfNaBtlO5mBkExrYdvOfPkNoEzcV/OnrtS6acsJEhIRh+WEl9sdfOfo5SvUD
	wmP2StPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDEs-0000000HEyj-0TPp;
	Fri, 12 Jul 2024 10:10:54 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSDEZ-0000000HEuH-0pHe
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jul 2024 10:10:36 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-52e99060b0dso1994628e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jul 2024 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720779033; x=1721383833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YLpvBosXYqA/rvkTh0mT/aSKt4vIFyBn/RUoc2V2tCE=;
        b=CQM7aknvTU9Y33te2STMAZKbx9GzPlawj9MQvSYJKC5tpLow2zhZLm28+5ct/UivBc
         x5/Kedmg+CT0LZOTpTNnSts6WZq3MyaOV4NnAevfEik2yhAf+3vuHf6esitR2rgJlq6i
         04h5d4HEmrnMIQqJd8SWpT8wlYfUeygTdGjErKRYg+nu6xzUEs35T4Zv/F6zHj+oeNNT
         KS568gqYS4li1XtbpksNQEmdmaOQBWD5eQ+OLE88GzDHmdllx4RLXqgn//AyINnDlG+v
         qK8Mu3Yn8GzAqE2cJpqpJpFGazzitRLbr3cC1IEAkVtv2nn7n0rbJAVovNgBYOFZUrwR
         s/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720779033; x=1721383833;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YLpvBosXYqA/rvkTh0mT/aSKt4vIFyBn/RUoc2V2tCE=;
        b=gkLtYwJ3RngAi1/ny6FoJANBKDFI8AE/mJsEU/9Ag0lUmTGidaGELvEUbG3Qjh9Jtj
         tkiuJisNg9cT5OuryCkN3rVTQsk61lhfvaTtaidg7E/ELSV6yDXVVSu+iPqfTZV1huLA
         73jG6v1k2yDqi3UJaUxDLeGAkLF7LNT4RwObUcbVf4RIUQZkaTD3iaXVGz6c6rdz717+
         cW232yyJmgsdNTTVY5dyAEN//0azj4cZf3UL1HLP6w3rISaJIInfyzX5QUS9utn3By20
         2hJpI/2uJdDjeQUopBZEyCB2dNFeykKymy8nzt54Gc5kuty4RhR4cVufcn+U5fRIQv32
         1AFw==
X-Forwarded-Encrypted: i=1; AJvYcCWl/amYg4Sgor0MigpxSTONc5wjNqiTiJHtwneanP+BhsVwBBb8NMoBgt4DWoyunxJ2ILWyzl3xwUDkhbQX7w69r0n5RuTlYNYRm1LNIOiMha0=
X-Gm-Message-State: AOJu0Yw6iKv2QxwRRt+wJLjMnPGyy0p+M/pi9tUoQHIRTH3J43oBt4Ex
	nfOXBBumxeO5vd1whG1pLM2cUDhOA+ddeIcQocLjABADFVvKorVSTannJ2PRrFo=
X-Google-Smtp-Source: AGHT+IFyqA3t3hkhhZrqF6nOtAnOoKoNqbS8mdY6Lc2Js711DlS8tj4mRAf2O93AAOxPA1QJBSNftA==
X-Received: by 2002:a19:f509:0:b0:52c:dfe1:44ea with SMTP id 2adb3069b0e04-52eb99913c4mr6234622e87.6.1720779032594;
        Fri, 12 Jul 2024 03:10:32 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964? ([2a0d:e487:123f:f92c:dc0b:c36a:f16e:7964])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36802d3f680sm1378714f8f.33.2024.07.12.03.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 03:10:32 -0700 (PDT)
Message-ID: <1dc131f7-b5f3-4219-9aac-7a5155a41165@linaro.org>
Date: Fri, 12 Jul 2024 12:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
To: xianwei.zhao@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240712-soc_info-v1-0-05ba95929d5a@amlogic.com>
 <20240712-soc_info-v1-1-05ba95929d5a@amlogic.com>
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
In-Reply-To: <20240712-soc_info-v1-1-05ba95929d5a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_031035_275535_E79DE1EA 
X-CRM114-Status: GOOD (  10.97  )
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

On 12/07/2024 08:54, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add new definition for Amlogi SoCs, include S4, C3, T7, A4, A5.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 8809a948201a..7549f1644e5e 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -41,6 +41,11 @@ static const struct meson_gx_soc_id {
>   	{ "G12B", 0x29 },
>   	{ "SM1", 0x2b },
>   	{ "A1", 0x2c },
> +	{ "T7", 0x36 },
> +	{ "S4", 0x37 },
> +	{ "A5", 0x3c },
> +	{ "C3", 0x3d },
> +	{ "A4", 0x40 },
>   };
>   
>   static const struct meson_gx_package_id {
> @@ -76,6 +81,11 @@ static const struct meson_gx_package_id {
>   	{ "S905X3", 0x2b, 0x10, 0x3f },
>   	{ "S905D3", 0x2b, 0x30, 0x3f },
>   	{ "A113L", 0x2c, 0x0, 0xf8 },
> +	{ "S805X2", 0x37, 0x2, 0xf },
> +	{ "C308L", 0x3d, 0x1, 0xf },
> +	{ "A311D2", 0x36, 0x1, 0xf },
> +	{ "A113X2", 0x3c, 0x1, 0xf },
> +	{ "A113L2", 0x40, 0x1, 0xf },
>   };
>   
>   static inline unsigned int socinfo_to_major(u32 socinfo)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
