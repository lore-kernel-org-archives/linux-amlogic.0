Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0419C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 09:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcDOroI83o51pNyK0g2bbfYyIKgSWj8KUJNSzug5OQA=; b=W13BNLS2dZ44kl
	7Afx6JlTmMmZTelf18DumHIctmyY3DZQJ+WZn1wh74qk+EBfILftmvN2hb3eMP7W9qrbABreqvC8k
	9VlmqNi2tQVvAGu7zd+NOaz23NQGLTCcCirPNI8eRCvXkx5loGJEXX8mqvWFb3MDDkEGrbTWj/95k
	GPOXODnaOUhLiLAiHCJGdjCJVeLdDZUQBWbK3YeNbZNZQKB4nbJQt5I1cYEeHYusXZxV0iLqG7syI
	u9GRNtsGGO+h2XjdVnSiQ50y50JDo07n+5JxnrzVbK3QtAtO3S8/mTPXGzX1bzw497QHWhkDHmcU+
	tYl0GAyvVgQ40Oomm94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxv3-009tEU-E9; Wed, 22 Dec 2021 09:28:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxur-009tC7-3e; Wed, 22 Dec 2021 09:28:10 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 22 Dec
 2021 17:28:04 +0800
Message-ID: <eae96731-d231-ab2f-934f-70a9fc3f8409@amlogic.com>
Date: Wed, 22 Dec 2021 17:28:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 3/3] tty: serial: meson: add UART driver compatible with
 S4 SoC on-chip
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-4-yu.tu@amlogic.com> <YcGDk3eC3sIstYjs@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <YcGDk3eC3sIstYjs@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_012809_190831_1C13FF1B 
X-CRM114-Status: GOOD (  26.57  )
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



On 2021/12/21 15:34, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Dec 21, 2021 at 03:16:34PM +0800, Yu Tu wrote:
>> The S4 SoC on-chip UART uses a 12M clock as the clock source for
>> calculating the baud rate of the UART. But previously, chips used 24M or
>> other clock sources. So add this change. The specific clock source is
>> determined by chip design.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   drivers/tty/serial/meson_uart.c | 62 +++++++++++++++++++++++++++++----
>>   1 file changed, 55 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index 69450a461c48..557c24d954a2 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/serial_core.h>
>>   #include <linux/tty.h>
>>   #include <linux/tty_flip.h>
>> +#include <linux/of_device.h>
>>   
>>   /* Register offsets */
>>   #define AML_UART_WFIFO			0x00
>> @@ -68,6 +69,8 @@
>>   #define AML_UART_BAUD_MASK		0x7fffff
>>   #define AML_UART_BAUD_USE		BIT(23)
>>   #define AML_UART_BAUD_XTAL		BIT(24)
>> +#define AML_UART_BAUD_XTAL_TICK		BIT(26)
>> +#define AML_UART_BAUD_XTAL_DIV2		BIT(27)
>>   
>>   #define AML_UART_PORT_NUM		12
>>   #define AML_UART_PORT_OFFSET		6
>> @@ -80,6 +83,11 @@ static struct uart_driver meson_uart_driver;
>>   
>>   static struct uart_port *meson_ports[AML_UART_PORT_NUM];
>>   
>> +struct meson_uart_data {
>> +	/*A clock source that calculates baud rates*/
> 
> Please use spaces in your comments.

I will correct this mistake in the next patch.

> 
>> +	unsigned int xtal_tick_en;
> 
> What is "_en" for?
> 
> "enabled"?
> 
> Spell it out please.
You're right.I will correct as you suggested.
> 
> And why an unsigned int for a boolean flag?
It is my thoughtless, I will correct.
> 
>> +};
>> +
>>   static void meson_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
>>   {
>>   }
>> @@ -294,16 +302,29 @@ static int meson_uart_startup(struct uart_port *port)
>>   
>>   static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
>>   {
>> +	struct meson_uart_data *uart_data = port->private_data;
>>   	u32 val;
>>   
>>   	while (!meson_uart_tx_empty(port))
>>   		cpu_relax();
>>   
>> +	val = readl_relaxed(port->membase + AML_UART_REG5);
>> +	val &= ~AML_UART_BAUD_MASK;
>> +
>>   	if (port->uartclk == 24000000) {
>> -		val = ((port->uartclk / 3) / baud) - 1;
>> -		val |= AML_UART_BAUD_XTAL;
>> +		if (uart_data->xtal_tick_en) {
>> +			val = (port->uartclk / 2 + baud / 2) / baud  - 1;
>> +			val |= (AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_DIV2);
>> +		} else {
>> +			val = ((port->uartclk / 3) + baud / 2) / baud  - 1;
>> +			val &= (~(AML_UART_BAUD_XTAL_TICK |
>> +				AML_UART_BAUD_XTAL_DIV2));
>> +			val |= AML_UART_BAUD_XTAL;
>> +		}
>>   	} else {
>>   		val = ((port->uartclk * 10 / (baud * 4) + 5) / 10) - 1;
>> +		val &= (~(AML_UART_BAUD_XTAL | AML_UART_BAUD_XTAL_TICK |
>> +			AML_UART_BAUD_XTAL_DIV2));
>>   	}
>>   	val |= AML_UART_BAUD_USE;
>>   	writel(val, port->membase + AML_UART_REG5);
>> @@ -714,6 +735,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>>   {
>>   	struct resource *res_mem, *res_irq;
>>   	struct uart_port *port;
>> +	struct meson_uart_data *uart_data;
>>   	int ret = 0;
>>   	int id = -1;
>>   
>> @@ -729,6 +751,10 @@ static int meson_uart_probe(struct platform_device *pdev)
>>   		}
>>   	}
>>   
>> +	uart_data = of_device_get_match_data(&pdev->dev);
>> +	if (!uart_data)
>> +		return  -EINVAL;
> 
> Wrong spacing.
> 
> Always use checkpatch.pl on your patches before sending them out.
Sorry, this is a rookie mistake.But I did check it locally before 
sending it. I will follow your advice strictly later.
> 
> And did you just break existing systems?  Do you know if all older ones
> will still work with that call?
> 
It does affect older systems, but the new and older baud rates are not 
the same. I checked the documents before I made any changes. So this 
change is compatible with the older.
>> +
>>   	if (pdev->id < 0 || pdev->id >= AML_UART_PORT_NUM)
>>   		return -EINVAL;
>>   
>> @@ -770,6 +796,7 @@ static int meson_uart_probe(struct platform_device *pdev)
>>   	port->x_char = 0;
>>   	port->ops = &meson_uart_ops;
>>   	port->fifosize = 64;
>> +	port->private_data = uart_data;
>>   
>>   	meson_ports[pdev->id] = port;
>>   	platform_set_drvdata(pdev, port);
>> @@ -798,14 +825,35 @@ static int meson_uart_remove(struct platform_device *pdev)
>>   	return 0;
>>   }
>>   
>> +static const struct meson_uart_data meson_uart_data = {
>> +	.xtal_tick_en = 0,
>> +};
>> +
>> +static const struct meson_uart_data s4_meson_uart_data = {
>> +	.xtal_tick_en = 1,
>> +};
> 
> As your whole structure just has one bit, why not just use that as the
> data value, instead of a structure?  No need to be complex here at all.
> 
It is my thoughtless, I will correct.
> thanks,
> 
> greg k-h
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
