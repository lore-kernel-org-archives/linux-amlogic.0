Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B163C4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG1Gcb7BI3yroIdDKazzh6ufmykpTeP0Jo6eZl0FtLs=; b=RXhSu0dSqvwxWOLNKAF1d5czI5
	I31/lFeP6THDUaVLSqFkkFwfvL2o6kjtLExKkP5i4KhV3Mdn8nFm80s3nF63k8oKWXDU/0PbR9CPU
	GAaCuMAZqP9P1Ogw/qWP7ZPgWhetIBpMqeC+lIiIqU7dDRjyvBUuYu18oUnH6Ca20dJOZvjAn2z5d
	Et4pG86w88AebsNmwoiFZF5oEAFLZ0+PihOwOk6mkvl5fCkeBEGSYKK+vJ85Rikl1T67j7fPgs127
	BG3xAkIJNB5JFTrW9YDOH76edxdT1fSE2z9F3ZQz8wUgYsh0ybu9cKh+duLzW0/A2FD75wR1AFVSQ
	aXSdRPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZnW-00000006Lqf-1sUh;
	Mon, 12 Feb 2024 17:08:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZnT-00000006Loe-2NkW
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:08:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-410d57a533dso8533415e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757726; x=1708362526; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0iuLXGNjpFke4Q7i+u3Xwr+sJ1jAJKm4/0FM4ijjUo=;
        b=fpVt/2L0qkdKMnztje9aDG941EtIadNcuuJ+IsoMFicGZTTS/0Vnhzwh5KNGnvzVsn
         ApMtwkg5gf5IebHzIbugF/5c94ggtGoy/5fDJJNS7GUsdu8nO7zrIObU0yYToZ5JSkBb
         CKSJ70f+Jr/fqa3Lb3oko6TLyWSqtynmtbkTk6FEyxBq1Bya1Ik6/EY+H1Z87ZZf42Q2
         l+DW4yvtpe6BmkeyJ2VXrbzZFqPGLbLn7SkmnQxrMMslVeNeCeGPrHd+YWxhA1ge8apC
         h80QMOX1UjD4uDPgIUwpBTbQ7wO7orYs37JN5Wtq2FIj+DFTtliuBuALvheGaVYFDrDx
         aiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757726; x=1708362526;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K0iuLXGNjpFke4Q7i+u3Xwr+sJ1jAJKm4/0FM4ijjUo=;
        b=VE+loGTgEqi428scB+xxbGpVYejIVvJKl75Q5hJz6AtLzolmmco2oUR2ORnDQlFy10
         PakZ0OGKXW+zzmtPRWSU5hlri1DZeBVywusEnZ8DHOAvXKUODIKVt7D9fuIe2ZZH3/1y
         8t/TmyBh0hjzfo5l6qAdhpnqzZBdWRO/hSe5KW3m/2xQWbS8ZiZbfM2pgZtFO6ToC9qz
         uOtNcHBV0XFy97Flq6Ycrg2VMTBb+8SGo8DS/jqI37B1KnMOEifCqDnFvJamxOjGHQyA
         BtHhCkqNis8Lyv3/E1XR+7s0GBD+HEGVh4p/ZNoDqv6MZYvrI8277yOo1xxdNk2468ub
         Fqwg==
X-Forwarded-Encrypted: i=1; AJvYcCXQas4npODrCErXitfRBjdXG/+QGnPKh4ylI3sSZJIdmoJ15nUI6EloK47Z/ZFSMLSfDHNbJR6DMkXqt0T1puVagzZ+7kn6i6wKrwxviNi0+g0=
X-Gm-Message-State: AOJu0YxrUyx7Lqfl9f0AX5/WFOD5na7dUICFPkLbi174/l1h2PxEzCIr
	usAKhmFR/zvX+VtBJiLzrkSWYiaA0uw/TBFkByPPqsJvRiWwkk/hB+WQVFq8qARf9OkEXyfgGC7
	f26GHuw==
