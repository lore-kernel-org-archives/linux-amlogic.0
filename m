Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88190C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 21:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNzRu9s8bIPlV13kXXmK4uKPv1rWIq1oSpWzRlhqvoA=; b=1PmO6zogHy1qoI
	810DY1SHujwjBpNlw+SkwWFXWQvMYfwY2+iSh90d6yQujCbq6d+urcVVTTmgVAcpY2AZqe6zHOX1/
	iFCyRzNZe/4W5GW4fgLtEwyVf0xR4DpiF5R8idQuYGcruSDIkFKVUHHZI7G3woXqGuzzDBsSXt5ty
	7rm8KdS21g3318zgrMAGhCmRqa4WrTbIZGhhJaYdmqx80XBiaAEhmm/OQu820guYXoSaXOPTHIFvk
	9rTXUXDB8DC1t1KQ27SHRmyZUqkDc/Mwmfj0YK6MTCd8gk6b4LcaHLxXQoX4gmJ+kzsGMQXoNUjAK
	QruxKm2gPWL1DYCHQhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAfMc-00DFLE-6e; Thu, 20 Jan 2022 21:53:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAfMZ-00DFKV-NQ
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 21:53:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso17090032wms.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 13:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=xzD+fvNee9njgyoYpg+UfIIsMfFdbgQCkyRxjeUcLZs=;
 b=DOWC4rjbw8rnosLNZZjD93f0SMG2hWCl/mdKZ1MaUzw8y2wcHsCnDSRlQSc6TE1Wnf
 rlW4qh3oWy3Qeo9Wu5FOz1HVlrMU5Wr2Yg+y1ols/BK+Vl36ZyNqKxQ7I72o4pR+Mbpg
 MQvrlYZsegGKzXFRHPCA9H/0X27k3IyKvaK/ISWR4tCvqfL6w6WLJGYC+d1M9O0tkzqX
 Re3ru0cS6l/egUk7HyrhiE/AegRHQVZ5sOvdhK4zBW8VBNDlssyaOLW/yH3OqbAv+TxH
 fvcJLPm+w/qoLyXWzcrr19ttNrrD+507D1gYj0MGAbNUL2mQuqA9tEz9sz9pPdL6optS
 eRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=xzD+fvNee9njgyoYpg+UfIIsMfFdbgQCkyRxjeUcLZs=;
 b=xUXVPLNVhAQkb5MysJ3jAdNkE0GXZWrmySGragb3DU5HuSUg9mbEnRxuzy8NS3x7QS
 oogLxNU+L985PCP5fxJamNxZeI94EssGOU87FyWyonVZJUW4qGxyZXZE07calJPSjU4v
 s8JlmIebGrEp4enmI/MnGW/gYvp2cemCx8Wl9/huIqB0SnUB1PXBJn4jAJ+zk6OXVIna
 JKq8PseeEC08SiBB1wGpe0pAp60hDYvFzDc0P+PZM7BXak3IZAHAVA9hafgwqklHwAqJ
 4q8vrYGs75whEJW6WdrO/Rd0nr8K4At2+xjufWBl7zlNgGyJje+cC/gW80Zy0s0B+EWF
 +Hig==
X-Gm-Message-State: AOAM532uqM3HJMNprgkoxWrpZbZaoz5rKtfcpoRuv1SoIKXsMBMfJSP2
 d/fNIBJ6tiwpTFzxyYSkDwyPRQ==
X-Google-Smtp-Source: ABdhPJxQ7umiOemEiVDSGIoLE5STLtbE5klLfGxPCsiVM1g38HO04FwYGlUrBw0KI+h5aWAwhv4J1g==
X-Received: by 2002:adf:f804:: with SMTP id s4mr933990wrp.672.1642715578424;
 Thu, 20 Jan 2022 13:52:58 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id a26sm8552337wmb.37.2022.01.20.13.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 13:52:57 -0800 (PST)
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-5-yu.tu@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V6 4/5] tty: serial: meson: Make some bit of the REG5
 register writable
Date: Thu, 20 Jan 2022 22:49:28 +0100
In-reply-to: <20220118030911.12815-5-yu.tu@amlogic.com>
Message-ID: <1j7dau2hxi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_135259_786286_8E8869A7 
X-CRM114-Status: GOOD (  13.50  )
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


On Tue 18 Jan 2022 at 11:09, Yu Tu <yu.tu@amlogic.com> wrote:

> The UART_REG5 register defaults to 0. The console port is set in
> ROMCODE. But other UART ports default to 0, so make bit24 and
> bit[26,27] writable so that the UART can choose a more
> appropriate clock.

Suggestion: Instead of talking bits (which is a bit cryptic) tell us
what is actually does

Something like:
 Make the internal clock source mux and divider writeable, allowing the
 uart to deviate from the settings intially applied by the ROMCode and
 using the most appropriate clocks

>
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/tty/serial/meson_uart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 92fa91c825e6..4e7b2b38ab0a 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -678,7 +678,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>  							CLK_SET_RATE_NO_REPARENT,
>  							port->membase + AML_UART_REG5,
>  							26, 2,
> -							CLK_DIVIDER_READ_ONLY,
> +							CLK_DIVIDER_ROUND_CLOSEST,
>  							xtal_div_table, NULL);
>  		if (IS_ERR(hw))
>  			return PTR_ERR(hw);
> @@ -708,7 +708,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>  					CLK_SET_RATE_PARENT,
>  					port->membase + AML_UART_REG5,
>  					24, 0x1,
> -					CLK_MUX_READ_ONLY,
> +					CLK_MUX_ROUND_CLOSEST,
>  					NULL, NULL);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
