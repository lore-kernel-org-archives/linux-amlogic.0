Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9AC48BC1
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 10:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD09eMdLX4nh0YJPjWFSzdAuhLpOruQ9soxXPKxkInk=; b=WqzNHbTSFv2MirkD3eABBrZWjB
	Sw7dwSugCXvaQBHg4xLipn1RBzbZm83OvoEOWtBMWFI9Sc69QkVUpw7QudU65BLPLpTz/YSUMzHkD
	YjV8HLQ/Cmg/ue2EoKuF1+YlSln4JeY6LF4edGTNEjHpT/hCOhxoIWQZ68tX3DqThdnkacut2QN+V
	v1lFh6dfGl8+nInUjBxVTzKLed7YGuHEMEolse4IFlbcfkpwpi5fb/fw/MLBSZWjlZ8oMhEjyoouM
	GMDznmy9CfhK/gGgn7tcq7a8RbiaefkWthbINf+ynFDrLpmeI4TsoTwzZp5OeODbaPfSTpk6L2LMU
	+5/lfWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq0Q-00000008p94-1xr3;
	Tue, 13 Feb 2024 10:27:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZq0L-00000008p5l-2WrV
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 10:27:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33ce2121d5dso26612f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 02:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820028; x=1708424828; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyTZUfKxgXBwWopHYb3LgscDsLO34lDgWMz659lp7mo=;
        b=kRCGFUTcGmjVNOvaCm9Q8HA/LZJvoC0Dxplh3Vb7fc8P8UUaSpPIjK64mFhm/ZjIJO
         aPpjbL9fMOZMxdbQnc8o3AuY93mdlHPGGlcoqebfZSemA7lZBdF3aCRIlwJcG8V/ekOQ
         FNHXpTJxHChNQ03rPfWKRk7TPceLNDM8UQicnDySWilxhyr2CqAiQPiRvwzbOMnYg8D4
         zdabGbXXy1NS+J7uYiNze8SH6dQNQjVAhMptVHXJPdTVWjo8YHZniEGSyjtwFfjGQuon
         chM5dRryoHR3B34xHOiK9Q5aGNRbeboZxagtjuEFqZZ6dp3LZFXlldZyibaLNJGXDEbF
         1UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820028; x=1708424828;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tyTZUfKxgXBwWopHYb3LgscDsLO34lDgWMz659lp7mo=;
        b=gckEJEf3uv4OCLbXTRUAp5Q69Q1ReVynTavUfBTb3QXgUJtYhHGu0GT0NK90uVuOaq
         uXfRNrJ16a0WDpTIeoFne2Odyzx6yvd54mnDMSHHkucWq3NPiaYe/F3Ccg5dRPEormz2
         ix2T9MyupO7A8KhnvSLxrBvlWRuDvpGgEUIty2VqumTaPyJoVVjuOddKkDTCmCBrkUDg
         oNkcXNzMbkcM7adXDjST+fKuuZNxA04kT2HzgDIo4XFN56OfBJUByc06G4gQoargiu+o
         fCcpwyZVYRNMz2oXEmqaQkV24snG1/s4c4cSyTUnL86NSaM430qG+aY9uo7zMAVbzKNb
         jWbw==
X-Gm-Message-State: AOJu0YyaYJ7BLwf7P/hKmTHviMYrKbfveRivGtH141blnb5PtGQJ/Qrf
	yWo8tCvpoGcwMqFHoaE6JCigQ+lrxhFZ/8XNrY7i8WGGUYWWm6uFWKdmg2DcG6frcub5JXATEqk
	KYM0dyw==
X-Google-Smtp-Source: AGHT+IGWMhj0KLJWYR4q7Tu0F5Jf5C6g7wLmViMX9LHHF66KDjADA0qXn6Mq9uVuMDq3lCear/joWg==
X-Received: by 2002:a5d:6785:0:b0:33b:7d9b:4592 with SMTP id v5-20020a5d6785000000b0033b7d9b4592mr4917512wru.5.1707820027605;
        Tue, 13 Feb 2024 02:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyXuwiUGeFI8zrVCbLtGqd06swkX06JnaokQfykh2lTXXhB3tIEqMiraG3YqDgDjH5MYBF4csqDHvxBXIMAHxWA1mFu4xFhLTIP5fOCZnDTkVr0a3lKAXwDFUuBjBERon1Th2M9KB83d4qJ/n3q2yacuvBHKi8L3jHXO08tB4H2Ry8+MPbmDGzNKS3Bdfykupqi5HIFbFOHBkRZ4D4zhzhWbqazeIzgchVTzIrs7++j1LTGEPRdmPgRfcx8tDSvANtZVE2RBdVc2OX6j5apnNKpyw1hofebP71JWVaD9Rryoi806Qn66amejnfBBUS1UXzPPSOb2lJ8SI9rs3l9PMAsFW/J2WPq2gpcEppd6ou43t2T9PtFOQrQ8XnQpohx+n2xwaKWCXb4DhuC8cS8xHFFDWE4sYIzQ1aK3n1m4D5tmp9td/O+TbcEn2bKL3ZZCc+m3clUKQgoFVNfCRzR0E3lPLkvNf3xSh0q8speVlpDVWLIFO7l3xyoCzdWob5IANexY7XVMQMf6VbzA==
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id m10-20020adff38a000000b0033b0d2ba3a1sm9161150wro.63.2024.02.13.02.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:27:07 -0800 (PST)
Message-ID: <19dc040e-e023-4a17-a6bb-8aca156088d0@linaro.org>
Date: Tue, 13 Feb 2024 11:27:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] nvmem: meson-efuse: fix function pointer type mismatch
Content-Language: en-US, fr
To: Arnd Bergmann <arnd@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213101607.460930-1-arnd@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240213101607.460930-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_022709_898602_4EA6CF95 
X-CRM114-Status: GOOD (  16.98  )
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

On 13/02/2024 11:15, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
> 
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>     78 |                                        (void(*)(void *))clk_disable_unprepare,
> 
> Address this with a trivial helper function that adjusts the return code.
> 
> Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/nvmem/meson-efuse.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index b922df99f9bc..3b9e31d7d073 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -38,6 +38,11 @@ static const struct of_device_id meson_efuse_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, meson_efuse_match);
>   
> +static void meson_efuse_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int meson_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -74,9 +79,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       clk);
> +	ret = devm_add_action_or_reset(dev, meson_efuse_clk_disable, clk);
>   	if (ret) {
>   		dev_err(dev, "failed to add disable callback");
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