X-Google-Smtp-Source: AGHT+IGy69D6aQBM/bkYPnISNw5ksoPp43llgNMxSd8DN5Wb3xtt9O4vPE7vD+2iGEH1bgsPA01Lvw==
X-Received: by 2002:a05:600c:1547:b0:410:c25d:38fe with SMTP id f7-20020a05600c154700b00410c25d38femr2996359wmg.28.1707757726064;
        Mon, 12 Feb 2024 09:08:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVeEALurTnullkTQeCej3c6aywgLg8EIb4V+oERO4gytOKg+Jcdptt7tvwhN09zOpebRuL49Z6kh/I4sccBVL0lrOIwC7+VDNXiT8jzs406ORK5uQbAUPnbh8vRnnFpmVT/siYNGsLE+ru4Vbx/Or1ckFEV0UcF6VcZzr8sR5adLWXIxl/edvb1o+op/oztn8BMEDwvpJg36it/mqLdIym7cxmgU8PT0Dclv5g0OK7xvdIOW3ukra8xmAAj5FVq/HPoUHLIbLvj3HKH61RihzshKj34t0NfAmwxy5XisJjAiG9QI35/RkW0ozin2i3hJykAU/e4HPsHenQo17vtws2DWGggU5BbUjnS4DTU5dHn3aS4GrKitXZMcxGPnAfDFI52atxfae7CL+5r+T/Ur0oReh/tTyPqCUA4JTpQ7G411WaNnueWUKsuMRig9aofEefsi9al7B/DJ3CgOCpGNBKU28/HOWFj8+vldOsqdwcurSWsDhDdGHvuzRGRQrjSofyMJCCupm2eUmiLgmK/+gNvIg1pKVIFKqaDr88o0OkJnHJesNz7f2vrBucP4YboBjSj6lsSH/E/OizqlCYGswzjDC1l8NpRn1je
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id l13-20020a1c790d000000b00411ac52b54esm320997wme.46.2024.02.12.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:08:45 -0800 (PST)
Message-ID: <233ca2ec-ba1d-403f-b1d6-ba1b2c856e7f@linaro.org>
Date: Mon, 12 Feb 2024 18:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 02/20] drviers: crypto: meson: add platform data
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
 <20240212135108.549755-3-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-3-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_090847_645563_71AC531A 
X-CRM114-Status: GOOD (  24.39  )
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
> To support other Amlogic SoC's we have to
> use platform data: descriptors and status registers
> offsets are individual for each SoC series.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
>   drivers/crypto/amlogic/amlogic-gxl-core.c   | 32 +++++++++++++++------
>   drivers/crypto/amlogic/amlogic-gxl.h        | 11 +++++++
>   3 files changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index b19032f92415..7eff3ae7356f 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
>   
>   	reinit_completion(&mc->chanlist[flow].complete);
>   	mc->chanlist[flow].status = 0;
> -	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
> +	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
>   	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
>   						  msecs_to_jiffies(500));
>   	if (mc->chanlist[flow].status == 0) {
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 35ec64df5b3a..4d1b1d5b7a54 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -18,6 +18,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
>   
>   #include "amlogic-gxl.h"
> @@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
>   
>   	for (flow = 0; flow < mc->flow_cnt; flow++) {
>   		if (mc->chanlist[flow].irq == irq) {
> -			p = readl(mc->base + ((0x04 + flow) << 2));
> +			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
>   			if (p) {
> -				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
> +				writel_relaxed(0xF, mc->base +
> +					      ((mc->pdata->status_reg + flow) << 2));
>   				mc->chanlist[flow].status = 1;
>   				complete(&mc->chanlist[flow].complete);
>   				return IRQ_HANDLED;
> @@ -245,15 +247,35 @@ static void meson_unregister_algs(struct meson_dev *mc)
>   	}
>   }
>   
> +static const struct meson_pdata meson_gxl_pdata = {
> +	.descs_reg = 0x0,
> +	.status_reg = 0x4,
> +};
> +
> +static const struct of_device_id meson_crypto_of_match_table[] = {
> +	{
> +		.compatible = "amlogic,gxl-crypto",
> +		.data = &meson_gxl_pdata,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
> +
>   static int meson_crypto_probe(struct platform_device *pdev)
>   {
> +	const struct of_device_id *match;
>   	struct meson_dev *mc;
>   	int err;
>   
> +	match = of_match_device(meson_crypto_of_match_table, &pdev->dev);
> +	if (!match)
> +		return -EINVAL;
> +
>   	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
>   	if (!mc)
>   		return -ENOMEM;
>   
> +	mc->pdata = match->data;
>   	mc->dev = &pdev->dev;
>   	platform_set_drvdata(pdev, mc);
>   
> @@ -319,12 +341,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
>   	clk_disable_unprepare(mc->busclk);
>   }
>   
> -static const struct of_device_id meson_crypto_of_match_table[] = {
> -	{ .compatible = "amlogic,gxl-crypto", },
> -	{}
> -};
> -MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
> -

Please leave the struct at this place, and use of_device_get_match_data() instead.

>   static struct platform_driver meson_crypto_driver = {
>   	.probe		 = meson_crypto_probe,
>   	.remove_new	 = meson_crypto_remove,
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index 79177cfa8b88..9ad75da214ff 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -78,6 +78,16 @@ struct meson_flow {
>   #endif
>   };
>   
> +/*
> + * struct meson_pdata - SoC series dependent data.
> + * @reg_descs:	offset to descriptors register
> + * @reg_status:	offset to status register
> + */
> +struct meson_pdata {
> +	u32 descs_reg;
> +	u32 status_reg;
> +};
> +
>   /*
>    * struct meson_dev - main container for all this driver information
>    * @base:	base address of amlogic-crypto
> @@ -93,6 +103,7 @@ struct meson_dev {
>   	void __iomem *base;
>   	struct clk *busclk;
>   	struct device *dev;
> +	const struct meson_pdata *pdata;
>   	struct meson_flow *chanlist;
>   	atomic_t flow;
>   	int flow_cnt;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
