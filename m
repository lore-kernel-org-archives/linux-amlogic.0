Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B38EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl3uMK8nlwuZJ8tzXooxpei3F7vocHxRxw76XoyuKrc=; b=WtmGwI8rPWkQGU0K+UuxGol8cA
	kRwKEMfQDzwO7qUbvHKswNhtTjUpiR9T4IT6E+eGLIFjk4+ByXAKCuC+yHaJRqVxFmCNS9PDLyZUC
	b+WbQqv84qBMYwPc+3MVg7qqAK6ESHr4iaIZBwpbi9GSWrS10V/8nGTYK2AN4Tsk+UX5OBSGWeUEB
	VRZE57NrE9BVy7LgT3X+EXvEit25oB8GB7Bbb6jATzAA/s4vB0mk6omar/Fhxhneh54DYznkXsjcr
	3/1M77glSOlCNsqevZbP1D4hoVybOAVcbN4yEkPeYMJmfK2InWGxu1O8tswv13T72ZM4RqzryR6Yz
	vgGGXxBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ7H-000k4j-01;
	Thu, 06 Jul 2023 07:09:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJ7E-000k1u-0M
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:09:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso383705e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688627361; x=1691219361;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e+3UxZtzHVgpN6AySbetYQrNrrAcbanGA/ITUARrZTA=;
        b=joyw8U0qByKFtglxOZnIe4fsCxJKWScziH7T+kOstAb0UKThqasBr5CdPEY5B1i2wr
         m8bJPFWK+EcfKKZXrttWGePda170qVCwdehzgiI/9cO1iau6sLuw+OokUf36N4AAc/ix
         1emyeXwHLEDabZWynbCxNkxcohY1NXf7bY54Omq0JDF0RN0bNtAetf0qaSaBsiQIa5h2
         G+GD6+cGPDTzmC3Lh/QGA7s/eYZ2VvVtoVZrIRx2Tv+rP1mJn1A3GX4qpIWc0M3y0tu1
         pJq+4yNyTAfSYFXOGnL4z1ScNb6DNI7ypt70EIWSkceScCrzjY1pmvUL8bhvIg7GkleD
         8ylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688627361; x=1691219361;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+3UxZtzHVgpN6AySbetYQrNrrAcbanGA/ITUARrZTA=;
        b=JZ94Rj6UbWJVzyHZQckLbnhbT8EbIrLSxEtGgEyOMbpF1p4gOrV/9FLWl0OG2JEO8o
         zGOpVxbK0MQOCl/qJHnqOxGCCBb2FBayf3/osPgETKeZY1zxDk3LPM5NBMTmSbNDwaku
         QWs6uqQMmwD5QslcCx8pjzgSluQmal9oBqW1h1ql81ovcA+skG3FRn2obBErw31hRBbx
         mfqFmPydIWwBP9U042l/I+/bsAt2t/Brj/mOeOHQ7mJLzl91aSffQNqZox+6B0nt7s6W
         J24C0AtNpYJUHWmQaKD9wRa3KxxOAhyLA23cQgwVGhH4O+TJht4Z2bWZT+tPhGi9Pda1
         +28w==
X-Gm-Message-State: ABy/qLb7lauwNMrf9uzkOx3BNw8Dt36yg1zpFMEeIQPtIfp6oxafUEWF
	ZDak4eUsY9nigilWvGbCC/Zufg==
X-Google-Smtp-Source: APBJJlFON4bLuwxCrqhdPT27/apuffS9FmUkfshZ1Q98OKa5xztSFTpSlUmvsazqmjuaOs8p4DyYvA==
X-Received: by 2002:a05:6512:1ca:b0:4f5:1418:e230 with SMTP id f10-20020a05651201ca00b004f51418e230mr734913lfp.52.1688627361586;
        Thu, 06 Jul 2023 00:09:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15d1:2748:ead4:bdff? ([2a01:e0a:982:cbb0:15d1:2748:ead4:bdff])
        by smtp.gmail.com with ESMTPSA id v19-20020a1cf713000000b003fbb00599e4sm4227903wmh.2.2023.07.06.00.09.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:09:21 -0700 (PDT)
Message-ID: <80b3c16b-fbf0-4c52-af1f-b9965cdeab5a@linaro.org>
Date: Thu, 6 Jul 2023 09:09:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 5/7] tty: serial: meson: add independent uart_data for
 A1 SoC family
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
 <20230705181833.16137-6-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230705181833.16137-6-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_000924_153252_F0AC7DF5 
X-CRM114-Status: GOOD (  15.45  )
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
> Implement separate uart_data to ensure proper devname value for the A1
> SoC family. Use 'ttyS' devname, as required by the A1 architecture,
> instead of the legacy gx architecture.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/tty/serial/meson_uart.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 6a63184b8091..84cf10b0ca5c 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -818,6 +818,11 @@ static struct meson_uart_data meson_g12a_uart_data = {
>   	.has_xtal_div2 = true,
>   };
>   
> +static struct meson_uart_data meson_a1_uart_data = {
> +	.uart_driver = &MESON_UART_DRIVER(ttyS),
> +	.has_xtal_div2 = false,
> +};
> +
>   static struct meson_uart_data meson_s4_uart_data = {
>   	.uart_driver = &MESON_UART_DRIVER(ttyS),
>   	.has_xtal_div2 = true,
> @@ -836,6 +841,10 @@ static const struct of_device_id meson_uart_dt_match[] = {
>   		.compatible = "amlogic,meson-s4-uart",
>   		.data = (void *)&meson_s4_uart_data,
>   	},
> +	{
> +		.compatible = "amlogic,meson-a1-uart",
> +		.data = (void *)&meson_a1_uart_data,
> +	},
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_uart_dt_match);

With the real struct name:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
