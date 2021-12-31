Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453EFC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qI4NIQBiGLPvEeZGkKUnYwMEmVtvymDW1eNptdV0erI=; b=DK30VLD4Vkdu6b
	mQalMOBW1LH3/OJnosSLeoPpspA54d+3sxi8dYjeO65Ke5ohj+d+DnMfZsy74R3+VyO1t7l2s0sbB
	Q3e5cYmS1m7NlyTnnpQ7RNZWRUWiSILTmWIosm2KpXyhajhEs+FFNhhIOTTRK9rKCgmWVrdb0Nb6O
	w2Hsb5Q0esZ3F5wdVIDlzP7qVKnxZ7tOIIu7uUeI38ajIGDXsX9kBHFHfIkl8vfsNSEtJKGtJ3wui
	HXV8vcHJjPmIcdbAt1L5lJS5tc6fuj6iXItRbYGKsEleZR+QTjLKxeICp8cp4q0kiZ7ItuBTfrf/6
	vDpqT+aKd+M6GYHPeAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3G1n-005z9b-9Y; Fri, 31 Dec 2021 11:24:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3G1a-005z8b-RV; Fri, 31 Dec 2021 11:24:44 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 19:24:37 +0800
Message-ID: <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
Date: Fri, 31 Dec 2021 19:24:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_032442_937980_4667B475 
X-CRM114-Status: GOOD (  30.53  )
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



On 2021/12/31 7:13, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 30, 2021 at 11:21 AM Yu Tu <yu.tu@amlogic.com> wrote:
> [...]
>> @@ -270,14 +284,11 @@ static void meson_uart_reset(struct uart_port *port)
>>   static int meson_uart_startup(struct uart_port *port)
>>   {
>>          u32 val;
>> -       int ret = 0;
>> +       int ret;
>>
>> -       val = readl(port->membase + AML_UART_CONTROL);
>> -       val |= AML_UART_CLEAR_ERR;
>> -       writel(val, port->membase + AML_UART_CONTROL);
>> -       val &= ~AML_UART_CLEAR_ERR;
>> -       writel(val, port->membase + AML_UART_CONTROL);
>> +       meson_uart_reset(port);
> I suggest splitting this into a separate patch. In general I think
> it's a good idea to re-use meson_uart_reset here if possible.
> However, if during testing it turns out that this doesn't work then we
> can revert this single patch which updates meson_uart_startup() only -
> instead of reverting the whole transition to the common clock
> framework.
> 
I approve of your suggestion. I will make the next patch.

> [...]
>>   static int meson_uart_request_port(struct uart_port *port)
>>   {
>> +       struct meson_uart_data *private_data = port->private_data;
>> +       int ret;
>> +
>> +       ret = clk_prepare_enable(private_data->pclk);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = clk_prepare_enable(private_data->baud_clk);
>> +       if (ret) {
>> +               clk_disable_unprepare(private_data->pclk);
>> +               return ret;
>> +       }
> This code is from my original suggestion - and I had a doubt there
> which I forgot to add as a comment originally:
> Can you confirm that accessing the UART controller registers works
> even when "pclk" is turned off?
> I am asking this because the common clock framework can access the
> clocks at any time.
> And I have seen SoCs which would hang when trying to access a module's
> registers while the module's pclk is turned off.
On all meson platforms, the default pclk for all UART is turned on 
during the u-boot phase. When registering uart pclk in the kernel phase, 
the CLK_IGNORE_UNUSED flag is added. So the real shutdown is when the 
standby goes down, the parent clk shuts down.
.
> 
> [...]
>>          port->fifosize = 64;
> commit 27d44e05d7b85d ("tty: serial: meson: retrieve port FIFO size
> from DT") [0] from May 2021 has changed this line to:
>    port->fifosize = fifosize;
> So your patch currently does not apply to linux-next (or even Linus'
> mainline tree).
> 
So do I need to wait for [0] patch merged before I can continue to make 
changes ?
What can I do before?
> [...]
>>   static const struct of_device_id meson_uart_dt_match[] = {
>> -       { .compatible = "amlogic,meson6-uart" },
>> -       { .compatible = "amlogic,meson8-uart" },
>> -       { .compatible = "amlogic,meson8b-uart" },
>> -       { .compatible = "amlogic,meson-gx-uart" },
>> +       {
>> +               .compatible = "amlogic,meson6-uart",
>> +               .data = (void *)false,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson8-uart",
>> +               .data = (void *)false,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson8b-uart",
>> +               .data = (void *)false,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson-gxbb-uart",
>> +               .data = (void *)false,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson-gxl-uart",
>> +               .data = (void *)true,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson-g12a-uart",
>> +               .data = (void *)true,
>> +       },
>> +       {
>> +               .compatible = "amlogic,meson-s4-uart",
>> +               .data = (void *)true,
>> +       },
>> +       /*
>> +        * deprecated, don't use anymore because it doesn't differentiate
>> +        * between GXBB and GXL which have different revisions of the UART IP.
>> +        */
>> +       {
>> +               .compatible = "amlogic,meson-gx-uart",
>> +               .data = (void *)false,
>> +       },
> For this change I think it's also best to split it into separate
> changes, similar to the dt-bindings:
> 1) deprecate and replace "amlogic,meson-gx-uart"
> 2) another one to add the S4 compatible string
> 3) and a third one with the big common clock framework change (adding
> the .data attributes)
> 
> This is about the "Separate each logical change into a separate patch"
> rule from the Linux kernel patch submission guide [1]
> Also I hope that it will make it (at least a bit) easier for others to
> also review this patch.
> 
I quite agree with your suggestion. I'll do as you suggest.
> 
> Best regards,
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/tty/serial/meson_uart.c?id=27d44e05d7b85d9d4cfe0a3c0663ea49752ece93
> [1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#separate-your-changes
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
