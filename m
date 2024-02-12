Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F02C4829E
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 18:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx5glzyS3I5/pTAWoeMLyU2VyKK704xzQn3BhQ/3zdA=; b=NmoSpO9MZ2EQRGeQ4P2MdlyUgq
	Dnx0fOlK1OQPwZ3BhTSvHlfU4cZzXj1XoHpFUXtRr+j+9FQHNCQ1jPw8X6stXHAKUrNWGJKWgAesq
	hbKFSpmR1SVBR829uT5O1KMMVLR+jqaU52JNhefV+yIOED13e89JzX6Abyy8VE/VVymLuNIyFv/Yk
	PF9VtFuTrFOjGXly5Z+3vXyyzQfa4bnw31Z0b0oh2hUduwyZ/IFbO1ZqRnHPyEITPVZrNUyJ/Sy3+
	/vMkF2d8rviLWAE04z9I0H9hjrweWEtdGaNRxL69tt3hVZc0yRzf+KgnjCwOKfZcKhCLj5/5rnoJ6
	3F+aEK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZapu-00000006aBW-3Sws;
	Mon, 12 Feb 2024 18:15:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZq1-00000006MqO-1RC4
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:11:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33b86bc4bbaso464969f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757882; x=1708362682; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z88dR7PUkTcRGj5lNakDVXVkWGFXVN89MP6hxtmCpLI=;
        b=fZTsyJ5TgDPPo6DsEs1k+MCpH7pvfh1RqVivD88htYywbXN613Cl2rdxIw6WMPO61m
         cwTcrEAoOjwAwsDKXDADkjIGlNM65A0sP4Ca/QkDUZes4logS8rpq6FJpja0ctjA35tc
         kkPSTplMore1kxnl9+qumt/uaALTN4HBi2VFs83xDZiGMTJqkfx1YDT49YUh1bQuUMyJ
         3YugzD6ZmaXEbkrd4HEHj1nBsK7kuGeRIqauHH8h8xAwSsj2wt9IaiOk3zd8blj6dFUs
         plvBx3yEzRRIlNdmANT/ttHwX8S8CZGycsTxsToL3+gFpmcoMNrgVD3xsn9V9CaUQe4j
         RNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757882; x=1708362682;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z88dR7PUkTcRGj5lNakDVXVkWGFXVN89MP6hxtmCpLI=;
        b=WsdIIBtxFC5C3iOmLPa64qZZrm4b734I3y/qb9l/xyXcZWfD30qC0KCxOkq0TDBhv5
         dFmNjaryjV+sUNhp5kLAQgXDUeLywGZ0EP0EYRaR5pH0R9fN6KFL5bVvWSySmlVTHlUn
         qamPTbIdP4bKjS+7VdHY03HzXb4rAVZplLJ4hsiw017SF6G0dy29mnZSjzL8EQVPl2cN
         K3kLSMHj4IUoAyyyHqMxfRuU2fynNCJgGfIgy+V20nr3LeFHfXodRMk1rrSNnbVnUaGV
         Wk8fLiT2InWdez6+MaZFe37gyaW8X3NHtcU5nrtaz2mArnIzgLlFbE0OjJth7pbL2OBk
         f2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVZHNdniwzZyrwPKswpSnUX9o2DK0dciJAFpV50j3KLujwbgasw0GNdK9v+CpVIw3kLKldUXvUBwxthVDZCEcW+JbKOn5yRntjqGQRQ8O4Kmmc=
X-Gm-Message-State: AOJu0YwxuNgdZ6rvo2nkTzp0x+C8ytPwxLkYIt5zQB6vS8zFzI1nSDHl
	t+HFD1ziJCVxR7Hm3Xkh0aGg6GI6igwwhqtLWXdh6GLmYNjONjoqRAAH+zR5dAk=
