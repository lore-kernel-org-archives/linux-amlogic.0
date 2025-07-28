Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D233C83F17
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jul 2025 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbTItBdBQWn885rGMBtUFFVDRM/TQdzrNiGoNN68qVE=; b=kFV34uNyoS5pybt5ye5Nd/f2Rc
	A9CsoZhrwVGAxFIk3wXqrKkynPG/UbPJ5ct91Zb9xj2rQQ8yOsXN06LfwM8F7iP+IzYRXlicjsCan
	XTa+qTFwbaNvs8J4Ddb9fu0+DgTePaeYfAF6BwMTkct/Yp9ElZQwnH0gEeFPX/air2mCcYSoD5z0x
	MphcUEovhnWpdy6eAlMxmVXSg7lPu4xVVmuo5KTIzLWVGvw+lQ2l9YuDWHkidlcBzRpzPMycbeTm+
	VTOe0Sy943f8D0Vg6RvhOy7k2AcXCBgyVOPydXpOadwKT3QY7IPMxPwLltfYZcRzgJxUxfI57iwkM
	6rwf9dNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQsT-0000000F0Ah-1m3S;
	Mon, 28 Jul 2025 16:39:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPzI-0000000ErSf-1GrW
	for linux-amlogic@lists.infradead.org;
	Mon, 28 Jul 2025 15:42:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4555f89b236so37533075e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Jul 2025 08:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753717322; x=1754322122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uBYu8MhPKwRmm5lVAPvrfaketU2wvZx8p9YAnLBD6c=;
        b=ZCsDTSH+izxKaI4vIjEFA0Bgkvan0nQaYO6UHBajQPDCEgsBjZ+iR8HbhlM8F4MXpA
         tvW2/ggeKFVS5lEB2T3UW5sFkDdvwbby6Ex5d9fErGjehsI/TBzmHEQRB+LGHgXvJZQi
         DwEHi0tbPX+rmu0slicrz0xUqlNYjqg6HDJdY9vOXWndI5tR4fflvkVhjHNmTrSZ9jLj
         ACDvcEhvhUI/6ypdYbUGD/bVKG7+O+wt8LHGZOO6Me8dN83lfmSZ5nFOCL19h3rEy4zT
         zR68amgxmrFiWcrLaFEgHKEkx4jQypclvLBA7tw/XCQsnKsA1SZRpPBlFKF5lELAVROd
         cAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717322; x=1754322122;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+uBYu8MhPKwRmm5lVAPvrfaketU2wvZx8p9YAnLBD6c=;
        b=sXFSPGHQJ9Ecv0h/cZNf+8AZutrJ+dsQsTYAJqxMWci9SP5XPsAXgtSxy5imQB0ar0
         lfQBGaWVcR6blTOT67tTYnLjYQYw9kKgUAhnFWKZliEII7wg4gjY67NR+ynWRHbF8d6G
         SGD3KbFKtvOeBFI5LM91eRWJwVBWIOgTistmsqvWVbEM5cLWik4rg0y6Twf+nb7WZw1Y
         5jkNcCqgxlcwuHALgToOsAaJ61OrqxBM6uYXv1S/Dk622awPSD21YJ+DaX99J6jZpTjv
         zXplYgti16fkhI2F1koydKzPaS6UxEAGzRfj69nGO7gHtRauoii1R8MjtbNNWyouj5E4
         0NPg==
X-Forwarded-Encrypted: i=1; AJvYcCXtU6bsHSKTcmS1+S/IuWucwG6/elMqAv/SxlU5A72+JYIegmYL0qnWJJxnFhRGUnrct+8gZ1y6we39JLc+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ZD3kh1PrGICvA02aaUDPnweK4bqHJuzkI0xZ6qVcmqe7azph
	hkpcmuDZnS/GGx2MugzxA2lGVkWouZkedpAiZNI5aFX71rJRR+o9FEMQX8Xg/AEorEY=
X-Gm-Gg: ASbGncuIZb+T6mB3GMBLjMKiMyW7okD4Jj4bu4Fa2QV7RC8m66mXJppGbG+2/GIFpqW
	S7RSk8V4mmBVi1aeqyN5GTdamxNk1ZHUKFCJ0j2QN342YfmyyfHMLCUb51KaEeyv3E8sxe8qZVf
	KJorqLvbhFI1IsYbLcjR3W73q65a4K3XVSGy3dTEx2hO9pYQ9GAHgpew7xNKHt0EFxisFqCMnx5
	EufOAMqqM+JrGThC7ZHkDQyF8HwQm/ZHb+YPiVaT67Qdvhw2l7Pjgou9Urgmw8OqFgwdhVON6RN
	AKPea0YbGAqI3AXb3geB/nqbWWb11ionPqyY4xsJlFkfjPbS1DbbAj818gY5PAl3McHm2WkgBbD
	oc6fwNIVRtili4F8CNjFU41Is14MY+w4ZKWWnl/IzNQO69Ab6sT4LRiwcqw+84axc30IUrxNNuR
	5/beAo1LzkWQ==
X-Google-Smtp-Source: AGHT+IF16ueRFmcMUJj81YYHrfcVJcrUX9Qm6yjH1RlY1iznSiPQLVNTJ/XAc9Sx/Gr1FOUaunJoWQ==
X-Received: by 2002:a05:600c:4f03:b0:456:1b8b:b8c6 with SMTP id 5b1f17b1804b1-4587dcce981mr70825915e9.14.1753717322137;
        Mon, 28 Jul 2025 08:42:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9019:46ec:c6f1:c165? ([2a01:e0a:3d9:2080:9019:46ec:c6f1:c165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a43asm1852232f8f.34.2025.07.28.08.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:42:01 -0700 (PDT)
Message-ID: <4eacd669-9967-4ad7-a3a6-d124477100fe@linaro.org>
Date: Mon, 28 Jul 2025 17:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: firmware: meson-sm: fix compile-test default
To: Johan Hovold <johan@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Carlo Caione <ccaione@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250725075429.10056-1-johan@kernel.org>
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
In-Reply-To: <20250725075429.10056-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_084204_345198_EF5FC653 
X-CRM114-Status: GOOD (  11.24  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/07/2025 09:54, Johan Hovold wrote:
> Enabling compile testing should not enable every individual driver (we
> have "allyesconfig" for that).
> 
> Fixes: 4a434abc40d2 ("firmware: meson-sm: enable build as module")
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/firmware/meson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
> index f2fdd3756648..179f5d46d8dd 100644
> --- a/drivers/firmware/meson/Kconfig
> +++ b/drivers/firmware/meson/Kconfig
> @@ -5,7 +5,7 @@
>   config MESON_SM
>   	tristate "Amlogic Secure Monitor driver"
>   	depends on ARCH_MESON || COMPILE_TEST
> -	default y
> +	default ARCH_MESON
>   	depends on ARM64_4K_PAGES
>   	help
>   	  Say y here to enable the Amlogic secure monitor driver

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
