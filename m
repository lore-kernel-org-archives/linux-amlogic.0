Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF268C25B7E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 13:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbUAJe0xEOJ+leo61fXosY4c1a0Weov1QS0ls3YuQ8M=; b=q4mOIdho3Zi8E5AcI/SImNisks
	BlwFFTVwTqPEiixM8EFc6it8VE3xr9ca6YBYfUPinIFiLzYZE3DFEX/qh3aKfwZ4uQSUAhjQwLD3S
	TDfLSvHAYwZn8r9kSS/p/um+/GMd4+r8rXctlj6F6AfXQz9pgRbU6xbN9HEQPFwCLaozL1SZLwb8e
	iYQhLBeXoOXDtyrnINTNxgAw6/dPhg/TP1+qB9P3Jjo4ezd1swzcP6hK4IWgZLVaSPOCl7w+9FmP6
	QAi9ZjdES6+HYHlAk/WLobAkw3I5IlF2tbguvdIo1vSbYRrGK6kWvm5d3Z22sHHxZs0sFAsgva24v
	CuskoVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETxU-00000002S8j-0OKZ;
	Tue, 04 Jun 2024 13:12:12 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETxQ-00000002S7J-2bnU
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jun 2024 13:12:10 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2eaa89464a3so28984841fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2024 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717506725; x=1718111525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scoabqS6+XucB7o3404ijfWMEletkULCboMQ7PF182w=;
        b=OUVI2bbOYguaT7qc6uI5bX+IRR6zif/lhKMAxvunsgnUTZtpCH9S1HwjwfVLlCwvnN
         RMok3iINQgGamAeTE+ogPYjl5wF/NN44DYTq6jc9/pSWJdITkSfPRUIuRwPdyttLApSK
         qa+dUVIYw6uJELpdZja685F/G94qoQIY14a7/A84yXg+R5bKGGtHlZrEJ7+ZEFE4gKvJ
         8KqlFcL/kkuvRJpdjpsZL0cQg+q6TNKF7ydXH9BSIDi64pb9uaPsCV8Ftgx7YqaY2Opn
         lK9bhBstHrJAOimDeNUfxmouXoyKgbWTbQYyPYjAqZ3VTrW6IxKqTvqriFGu55S2y026
         JjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717506725; x=1718111525;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=scoabqS6+XucB7o3404ijfWMEletkULCboMQ7PF182w=;
        b=OfC4ZjpiRBj8TX3FwoFs3bLy7LH2zIgum2vZgfrjikrCkX6HlDUAZC5aII21g6AC0o
         5ZDYSf1srQKPZLgkqWZrgZudJw23Podk/hKJZW1qqJFPyfUDeL85f10a6u3dFgD3MYDJ
         66R/T1ATwsLyPjyEjmztcQaVBCR5pQfhebMvOBNvfio2VjbXYaUgDlXSNJnOq/hLUImn
         R+9rrcDuJezVgz34nN6408c05kcefZIMMyR0G8rejv/Y+X90p7uSe612/1mBVVnM1PXX
         kU+u/O1O0vnwvT+4rD3jTLSIQOVtX/cdxenqo2X9PJgxsei8RfLUL8JTzSoDMqbk8BHT
         fBbw==
X-Forwarded-Encrypted: i=1; AJvYcCVUjPWiiWGu4APmZgRGP8GNBXg//KnAwPVFfbEOwM+92hlfwID2k2AP9wvPQirjZb6sWoIPoPVpa0PfaZtEU+b3CibDV5oO13y2IodZpSAg5eo=
X-Gm-Message-State: AOJu0Yxk4y7nzL0YHANwNfNO7jIkmuBzIHPy/wU4bIdSR23N+n2hMHKK
	KyPOaE+19+CNuu51k7Mo5jGs1QB4UySRLEkau6uYVLcRo5VbtBqj3mXjU+PyFxE=
X-Google-Smtp-Source: AGHT+IEvFTfvdKINEDRD11Vcd01v7jqXDgHD79oA6Jf4/oVf1B01pQg+yySRPRVnwxYWE8QOmGpS0A==
X-Received: by 2002:a2e:b8c7:0:b0:2e9:5263:36e9 with SMTP id 38308e7fff4ca-2ea951d5c81mr82447921fa.43.1717506725401;
        Tue, 04 Jun 2024 06:12:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:409c:8ebe:886e:8c03? ([2a01:e0a:982:cbb0:409c:8ebe:886e:8c03])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb49ebsm15646791fa.34.2024.06.04.06.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 06:12:04 -0700 (PDT)
Message-ID: <4a4ca630-f71c-4012-a076-8e31b67b2517@linaro.org>
Date: Tue, 4 Jun 2024 15:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905L ID
To: Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240604050752.3312468-1-christianshewitt@gmail.com>
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
In-Reply-To: <20240604050752.3312468-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_061208_865599_0110A133 
X-CRM114-Status: GOOD (  10.40  )
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

On 04/06/2024 07:07, Christian Hewitt wrote:
> Add the S905L SoC ID observed in several P271 boards:
> 
> kernel: soc soc0: Amlogic Meson GXLX (S905L) Revision 26:a (c1:2) Detected
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 6abb730344ab..7e255acf5430 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -64,6 +64,7 @@ static const struct meson_gx_package_id {
>   	{ "962E", 0x24, 0x20, 0xf0 },
>   	{ "A113X", 0x25, 0x37, 0xff },
>   	{ "A113D", 0x25, 0x22, 0xff },
> +	{ "S905L", 0x26, 0, 0x0 },
>   	{ "S905D2", 0x28, 0x10, 0xf0 },
>   	{ "S905Y2", 0x28, 0x30, 0xf0 },
>   	{ "S905X2", 0x28, 0x40, 0xf0 },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
