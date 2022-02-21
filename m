Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F4AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/3JVxhykTOM0ZnwQU7UPFNfkhQCK+tIrkwiBh4AJx4=; b=0QEWj/aIvJ7GoW
	MhjZcF++stFvE4yy49b1B9xZ2PQE7RqJdnSOD/fWQqyqcwaCpuvnZ44XlrTmtLpfPpWdBt0H5pol8
	U7UGLowsvQM/yRSbhwHcKJa7rQhygsoz0CiAKiYJbl2HCJhtzmCkjllI20xfhCrz4FSDuF53cF/LG
	36gYUOZdSXwDGnguz2/4aew8jYZjTLWouTIzPQYr1o2C71xlL/xfSOm7Ic1xpAMcIOLNhBYUgEvKP
	EWuyUofjyRHPkAa1noAtUCpPKOcTmibz44V16gG1dLEsns5398P3R6PMqcdXl7IvkzxeLkEi4Gg7d
	L4RILb0jBkIcEZR/KbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM41w-004HOW-Gc; Mon, 21 Feb 2022 08:26:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM41e-004HGs-0y; Mon, 21 Feb 2022 08:26:31 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 21 Feb
 2022 16:26:27 +0800
Message-ID: <7f056798-8784-2fa9-3ae0-d9ba62449f3c@amlogic.com>
Date: Mon, 21 Feb 2022 16:26:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V6 3/5] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Jiri Slaby <jirislaby@kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-4-yu.tu@amlogic.com>
 <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
 <1jbl062i4o.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jbl062i4o.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_002630_111464_15F8D3CE 
X-CRM114-Status: GOOD (  11.48  )
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



On 2022/1/21 5:48, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Tue 18 Jan 2022 at 10:39, Jiri Slaby <jirislaby@kernel.org> wrote:
> 
>> On 18. 01. 22, 4:09, Yu Tu wrote:
>>> Using the common Clock code to describe the UART baud rate clock
>>> makes it easier for the UART driver to be compatible with the
>>> baud rate requirements of the UART IP on different meson chips.
>> ...
>>> --- a/drivers/tty/serial/meson_uart.c
>>> +++ b/drivers/tty/serial/meson_uart.c
>> ...
>>> @@ -629,57 +640,105 @@ static struct uart_driver meson_uart_driver = {
>>>    	.cons		= MESON_SERIAL_CONSOLE,
>>>    };
>>>    -static inline struct clk *meson_uart_probe_clock(struct device *dev,
>>> -						 const char *id)
>>> -{
>>> -	struct clk *clk = NULL;
>>> -	int ret;
>>> -
>>> -	clk = devm_clk_get(dev, id);
>>> -	if (IS_ERR(clk))
>>> -		return clk;
>>> -
>>> -	ret = clk_prepare_enable(clk);
>>> -	if (ret) {
>>> -		dev_err(dev, "couldn't enable clk\n");
>>> -		return ERR_PTR(ret);
>>> -	}
>>> -
>>> -	devm_add_action_or_reset(dev,
>>> -			(void(*)(void *))clk_disable_unprepare,
>>> -			clk);
>>> -
>>> -	return clk;
>>> -}
>>> +static struct clk_div_table xtal_div_table[] = {
>>
>> This can be const, right?
>>
>>> +	{0, 3},
>>> +	{1, 1},
>>> +	{2, 2},
>>> +	{3, 2},
>>
>> Not sure if you didn't remove too much whitespace. I think it should be
>> like: "{ 0, 3 },". But I actually don't care, it's a minor thing.
> 
> Seconds
> It worth fixing in the next version
> 
I will correct in a version.
>>
>> I cannot comment on the rest (clk and OF part) as my knowledge is pretty
>> limited there. Leaving up to others.
>>
>> thanks,
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
