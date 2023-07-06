Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A660EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1GAzzN9+3kwFpu+XFszySEmB8+15f+2WRBhuXwQd9A=; b=w8VtfJOgl7Vg89Y12TG1GgdSOC
	lXcnTHrbdRvqExwV+7fHQRz3zoheNReTZ0539bjvBhT8XBLCqTpk02zNSaAws5kYcB3DanS7kpmtH
	1HcqqfqSy9w/yf9XQu3bz8yOvWnQfR7dBOFnH7OkoSfSF8Ts8ojMclK7N/pj+lnRXGopPEQvkAcZv
	J0nRUe2+JLuNqXLy5JILxzCHicNIbwBOl8DONEGitYedXs9MgrZ4xsNs77jnfsndxqf29e9+lDj1g
	B1+C07Y4rhGv4FqNRMN0UyosUxCziSdTJD3cgb+kBstnzTLSRoByYhleDMWRFA2Hq8RriS1MknsMM
	OHDjKJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ7B-000k1N-11;
	Thu, 06 Jul 2023 07:09:21 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ78-000jyb-2Y
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:09:20 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b703c900e3so4394381fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688627352; x=1691219352;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plmZ0h8i9sq4RHWU4DDCLjYO4HpotTDagLCFOMDhSlY=;
        b=xIwiu9Y6vbnS82nhfebFqnQdHjPSKebEsBwnSxUMm8JSAlTWAmIDYrEWOS4xAXETiq
         CMdRmqIz4OLiv4jNcTZw5JVgjC3Z6/ZxOZez6DTQioXnT4GNfRjVHI+dR+UvoU0msYVl
         nUOsbabplWcjcarlchb96kV8mVpAeH8aPr5zf2UStLpILjApZd5ja8PNdbDC6H3TDak6
         nbrpTxpywB2jiqZZIvb309RDW+2sxuE850yGXtilfurszckER6Z3aBZkWM0TYc/lbZX/
         elkmAYi9vB8frufrILukrR/SNpDXADzidXh+Gdi5q9Jn5QTpuuB/OGjQfWltff2awozg
         Pe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688627352; x=1691219352;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plmZ0h8i9sq4RHWU4DDCLjYO4HpotTDagLCFOMDhSlY=;
        b=lhfJs8T6rsKlX1EGhOiawvza5mboFcURFkYUYll57uufJ5iIPk+4eVQlvhXReBBnBT
         hWUo+mouHUqlrmRMhulWZnhUf3PMkUEKI947k4oLt5u9rjRNWh/U/FYWQxFrP5gENbas
         V5dTIX0px94qSbLH5edhRevF9wRw5ohmIM5FHETnuRu7LOiVMML3OxPw6wvoSY9mvzX5
         GRejubWkWWh1mCYCNpnKqVGD7Z7lCqJ0P8Ri2LnH99lrsLHWJqir1QgV3NmLnqOse2E0
         jInVNwX2S++W4uD8iP6eoMCjRYkujzY4vZFRP8cTda2ZlQSyTe3OUIZkwAs24Bjhp/Mw
         z9ZQ==
X-Gm-Message-State: ABy/qLbQ5qxCZ1rl82h0xT7bzGH6IVWMivWOPElL+KZny6mMhoBojCPL
	SExVQ3uUIM/jg4Yt4Ujnkbsj/Q==
X-Google-Smtp-Source: APBJJlGQIR7wFWC4Jxx97JnuXfSxfTwE5u86C3BNsee1uxgxFPIMdNLES68r80nFrhLiA2eZWixj4g==
X-Received: by 2002:a2e:7802:0:b0:2b6:c236:b040 with SMTP id t2-20020a2e7802000000b002b6c236b040mr683275ljc.12.1688627352432;
        Thu, 06 Jul 2023 00:09:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d1:2748:ead4:bdff? ([2a01:e0a:982:cbb0:15d1:2748:ead4:bdff])
        by smtp.gmail.com with ESMTPSA id c3-20020a5d4143000000b003143d80d11dsm1006985wrq.112.2023.07.06.00.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:09:11 -0700 (PDT)
Message-ID: <62de5067-f651-67d8-3779-46b1fe0bdd08@linaro.org>
Date: Thu, 6 Jul 2023 09:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/7] tty: serial: meson: introduce separate uart_data
 for S4 SoC family
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, gregkh@linuxfoundation.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jbrunet@baylibre.com, jirislaby@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: kelvin.zhang@amlogic.com, xianwei.zhao@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230705181833.16137-1-ddrokosov@sberdevices.ru>
 <20230705181833.16137-5-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230705181833.16137-5-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_000918_825969_0F370F0E 
X-CRM114-Status: GOOD (  17.85  )
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

On 05/07/2023 20:18, Dmitry Rokosov wrote:
> In order to use the correct devname value for the S4 SoC family, it
> is imperative that we implement separate uart_data. Unlike the legacy
> g12a architecture, the S4 architecture should employ the use of 'ttyS'
> devname.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/tty/serial/meson_uart.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index ad0748a10db7..6a63184b8091 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -818,6 +818,11 @@ static struct meson_uart_data meson_g12a_uart_data = {
>   	.has_xtal_div2 = true,
>   };
>   
> +static struct meson_uart_data meson_s4_uart_data = {
> +	.uart_driver = &MESON_UART_DRIVER(ttyS),
> +	.has_xtal_div2 = true,
> +};
> +
>   static const struct of_device_id meson_uart_dt_match[] = {
>   	{ .compatible = "amlogic,meson6-uart" },
>   	{ .compatible = "amlogic,meson8-uart" },
> @@ -829,7 +834,7 @@ static const struct of_device_id meson_uart_dt_match[] = {
>   	},
>   	{
>   		.compatible = "amlogic,meson-s4-uart",
> -		.data = (void *)&meson_g12a_uart_data,
> +		.data = (void *)&meson_s4_uart_data,
>   	},
>   	{ /* sentinel */ },
>   };

With the real struct name:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
