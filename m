Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07867C36010
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 13:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQOnPB55XqGl+GYD18jKJ4v9lERci/MuM4Gd8ps4Qhs=; b=eZLMgmXDjpZ8c3b4/Vgs9A5070
	oqqw60kucz9yMnL4pGOA/5ouVO95XjdkIXkZ6YiMI5KBR27WVcV8m8N1SmGHAspTwGALIBlOsw476
	JPWpxOh3HRgGpBVSjRdoLO3BpTOvk+Zaym/z55MN5/2+hwMJcNNlhxmfpxbTdevJryZQy/K+YILJn
	eg/2/LZg8Ki+aVjtGrOmKe0N7klKOwsfLpKWaV9ll1T/+wbC4C45jYzDYbVU8ly88fPxZVqeYw+Ko
	QBpscDEALQPhrX1la9kicWhWqoAaQcUo4HaTfZ6qB0+kWQ/yEKJCXlyua3y8tgrBrGO01gOIYuBkK
	5i05oVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ea8-0000000DxEk-0p10;
	Fri, 11 Apr 2025 13:38:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ETq-0000000DwD4-39y5
	for linux-amlogic@bombadil.infradead.org;
	Fri, 11 Apr 2025 13:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=Ys2zmQKpfW4P35WF6lXbQzSiSIW2EulzVdbiG/PaLWA=; b=NcwHbg4lCqKgM5cQWdOAequwV8
	wlN90N2WjMTSBW67vqyLdQ+bLC4BTMQcj9/y9Bn7Fpqq5gTCgIaLA/hEdU8NVP9CueC+xIE9gVOGX
	rQEVOBjBmqP/J3wBg7Dj/YBiRORt9wwCowbAZEWOdwwqV0E0fwQg2/3dHqHnXaWMGAcFBSFjlun+q
	BCjIW+k1etX0DBM5VXoimNo2TS0P/yrPHkNCrEYS+GwVzQ0ZsKUHEe3l1qqf3AC5SCZPhsWPk9XLu
	Q5QRgPP+vkBQ068PCsT/VlsRMnBEXTMBZRlqyVAx8LTSALXc0RLvt4C942WshsmirxVdm7nfo/D3Y
	fEGmDU8Q==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3ETn-000000091YH-0gEj
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 13:31:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ede096d73so14732285e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744378292; x=1744983092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ys2zmQKpfW4P35WF6lXbQzSiSIW2EulzVdbiG/PaLWA=;
        b=HdhGLwF+T/AisK7y7ogBGswJidzWT9NcPfKIKlr159QN+Ch+oe/X4Ae95F8xtDdwXE
         oa1VjWCq07tGWA/TMaw9x5KhvKpf4oql0zPuCAg80biOzt25DBQEV0xtqEcN6licCMdN
         ChEBahsHZYv7Ki35763Ii+81HPrvl8Cm7WCKIrQdzQyjG6T33Fp/5LHpUjL0MMYlBHDk
         2EgHQWEfc/xv9sXVb26jH4do+NMIEb0ZOBUoU1oAQfaSYP7G5rUZYG8kXycneo+255jI
         fUdBhEdcInf2RvKcruuPxlrItkOXSFD9k2nqhM+y81TwRiNAOxTd15arPyvDvOX4AOAP
         aR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378292; x=1744983092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ys2zmQKpfW4P35WF6lXbQzSiSIW2EulzVdbiG/PaLWA=;
        b=bj7tr0gBIs/ajkf952tpy9Zw7CmXfklH6R0VHxN+BHrY25ut2a5+rg6b4SeLhn8xq4
         W4Wki7BHDmvm63vSWWScZvCRzvjvgotcs9UtR3Q38Kg4A9uCohNodrl18Mv/KC+khhTq
         lUMgSfh/T5Y6lMOlD1RX9dM39a/nEjHDIn3edaD0vh+tF968SOvBBkIjfFcZY916BNYy
         XkFCZ0uu4fUJHgDQ66mu7rh8KnNsx6LBbPMEutNiQhuOxsexJmNijNORTQ9JfN+OXWM8
         DTU0SJAkhCnHnk98qc4dholTF+E3tg+6A6b5+opdRCiH8g6r8A5Zow0WJ7qoEuaGdO4J
         buug==
