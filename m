Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F71C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 08:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GtTs1vfLXdfUoMVhLXT2Yc4OjqATK0NmQPxlMKniRs=; b=NFrc2YJMaW4aBF
	mRYOwk0wHAS591ILdZwDA80C8z0JIxbyahfiDcSWQDkkfMXGQJEbcC5Fn4oHO+zJmAoQ9c72QJlkm
	6wJU4sZgh9Bk1oQU3xUULljaDnwxrXyzlM1dootXVTe1/1ynwduwaW0BbigX80VIfBJWXEC6e9XM0
	5AcHj4Jtp0fLWXOSuRC55ZDk+b3HcjAPVDoP0DTjsGcN7kAj3XvaRaEXHasgXyZ7ZNlkhcbs4jKZA
	bsUlclnkOzWCKFwjInlgGiCB36HzYm9xIpPHFnmUGdK5bFY72n6QIOXTK8mj/66dFFdRoqP3xg5m0
	bHELZmaRFt4kEiWxKzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSVJ-00CVs6-KR; Thu, 21 Apr 2022 08:49:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSVB-00CVo8-Gr
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 08:49:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id bg25so2034929wmb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aqSPW9x18iap7VEqnzBaFCwvwC9XWVLp+mVcr+cF4XU=;
 b=sVQrimJBLCXmLbM375kfAud906Dx8MUr3UWI3gePbVIosyLCjwJ+wV3rGV4lFcJXo1
 1lSq9f8z1TFWEw9edZllTJ3NOhv5VycjBt43cAcM/TrPwgvUl9+7uc+eYFc1Hkk+TDPr
 bMjavqPKtpYICG8KvxnSjVbCYkovadQH6N3rCQXk7EBh4V15hzAzWV3Or9vDkOvtEP5g
 KJw/4nsk6vEFEA9WddRyyRnXnI1Clue8JLCQcHiWsoEBQC+LUwuFq8lyVLslq9lU9Mhx
 /ZRDg87iM64NODjWq9JGGVgVmSEDpmAMikiVoxWhcw9OBsSFX3nt59A7FyESVJjNTLdi
 OlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aqSPW9x18iap7VEqnzBaFCwvwC9XWVLp+mVcr+cF4XU=;
 b=TaNdnY4G+hSVOql/C6nydUX3wDjEo7lGxp/yud6RNjlVM+azh0FPlVjfpZynqgCrrB
 lX4iBIie5FMS/v3uf+WmARd8wrJPIZBz6/YoUa7JYf17QzER84qu88maKPtYpvQugmIG
 ui9m5AN257EBGP6Zl3bF7y8fVkE+QfJJb7A2tAHAzt2S+3ajNWYNCxoS6pW020TerOns
 g8Ch5fxqDGCtobr3/OFLzBV9TiUqeItcKlDX3NqAIl9u1QLLoseVzqqSwsmx81oKQyaT
 YeUz7wKAzRlt6IAeZTOHOjczEQ1pHwpj0RZa17dkngdT+SGXqzHyXTo/H+bbyP4Y4/u5
 8gqQ==
X-Gm-Message-State: AOAM532i8qYZXk6hLVC9L67rzq4+9zBG8mVOWQDVXvT18Cklqr0ob1FJ
 HsSWQsSwdqqOTw8Htx2LRq+H7A==
X-Google-Smtp-Source: ABdhPJzriyI1Ddu4GZCWUIbVECnu8piDZLNnSlQ/iUsewg5ps2kg0Tk6ePdstsZTppKMCwkIC+JBSA==
X-Received: by 2002:a05:600c:1c9b:b0:391:6287:b7a3 with SMTP id
 k27-20020a05600c1c9b00b003916287b7a3mr7507911wms.188.1650530964122; 
 Thu, 21 Apr 2022 01:49:24 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d?
 ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm2028679wrq.81.2022.04.21.01.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 01:49:23 -0700 (PDT)
Message-ID: <3f5df9df-7699-7210-6253-4dd03f4444a0@baylibre.com>
Date: Thu, 21 Apr 2022 10:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 2/2] tty: serial: meson: Added S4 SOC compatibility
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-3-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220418053202.24528-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_014925_660070_B72A49EA 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/04/2022 07:32, Yu Tu wrote:
> Make UART driver compatible with S4 SOC UART. Meanwhile, the S4 SOC
> UART uses 12MHz as the clock source for baud rate calculations.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 58bd2723c004..43941f21735f 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -790,11 +790,19 @@ static int meson_uart_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static struct meson_uart_data s4_uart_date = {

Should be s4_uart_data instead of s4_uart_date

> +	.has_xtal_div2 = true,
> +};
> +
>   static const struct of_device_id meson_uart_dt_match[] = {
>   	{ .compatible = "amlogic,meson6-uart" },
>   	{ .compatible = "amlogic,meson8-uart" },
>   	{ .compatible = "amlogic,meson8b-uart" },
>   	{ .compatible = "amlogic,meson-gx-uart" },
> +	{
> +		.compatible = "amlogic,meson-s4-uart",
> +		.data = (void *)&s4_uart_date,

Here same

> +	},
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
With this change, it's fine for me.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
