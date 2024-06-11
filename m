Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95578C25B76
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qbavYizoM1jaX5nUJxCJzletIzWAaqFSXAOaQwofvQ=; b=C5jU3iOzmrv9OZeBzHcLofU1Fx
	qvgEz3RL4XEclnZ8iOsoua/7yx4K8qSl5fXsaPez6BB2mso8cUKXHD/DtKuUHEGu9Qo1hMpblYzga
	pOCRDkE82PCS62Ou2kTeXoKRORTnbbs6kPXqUD4zgfG5Mg/vjZsqJMaCo3kdfZbMfPIzsmQWCSaoz
	XWAUmQywvFxJ08SHDNslNqa6tXRmQt2t7CZLFIfCE3V1UR3Agq0mhJRjlVq2lt/BNbsdzHhIRHTkC
	QnfX1Z3VEaBJuWmVe0ci4ChoaAx4/paqYWObJkRYiLG9919ysJIDe3e5n9lk1MjF5zy07oE/oKC2g
	M8m1QGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwAo-00000007u8O-1Uw2;
	Tue, 11 Jun 2024 07:44:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwAi-00000007u43-2wq6
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 07:44:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-35f1e35156cso1983548f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 00:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718091839; x=1718696639; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsHiHDrwj7KWTlL47RJPPmsPBBAjKyL5RmZO1AaRVKI=;
        b=l4yWWF1uz3+xbig54Z9AhFxdYk5WtNG7Fu2WfJ3Jf3YeQ8jBuiZELDamKRNlhtB6Xm
         R5FxC4j1SSiRVHhPF7ypq6IzrspButvEOs1bo8vHQ2DLgbW/0xTgYtZuCPKOtrnc0ytw
         n2Af07If1w0zzY4DVBYhpkulbs5kq3pg2J11o3eDzaEYMTfM3e/IpWRC/xz8DJJv3abf
         oAWP4aSX2W8/I3t+abVdfceTlEMGrdLhYBxsLPqH20IUbpT+ExQQ+k2rZPY+SnGhnNZs
         73nlA4aEUK2itgc6uog/nKuddRDClavtsO7Gc+siLwJAtDetyaizRW/Z0hxzVZKQVxvO
         XNjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091839; x=1718696639;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WsHiHDrwj7KWTlL47RJPPmsPBBAjKyL5RmZO1AaRVKI=;
        b=wzuOxm4U9NLYmLvrMFIX7Q8mMyBi3yb9r8ZPAFSPyCzQxFh4sVdynE2vGm70LyPZga
         +vbLgdZpQEYzbBlTcFPh4BuwMAHVbg4v2yLCzWEqbLaEGaQKE6nlkH8o9Mu43RlG90WK
         j3Aylbt6WDBAkeb3EhG1aIkUu2itOzIR48sHFiW/D8RgaZjIfW7dl3+EpD8ZFKg2fKoF
         5xrDDh5fXsM7+4Joj524JaUl0vqrpBp8u1fCifDms0S9B0EeOwSElBvxCGDY9axLp7Hw
         gvHueYw45KAqbwt/XfjsAMm1cnnR7CIVFmMu1QRjVLqzVYFauBZkjiLsZ6WHUWs1wAkE
         Q0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUCBciGHl5+WDt12gplvh1sZdxLNcqNS3Xb9fvTQRgVEDit4tzs/1wafGUsZIds7cCluE7dEQLDuzhFPDq+Snax7sjaLlZ2t+CUflYK7Q5ebKI=
X-Gm-Message-State: AOJu0YzQ+01x8WQimkwn8OOVQUBS8s/oraokzJcVTeFzV09+t7YLNo8f
	dwfIEEk7apz96fHAw9Rv03S1pVNycsiWNToRVONgn6vSd6C3mlQWRWVoxNI+iw8=
X-Google-Smtp-Source: AGHT+IHVUWQPU0XLKI8clLjC5hscIpVdt5ZDQarh9E7gq2k1Q6gIf/HvwxVroSXFwFVrLN4v0Tr2cg==
X-Received: by 2002:a05:6000:1291:b0:35f:22d5:da72 with SMTP id ffacd0b85a97d-35f22d5dbbamr3080168f8f.50.1718091838847;
        Tue, 11 Jun 2024 00:43:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f25dc3f07sm4013408f8f.79.2024.06.11.00.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 00:43:58 -0700 (PDT)
Message-ID: <c0013295-c7de-4118-99dc-12074002c5fd@linaro.org>
Date: Tue, 11 Jun 2024 09:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pmdomain: amlogic: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
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
In-Reply-To: <20240610-md-drivers-pmdomain-amlogic-v1-1-b49ddb1a8bdf@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_004400_798266_C951BF05 
X-CRM114-Status: GOOD (  15.00  )
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

On 11/06/2024 01:13, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes meson-secure-pwrc.c which, although it did not produce a
> warning with the x86 allmodconfig configuration, may cause this
> warning with other configurations where CONFIG_MESON_SM is enabled.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/pmdomain/amlogic/meson-ee-pwrc.c     | 1 +
>   drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c | 1 +
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> index fcec6eb610e4..fbb2b4103930 100644
> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
> @@ -648,4 +648,5 @@ static struct platform_driver meson_ee_pwrc_driver = {
>   	},
>   };
>   module_platform_driver(meson_ee_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Everything-Else Power Domains driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> index 33df520eab95..6028e91664a4 100644
> --- a/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.c
> @@ -376,4 +376,5 @@ static struct platform_driver meson_gx_pwrc_vpu_driver = {
>   	},
>   };
>   module_platform_driver(meson_gx_pwrc_vpu_driver);
> +MODULE_DESCRIPTION("Amlogic Meson GX Power Domains driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 4d5bda0d60fc..b50e5678abe3 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -355,4 +355,5 @@ static struct platform_driver meson_secure_pwrc_driver = {
>   	},
>   };
>   module_platform_driver(meson_secure_pwrc_driver);
> +MODULE_DESCRIPTION("Amlogic Meson Secure Power Domains driver");
>   MODULE_LICENSE("Dual MIT/GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-pmdomain-amlogic-f117930600ea
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