X-Forwarded-Encrypted: i=1; AJvYcCUQduzucpRLdCNB2VtW1tubRvfKWKDnJ/6dRxEk40nzZI+IeCbCgcreN8gtEY0CjJ4QUmDPcmTVrT3DxNN0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeepv3hPZW9lINoDMaVB9HIyMdWAAXqi9+Iy8olDPgIXK+jGVa
	ipqcMHZcaJ/Cp2r4kja+OZiM9WQEz1xlIrtQwF0S1Epslebj1k3KUPHTCxvN2P4=
X-Gm-Gg: ASbGncvVX5rs2xsMN3mQF8YpRynXoc9UZ/KLBODiwHajg9ZMx4e2WaXTjvJbD0dxT0E
	Wse7hIiDFjALLyUnz6Bpeb/JcaHidQpK3GO4S6YDmKmUr5EWscrPA6naHlvH1O5QycSy1Ey7a75
	yTWf3stuyXTLlvmDJwJrXhvQcFW5dKoIbib/bDebW7vdrId0vb8y79tXGX6eFH7rEr64wvPH6AU
	1Xksd/hn1MFxRWV2g+eb5chnL6bC0hS9tUOfMKa4mdKKYsdHvFiAnLVKsRIm/pqi3w2wuu52RzO
	pJSiUtdCovuTZEjAb7pDzIgr4rErA9oA3NlFZDgHb70k5FAsl6dAn5o0XVpQ4VEoSM958G6MINC
	X/rIfVkRv/cl2sIK4Qw==
X-Google-Smtp-Source: AGHT+IHyOrozgsuOzZWZs7ZYmaWQ0usXxB6oIaUXRPRoUskrmrPfCCEyNNzxS9EE/RunI0ffXUHN1Q==
X-Received: by 2002:a05:600c:4fc1:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43f3a9b015amr19324255e9.29.1744378292326;
        Fri, 11 Apr 2025 06:31:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d6ebsm87521365e9.2.2025.04.11.06.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:31:32 -0700 (PDT)
Message-ID: <9f10bc53-10c8-4312-b7f7-2935990fb193@linaro.org>
Date: Fri, 11 Apr 2025 15:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] soc: amlogic: clk-measure: Define MSR_CLK's register
 offset separately
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
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
In-Reply-To: <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_143135_442283_4314C67E 
X-CRM114-Status: GOOD (  21.79  )
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

On 11/04/2025 14:42, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Since the MSR_CLK register offset differs between chip variants, we
> replace the macro-based definition with chip-specific assignments.
> 
> Change the max_register in regmap_config to be retrieved from DTS.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 70 ++++++++++++++++++++++++++-------
>   1 file changed, 55 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 39638d6a593c..30387d26307c 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -14,11 +14,6 @@
>   
>   static DEFINE_MUTEX(measure_lock);
>   
> -#define MSR_CLK_DUTY		0x0
> -#define MSR_CLK_REG0		0x4
> -#define MSR_CLK_REG1		0x8
> -#define MSR_CLK_REG2		0xc
> -
>   #define MSR_DURATION		GENMASK(15, 0)
>   #define MSR_ENABLE		BIT(16)
>   #define MSR_CONT		BIT(17) /* continuous measurement */
> @@ -39,9 +34,20 @@ struct meson_msr_id {
>   	const char *name;
>   };
>   
> +struct msr_reg_offset {
> +	unsigned int duty;
> +	unsigned int reg0;
> +	unsigned int reg1;
> +	unsigned int reg2;
> +	unsigned int reg3;
> +	unsigned int reg4;
> +	unsigned int reg5;
> +};

