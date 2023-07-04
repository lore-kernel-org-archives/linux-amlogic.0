Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF496EB64DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9xI0Se73Bq87y9YzXOCg/7MjinCR/OiqO+N25b+wRM=; b=xBg5wJW67jVOhr4LE6yMg4WQ0Q
	vESmONX+L15tNJ5no56W/Sacbs/0IXDhMdj7vvaYH4SExNxP6UEVa0oODxQW/mM4qi9KLvlGq7tMn
	hX7yUEEiLjencDmRBZh99k7MWNnJ6E0Zns4xGVX4OwIIRog/9SGPzXBhW1VBxs9ndo3AbH5c4ekEk
	Sfq6ZG/2A0cuiyXk73aPsm0QgAVQ3huEJyhzxpAd4rZZzxWsCtqxYWhnclaV+HPubgv5jUqvOo+ok
	vCMdqSVMl8jR9wL0kbvii0ph03qRRFucZOPXzETRkTSnC+LQJOoXCUDpYuTeZKmqjKBgItnIgP6Pj
	j4ktKw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhIp-00DYLp-14;
	Tue, 04 Jul 2023 14:46:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhIh-00DYLM-2W
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 14:46:45 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-314172bb818so6476274f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jul 2023 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688482002; x=1691074002;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r7WGfX3NpjGNse8P3RuikUKmRu8m7xgJ3of97xkU49E=;
        b=i9YcYKPOfsLQ3niBBhdfPaZKeZPgqqUCoYcehPFwuct4jJsABISY69FRIRgs+wfaS3
         mdlP7IMcdZ41bBAvDMpAsjRdl+qg9vpZM1+0OoJhtmWQCCWOZMSHIRhQDYh45xjBIuz4
         fWTBMTVLhjAvKHOijYdsPdpGi+BSp2BSa4+gNcxxNJO4Pru4JsMFjnBuDx1Bvsn+W6OP
         XhQthXsMSbPcGLgH12xS4uklCYDsP18I+dZTN6SlCN+ckRU6ecQ4Tavh9zX/shB4jdLV
         ci+lpRymsAevsov610L90br7B/PDjb8Eo8C0QgWZQC99bsHUTLk3jlwi90Y082Uj7HEr
         YgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688482002; x=1691074002;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7WGfX3NpjGNse8P3RuikUKmRu8m7xgJ3of97xkU49E=;
        b=LnUYugnAKxyQCmusWU8tSzmt4XsKgW0DVgGUz7Um8QLB8FwO2Rm9FfkvQ3uOTk/ohE
         0KxL96lX6LT6BvVJFachZ4ugpnq/rm+FbTxw1eS8u2/oqgxGJnxVZiZpdrFk3URN3Hbm
         EU7se7lSK8rz9Eiq5SinFr41X6ObLkUjWwXzVMbmrlF5a17h2zDs+RS7ekpaUTy9y9FD
         qKrFisjJJfZR5HYFB4G9GylOXxVNrgmvD6lMrGNFLnlI6C0T5WBEF7FENUS8XR6BaSzs
         h8jvp4wWeqOEiBdKWHDs/i8YmNucNmGm6C4tCGXdmlU34aCdhecXtnKl9eDx6cmV3pB0
         L5sA==
X-Gm-Message-State: AC+VfDwQ1Z9NzaitomeXWawUbd5Gz11wx5kxGtj9+6HSkNDBCAKdTqWk
	3jKQLVwMT5g43ozBVTlUaxdXTw==
X-Google-Smtp-Source: ACHHUZ6DxPRtPj06HNSQ0M6tH7Rc+DJD0V1yEFbDTRUyabbyWc40rx10HmYSfjlu9jjVdFYAOm5PMw==
X-Received: by 2002:a05:600c:219a:b0:3fb:a1d9:ede8 with SMTP id e26-20020a05600c219a00b003fba1d9ede8mr11046299wme.10.1688482002355;
        Tue, 04 Jul 2023 07:46:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b? ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c028c00b003fbaade072dsm19987380wmk.23.2023.07.04.07.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 07:46:41 -0700 (PDT)
