Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65216C77B7A
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0JB6RHtIcfhG3nzGV9Qf/soMrQ2YXx/B+ucwmDdWT1A=; b=GaumzFS5pezCPuqUjJcOY56Ylr
	BLSpaFdqvaBnTZz7SwCzIa1Nl9YIKO0pWQ7ViFClg9E1WwsgJA/OoLpuA7HQ2+hZF4kTSoUeE9ad+
	n7HksrIUAfbrG0ZuKAJ5k+L9Bb4IrFHLSws6phbQKD1Tx2wDsuJsRRk2ccKmZnlaWCfUqBpP+fQMx
	ZM8Y5SREtJ7ShvVyTki61z1rAfvKJb0B9h9f06uRtNxHT9uQMZbOAA0Pk79eB6L4LthDrKeQa9Xam
	Kjw6HwdFKLfdnklZrQdR3Lo4MTJTgepXOTmZR8QEqdK1G2Pq8FKMdzIP0JGUvwL8o8kkMqKZT3qGn
	AoCxwBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5564-0072Tu-0A;
	Fri, 02 Jun 2023 13:45:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5560-0072Se-2e
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 13:45:38 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-30c55d2b9f3so1136044f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Jun 2023 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685713534; x=1688305534;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gF49zRdU5uYPaFJUudEu7rAmB8Wh16UloOD04JQ8NIs=;
        b=RVJEO2eVuCuiL1511OFZBGs54XGY4/XZu7MAVL9WepBFRG2JZjVui9DsL7r3zRTsfS
         AtGDQQzas3aSWpLbtbl6G0ZFPkbaOKdwRUfVLu76hUoIYRUh3MIQSFsy82zLtF1S5PZn
         zMe2R76tOb/Yv1lAf7Q1FTQi59VTSwVi8ODHs2nn8dyR7k/mhsb1/0zMmK2tjYhfx/25
         tKJvKlq8j94Sf6vyQwR2SyM93KBsPTp+LY5KnSkOWzN6MKI96mUuhR6cVIeYyFisHsA4
         zgh0QxEEMbq0Sw7hSZVN73QrgTEdmWhWcioTGzztTTnYGbDoG2UO1Bs7+sxNW6LFUhPf
         3YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685713534; x=1688305534;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gF49zRdU5uYPaFJUudEu7rAmB8Wh16UloOD04JQ8NIs=;
        b=YA9oDVVNgCegc9LHv1zT8uLVnQLfQRq6cBaz6Z10GTAdkv7KJ9N8swoEUbSIc1Dk5Q
         oC9KrpkkkTAgqvxb8E4/1p6ms0XzkPcs4+F5HwvZzNOVoGU0DL8vgpGziULTjqjShGxi
         JtjMqeKKQOybbDNVIchPFnxEUEsVP+3EJx622YOb0ZJLid+TNI3RArN03XK5FcvWXdlS
         knpzsO8fZtWfJ63eLBY+XCC/eDrl/U/zaQbrA4FWBoPmKoT5hHKuKMn1x5HMqPM+h2F+
         oxM9vosVm/ZvSOSAlHpMSJJy1w443OEyGtxe9Glq0X65di6Uuk/cIJnankj/MsPLyH8G
         yVNw==
X-Gm-Message-State: AC+VfDxt2iqhB3k3bQw2TDzzt9aL1h9gbNp25k6OM/aXEaDKtLulduQ3
	2OJh/IaQQKOqj2yg83WAbAtPuA==
X-Google-Smtp-Source: ACHHUZ7e5gX8srqJY3LI2LuOHEcTHAy31A308Z2pNKwyz3Q8cm4AnEw6BqUi6wXA0jx4C2egKv13DA==
X-Received: by 2002:adf:f2c7:0:b0:309:e24:57aa with SMTP id d7-20020adff2c7000000b003090e2457aamr45060wrp.19.1685713533710;
        Fri, 02 Jun 2023 06:45:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2? ([2a01:e0a:982:cbb0:cabd:b6f:39ae:51a2])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b003093a412310sm1741471wrx.92.2023.06.02.06.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:45:29 -0700 (PDT)
Message-ID: <cc95cd30-ef3c-63e3-0f44-ad6338c7ed8e@linaro.org>
Date: Fri, 2 Jun 2023 15:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: venc: include linux/bitfield.h
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Nicolas Belin <nbelin@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>, Carlo Caione <ccaione@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230602124539.894888-1-arnd@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230602124539.894888-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_064536_859638_F11387E9 
X-CRM114-Status: GOOD (  12.70  )
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

On 02/06/2023 14:45, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without this header, the use of FIELD_PREP() can cause a build failure:
> 
> drivers/gpu/drm/meson/meson_venc.c: In function 'meson_encl_set_gamma_table':
> drivers/gpu/drm/meson/meson_venc.c:1595:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
> 
> Fixes: 51fc01a03442c ("drm/meson: venc: add ENCL encoder setup for MIPI-DSI output")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/gpu/drm/meson/meson_venc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 2bdc2855e249b..3bf0d6e4fc30a 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -5,6 +5,7 @@
>    * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/export.h>
>   #include <linux/iopoll.h>
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