I don't object, but:
1) could you help actually put a real name on those registers ?
2) why adding regs 3, 4 & 5 if you don't use them ?

> +
>   struct meson_msr_data {
>   	struct meson_msr_id *msr_table;
>   	unsigned int msr_count;
> +	struct msr_reg_offset reg;
>   };
>   
>   struct meson_msr {
> @@ -495,6 +501,7 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
>   	struct meson_msr *priv = clk_msr_id->priv;
> +	struct msr_reg_offset *reg = &priv->data.reg;
>   	unsigned int val;
>   	int ret;
>   
> @@ -502,22 +509,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	if (ret)
>   		return ret;
>   
> -	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
> +	regmap_write(priv->regmap, reg->reg0, 0);
>   
>   	/* Set measurement duration */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_DURATION,
>   			   FIELD_PREP(MSR_DURATION, duration - 1));
>   
>   	/* Set ID */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_CLK_SRC,
>   			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>   
>   	/* Enable & Start */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
> +	regmap_update_bits(priv->regmap, reg->reg0,
>   			   MSR_RUN | MSR_ENABLE,
>   			   MSR_RUN | MSR_ENABLE);
>   
> -	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
> +	ret = regmap_read_poll_timeout(priv->regmap, reg->reg0,
>   				       val, !(val & MSR_BUSY), 10, 10000);
>   	if (ret) {
>   		mutex_unlock(&measure_lock);
> @@ -525,10 +532,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	}
>   
>   	/* Disable */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_ENABLE, 0);
>   
>   	/* Get the value in multiple of gate time counts */
> -	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
> +	regmap_read(priv->regmap, reg->reg2, &val);
>   
>   	mutex_unlock(&measure_lock);
>   
> @@ -599,11 +606,10 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
>   }
>   DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
>   
> -static const struct regmap_config meson_clk_msr_regmap_config = {
> +static struct regmap_config meson_clk_msr_regmap_config = {
>   	.reg_bits = 32,
>   	.val_bits = 32,
>   	.reg_stride = 4,
> -	.max_register = MSR_CLK_REG2,
>   };
>   
>   static int meson_msr_probe(struct platform_device *pdev)
> @@ -611,6 +617,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	const struct meson_msr_data *match_data;
>   	struct meson_msr *priv;
>   	struct dentry *root, *clks;
> +	struct resource *res;
>   	void __iomem *base;
>   	int i;
>   
> @@ -636,15 +643,18 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	       match_data->msr_count * sizeof(struct meson_msr_id));
>   	priv->data.msr_count = match_data->msr_count;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> +	meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
>   	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>   					     &meson_clk_msr_regmap_config);
>   	if (IS_ERR(priv->regmap))
>   		return PTR_ERR(priv->regmap);
>   
> +	memcpy(&priv->data.reg, &match_data->reg, sizeof(struct msr_reg_offset));
> +
>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>   	clks = debugfs_create_dir("clks", root);
>   
> @@ -667,26 +677,56 @@ static int meson_msr_probe(struct platform_device *pdev)
>   static const struct meson_msr_data clk_msr_gx_data = {
>   	.msr_table = (void *)clk_msr_gx,
>   	.msr_count = ARRAY_SIZE(clk_msr_gx),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},

Would be great to not duplicate this struct.

>   };
>   
>   static const struct meson_msr_data clk_msr_m8_data = {
>   	.msr_table = (void *)clk_msr_m8,
>   	.msr_count = ARRAY_SIZE(clk_msr_m8),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_axg_data = {
>   	.msr_table = (void *)clk_msr_axg,
>   	.msr_count = ARRAY_SIZE(clk_msr_axg),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_g12a_data = {
>   	.msr_table = (void *)clk_msr_g12a,
>   	.msr_count = ARRAY_SIZE(clk_msr_g12a),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_sm1_data = {
>   	.msr_table = (void *)clk_msr_sm1,
>   	.msr_count = ARRAY_SIZE(clk_msr_sm1),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct of_device_id meson_msr_match_table[] = {
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
