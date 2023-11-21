Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140BC61D92
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Nov 2023 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0JgGzdfk9awuy3Wb8TEJ9JI8ca5RwaHoYv1M4JIDRk=; b=Zu/pLn49JZsbWMZaIMbAXMgC+V
	Tj9DthcNmOF+noIHn0j4X1sG/Ldh7QTkFkJBF3TdCJGUl1tAIbyC6PYWQ5shJ2DIqXAXuML/XUU1q
	keqxp7FEfcXWSnfBt5KwKBSF2eqscppQ2kcOKKK81R4BeZ+raHQvoRU0rs9hgnhvar9IlKBfiEsn6
	pQ9XMTPDt3P1jFFrRpizQ8KTfWoDaMl+dhXsekXpRCTU7iSkxFUzSmxMb+gcDutsdvGruTeX8CtC3
	c3u5XRvxmxVcj0Ej50S1auIlsqSPNfPHDPh/BskCDpTojUjqrBTMFS9ttJHWz2VXc3GSPU5GtbW6v
	+d9EtIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OcP-00GNNQ-2w;
	Tue, 21 Nov 2023 11:08:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5OcN-00GNM3-1O
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Nov 2023 11:08:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso20661455e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Nov 2023 03:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700564910; x=1701169710; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjdtNxULy8GpfsKCvdM83K03LmtKeMMcPxb4JkNuP7s=;
        b=ZYlbV3tH8O1mx9QtVfLAj9qwucirWMGCofHUcmjujzSqfXZKjNNHX4HB1XrzAQCgQo
         Lyp3LNF6v/bSofxE+ofT1Jkjx3QAUZBtrijuU1RbX6C1x80tkoo4glGnAfC3M3vZTyGV
         WIUOXEpXGITYhZGh+3FkObymfNFBoO8xRLXOkuK2Po0SXQyezL6+7zbe35BQnan/E7t/
         9z7uv5aZiWncfjoTjW9jsCW+Q5biRee7mpECNV4antJ5YffBU98A5FXYzFlTrygzCx0h
         5LC8t3rZ8HKgkiRADPXGLIsfK5/iXbiFrqoMYATEwVLUJIP9VMkvoDlPpm2TyQ8ddR7n
         jrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700564910; x=1701169710;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GjdtNxULy8GpfsKCvdM83K03LmtKeMMcPxb4JkNuP7s=;
        b=aDw45W/TJQHLvvF/wrBujW8XNu9qxhFlrIi4rCzaXTHdVFHdbrX3XIt5mG37zBqvu/
         2WPlNkHUkgujK9VV9dl/UgVdR8ryM+f9trvLsi+Hr3BQ/RAx2+SJ0afL0L3kuFN72erx
         54DqpgX2M9QCaH9YjX6ieiIb3EalqGU/wBgrIi5fS/PLQKwsmOqsy43jAIJPOVhlciiM
         ZZmo9KWFvW4WJjUqWWfebdkP6mphd261nwo5iXxXEPqxCTYqwt1Fxu6Gjz1w+KEg2/TY
         anZq/1ynO/wSetGtBUO254mSQCThLEh9bC0AjYkjr2EDNcHUOT1853/YmSf/uVSjYvX5
         W0TQ==
X-Gm-Message-State: AOJu0YyGFbUDwzcT94VdZRAxpYcIgLNsLt0z9OoerIHzD6ZIRWC33Bfl
	Pk41T2WSsxLJSfCffRRxe84LFA==
X-Google-Smtp-Source: AGHT+IE06AyXcbIInK/ALarbb+zk6R0IAgBeYBiZpcgR5OQCTkC4jUkRjeSmSTNHO5ygCD7WzMWbLg==
X-Received: by 2002:a05:600c:230a:b0:408:37d4:b5ba with SMTP id 10-20020a05600c230a00b0040837d4b5bamr8384988wmo.12.1700564910505;
        Tue, 21 Nov 2023 03:08:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a39:bc19:20b6:16a? ([2a01:e0a:982:cbb0:2a39:bc19:20b6:16a])
        by smtp.gmail.com with ESMTPSA id jg6-20020a05600ca00600b0040b2c195523sm449723wmb.31.2023.11.21.03.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 03:08:30 -0800 (PST)
Message-ID: <f693f5c2-7103-4d32-bc38-6832b0f46453@linaro.org>
Date: Tue, 21 Nov 2023 12:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] iio: adc: meson: add separate config for axg SoC family
Content-Language: en-US, fr
To: George Stark <gnstark@salutedevices.com>, jic23@kernel.org,
 lars@metafoo.de, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, andriy.shevchenko@linux.intel.com,
 nuno.sa@analog.com, u.kleine-koenig@pengutronix.de
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kernel@salutedevices.com
References: <20231121075000.133711-1-gnstark@salutedevices.com>
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
In-Reply-To: <20231121075000.133711-1-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_030835_466770_BF432F1D 
X-CRM114-Status: GOOD (  12.67  )
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

On 21/11/2023 08:50, George Stark wrote:
> According to Amlogic custom kernels ADC of axg SoC family requires
> unique number of setting so add dedicated config for it.

Please rephrase precising AXG has vref_select and requires this setting
to work nominally and thus requires a separate config.

With this:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   drivers/iio/adc/meson_saradc.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index db280da9edbf..34555a85f131 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1242,6 +1242,20 @@ static const struct meson_sar_adc_param meson_sar_adc_gxl_param = {
>   	.cmv_select = 1,
>   };
>   
> +static const struct meson_sar_adc_param meson_sar_adc_axg_param = {
> +	.has_bl30_integration = true,
> +	.clock_rate = 1200000,
> +	.bandgap_reg = MESON_SAR_ADC_REG11,
> +	.regmap_config = &meson_sar_adc_regmap_config_gxbb,
> +	.resolution = 12,
> +	.disable_ring_counter = 1,
> +	.has_reg11 = true,
> +	.vref_volatge = 1,
> +	.has_vref_select = true,
> +	.vref_select = VREF_VDDA,
> +	.cmv_select = 1,
> +};
> +
>   static const struct meson_sar_adc_param meson_sar_adc_g12a_param = {
>   	.has_bl30_integration = false,
>   	.clock_rate = 1200000,
> @@ -1286,7 +1300,7 @@ static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>   };
>   
>   static const struct meson_sar_adc_data meson_sar_adc_axg_data = {
> -	.param = &meson_sar_adc_gxl_param,
> +	.param = &meson_sar_adc_axg_param,
>   	.name = "meson-axg-saradc",
>   };
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
