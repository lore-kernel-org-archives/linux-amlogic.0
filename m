Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA3FC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bs0NSEpmIjIFgig26rmm3UdflZAhlFDDQ0RvpkkJQa4=; b=IoreFKK7XcDjLS
	1Fix/YY/5dJ7UtQtWkMUfCczL2SzmU980PanFx7D42G+qI/CsngWhM2NqNZ9wLTRnUB8i2o2SZlbo
	tIFckPI4ZIyOq5IFI8pJudHT5NVVNgqMvF4MjOXzWyWR58HlVIqYPo0eYNUEsK+xUSXJJrev0U8Yf
	ioazBHQzllqXBsAhb+Nrauu4K7vkXdzlkwpcetDsOz1+SB0XnLLCMSl0xXkHpu0yvXaLbHba/ZdGo
	uuh0r1jxdqvw8NI6vqooB8TiPenEoR9OesJ99Wg2s1yC607vtxcaRDW7F7qp68/VBLcGKW1MHWibY
	mWljAjHHWKjhdnrwX3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncScV-00CFeE-1O; Thu, 07 Apr 2022 13:56:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncScQ-00CFbE-Fz
 for linux-amlogic@lists.infradead.org; Thu, 07 Apr 2022 13:56:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 h189-20020a1c21c6000000b0038ccb70e239so809317wmh.3
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Apr 2022 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t5QhkfA9y7tJ3ykG1dO9EyBB58+Cc1c3AijbHVEEcOQ=;
 b=Y9CIiYhwRxRrjQLLG1vt1YSt/CNOatiRkDxb8EIhnWSivyaipiLU4JmlHsTtpoMzZ9
 mUcH0YQu43Ov0gm9k8ZxNbEk1Q/w23L4X+iVqEp89HzljTjDuUK1jEeNEMSaA7lvR5bU
 OD0CHpmH2QZZDPoVYCftq4bUtql15/j6FuRL+52wdAGoudbYkIhMk1Oh1QyJc/xLXhH4
 diqzMxSFl9nSyvCjREkwn6gxxG8BrG4Evm/O2cofUV6BwDmtmnLgzWFD3xYFMjlchR52
 vfDBzKwVgOIPkdy042ap/NSmYNOLB8nZSDgQEKflgeqCWSenXIa9JGfnyOmrCfFhSotR
 jHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=t5QhkfA9y7tJ3ykG1dO9EyBB58+Cc1c3AijbHVEEcOQ=;
 b=ptQeUbz2YbZcJuG4rkH46pzmao2w7AYUa6xIl5wZK23JHy+zWzDYTkIshPhtfPNs5q
 aq/xOOfU8mltHQzDSOe6kayalAO+lOHAYQh3O2zSPQAVenv/yPRFQJCDRWK9zdSu336w
 uYNtspl6PUJjciKOGD/j29QtQceRXlg5cyg0ynkKkErmVugSltY1wEH2kHlIKmXCnEU4
 uhHCmkkzEFpZ02s8mTkT/XVsM9kgjs/AYD2cbmGyJxga/4nGeQCpO/IsFiSOUpeolPHh
 L6IynBLRa5IzkOHM0de7Kq3zvSy2Jirt2u7U8aqOXMCPpSaQeTLAKEqawTPdCXUj4PT7
 7Fkw==
X-Gm-Message-State: AOAM530gf9D9AFUa2VozdpkdO9b9Z1qgO6X7N5dNmktMPJJ4llOyLaF2
 /ElxpF8GTHMK2G20LzJdbQeofQ==
X-Google-Smtp-Source: ABdhPJwW1VqNVXIlHo0NkxbWOQPtxC7d/cX4ne877T2cXoP9BUWryQMvDBPyojSUaaWP2zWhszx+8w==
X-Received: by 2002:a05:600c:4e51:b0:38e:6f91:d2c1 with SMTP id
 e17-20020a05600c4e5100b0038e6f91d2c1mr12489799wmq.128.1649339771183; 
 Thu, 07 Apr 2022 06:56:11 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d64c8000000b0020784359295sm3639502wri.54.2022.04.07.06.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:56:10 -0700 (PDT)
Message-ID: <4d54fbbe-c2b0-877f-6fdf-449f2c1413f9@baylibre.com>
Date: Thu, 7 Apr 2022 15:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] tty: serial: meson: Use DIV_ROUND_CLOSEST to
 calculate baud rates
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220407081355.13602-1-yu.tu@amlogic.com>
 <20220407081355.13602-2-yu.tu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220407081355.13602-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_065614_797962_17165546 
X-CRM114-Status: GOOD (  14.44  )
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

On 07/04/2022 10:13, Yu Tu wrote:
> Due to chip process differences, chip designers recommend using baud
> rates as close to and larger as possible in order to reduce clock
> errors.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 2bf1c57e0981..8e59624935af 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -299,10 +299,10 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>   		cpu_relax();
>   
>   	if (port->uartclk == 24000000) {
> -		val = ((port->uartclk / 3) / baud) - 1;
> +		val = DIV_ROUND_CLOSEST(port->uartclk / 3, baud) - 1;
>   		val |= AML_UART_BAUD_XTAL;
>   	} else {
> -		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
> +		val =  DIV_ROUND_CLOSEST(port->uartclk / 4, baud) - 1;
>   	}
>   	val |= AML_UART_BAUD_USE;
>   	writel(val, port->membase + AML_UART_REG5);

I check the calculations, and with DIV_ROUND_CLOSEST(), result is always
closer to the required baudrate.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
