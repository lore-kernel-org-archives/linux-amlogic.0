Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E898C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 05:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ao8nzW1bvmbLsiLWbskBkm2BlV0BcVKtq+U3MlgWuM=; b=ChvQeQ61D/WVRX
	JbSPeRS9hyRDnYh4qOsoPnrCJnh+Q2Pb3OSzw7CpTVVXAL0TlqV6EbyulL8xL6xj5SvyFiBXRIr9N
	NRVpywc90ToAmPcLB0qZY8YSfXio4R8R5aCUXpg6R5pRiERbV4uRc0jl057lNCXXo1kHgDSTK6Um7
	6WsY8Gec7p3RhXVPw7c5kqCEbhfDMBed7srm8IbQXilgQipv24udr1gEzxA4wSnlPXA6pyCtRN291
	D/stGT/6+soAHa8LjCaY/GROAjChhYTpY6kgI3jX9QIZ2CAfZzZkglxnSGQEJQ/5/0jI7D/9hhSSv
	pIDoeL9q7kJTtm9gYNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOvM4-00F556-RW; Tue, 01 Mar 2022 05:47:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOvJG-00F3lo-U7; Tue, 01 Mar 2022 05:44:32 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Mar
 2022 13:44:28 +0800
Message-ID: <34a1fd07-cb83-25b9-a208-490ea01ed891@amlogic.com>
Date: Tue, 1 Mar 2022 13:44:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 5/6] tty: serial: meson: The system stuck when you run
 the stty command on the console to change the baud rate
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
 <20220225073922.3947-6-yu.tu@amlogic.com>
 <1jczj7xnn0.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jczj7xnn0.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_214431_079946_BF831B52 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Jerome,
	Thank you for your reply.

On 2022/2/28 18:58, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Fri 25 Feb 2022 at 15:39, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> Start the console and run the following commands in turn:
>> stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600. The
>> system will stuck.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   drivers/tty/serial/meson_uart.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index ba8dc203b9cb..d19349ead738 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -365,8 +365,13 @@ static void meson_uart_set_termios(struct uart_port *port,
>>   	writel(val, port->membase + AML_UART_CONTROL);
>>   
>>   	baud = uart_get_baud_rate(port, termios, old, 50, 4000000);
>> +
>> +	spin_unlock_irqrestore(&port->lock, flags);
>> +
>>   	meson_uart_change_speed(port, baud);
>>   
>> +	spin_lock_irqsave(&port->lock, flags);
> 
> Already told you before, you can make meson_change_speed()
> clk_set_rate() uses mutex and may sleep.
Sorry, I may have only paid attention to how you asked me to change to 
using the clock before, instead of paying attention to this suggestion.
> 
>> +
>>   	port->read_status_mask = AML_UART_TX_FIFO_WERR;
>>   	if (iflags & INPCK)
>>   		port->read_status_mask |= AML_UART_PARITY_ERR |
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
