Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D10EDE994
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 08:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiWMyGxQo1jb2Ug5/GSmtQy7M6z2pnaqd3WMAoCCVLA=; b=xNWBvDSAx5Sw0/C6ALlr+LYMUV
	5zIYxlUBm5KOHB6GbW7c+twCCPp8HCLw3RmCcYA1bqAAKGzSUOqHnJMZoPVqK5+4hZrS1qB7EOCx6
	gB0eMpRUoVPrrNZoO8k/SDslTgT8JEUJEQpM2rgDQhKaKvGOgUaxmSxejnxgGDNBC0faSiJxK+cHG
	nXW1mo8//TFdBzKQCLPoq1sF/YIIN3D0CHAunCnM50UxE3g9vmMDkPUeakUldqd/25LEY548cyLXb
	9FpbZuyj86X+bav8sB2IBPdGUpHODv1wuqpTd7o3tJQga5lEfwMd4qBm9Ea1z/elerivYjbzsM7Bj
	m4llE54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghhu-007hds-2G;
	Thu, 14 Sep 2023 08:28:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghhs-007hbv-1T
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Sep 2023 08:28:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4018af103bcso4416495e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 01:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694680089; x=1695284889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxGQXNzN+NwBnNyk/TZou6F9rmpM0eYJarlgQW2CMAg=;
        b=GTFVNxuSRH1QMEoTyUQV4OVAYoLjmMAWqyhU37Brk876Gw+LhgZsIfWcGVfIUY9QDc
         YzTg6r5yy1kNp41c6MAZUzZ6Ndje4EF/GiX1z/c6FeTYDvatvKLzNhYbXUZypnNeAElN
         4muCVEgmQQC7jQJoKLvWOBzEbA5raoyVplfKqwkUeGsMqMJJ9FWxueFJPs6KQw88aKHg
         h6/Djm1/yf837wryUOwnb4mMyE5uGVtXLPBm7hvfW4ast2jwWthQ1p61LHauCi9jDG30
         URyChhjNmygw9b+5fRV+Y1lZiS5SjgKN95pAO95Pls892N9N5GX+Xj1jUrSIQTqjyzjw
         SIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694680089; x=1695284889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AxGQXNzN+NwBnNyk/TZou6F9rmpM0eYJarlgQW2CMAg=;
        b=vHSEl693Wowx7r4KiSf+l16FOQEcHNSIc3aK7dpTnvbEox49FjggQjDbzGWT06aSCC
         Y35n0h1RZ3XZMXYGAuetIWXFkQ2EL1X6ukzfMuulq06qEA6wFlcvp9bs9YIQqHlTcn18
         8H/bBfd+R0JD7UT+l5B1dtbu6qmmtWsRhMG/kE8F5PkGKZnrbP64McTPWO6pTKgBW7wF
         OlUK7eZM3e/K/r3tuO4jxX+Ae61GsmhgngTIbBGkykVj7OEwoHJtAg4JzljULOq8hVeq
         sTSvHRr1HWawlHyiKMTdSG0XZtxqAdu8afn+X9aUBS6EUgVVui6yQr8uzYi2czur54sJ
         lRrw==
X-Gm-Message-State: AOJu0YwHRTC6CICY0T6Z5PZ/LIIG3gRWYgI8zxRN8uvjGcRvlOCwrSCn
	lWLd/UQ08/0PGuZjtwpPnVYbyA==
X-Google-Smtp-Source: AGHT+IFEGFDMleZi4sTo/OOg2pcnaPOtvFe5E6YxWvlKnqaMGiOQFJwFRp9lYNGJhdERHXK7yzRKVw==
X-Received: by 2002:a1c:770c:0:b0:3ff:516b:5c4c with SMTP id t12-20020a1c770c000000b003ff516b5c4cmr912355wmi.18.1694680089139;
        Thu, 14 Sep 2023 01:28:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494? ([2a01:e0a:982:cbb0:c61:ffb9:3ed9:c494])
        by smtp.gmail.com with ESMTPSA id w16-20020adfec50000000b003141a3c4353sm1091493wrn.30.2023.09.14.01.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:28:08 -0700 (PDT)
Message-ID: <c4cccb50-2b59-4e79-9462-5f76c7c45f33@linaro.org>
Date: Thu, 14 Sep 2023 10:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/3] reset: reset-meson: add support for Amlogic C3 SoC
 Reset Controller
Content-Language: en-US, fr
To: zelong dong <zelong.dong@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 yonghui.yu@amlogic.com, kelvin.zhang@amlogic.com,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
References: <20230914064018.18790-1-zelong.dong@amlogic.com>
 <20230914064018.18790-3-zelong.dong@amlogic.com>
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
In-Reply-To: <20230914064018.18790-3-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_012812_494176_2D8629E9 
X-CRM114-Status: GOOD (  13.87  )
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

On 14/09/2023 08:40, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add a new compatible string to support for the reset controller
> on the C3 SoC. The count and offset for C3 Soc RESET registers are
> same as S4 Soc.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/reset/reset-meson.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index a7af051b17fb..f78be97898bc 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -108,6 +108,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>   	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
>   	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
>   	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
> +	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
>   	 { /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
