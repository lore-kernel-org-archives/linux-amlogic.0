Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA48C64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdjCBEZdurEuWVCg2zQCK9Jiph1qT731DIxdx3yynE8=; b=I8Z2s2N5Ec9XP7gvG9FZDfASWv
	PZegitFoNXtb72qn3SpZ3XxhuXPqN9YEYDIP/UZU4XsijtK9Csol12LfgQJNIWV++pd0QyvEz4LNC
	Irbqtdv1M7n301ih14uvzwyPJ/lJez9tkZ5bOMz61BM2rrQ5GAkwntGf+rPRUFy/Ml4Izx1p2a4ee
	bwch/qFv/YjLtgQtH4ZNSD6I8CqgH9Bx2p3EsmEvzVnDGgPWTotDyGnwXQ+dRwgFNn8PvGBhuVmas
	wj9Uo9du8P6JOzD9mHjEHkzKjOH+MWJ+9e/etvpsIE5WxLxOojYsGVVmAT2JZSBOQHi4ArkdXXo7a
	SIBdEJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsls-004oBU-Gc; Wed, 08 Mar 2023 12:19:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsli-004o7e-FX
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 12:19:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id j2so15146958wrh.9
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 04:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678277978;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rXvALgLNXOwSxkTFpGdegQSuj49S1SEGCZhhXhGW1Qo=;
        b=SQjZi8e1Y8wjXcVmWAFiXFMxgkXzRUA08zefLSOzhq+ANL7UXTp9S74Ab3MergeMql
         k9CSw1NTqCoFTQ7FHBVu4zBG1jtLGJc1EzkkyitJt1iu8UQ3fg/Qpji8P+8EER4p8b+L
         oniAiIxhQnp2b7nrr/x59Wh3xXQSC/9fFzeY29sUYSgMLRxrbkFLH8nuHQWXIAaF9XIw
         GnO7sm/MuiMXOQ14XB8aHVscMHqc9jAEmswIDFHR5874IjX4O+vWtYGMckDcolHhD+IJ
         PAjkEspvJc/z5mlh/R+NpbPQWQlRaCkeZSOe8x6sCjR7KOEfw2DcUO7KY+9mM/ybfRyL
         bNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277978;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXvALgLNXOwSxkTFpGdegQSuj49S1SEGCZhhXhGW1Qo=;
        b=xe85+wWKr2Qhs9DS/Xw8yoxnJbjuS+ecsjXwHJ8ape6nLJTqgSwBsL9jgdVYEugpp0
         oHEJZ7ld6BY353FM3MxJJNaJGG+kVx79lXtu0Rw6KArp9VzQYBvPHNqdiVY9j0Cfu0Bz
         aqr1zqvyN4U2tn3PZR7MwWhgDzuc0HVkUGeWFGPaiFxUPI27IbP9gdssUkma7ocm19Pw
         c3c9EQt8hm/dh++Rvtl/ik6+Hww4DA7NUDUsqswT+ij9gvggaZERavjqwEsEplQGzPPq
         /latxaP/qvtt7aC1dUSnbeEdkzu/EVNwTBh/ZwOd8fT1BAjMhTtDjkfDR2/Z3XvkUMkM
         RVDQ==
X-Gm-Message-State: AO0yUKXttJhisQgVY1mIMBPIEDpFUYc57+TKlzLHF9wCKsq0ebHASMuv
	i5eD9GKe2bcjZ3NYoG4j2Oi6jw==
X-Google-Smtp-Source: AK7set95ELz8qiTpkF9TOq+N1ZvxqR9tCnjqO9/rzyHVM2ACM5iIX94fw1GxAHp6N4NHvTFJKrA+5g==
X-Received: by 2002:a5d:4ec4:0:b0:2c7:f56:2892 with SMTP id s4-20020a5d4ec4000000b002c70f562892mr11952190wrv.40.1678277977823;
        Wed, 08 Mar 2023 04:19:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id x21-20020a05600c189500b003e71a6be279sm15373743wmp.37.2023.03.08.04.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:19:37 -0800 (PST)
Message-ID: <db540297-2f9b-e420-be33-0a1f1a838862@linaro.org>
Date: Wed, 8 Mar 2023 13:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/3] tty: serial: meson: Add a new compatible string
 for the G12A SoC
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
 <20230307222651.2106615-3-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230307222651.2106615-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_041942_546541_A8D8EC02 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/03/2023 23:26, Martin Blumenstingl wrote:
> Amlogic Meson G12A (and later) SoCs also have the "divide XTAL by 2" bit
> as the S4 UART controllers. Add a new compatible string for these SoCs
> and enable the has_xtal_div2 flag for them.
> 
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes from v1 -> v2:
> - none
> 
> Changes from v2 -> v3:
> - none
> 
> 
>   drivers/tty/serial/meson_uart.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 74110017988a..2501db5a7aaf 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -779,7 +779,7 @@ static int meson_uart_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static struct meson_uart_data s4_uart_data = {
> +static struct meson_uart_data meson_g12a_uart_data = {
>   	.has_xtal_div2 = true,
>   };
>   
> @@ -788,9 +788,13 @@ static const struct of_device_id meson_uart_dt_match[] = {
>   	{ .compatible = "amlogic,meson8-uart" },
>   	{ .compatible = "amlogic,meson8b-uart" },
>   	{ .compatible = "amlogic,meson-gx-uart" },
> +	{
> +		.compatible = "amlogic,meson-g12a-uart",
> +		.data = (void *)&meson_g12a_uart_data,
> +	},
>   	{
>   		.compatible = "amlogic,meson-s4-uart",
> -		.data = (void *)&s4_uart_data,
> +		.data = (void *)&meson_g12a_uart_data,
>   	},
>   	{ /* sentinel */ },
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