Message-ID: <7b06b8cd-f4c9-7636-0f73-48b2f695d7ba@linaro.org>
Date: Tue, 4 Jul 2023 16:46:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/5] tty: serial: meson: redesign the module to
 platform_driver
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
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-3-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230704135936.14697-3-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_074643_861653_9FBF38C8 
X-CRM114-Status: GOOD (  28.35  )
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

On 04/07/2023 15:59, Dmitry Rokosov wrote:
> Actually, the meson_uart module is already a platform_driver, but it is
> currently registered manually and the uart core registration is run
> outside the probe() scope, which results in some restrictions. For
> instance, it is not possible to communicate with the OF subsystem
> because it requires an initialized device object.
> 
> To address this issue, apply module_platform_driver() instead of direct
> module init/exit routines. Additionally, move uart_register_driver() to
> the driver probe(), and destroy manual console registration because it's
> already run in the uart_register_driver() flow.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   drivers/tty/serial/meson_uart.c | 46 +++++++--------------------------
>   1 file changed, 10 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 169f028956ae..87c0eb5f2dba 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -621,12 +621,6 @@ static struct console meson_serial_console = {
>   	.data		= &meson_uart_driver,
>   };
>   
> -static int __init meson_serial_console_init(void)
> -{
> -	register_console(&meson_serial_console);
> -	return 0;
> -}
> -
>   static void meson_serial_early_console_write(struct console *co,
>   					     const char *s,
>   					     u_int count)
> @@ -652,9 +646,6 @@ OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
>   
>   #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
>   #else
> -static int __init meson_serial_console_init(void) {
> -	return 0;
> -}
>   #define MESON_SERIAL_CONSOLE	NULL
>   #endif
>   
> @@ -738,6 +729,13 @@ static int meson_uart_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	if (!meson_uart_driver.state) {
> +		ret = uart_register_driver(&meson_uart_driver);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +				      "failed to register meson-uart driver\n");
> +	}

PL010 protects this in a mutex, and I think you should do the same otherwise
if multiple uart probes at the same it will do weird stuff.

> +
>   	port->iotype = UPIO_MEM;
>   	port->mapbase = res_mem->start;
>   	port->mapsize = resource_size(res_mem);
> @@ -776,6 +774,8 @@ static int meson_uart_remove(struct platform_device *pdev)
>   	uart_remove_one_port(&meson_uart_driver, port);
>   	meson_ports[pdev->id] = NULL;
>   
> +	uart_unregister_driver(&meson_uart_driver);
> +

This is dangerous, it will remove the driver even if some uart are still attached to it.

You should probably do like in pl010_remove() and remove only if the last one is removed.

>   	return 0;
>   }
>   
> @@ -809,33 +809,7 @@ static  struct platform_driver meson_uart_platform_driver = {
>   	},
>   };
>   
> -static int __init meson_uart_init(void)
> -{
> -	int ret;
> -
> -	ret = meson_serial_console_init();
> -	if (ret)
> -		return ret;
> -	
> -	ret = uart_register_driver(&meson_uart_driver);
> -	if (ret)
> -		return ret;
> -
> -	ret = platform_driver_register(&meson_uart_platform_driver);
> -	if (ret)
> -		uart_unregister_driver(&meson_uart_driver);
> -
> -	return ret;
> -}
> -
> -static void __exit meson_uart_exit(void)
> -{
> -	platform_driver_unregister(&meson_uart_platform_driver);
> -	uart_unregister_driver(&meson_uart_driver);
> -}
> -
> -module_init(meson_uart_init);
> -module_exit(meson_uart_exit);
> +module_platform_driver(meson_uart_platform_driver);

Only pl010 uses this scheme, and I don't know why... if it works then it's ok for me.

Thanks,
Neil

>   
>   MODULE_AUTHOR("Carlo Caione <carlo@caione.org>");
>   MODULE_DESCRIPTION("Amlogic Meson serial port driver");


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
