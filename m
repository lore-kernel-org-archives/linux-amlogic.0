Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB1C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueKz3h34pyKmNxzFUVDOafviBNbIPgr3h9kDytf27GY=; b=1DxNh5Vxk8SeyU
	mPbwq3QEX6ZmSYNaKD3KNOL7lxT/ztmv5FoVYdClIjOpaqr/x0vr7nILR5Q9uXYUGyd+uEhO1ZWNJ
	VxhBIziYcTFtd1v+KWPWoJ8aK5YuyUtrzju+43qX5r2/S1fBawR+vheTSD+47OR57jbwgUJam+pYM
	Ftr5wTndaHUVPC3jxL9xezuN1Nuw2TFMCEJqBkMVsLvuVdeKTNjsv0GQqDiRtZLH6NKBgzJPMEQbN
	Qw4I2zeFN7gfrbqjyxkCC4nKqSBespK4rIghGeVz60+UY+ApoQHFLx3s76jf6yH7ErBKnMPnbmeGr
	oXzqsyIUwEPrxgzfK8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3zf-004GPv-Nc; Mon, 21 Feb 2022 08:24:27 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3zT-004GMt-GK; Mon, 21 Feb 2022 08:24:16 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Feb
 2022 16:24:07 +0800
Message-ID: <1cd6e368-e1ce-d587-fb5d-d8bd46dbeb99@amlogic.com>
Date: Mon, 21 Feb 2022 16:24:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V6 4/5] tty: serial: meson: Make some bit of the REG5
 register writable
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-5-yu.tu@amlogic.com>
 <1j7dau2hxi.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j7dau2hxi.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_002415_601447_898B0832 
X-CRM114-Status: GOOD (  11.74  )
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
	Thank you very much for your reply. At present, the problem of 
switching uART baud rate stuck has been solved. I'm ready to send the 
next edition.

On 2022/1/21 5:49, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Tue 18 Jan 2022 at 11:09, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> The UART_REG5 register defaults to 0. The console port is set in
>> ROMCODE. But other UART ports default to 0, so make bit24 and
>> bit[26,27] writable so that the UART can choose a more
>> appropriate clock.
> 
> Suggestion: Instead of talking bits (which is a bit cryptic) tell us
> what is actually does
> 
> Something like:
>   Make the internal clock source mux and divider writeable, allowing the
>   uart to deviate from the settings intially applied by the ROMCode and
>   using the most appropriate clocks
> 
Your description is better, I will follow your suggestion in the next 
edition.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   drivers/tty/serial/meson_uart.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index 92fa91c825e6..4e7b2b38ab0a 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -678,7 +678,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>>   							CLK_SET_RATE_NO_REPARENT,
>>   							port->membase + AML_UART_REG5,
>>   							26, 2,
>> -							CLK_DIVIDER_READ_ONLY,
>> +							CLK_DIVIDER_ROUND_CLOSEST,
>>   							xtal_div_table, NULL);
>>   		if (IS_ERR(hw))
>>   			return PTR_ERR(hw);
>> @@ -708,7 +708,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
>>   					CLK_SET_RATE_PARENT,
>>   					port->membase + AML_UART_REG5,
>>   					24, 0x1,
>> -					CLK_MUX_READ_ONLY,
>> +					CLK_MUX_ROUND_CLOSEST,
>>   					NULL, NULL);
>>   	if (IS_ERR(hw))
>>   		return PTR_ERR(hw);
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
