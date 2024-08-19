Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D006C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU7hekOrdNPXtyLSbWjQuxYWtglDtz90BTyN4sNvI24=; b=R0Wo8FqrOv/SSxCl+AIWVY822h
	4u4miau6LgkSEjCLsc5Z9BXMb/zbasocR8+sTwA5f5iRQ6ixdRJcAAZxF8lqVzGWwte+wThzLZnRN
	Zv1SyQailkF48Jvg/VybS6QiNn8PIcO4xzrlVnKExCBrlfHIhN5ihTdsK9yjFTHRyV6icdHjoNvu0
	s8ZjPMP1PGGvNrsHNXhZJMyi/FJaWFoV4eXJj6P/Jvc9JyYCLeE0HPAQgtJMEySIep3BBZwTzNlYf
	7Du7LzmIV8hD6HxQRELwWs2FO4E7oSVW4wzmzm3fFvEF3VougJjZlMxzk1x2lac9kxLlH+dawjid6
	BibhHgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5GV-00000002AqR-12C6;
	Mon, 19 Aug 2024 16:29:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5GA-00000002AhN-0VD1
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:29:35 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42819654737so35250635e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724084972; x=1724689772; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyTK/Nqg+TcWV88Hzbb8pamwVc3/Bic39dkGuh1HO74=;
        b=CVfhVxcO5wGMhNUeWg9olp7dnNi4INUsTNF83c+InDWH9xXnQjy5UQGBnl+Lkr4r9P
         BidqesDylZYpflQgskla91OZ5/aR6MTTMwRJIsWB9z2/aOMbOPighGSTDzcJNMKLfYTW
         HECpbkMFgSX/FbUM0YlcmIyFDmeyUrfjlc6AEb1TcdPr8yavdDriuh7wtB+7gNdoC7sm
         yupOXyXOdIbIDtgOba0IANMcLuRpgDYjfTQrtTV5ROAN3DWgg3/VFCDDQkEQ/iMSvVfM
         BnsMv6Ab/YCsnIQeti6DvFfXZHlAq0rxm56mwRDjW/O283Uni1v9eT/Bk5SHu4SIZKqz
         yy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084972; x=1724689772;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vyTK/Nqg+TcWV88Hzbb8pamwVc3/Bic39dkGuh1HO74=;
        b=I/YpjdjlUGhhe7viHqC2lf3J/4crb0dS52l0y9lStnDWj9dBsET5uNSpMIutBqRnyF
         MsXR/O5XLr1PAvtYDjfTWj9IjfNrG2fElRXcWb3BM9i4qFNBYqV1He5Tk4U7S/sBYD8x
         vpT5uXeO4ujGAjVvhGMmRmoT4PqhN7dI85N5SW8bJR8gMjlrHvRiHbg3dtc15jA+DhCZ
         tuxcri+DrfL3EacJj4BE49WqRffN4U+Zzz53LeLddxboFD+krkVuJQ3UZuGLqlZJfabZ
         qg9z0SIniCycBBQfYqquYkdyGzolMGtfTaymTTtydmudabNSMPDwmrrl8kTzW+Q9sCl9
         WKaw==
X-Forwarded-Encrypted: i=1; AJvYcCVkqBnmslJoEosAwWqgl8dawpSOK6JRoLHhj8IlNz74irNJZSx39bpNWgvHk+uk4OSrOKl+yJRLaaLBqyqOis09nU7vp/4ZVX1Bo402vf/VqxI=
X-Gm-Message-State: AOJu0Yw3TcEyQbSO6N7pKsQTKnIwsB35m58dn9oiBqu1aQaO3V9DYDYg
	udHTdVJEau5/fx3m0yNQPW1+yMv4nVcjnzdlWqZxERQNhBEpa4p1DwbzboxIOqE=
X-Google-Smtp-Source: AGHT+IFmUt462S1VhERmlQIQq8oIZQDZkUEeKWv+5iLxGFcru4qpZHKVXvR9dRFVXR4lSve7N0W4QA==
X-Received: by 2002:a05:600c:3587:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-429ed7b8883mr89103815e9.18.1724084971510;
        Mon, 19 Aug 2024 09:29:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d781047asm172550245e9.0.2024.08.19.09.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:29:31 -0700 (PDT)
Message-ID: <b828b63d-e1a8-4c9b-9001-da686dffeb64@linaro.org>
Date: Mon, 19 Aug 2024 18:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/9] reset: amlogic: make parameters unsigned
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-4-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-4-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_092934_197316_3D665CAD 
X-CRM114-Status: GOOD (  11.94  )
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

On 08/08/2024 12:27, Jerome Brunet wrote:
> register count and offset cannot be negative. Use unsigned integer
> for this.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 820905779acd..460ad2f8360f 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -17,8 +17,8 @@
>   #include <linux/types.h>
>   
>   struct meson_reset_param {
> -	int reg_count;
> -	int level_offset;
> +	unsigned int reg_count;
> +	unsigned int level_offset;
>   };
>   
>   struct meson_reset {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
