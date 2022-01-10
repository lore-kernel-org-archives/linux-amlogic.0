Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D3CC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5/vHpLHbtBYfDiNiHmB9GLAqvwAT2NBCtzoJ5NZJj8=; b=2hpPQhtuYbJHyt
	nGHZ5ptiXwKN/iWPHV31nho7cnBuzS3gCs/B57ksedFY41xy8k0wMyHq2Up1vKMkton5m9QR3DXFm
	H/tz5r0z7VZ/l4xWmGn0SLVObIHWwN8EXIRJTXmjOnD55Hjem+zSjUb5zpyvw3PLzsaCnHPW/m7nB
	Ezs8sNSN6LaB91osBQLTbwMDBThu4R+mGJErUaehkiTr0x/w+psUEMReiU96r9H819J5S3Z2qIphF
	goX+3fVV3TUIo7qe9EIw1GBBteY5JZIpvPJ5iY/OE7UILgVCyKhXyJwVf8heI8Nu2vwCo1XVCe1GI
	rgD46vfzpdGB/0yA+VBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qhN-00AD3U-IU; Mon, 10 Jan 2022 09:10:41 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qSS-00A5G4-RF; Mon, 10 Jan 2022 08:55:18 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 16:55:14 +0800
Message-ID: <f16770c3-fc9c-3353-8b5c-5f3029cda240@amlogic.com>
Date: Mon, 10 Jan 2022 16:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tty: serial: meson: meson_uart_shutdown omit clear
 AML_UART_TX_EN bit
Content-Language: en-US
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220110082616.13474-1-yu.tu@amlogic.com>
 <20220110082616.13474-4-yu.tu@amlogic.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <20220110082616.13474-4-yu.tu@amlogic.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005516_951089_85F5B43A 
X-CRM114-Status: GOOD (  11.19  )
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

Hi All,
	I'm really sorry for sending the wrong specified file. Please ignore 
the email. I will resend V4.

On 2022/1/10 16:26, Yu Tu wrote:
> This change is an improvement. The meson_uart_shutdown function
> should have the opposite operation to the meson_uart_startup
> function, but the meson_uart_shutdown of AML_UART_TX_EN is logically
> missing.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 9b07e3534969..c17109d6d441 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -140,7 +140,7 @@ static void meson_uart_shutdown(struct uart_port *port)
>   	spin_lock_irqsave(&port->lock, flags);
>   
>   	val = readl(port->membase + AML_UART_CONTROL);
> -	val &= ~AML_UART_RX_EN;
> +	val &= ~(AML_UART_RX_EN | AML_UART_TX_EN);
>   	val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
>   	writel(val, port->membase + AML_UART_CONTROL);
>   
> 
> base-commit: b3a9e3b9622ae10064826dccb4f7a52bd88c7407
> prerequisite-patch-id: 97a514f3447511cb204179ce03ae99dc1d5902d9
> prerequisite-patch-id: a2e4756ff85f0df0efe111d7e2cb51b8e26e226f
> prerequisite-patch-id: af9e3acc8f6ff7602d3a68a57c008e5ec362b353
> prerequisite-patch-id: a44e5da7009d9b815eb87395cbd7d14e7d953a09

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
