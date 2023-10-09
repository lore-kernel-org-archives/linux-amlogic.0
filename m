Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F1EE95A8E
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Oct 2023 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKsGimdGEOXidFO+zW2BJ42CPTR52RHRdZs6DgEvXGs=; b=vCRslde4f6+OzvqSZXwMAO7WPK
	7tpHDN0iRWlpx1gTFp6VFp9nduJAXvat408MdVOcHhVUUgHMVNLjW4iJ/zI9jMHSqXwE5wk5uPswo
	4/EWmtQMYtI2AbgvUYghbXHTdgRVyvCFju6HxxBCJCl/scDc1/kxaOyCBJysjQXnOj2F1ZHuU2Qj9
	jN9CzW93LFsk03cBK8056RtiYrarrhWwV9Qjv2bsuArYv5PjPMPIwBJYvSBo9OhhHLcdc7HfQ2QjJ
	2sLFEstJd7pGQ3jqCSiaqOQTdKLx1tURI/hxib1W6zpH6DjTuhZ1Y2/X1OK6o8vUSRSt55lWRvGp1
	/H2rCuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppoy-00AjXI-1S;
	Mon, 09 Oct 2023 12:57:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppov-00AjWd-1P
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Oct 2023 12:57:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3248e90f032so4449262f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Oct 2023 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696856231; x=1697461031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZXoHEUdlaSpzaGNvl0KYK8jIguk5p4r9xc4kKWkyNI=;
        b=T79hGooJIElthCowUp3PoxmE/R4JP1zxafjKBnNJK80ul+7aMAui19vgJr/UnyL43W
         W4TnjXdXQzYh7mBclCIn/fk5IGmtnJdXGj3wEMOJyoqV1KkcnJs0WRzhvGqTR5bG5dVo
         LFpqsOOnDj91RFZ2ZV3LdUPdL0UcC1CrQHnCU1wkjiJOwpWx+E99jMDT2/4/gaiOXaTi
         Dp1r8FpG8op0UOTC1vbBUfB9nbQSUxvE+sCpHVHpyKYPXeREzgp02VoFJjU7nMi/KrhC
         cvZM/caYLFw7FwiSuQwz2AH7N06e3iDKmUM9wTbSBPVqRP1xClcKKsrPaQPvDxDDpRnp
         2EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856231; x=1697461031;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EZXoHEUdlaSpzaGNvl0KYK8jIguk5p4r9xc4kKWkyNI=;
        b=YFkCOahBssbkq4bJ77AgG3N1OyzUBRMJaz1sXotXn79s7/xNGysZ0XCMc5ekaHIWvC
         8vfTWyla8llcBzE9MfB6hNXFjndARAVDsvenezp/JS1Am36XXK07FadqSmTbDKt8f5B6
         dZeERaui+YX0/UZBy9jUlUuxenMVKTqa+LJgOS4TUQk4AyYdblASlljWmkXQfgw5csed
         ZXI/4j/eq2HuhtGPY0O3WW6oIY6xHPSjU0DWvdfrMAhbMquqk7g6cCbicdfCY5svC7Li
         IhMKwro+F4cfkop1jo0g/5KiO4KfSm8ojF6AjaIq/hDn+gyxZ78HGCWvi0fGpe6eereP
         NUBg==
X-Gm-Message-State: AOJu0YyxEmR7mc7cB1dQSN7Gd4LA0IiJECrt2oFr+aMmeax1ae2h2FC6
	bHqerb7je2YbOPYKaLWpMNJqoQ==
X-Google-Smtp-Source: AGHT+IFCcZ9U4VKbmvYJqVAUH/X0Z49KpYeQVkB7vsetwEcUfdpmXdEvFY1+nTDw39WcIZKChcMilw==
X-Received: by 2002:adf:f641:0:b0:31f:b6ea:af48 with SMTP id x1-20020adff641000000b0031fb6eaaf48mr13186215wrp.49.1696856230815;
        Mon, 09 Oct 2023 05:57:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4406:fc3c:1c62:7b3e? ([2a01:e0a:982:cbb0:4406:fc3c:1c62:7b3e])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000180800b00321773bb933sm9575321wrh.77.2023.10.09.05.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 05:57:10 -0700 (PDT)
Message-ID: <d25ce389-b18b-4c45-9c61-5a909b514699@linaro.org>
Date: Mon, 9 Oct 2023 14:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] tty: serial: meson: Add a earlycon for the S4 SoC
Content-Language: en-US, fr
To: Lucas Tanure <tanure@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20231009121151.4509-1-tanure@linux.com>
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
In-Reply-To: <20231009121151.4509-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_055713_511171_854EE39D 
X-CRM114-Status: GOOD (  12.55  )
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

On 09/10/2023 14:11, Lucas Tanure wrote:
> The new Amlogic S4 SoC does not have a always-on uart, so add
> OF_EARLYCON_DECLARE for it.
> Amlogic T7 will use this as fallback.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/tty/serial/meson_uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 45cc23e9e399..de298bf75d9b 100644
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
>   
>   #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
>   #else

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
