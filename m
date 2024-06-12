Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E549C27C53
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 14:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc4r9cGgSex98JFMJxRc0Mxv00BOQImydwSkd7kuJaE=; b=qn1DqyD5mSPCrcX5Hzqza5avyi
	BDHFvQhkmCokgAC1Su/Udgu/OVqV9EjfOpHA0M6eQfX3APbItS1T0DawZRc+XT7TSrOwaqIHhPg6C
	UWZPkNQjbt8WBfv3V0E342eBzB8tizpAHEqQ0vpJ81F2tJXJpHClfnsFh/11l5w/zlY9Mz+5FAvtt
	Bq9X/a+cWAcsIb745LHBGpUBpeJpLfisE5ZEvoZimvPK3BawupcJuCqGHGIC9H15l/xvFe9sm3YxW
	n2LIcDG1j+MlDR+LGrdoMuu385gDtsI6+w4smimU9sRkEIa0BuJ78THFj/AkIfz6LwFvwkeKb5pNt
	LMwuCmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHP49-0000000CxmL-0M76;
	Wed, 12 Jun 2024 14:35:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHP46-0000000CxlZ-2n0q
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jun 2024 14:35:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so12253085e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2024 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718202904; x=1718807704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0d3nemtLTIlGYr0wQiRJe+hWAQzd6FHXLae79gtynBo=;
        b=TJLgxbbnJglwffAQUuClYtXypDSbaQBMQUTU6NnF8DFXlV3JDBxt/xjzyLRkpqA6SU
         9i5DqwjVzwQSVGVS7MrXbsh6thZbciyT0adJDXYkC0MDwzB+WXOgfZPSf+XcrNFZhe+a
         jzQyZJ2yVvCF4A9/sfsdGRLyyxILQjsGLYaLSZ4S1dorhL1yoDBAcojokSqmgUTjIU5y
         tFaXHBs2rviXv48vfAjhiYUI5pUH7SFJBZ388ICNNT+Tz0kLdhVTXYfcOW6D1MMI1GY0
         xzJoSjmfNv1Uwg5A4/CtJdDvxyOygn+DsudM9OjxKNtWSPF4zs1/9o45/2I6kEyT8DIV
         DiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718202904; x=1718807704;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d3nemtLTIlGYr0wQiRJe+hWAQzd6FHXLae79gtynBo=;
        b=DYZMguFC9eozAAW4YPyfW5lD2LGlhzO+87xztHAsJUNhH5AJ79MgSw6rtTeht3mumy
         w2JEteDLEBVKhmGAwUBJGRz4Y/Hgo2yp1mxo1wu1eDl8ObcAO0hrUEcFsgk8TElm0noO
         WBOxK4v1WJI58TdUup2yCkbXyV0X3p3qefxv39oIh/hNTrXm2UeJldSgJPLD/pQPlbm9
         2Gi1BskAkHiaWNfMH7LGxqlMLAolzBr4vSFNa0WkekkEN4jUz047oJKSp9msksnLU9q+
         +SH0RRXr+mdht4rCyz6cEBBE4xtljKFWvuZhkHLrqTYSc9DLGumQTcHo2NGNXihi57If
         onVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1auJkwJ9i1OHg9iz3JnwxhuYXZ7YJ+T3F4p//RZQoVH8wPhrEtY5X+mN901UAQW0VzW0zx6LsE8zxVVE6O8c47Na7MPX6Ax0TcNMvGqJ6n9c=
X-Gm-Message-State: AOJu0YzMudj7CAJLR/60l9e64DaSojakyu4zKtD2FZheqzin3an0vB5J
	Iw2QS9OwIrlAowiBPbV349X/mMHDs+W0byMM5gYeSubV6N67m7KZYO7lJ6N8bWQ=
X-Google-Smtp-Source: AGHT+IFdR66CEHF3pbbU8fAxsgoAgu2w+lXVGwcwRX1cvGhBLBdMA1CA0IynRV9+5vuANlVWMo80dQ==
X-Received: by 2002:a05:600c:5487:b0:422:1a82:3ebf with SMTP id 5b1f17b1804b1-422867bec26mr19747255e9.35.1718202904586;
        Wed, 12 Jun 2024 07:35:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb? ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de623sm29220775e9.31.2024.06.12.07.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 07:35:04 -0700 (PDT)
Message-ID: <de0672bc-b75b-48a8-aa01-2ed7b89aeff5@linaro.org>
Date: Wed, 12 Jun 2024 16:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] spi: meson-spicc: add spicc loopback mode
To: xianwei.zhao@amlogic.com, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sunny Luo <sunny.luo@amlogic.com>
References: <20240612-spi_lbc-v1-1-d52e8c8011bd@amlogic.com>
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
In-Reply-To: <20240612-spi_lbc-v1-1-d52e8c8011bd@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_073506_777617_5209EE8D 
X-CRM114-Status: GOOD (  13.75  )
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

On 12/06/2024 11:44, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add spicc loopback mode for debugging convenience.
> 
> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/spi/spi-meson-spicc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index 8a4a8ba9dfed..8838a98b04c2 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -514,7 +514,9 @@ static int meson_spicc_prepare_message(struct spi_controller *host,
>   	/* Setup no wait cycles by default */
>   	writel_relaxed(0, spicc->base + SPICC_PERIODREG);
>   
> -	writel_bits_relaxed(SPICC_LBC_W1, 0, spicc->base + SPICC_TESTREG);
> +	writel_bits_relaxed(SPICC_LBC_W1,
> +			    spi->mode & SPI_LOOP ? SPICC_LBC_W1 : 0,
> +			    spicc->base + SPICC_TESTREG);
>   
>   	return 0;
>   }
> @@ -850,7 +852,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
>   
>   	host->num_chipselect = 4;
>   	host->dev.of_node = pdev->dev.of_node;
> -	host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH;
> +	host->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LOOP;
>   	host->bits_per_word_mask = SPI_BPW_MASK(32) |
>   				   SPI_BPW_MASK(24) |
>   				   SPI_BPW_MASK(16) |
> 
> ---
> base-commit: ec0d19f2b59699e2e148091debaa0d9d6af5800a
> change-id: 20240611-spi_lbc-0859cebc580e
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
