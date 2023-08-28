Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366DBC71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 12:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jj3M51mDqYcCCvDG0dNhQ+rg47Q3aszyYvU7Ix1lOMI=; b=yRLBoPqPrv7oEwlLCQBaBMuO8y
	vv+uOZVc0bUk6V9cUgCXa/j5ugpYGasU2+UHW7HaRBhIcCgghlYijNCc9KySc4+9evqGWn1mrD8te
	f0eAVTtrAlNCYx6vusnmSvZyNhrJ0RpBFmggJT6y1oe0P3I/O+PjWInekorLWndr4Rpfl122/v9YI
	Zshv3zEhM9WZ1KASaGdm1MukHM/tc9P1axO5Fftj3TdOP3kg6zIXgpywRt/qYBHaWyHO3rLf59XC2
	oWSZFYBqJv+rX9bxLCVxrJllNKMfaae5Y7kM47Ocr6lMaBo7WwSnuJ3GGGPJtDYj/Ma3ibHi9QwJq
	Xw6W6JSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qabAp-009YFu-1x;
	Mon, 28 Aug 2023 12:16:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qabAm-009YEa-1E
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Aug 2023 12:16:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so29232685e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Aug 2023 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693225006; x=1693829806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZuizckw45998AR6QtCXfw5DbbirqliA6Qj9SYukWNQ=;
        b=gr5jBlzwmGC61xdjqkCu/QVUKM7ZVSaWqd6e/NXmUeuuFik5LKbE4RIKoMiGPG7LIk
         z6Tz2YleQV8fVnPoGSCNEFF2RLQ0BUMcUGDrZiQEDojwA8bBJZ+vI1gYtWl3ZQLJg3gh
         UpZdWT+N98Yt4Dm/H4NNRa1Xm5R6YyI1zRz3uG3ZQbf5qKlm4uOdjh0P/hjXzXYjKDvA
         b6b1X+hOc5y38yM74Crp7xRt+B71Xulq5UlixMQNdlOjc3iy+54hsM00H89YVoBEu3vU
         gtZRJy+rzFTxbMKwNOrXGj3DMxexWd5MLimqFSaRN++dUz786iVjbs1uXQG9/3Wu6KAu
         Zxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693225006; x=1693829806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sZuizckw45998AR6QtCXfw5DbbirqliA6Qj9SYukWNQ=;
        b=FuCbNYaR6WoQR6bVqAZ46TsuiTwJMHJYnrkyMWz3lkTUI//kGGO+Xehb725dwoWk/B
         0ifyCpQm4KiJyWzM3TOkMiFB9u53mnNGi7cybVOB4YpBHSKAPznd67lyaKN6y758gTR3
         wB+D+VVHgFH/4dfUatXjPitLbVDs9sKNA1PJ1k/2MFRLs5fTaEC3Pejw46fdAtqD6NCl
         Kn8b49sF5nMt5e6u0tREIh+GUJeYQM+epZm/1WGbxmjg+sVpykRpG62gvmQxt3IN+EHR
         4jo4HsSqjNIdcSMPHnLyMPxSxFQ6kDwz/fyoEj4F74iIQ5/j+UWP+oAQJmhFKGbviWZH
         qUcQ==
X-Gm-Message-State: AOJu0YxDKlZXG9lnBDcHGNPwrOMGJ+IHoPVNOOdJIWMeCfZCppKELZxb
	Py4HyZyohAFxbbyfRk/R5OzSYw==
X-Google-Smtp-Source: AGHT+IFIf+QuOGUqCwGjbKIFDIcOjlq3Nu/TaeRktQH/Z1Og89+EJ/bldN1jMS69WdKWg+aSp+7aiw==
X-Received: by 2002:a5d:5242:0:b0:31a:d4e1:ea30 with SMTP id k2-20020a5d5242000000b0031ad4e1ea30mr22248819wrc.17.1693225005693;
        Mon, 28 Aug 2023 05:16:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5e59:c27b:747a:3f52? ([2a01:e0a:982:cbb0:5e59:c27b:747a:3f52])
        by smtp.gmail.com with ESMTPSA id bs19-20020a056000071300b0031c855d52efsm7798804wrb.87.2023.08.28.05.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 05:16:45 -0700 (PDT)
Message-ID: <7720b990-c9cf-4c3d-8bb2-928b3b17f089@linaro.org>
Date: Mon, 28 Aug 2023 14:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] tty: serial: meson: Add a earlycon for the S4 SoC
Content-Language: en-US, fr
To: Lucas Tanure <tanure@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230828121053.60838-1-tanure@linux.com>
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
In-Reply-To: <20230828121053.60838-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_051648_419457_806390C1 
X-CRM114-Status: GOOD (  12.96  )
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

On 28/08/2023 14:10, Lucas Tanure wrote:
> The new Amlogic S4 SoC does not have a always-on uart, so add
> OF_EARLYCON_DECLARE for it.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/tty/serial/meson_uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 790d910dafa5..8dfaa260e545 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -646,8 +646,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
>   	return 0;
>   }
>   
> -OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
> -		    meson_serial_early_console_setup);
> +OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart", meson_serial_early_console_setup);
> +OF_EARLYCON_DECLARE(meson, "amlogic,meson-s4-uart", meson_serial_early_console_setup);

Not sure why you would change both lines, and where's the t7 entry ?

Neil

>   
>   #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
>   #else


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
