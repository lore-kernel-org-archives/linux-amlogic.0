Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D09EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qF+2jh0f9NqbkVZZ+BSBvd2uPifscYcz+X/tup5REq8=; b=ogzOL06RpAAuuZ
	XRU27/EkxgZ2LVK0KX4/3UhrmtmyZSkm1lBSB/Lr4gJWxNf/SO35WgA3lAjdxH47w5lco7OXX4q8q
	02ZUYjrLKVhXk2ne5zrC3MIQCL/Fx8M80PxOL+MxZqzxnJklIAFi1cG40O+hqKfddA0QXv4UaSPjs
	4sgacDkOy3yB9OlsyBjuUrPb6wif8/ourjX4mJ1PcIYKGuVeb+nVeeJCtv1yzlnV65tXHmCkzHIGb
	AyD39iH4iRHcxcEqBgN1ipTrEdHlLVGZAjCHkYtyRe1c4x/Llg8whoGOKRQW478GwmW6CNSpLZz6u
	zekjUrW9LGoforGMV2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qgS-00ACXm-Og; Mon, 10 Jan 2022 09:09:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qSK-00A5C1-HI; Mon, 10 Jan 2022 08:55:09 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 16:55:05 +0800
Message-ID: <b553aea7-cb78-830a-4a4c-51d2ee2a1850@amlogic.com>
Date: Mon, 10 Jan 2022 16:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] tty: serial: meson: Make the bit24 and bit [26, 27] of the
 UART_REG5 register writable
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
 <20220110082616.13474-3-yu.tu@amlogic.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <20220110082616.13474-3-yu.tu@amlogic.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005508_648483_ABDFB7CE 
X-CRM114-Status: GOOD (  10.35  )
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
> The UART_REG5 register defaults to 0. The console port is set in
> ROMCODE. But other UART ports default to 0, so make bit24 and
> bit[26,27] writable so that the UART can choose a more
> appropriate clock.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>   drivers/tty/serial/meson_uart.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
> index 7c3f30cea68e..b0551750dff8 100644
> --- a/drivers/tty/serial/meson_uart.c
> +++ b/drivers/tty/serial/meson_uart.c
> @@ -693,7 +693,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>   							CLK_SET_RATE_NO_REPARENT,
>   							port->membase + AML_UART_REG5,
>   							26, 2,
> -							CLK_DIVIDER_READ_ONLY,
> +							CLK_DIVIDER_ROUND_CLOSEST,
>   							xtal_div_table, NULL);
>   		if (IS_ERR(hw))
>   			return PTR_ERR(hw);
> @@ -719,7 +719,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>   					CLK_SET_RATE_PARENT,
>   					port->membase + AML_UART_REG5,
>   					24, 0x1,
> -					CLK_MUX_READ_ONLY,
> +					CLK_MUX_ROUND_CLOSEST,
>   					NULL, NULL);
>   	if (IS_ERR(hw))
>   		return PTR_ERR(hw);
> 
> base-commit: 93a770b7e16772530196674ffc79bb13fa927dc6
> prerequisite-patch-id: 95191c926509964c8e9bf4128b8bbad8a277b84a
> prerequisite-patch-id: a2e4756ff85f0df0efe111d7e2cb51b8e26e226f
> prerequisite-patch-id: 4e4d909acabcb7533da20e2207207be73454a88c

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
