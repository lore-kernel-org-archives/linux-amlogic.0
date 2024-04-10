Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15313CD1299
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXZUq2Nvcr6Ug9yhIjmLSFRAENO+chldPXnMQp4obSc=; b=wxb9SjIp81rAXeEXR3IYvH/kz6
	CrMG6PhnWUsRnCE1U1MwZv5sgRC9FnOTINDsScaTj0+pOF2/1k2ihFiq4bVtp2rM3i0wKvyRgPw05
	UDAoNMJYOFyLxJ50eHLDVBJQAsuBkra4RLz8SX6AqciCZL3xNBHm0mHF5L/smsyMlY1HrVYxucSkK
	O/kbbj1yCCQCtKs6CjKC4MbJIeXA/cZ2hNKl5lDhcALzWxDA47z9N9C5Gg+KTspFhjZ8ypa0vc9lV
	97QdQKYdsl+3CQINzmV8PRwyb8tAkBI8IdsPcJeynZhlixwv5C3/4vhWZj6vu0Xuk9bTcqgvNA4Ab
	gXRFVvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaJN-00000007tf1-0KuX;
	Wed, 10 Apr 2024 15:56:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaJ5-00000007tPW-2GA0
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 15:56:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3442f4e098bso2455482f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712764573; x=1713369373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMdmKuUIz4lixjCtcUgme1poJSOdnyEZp5xiFsRRNeM=;
        b=DeU8pxSbIJ+D+Y2b0jgVRfUxLu4x11mm2Gm/YHsi9IubeF6FuRJYuYoqjkoIfsxsOq
         v3CsNPTNcCVY8cjv+WMcc+QIcrR+dvJ2ufdPzg2poYJ/ehdP3yc4W2VCcC391ttF8NCV
         5pEhMr4rW68OCD235+SuAnbzBhSu2HTyCCaeHJffEHO2QwbtcH0K78Er0G5cKlE++FpK
         nrk+H41ygeQEkXvh+cKNhoh2zfYTCewYGFFdNs4r49ouBb6tLVZeN2Ni/VMkLQLXXCD3
         jboq1Tp7oYSgT2xWj30sE0BcGgwZ0QYHMJjS8M38OPVnwVC+A1W72BHhS1Qo4WgEy9r4
         BDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764573; x=1713369373;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HMdmKuUIz4lixjCtcUgme1poJSOdnyEZp5xiFsRRNeM=;
        b=X4Jgg9WKaWJUH1aBUEDHSlQfmJHedygPn+6zJIVmuzk2W2MxSEQcup4/Zniiqqjfaw
         wIkQQBRa4Q5VMyxdJOmpsFszi5AqPJi26bhSujks4MNkCi9P90ZIobn7Gpvq+A2OUpxR
         xnNsFCgfigdjH88PeuWWRWkrQQilBDaM/N/Wg7fkWuvTYSEQQwSRUkyKLnHxsu3M06GO
         zyGn0jyVrq5VeN/d6AeLBYA7h10HwBWpCy3Jkj54IsJiVOkqc5PHBlqTGyfkLXxFbQ5s
         1EsFHlwfPlGAX6RMa+HKhOYpCcrAWX+fwKMjh9qDc9xAQ84JF68T0H1s0pMaaIGS07IH
         ky7A==
X-Forwarded-Encrypted: i=1; AJvYcCUMcWwrpV8cbaJGIK//heqJcQNC0ldh6rJFONcljw7RPkGjlOgvg30ec7Z6h5Ft8IC+CfonjR3lVdt6W9vQFTPTwIICPIyUX0Gqzwlo4ann0Wc=
X-Gm-Message-State: AOJu0YwqXh+FFWp4kGJuEHzsnj95v+mTCs6wk9dwN131woo2R5faeSoq
	vohGx9i0f6y3u5/q5yHhqih1xK41teu/g5yzVgcLQBEn3W0/0sPQHHvN1UjHmqY=
X-Google-Smtp-Source: AGHT+IH0DicSj7EZdYVwanK8DChE5Kq6JyrG4DLOmsDfa/paE/heJ15/axU+4Ae8PBBUkNTAuGB01w==
X-Received: by 2002:a05:6000:402c:b0:345:811b:466e with SMTP id cp44-20020a056000402c00b00345811b466emr46608wrb.26.1712764573431;
        Wed, 10 Apr 2024 08:56:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3? ([2a01:e0a:982:cbb0:760d:c2fa:a66b:fed3])
        by smtp.gmail.com with ESMTPSA id i6-20020adffc06000000b003455e5d2569sm10468562wrr.0.2024.04.10.08.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:56:13 -0700 (PDT)
Message-ID: <7c1aa6a9-b964-45e7-bd8c-d9ef5096a04a@linaro.org>
Date: Wed, 10 Apr 2024 17:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] clk: meson: s4: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410155406.224128-1-krzk@kernel.org>
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
In-Reply-To: <20240410155406.224128-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_085615_885066_4C9E2B51 
X-CRM114-Status: GOOD (  13.23  )
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

On 10/04/2024 17:54, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   drivers/clk/meson/s4-peripherals.c | 1 +
>   drivers/clk/meson/s4-pll.c         | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 6c35de3d536f..22ff030bd6a8 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3799,6 +3799,7 @@ static const struct of_device_id clkc_match_table[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>   
>   static struct platform_driver s4_driver = {
>   	.probe		= meson_s4_periphs_probe,
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 8dfaeccaadc2..8a917b9703bf 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -853,6 +853,7 @@ static const struct of_device_id clkc_match_table[] = {
>   	},
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>   
>   static struct platform_driver s4_driver = {
>   	.probe		= meson_s4_pll_probe,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
