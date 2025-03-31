Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01834C36017
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgk8R/2wgImofaIsNMqnkD08QDLwH8gKmc8+tw61T28=; b=sJS+62VgPk/VtkRbkiXdO7MJ+N
	RAYo2pW7N9q1/JjmI15erpRnufGtLdclqWz6HtE0SUnxrOG4rGeH1DfoxZ0w2T8vzug9sjc9H0NO1
	nuriSVD43P/b8BHoM3MsSVLmkZZpIRGhieGWkw4IdmVoLJIJfIx3rxeOGy1Y3pUUKPzHfzmaEHViP
	ZgaaZCTs08U9bXwrfoZ8RGvfZI6Qusv9g9/Ey27LEZ511iwltN9vSiJyAUFSMgiKtS54xqWpmUduZ
	/DP66ZU4Va56Fe9e4B9N4iiX5y1wivCkY1ndbUvXu7t0QDDDIVUI/muxWfBS6QUodqWKl3fsWAGIe
	qobzOgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8rC-0000000H7gk-1Jh4;
	Mon, 31 Mar 2025 06:42:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz8pT-0000000H7J7-3dyl
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Mar 2025 06:41:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so35605375e9.1
        for <linux-amlogic@lists.infradead.org>; Sun, 30 Mar 2025 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403262; x=1744008062; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=IyvzEsk9WoiZuVlP7wJWZpKPjqJ7REIDV6+nxkip4jtzAA7+XIebf7EXLSUtnIBtpj
         nVl6j7qLd5upTBEzeLSIv7QLJZuixeFudIxZPXIWulzaRv/XsaI31KVAc0iODPAJW6gH
         EUiMpwqdzsJhIe4Uit9b0/Gta1L07fwy8+WPjKkI0Yti77Wg7XGYCCTAXjbLUxZpeheG
         JUuTHZZ2JY17TBmwIrwGAI8et2KUwT4QXrm8HR5fyYaQhvATCDG2iQdyyY5IILommcV2
         6tFJRjs7JKw0Mo9uqFhEZJkJKKaX3/Py7fZy685IsPNIiIbKKdaEpXiOrhqinA1ddTcn
         pGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403262; x=1744008062;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sGnhJIC759yJZtlti/ONE6+GpsFrfUcaeYqXQAyKOzg=;
        b=QEegH/0KWow305G1GxtWXdFaf51wE3vx5re5nPasEyRjnO4/1gJq6Y982kvKSCwX+s
         D9vIB/r2pz8aAtmgUYt2gZxFILzsfeD3aPSoDw+NnISX96275Pj/hdTEGqQIoUvMV7cg
         zboIqNNm/AhQIkzCHn2F/kdWDTc3wCopbtf+BYna6rB4MQ8Z1AvQaM4L5MOC73V5m4OU
         UGiAPL0o4Lwem5eyB6fbeneIZoCzbSUgmdfrlBVEzMnXQ+/49bGn1OIbwvyGBW4s7She
         sV6xbI+W5RJxWqYztfvAhoiYcRSbZ1QyyQY597XOpmVV0mq4orrzkkv9eZUwAf+HU1Y8
         k81w==
X-Forwarded-Encrypted: i=1; AJvYcCVZmlEA/BdcfGlQ/Pd69noNWp19YThjCumvql7hKzilRh9i1NY8xiD74QJO4x7BB5ga7qR6xof84ZvIqteE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzft2qdnarQUOa6v3jbyAkYKFsM7xTy8Bxy6iaBH6R9e1mAJt7J
	VK02xyBSuqjP1a75GPL9Bugdnm+GlSkBCV6BrSzuE01kYVBQWw65mehEclbMwFc=
X-Gm-Gg: ASbGncuDeL54IWU4jEx0ApR2Ofc+iNdTdoRkJn0O3FmZHLrkVIeFgRAGo1GW7IcQ2Kp
	wTW3gnZTqqfSohl9F0C61/fpWDEcir6nKJuKFNGUp2CpYjx5+QJ05aMVzCeTsJer9TnhqFA+9Wv
	L/seYIvvozj4KB57MYS7uPgH/yascpOrHazttTQUBjtTO0xDxp6YGLEWyZ69kw165+vMTd+uapl
	KNRI5bbA8L7OPLR6QxMeav/r6zM8YYgsdipuphqyqs497CujD/wQIQg7VBYjtRkw87xrp5SrQe0
	gJ6dJpz/mzddYz5v+SpXlZWkcJC6pxRwCjXmxLPeCuMaaLK5rZcYdhPCv4ty296WMc9/BrwrX0K
	hNH7XrVCvfME3t5mh
X-Google-Smtp-Source: AGHT+IH5cRzNfuzcbg+vhCUwchxeuNmDNhE01WF7XDQIelmYWUn5sRs+QoiQmqXdq3AIDEZNp4hpcg==
X-Received: by 2002:a05:600c:5494:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43db6252fa8mr75261725e9.18.1743403261690;
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede5csm159075245e9.8.2025.03.30.23.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:41:01 -0700 (PDT)
Message-ID: <769e7524-c1fc-4364-a6e8-e0d0315f9514@linaro.org>
Date: Mon, 31 Mar 2025 08:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: meson: define the pull up/down resistor value as
 60 kOhm
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linus.walleij@linaro.org
References: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250329190132.855196-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_234103_923214_BF6E1F82 
X-CRM114-Status: GOOD (  15.43  )
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

On 29/03/2025 20:01, Martin Blumenstingl wrote:
> The public datasheets of the following Amlogic SoCs describe a typical
> resistor value for the built-in pull up/down resistor:
> - Meson8/8b/8m2: not documented
> - GXBB (S905): 60 kOhm
> - GXL (S905X): 60 kOhm
> - GXM (S912): 60 kOhm
> - G12B (S922X): 60 kOhm
> - SM1 (S905D3): 60 kOhm
> 
> The public G12B and SM1 datasheets additionally state min and max
> values:
> - min value: 50 kOhm for both, pull-up and pull-down
> - max value for the pull-up: 70 kOhm
> - max value for the pull-down: 130 kOhm
> 
> Use 60 kOhm in the pinctrl-meson driver as well so it's shown in the
> debugfs output. It may not be accurate for Meson8/8b/8m2 but in reality
> 60 kOhm is closer to the actual value than 1 Ohm.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 253a0cc57e39..e5a32a0532ee 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -487,7 +487,7 @@ static int meson_pinconf_get(struct pinctrl_dev *pcdev, unsigned int pin,
>   	case PIN_CONFIG_BIAS_PULL_DOWN:
>   	case PIN_CONFIG_BIAS_PULL_UP:
>   		if (meson_pinconf_get_pull(pc, pin) == param)
> -			arg = 1;
> +			arg = 60000;
>   		else
>   			return -EINVAL;
>   		break;

Nice finding !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
