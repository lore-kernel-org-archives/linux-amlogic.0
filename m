Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807DEEE6423
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Sep 2023 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Ztk3yQr7fJ7p/prsijdENsPLhTc3h9RVLykCyORnuY=; b=G+D/XxlK+cVJMBwCfPm2elhHWs
	WaQgcvu3NcYh0aNlTjADEfUAKVy83gZXEkIFNvwJq/dsS32xiNp7Qxllgjfe2FUmUngYDbYhZlLoQ
	viymz/E3xpvGJ3BRaO+vIX6mMtNa2aiCHuWii2Sh5JJvZHVickim+JseaUU8TqrALqaTVk4s+VXNV
	b2a5a7NGlYubqP81Egb5XqWSk6cXtChIGBSDcrUzmOzwX6iYXf5Hh06N6yeKWC864b/EgCAKt4OX4
	oyM+8cDmDSD7cJnH6ILmv7nHcT+OfVHZDzOZTicypbKHq9TvXc9sxHblN6m00tDHlGbwtxE5Owr1z
	kE7jYoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2l7-009xDk-1v;
	Fri, 15 Sep 2023 06:56:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh2l5-009xCv-19
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Sep 2023 06:56:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31c7912416bso1612357f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Sep 2023 23:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694761011; x=1695365811; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j12oxEv4oQ9vPyiNgmw9xBXkHftj9B6rlt22/B5nTIU=;
        b=Dh2xEfNj1IthRu58ELxVigCxAs7I5h/Ul5btB7ao46zCzvCSqdWOAqct64A9K3mZ3z
         /hfrVFUy8TkpYvSAJo4ko91hdjOsiXzuBigVQfjHD4aYpVG+cNIHXzFg7WLfsSHFe+P8
         7foZGUSZW57daYGgQYOYNV6QYiIDxPPQGI05FTiQDAIBU1gAdr3GZ+pFwawhMB3kjf3G
         mc3I6zRp5Z9aL7or5ZDe6LfvWadESRSgMWzDJKu0OtKfNjWWF5b4+gkMNFVXvRR9gNDH
         XuyVO8NQHdAfUCpHW5gwFmXh8mMyYqwQ4FDAg/kgKvfQ6Yc0OPPH55gstcDGy64GGM7b
         oj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694761011; x=1695365811;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j12oxEv4oQ9vPyiNgmw9xBXkHftj9B6rlt22/B5nTIU=;
        b=m2ghX/X5YXQoTfNJBAkLzVByU6SAIgpcAJZRMAeuLZ78ndwrZKu31Z6YMZd7rsIRke
         ITuCIdvL3YeMlnvqrLuV5nbjbdIEFTqZ7E5zLypoK3Wb1HHoKTSK0QRUuwygnnyoX6fP
         M3ec4Vg/Si4Y1/djfXyUraLkg6AaZrJ1LR3PChSNu7chTyK9sjJFkQ3XeGZAL+mb9c4j
         4u2zECxbyIJxsgAva2YEnnW6tv38q/AlQt2wLp8S1QQ7RRrdo9ayEGzW6CX+8It8929p
         R3uO4sIgrGX7hTDZoUfcnv2qdTNkjP09636y3j+I62hCmySLB7crGfmpM2gFLsuzo4zQ
         terw==
X-Gm-Message-State: AOJu0YwcgE/HtbU7yvXzD5Pi0G4EUku+niOoXy1NcANAhn0FshWNcQtS
	Va0xJxH0oz34jBZPudGkCvvjIQ==
X-Google-Smtp-Source: AGHT+IF5bZDW17upZUyQuCXfWlfLN6eyzQLEiOGPo8/YwnqmLsw5emBhRDtJwlH6pFksTMU3pE88Yw==
X-Received: by 2002:a05:6000:118d:b0:316:efb9:101d with SMTP id g13-20020a056000118d00b00316efb9101dmr712786wrx.25.1694761011484;
        Thu, 14 Sep 2023 23:56:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:990a:74e6:266e:2294? ([2a01:e0a:982:cbb0:990a:74e6:266e:2294])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d5352000000b0031c3ee933b5sm3598140wrv.108.2023.09.14.23.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 23:56:51 -0700 (PDT)
Message-ID: <5cd2ed15-949d-40b4-93fd-b1480f557b14@linaro.org>
Date: Fri, 15 Sep 2023 08:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH tty v1 37/74] serial: meson: Use port lock wrappers
Content-Language: en-US, fr
To: John Ogness <john.ogness@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lucas Tanure <tanure@linux.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <20230914183831.587273-38-john.ogness@linutronix.de>
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
In-Reply-To: <20230914183831.587273-38-john.ogness@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_235655_416438_DFDCCA83 
X-CRM114-Status: GOOD (  26.49  )
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