X-Google-Smtp-Source: AGHT+IGBNdxn1mzGqbZ273VsCbHhIKxKw+Ok3uY/Ud8yKtGlif2B8ukwVxDWaYYg5Y0mAqINm6+ORw==
X-Received: by 2002:a5d:490b:0:b0:33b:2fdd:daf8 with SMTP id x11-20020a5d490b000000b0033b2fdddaf8mr5110953wrq.21.1707757881869;
        Mon, 12 Feb 2024 09:11:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWeNEu1npYYlncp0jQv1FNO760HTnDLPJSlgdJ0xDQ+O/KSiOHvDOI8s9zWA64eeGlff5F7BMYt8iSkGsr+K9rs+rN+t9FGYcP0LyJC92jlwTegS1pwTEL5thLaa7DSz+vJW3fWkWZQldhcpgFMlyDOGesAsr4kdrJYUpM0ZFCwofWi0/ipDx8SaDRPLKO4J7gaFWo+mhtZg6RbJP74TjW5FYnn0YQiqTJDDpqH784wWQ8bCaV1vv31j2sDsQncyfP6pPyEmrudmzrwRP/caPcOxuim6djy4H0qAlR2paKyuOE1GsAPcjN5J3wV72vkycBt5XnOGhnVTyYGew5s5LVNeLQYhwy2XjMhrje59yN/EClZmau90cGXAt/+nUmawRK+EThaZv7C3Vhki3gdguOYFP2Di3GNctrQ+q743KoM95N7tPRY7XsGKwmQdF/aDY3V7UPCLMZXgmA5musziHNXSf38O15ZWzzkspJXsXku4H1imwJLg+mI8n2lCA1BJOCTXem9WfvCweNfc2XU2LCL/ssaysmxvmdnp6kA0i9lZA8Fa9X0IH0hEr4wecZTbxrOTUi63Gdv12yDbXIVq4Ad7cQkZ7/S92GQ
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id ck13-20020a5d5e8d000000b0033b684d6d5csm7440536wrb.20.2024.02.12.09.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:11:21 -0800 (PST)
Message-ID: <6cbbf8ff-8e8b-4b37-846c-a9d4084f3f2d@linaro.org>
Date: Mon, 12 Feb 2024 18:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 04/20] drivers: crypto: meson: add MMIO helpers
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-5-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-5-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_091125_431306_B8C3BBAF 
X-CRM114-Status: GOOD (  17.43  )
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

On 12/02/2024 14:50, Alexey Romanov wrote:
> Add MMIO access helpers: meson_dma_start() and meson_dma_ready().
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
>   drivers/crypto/amlogic/amlogic-gxl-core.c   | 24 ++++++++++++++++-----
>   drivers/crypto/amlogic/amlogic-gxl.h        |  2 ++
>   3 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index 7eff3ae7356f..1fe916b0a138 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
>   
>   	reinit_completion(&mc->chanlist[flow].complete);
>   	mc->chanlist[flow].status = 0;
> -	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
> +	meson_dma_start(mc, flow);
>   	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
>   						  msecs_to_jiffies(500));
>   	if (mc->chanlist[flow].status == 0) {
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 54113c524ec5..372c30f72072 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -23,18 +23,32 @@
>   
>   #include "amlogic-gxl.h"
>   
> +void meson_dma_start(struct meson_dev *mc, int flow)
> +{
> +	u32 offset = (mc->pdata->descs_reg + flow) << 2;
> +
> +	writel(mc->chanlist[flow].t_phy | 2, mc->base + offset);
> +}
> +
> +static bool meson_dma_ready(struct meson_dev *mc, int flow)
> +{
> +	u32 offset = (mc->pdata->status_reg + flow) << 2;
> +	u32 data = readl(mc->base + offset);
> +
> +	if (data)
> +		writel_relaxed(0xF, mc->base + offset);
> +
> +	return data;
> +}
> +
>   static irqreturn_t meson_irq_handler(int irq, void *data)
>   {
>   	struct meson_dev *mc = (struct meson_dev *)data;
>   	int flow;
> -	u32 p;
>   
>   	for (flow = 0; flow < mc->flow_cnt; flow++) {
>   		if (mc->chanlist[flow].irq == irq) {
> -			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
> -			if (p) {
> -				writel_relaxed(0xF, mc->base +
> -					      ((mc->pdata->status_reg + flow) << 2));
> +			if (meson_dma_ready(mc, flow)) {
>   				mc->chanlist[flow].status = 1;
>   				complete(&mc->chanlist[flow].complete);
>   				return IRQ_HANDLED;
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index a36b9bac63a0..59fc6a67e0a9 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -163,6 +163,8 @@ struct meson_alg_template {
>   #endif
>   };
>   
> +void meson_dma_start(struct meson_dev *mc, int flow);
> +
>   int meson_enqueue(struct crypto_async_request *areq, u32 type);
>   
>   int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
