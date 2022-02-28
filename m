Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A41C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVjzyfBKqE+td1g/437PhY94OYBBeYbeGs/yX/2iS9E=; b=tmhvWSNZ8922Wh
	uEHnIKu0i1sVIIp4cjQ1w77mlrg86+NefM/qR4ksUVdoMEhdQCNUQ5hvXLb0SJikfN3hQ6DpC1DKB
	3kV5Y8jeGN6YxubVyjLxLCBdfHsf9PMqLs22NVk2c/E2KUW9EKGaiT1g/+P5mQITIeSxWZkZFkImJ
	VTIfvgS7wUnY26qwzFQzKQgD6nA4uBf9KkGMXB835n3zRrK3FGWr7ZlBPEZp9XEzhkWql/0BAW49W
	dkP7Of/grarZQBSVhnPkthf4NCHENFBuztoXiWqyvSlEgQAO0zLIEuSTJhT2oXg4v0yl5L3qzRUAD
	ssAodX5EHF1kfTileM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOe7T-00Bpct-29; Mon, 28 Feb 2022 11:23:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOdkd-00Be0l-Te
 for linux-amlogic@lists.infradead.org; Mon, 28 Feb 2022 10:59:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id d28so14790177wra.4
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 02:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=uCN8f3Fyd5pokV8pP2TP0yZnM+iGBuaGKpYFHzcRb64=;
 b=U1sd+1e2936jSttBnDkeF2aFADnnxGDPhbHqTgwESbce77Ji25yxyMYU/0U+KJCQYr
 QNhUdyoHzRf/sIJdmiN2P2EsRqdmwXrROsYdqJDj7Ev+PjrP5vDgnkszfIRm9s1m0TM9
 UNL6Zz7QOyjrX753nWNpgz43bZn3RzM/OSbX3Uj5yL8e14tJ0pGhw5Y2TZJUgviDUEfN
 IdDAV5xdYItRWJzG5xp/zTx7cAWVcnyD6V9inmPFlHMyOCfRMWEuJ4t0MPzwXhMOPDT5
 1ysQsfR28eLGRBg/DiEg1RMrwLxR5PpMAjlEbiiLcaw5hDKubqRlBhX73V0cFtstOyCO
 sbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=uCN8f3Fyd5pokV8pP2TP0yZnM+iGBuaGKpYFHzcRb64=;
 b=ti5CJHGlwS0p6V3B/ZbON9XVLHW5SUWrgPapWP5DljumWiJCy2+QF5OHSUAwOGDpPy
 NjwyjcPN81NwUFv47YE2iwvz8gE4SpwLSEN8W8MuZ0yIf/P766c3oTOSHx25EhYLoest
 8f3/uIsU0OjZF0APVKexIWQ1pzmF6ls8XWi/JQtNEuD62ylZFy4eUx9mlJCEs/ZgOveZ
 58anxJuzRZXRJPzLbBuLMtlwEQ2yYUVsGfvbjFszW1UhpkYCnYCosXVckqGDA6conmJD
 P2gpqDGsBK+IpF5iBD2mP1b2PeE3rAYvv0uzcgQT0ejMinfrJIHi/YjIyPnue+7d1CVF
 +FLA==
X-Gm-Message-State: AOAM5337guZG4vr3ZgLCJ/d0Z6hSI01g1FCZx+kWlHUPBUVBosSUzei+
 z4HUA5hfLfmTGv43xxX13M2ESg==
X-Google-Smtp-Source: ABdhPJwF2zUP4Y28CMI6eZMFjYIqjlKEfAPLDcFwRGYzr64h9oXzj49Vb3OIvWo3FlvGEewcFviqJQ==
X-Received: by 2002:adf:d089:0:b0:1ed:9e86:2144 with SMTP id
 y9-20020adfd089000000b001ed9e862144mr14956887wrh.363.1646045973473; 
 Mon, 28 Feb 2022 02:59:33 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d4dc1000000b001eeadc98c0csm10001385wru.101.2022.02.28.02.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 02:59:33 -0800 (PST)
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <20220225073922.3947-6-yu.tu@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V7 5/6] tty: serial: meson: The system stuck when you
 run the stty command on the console to change the baud rate
Date: Mon, 28 Feb 2022 11:58:30 +0100
In-reply-to: <20220225073922.3947-6-yu.tu@amlogic.com>
Message-ID: <1jczj7xnn0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025936_005960_67CB7569 
X-CRM114-Status: GOOD (  12.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 25 Feb 2022 at 15:39, Yu Tu <yu.tu@amlogic.com> wrote:

> Start the console and run the following commands in turn:
> stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600. The
> system will stuck.
>
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/tty/serial/meson_uart.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index ba8dc203b9cb..d19349ead738 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -365,8 +365,13 @@ static void meson_uart_set_termios(struct uart_port *port,
>  	writel(val, port->membase + AML_UART_CONTROL);
>  
>  	baud = uart_get_baud_rate(port, termios, old, 50, 4000000);
> +
> +	spin_unlock_irqrestore(&port->lock, flags);
> +
>  	meson_uart_change_speed(port, baud);
>  
> +	spin_lock_irqsave(&port->lock, flags);

Already told you before, you can make meson_change_speed()
clk_set_rate() uses mutex and may sleep.

> +
>  	port->read_status_mask = AML_UART_TX_FIFO_WERR;
>  	if (iflags & INPCK)
>  		port->read_status_mask |= AML_UART_PARITY_ERR |


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