On 14/09/2023 20:37, John Ogness wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> When a serial port is used for kernel console output, then all
> modifications to the UART registers which are done from other contexts,
> e.g. getty, termios, are interference points for the kernel console.
> 
> So far this has been ignored and the printk output is based on the
> principle of hope. The rework of the console infrastructure which aims to
> support threaded and atomic consoles, requires to mark sections which
> modify the UART registers as unsafe. This allows the atomic write function
> to make informed decisions and eventually to restore operational state. It
> also allows to prevent the regular UART code from modifying UART registers
> while printk output is in progress.
> 
> All modifications of UART registers are guarded by the UART port lock,
> which provides an obvious synchronization point with the console
> infrastructure.
> 
> To avoid adding this functionality to all UART drivers, wrap the
> spin_[un]lock*() invocations for uart_port::lock into helper functions
> which just contain the spin_[un]lock*() invocations for now. In a
> subsequent step these helpers will gain the console synchronization
> mechanisms.
> 
> Converted with coccinelle. No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/tty/serial/meson_uart.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 790d910dafa5..45cc23e9e399 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -129,14 +129,14 @@ static void meson_uart_shutdown(struct uart_port *port)
>   
>   	free_irq(port->irq, port);
>   
> -	spin_lock_irqsave(&port->lock, flags);
> +	uart_port_lock_irqsave(port, &flags);
>   
>   	val = readl(port->membase + AML_UART_CONTROL);
>   	val &= ~AML_UART_RX_EN;
>   	val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
>   	writel(val, port->membase + AML_UART_CONTROL);
>   
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	uart_port_unlock_irqrestore(port, flags);
>   }
>   
>   static void meson_uart_start_tx(struct uart_port *port)
> @@ -238,7 +238,7 @@ static irqreturn_t meson_uart_interrupt(int irq, void *dev_id)
>   {
>   	struct uart_port *port = (struct uart_port *)dev_id;
>   
> -	spin_lock(&port->lock);
> +	uart_port_lock(port);
>   
>   	if (!(readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY))
>   		meson_receive_chars(port);
> @@ -248,7 +248,7 @@ static irqreturn_t meson_uart_interrupt(int irq, void *dev_id)
>   			meson_uart_start_tx(port);
>   	}
>   
> -	spin_unlock(&port->lock);
> +	uart_port_unlock(port);
>   
>   	return IRQ_HANDLED;
>   }
> @@ -284,7 +284,7 @@ static int meson_uart_startup(struct uart_port *port)
>   	u32 val;
>   	int ret = 0;
>   
> -	spin_lock_irqsave(&port->lock, flags);
> +	uart_port_lock_irqsave(port, &flags);
>   
>   	val = readl(port->membase + AML_UART_CONTROL);
>   	val |= AML_UART_CLEAR_ERR;
> @@ -301,7 +301,7 @@ static int meson_uart_startup(struct uart_port *port)
>   	val = (AML_UART_RECV_IRQ(1) | AML_UART_XMIT_IRQ(port->fifosize / 2));
>   	writel(val, port->membase + AML_UART_MISC);
>   
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	uart_port_unlock_irqrestore(port, flags);
>   
>   	ret = request_irq(port->irq, meson_uart_interrupt, 0,
>   			  port->name, port);
> @@ -341,7 +341,7 @@ static void meson_uart_set_termios(struct uart_port *port,
>   	unsigned long flags;
>   	u32 val;
>   
> -	spin_lock_irqsave(&port->lock, flags);
> +	uart_port_lock_irqsave(port, &flags);
>   
>   	cflags = termios->c_cflag;
>   	iflags = termios->c_iflag;
> @@ -401,7 +401,7 @@ static void meson_uart_set_termios(struct uart_port *port,
>   					    AML_UART_FRAME_ERR;
>   
>   	uart_update_timeout(port, termios->c_cflag, baud);
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	uart_port_unlock_irqrestore(port, flags);
>   }
>   
>   static int meson_uart_verify_port(struct uart_port *port,
> @@ -460,14 +460,14 @@ static int meson_uart_poll_get_char(struct uart_port *port)
>   	u32 c;
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&port->lock, flags);
> +	uart_port_lock_irqsave(port, &flags);
>   
>   	if (readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY)
>   		c = NO_POLL_CHAR;
>   	else
>   		c = readl(port->membase + AML_UART_RFIFO);
>   
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	uart_port_unlock_irqrestore(port, flags);
>   
>   	return c;
>   }
> @@ -478,7 +478,7 @@ static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
>   	u32 reg;
>   	int ret;
>   
> -	spin_lock_irqsave(&port->lock, flags);
> +	uart_port_lock_irqsave(port, &flags);
>   
>   	/* Wait until FIFO is empty or timeout */
>   	ret = readl_poll_timeout_atomic(port->membase + AML_UART_STATUS, reg,
> @@ -502,7 +502,7 @@ static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
>   		dev_err(port->dev, "Timeout waiting for UART TX EMPTY\n");
>   
>   out:
> -	spin_unlock_irqrestore(&port->lock, flags);
> +	uart_port_unlock_irqrestore(port, flags);
>   }
>   
>   #endif /* CONFIG_CONSOLE_POLL */
> @@ -559,9 +559,9 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
>   	if (port->sysrq) {
>   		locked = 0;
>   	} else if (oops_in_progress) {
> -		locked = spin_trylock(&port->lock);
> +		locked = uart_port_trylock(port);
>   	} else {
> -		spin_lock(&port->lock);
> +		uart_port_lock(port);
>   		locked = 1;
>   	}
>   
> @@ -573,7 +573,7 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
>   	writel(val, port->membase + AML_UART_CONTROL);
>   
>   	if (locked)
> -		spin_unlock(&port->lock);
> +		uart_port_unlock(port);
>   	local_irq_restore(flags);
>   }
>   

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
