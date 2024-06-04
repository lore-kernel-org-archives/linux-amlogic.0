Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DDCC27C50
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 14:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhCS+ji9EraBho7yEg/DFP/IOQgQK91tXvEY9EYdKCY=; b=lmXSVPXkbql1WbPfi3Y2qGvnmB
	Qj1ai5EBzatbqIu04WRkz2/OFqsLh+snXErb262GDx27zZMTnsYbzrnmrcZEzYKZzpA20CUWstbJn
	ooj5/qlaBN51hm8Djbp4gR/aDMFzJxvEqyZPGnEFPG+2/UURFbSw+y4x9ObSSSaMd8FceTvEIDLZd
	/tSPY2j8l+UMIoiCjNHZGvSD0fDZYQlz/nyIpQ/54RN9m35EoDxjVgZ/LdPruo8lfqyzNz5NqYtsF
	0RpybfiTQdANa4D4po6a/P3x0OWVi+RXuP/PnmInOiR+ntW8nn0RGGl9/OUcH3ZKG7jANgwuZoKAY
	vZ2wxpeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVLm-00000002lqK-2ISE;
	Tue, 04 Jun 2024 14:41:22 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEVLi-00000002low-0V9X
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jun 2024 14:41:19 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2eaad2c670aso13621771fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2024 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717512075; x=1718116875; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vQBqWQKdiSCGnWlHt/otymCNpcbYBOH6U22YJB9LlU=;
        b=WswFTgiRt/NXUUYsnIT3pOUXGhWgkSZ9mZy8Bre3FhchPbcDq+iHfo1YpgkcM7vNW+
         zHvVQl3vNhTVoVqSw0DOS7Taer2av5eCcfi3LhmQEZQyPOHRmyusou3aU0D/Rit208rb
         McVRwgmBC+8qa/Rdvfwc35yyUaeUjSdINKjhT1yORYSvoWj0yf2O4Tvav0jruk19AjQ3
         aRXZtJIT4Qj0IiOyrvzecc57/ehFB9BOBbgtdN5Vo8w74GEyiQuQTGH4/Yt9UTkWyQ2y
         55mCSeLsbnbsd/M3lL1H4WkLL/+tY+UNZ1nQIu1Yr/BFCy8mYINFUI3r7dm+0JA3tF9x
         /E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717512075; x=1718116875;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2vQBqWQKdiSCGnWlHt/otymCNpcbYBOH6U22YJB9LlU=;
        b=RUzGdt60ArDPEQ1ow0on+d9n9YYzYnYfyaOXK5373tk7azjoNdMXk9f3wJ2jVYPh45
         x6mCBcjpCHnamnN4QbRoKxpGuK03OzA5uEAx8cKGwQAbocJ0EY0I8R3IH7GtFBnI/6vP
         0adHpZ9vQo34fTIVg42+WBxbp0CcoNOg5clqr62NSzisvbTc/bweCPYVWvG/hVJy6Vdb
         Hdw0QSKSmc4prC0CQXx9uZg3nCOvHgalMHqbMlX/UBeexMlQiXuLn88yC9CkxbUo2FGL
         TcxoMlxZ18c1w2OWBzEVduSCRxR9NFeMXcFM5kxPxRBBMt7Y60fZQmwSk7EmV8MDZr1t
         aj2A==
X-Forwarded-Encrypted: i=1; AJvYcCXOJyPz30roY3rDwH/g7mBjQx714k3bGtEIQ8TcEfY4CuuA+FHPukZh3Jq39DR3d0s0/X3BV4Z50HbzYCjtS8x8uZx4PylhEL6p7sByB5TiavE=
X-Gm-Message-State: AOJu0YxC0t87KsAJ5V3DVhRAZFQnauGEIOR7ZMrbZ23mPMb0phRtHvTm
	sGyKc52IiIMgveBtArbFEFACyfWZqSBmpNdNW0z7kK0/CZI1s8A6146bdpordeQ=
X-Google-Smtp-Source: AGHT+IEw13AJKJtvmeJ2e7Z1/3vaawvXvsxsctB4K5CR6UoYlwjJ6aniOCKrnfEuV11Hr2LCfmJdLw==
X-Received: by 2002:a2e:87d1:0:b0:2ea:7e38:7968 with SMTP id 38308e7fff4ca-2ea951e8561mr75046131fa.53.1717512074957;
        Tue, 04 Jun 2024 07:41:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:409c:8ebe:886e:8c03? ([2a01:e0a:982:cbb0:409c:8ebe:886e:8c03])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a4cc0sm156510835e9.30.2024.06.04.07.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:41:14 -0700 (PDT)
Message-ID: <97365305-6152-474a-8866-6e4730aa9add@linaro.org>
Date: Tue, 4 Jun 2024 16:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: add new A113X SoC id
To: Viacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240604140612.1179323-1-adeep@lexina.in>
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
In-Reply-To: <20240604140612.1179323-1-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_074118_259694_118BD959 
X-CRM114-Status: GOOD (  11.00  )
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

On 04/06/2024 16:04, Viacheslav Bocharov wrote:
> Add new definition for Amlogix A113X SoC found in JetHub D1/D1+ devices:
> 
> soc soc0: Amlogic Meson AXG (A113X) Revision 25:b (43:2) Detected
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> 
> ---
> This commit is applied on top of Christian Hewitt's commit with S905L SoC id.
> 
> ---
>   drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 7e255acf5430..8809a948201a 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -63,6 +63,7 @@ static const struct meson_gx_package_id {
>   	{ "962X", 0x24, 0x10, 0xf0 },
>   	{ "962E", 0x24, 0x20, 0xf0 },
>   	{ "A113X", 0x25, 0x37, 0xff },
> +	{ "A113X", 0x25, 0x43, 0xff },
>   	{ "A113D", 0x25, 0x22, 0xff },
>   	{ "S905L", 0x26, 0, 0x0 },
>   	{ "S905D2", 0x28, 0x10, 0xf0 },

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
