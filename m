Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48452C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XafFg2U1arQy6L53Y01rJnEYEMBNJjbhXxv25zAPBMw=; b=XJbAzjk1l5ydaP
	lQiFHWC7r8M2iy4GVpUD3kBzg1btEwvl85DGxbNma412WQzmm5KSXQM/bCgJJXwKI0izTVg0ljKR/
	bIsMkH6PTY/r74OblHkvENw0tqfKB3/pMM+Q21a9RCO5T2VvCqxGUCuG1dS65DQlueouQBJFJ8LXm
	YbmON9Oi2wmcGtHwe85O017VIDKJP9ENxVhbtTcxkacp2cCHBzWa3PnfY70CNcDbBU+TVFYNRdKtk
	TmH4exRTsquTk1Rv/2U6Cqx2A8eUnWwzT6JoP74CcCvK8kann8He6IY5/ZSMRc4bItrZa//JM1nda
	QM8w6tHFhUMJ0UpzhXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3FN2-005xAQ-0l; Fri, 31 Dec 2021 10:42:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3FMr-005x8o-Kr; Fri, 31 Dec 2021 10:42:38 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 18:42:34 +0800
Message-ID: <63c79fb5-e405-7d23-1083-7758bfbcf19d@amlogic.com>
Date: Fri, 31 Dec 2021 18:42:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 5/6] tty: serial: meson: meson_uart_shutdown omit clear
 AML_UART_TX_EN bit
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-6-yu.tu@amlogic.com>
 <CAFBinCC7pvT4=LhowZQpH-_5=90KBnczcRfYc3tLQr8hEh49Zg@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCC7pvT4=LhowZQpH-_5=90KBnczcRfYc3tLQr8hEh49Zg@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_024237_715355_7E69B4DD 
X-CRM114-Status: GOOD (  10.46  )
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



On 2021/12/31 6:44, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 30, 2021 at 11:22 AM Yu Tu <yu.tu@amlogic.com> wrote:
> [...]
>>          val = readl(port->membase + AML_UART_CONTROL);
>> -       val &= ~AML_UART_RX_EN;
>> +       val &= ~(AML_UART_RX_EN | AML_UART_TX_EN);
>>          val &= ~(AML_UART_RX_INT_EN | AML_UART_TX_INT_EN);
>>          writel(val, port->membase + AML_UART_CONTROL);
> This looks fine to me but I think it would be good to Cc the author of
> commit 855ddcab352c15 ("ARM: meson: serial: only disable tx irq on
> stop")
> The meson_uart driver which Carlo added eight years ago did clear
> AML_UART_TX_EN here, but it was changed with the commit I mentioned
> above.
> 
I'm going to delete this change this time. Because there is no bug at 
present, if this is a bug encountered later, i will prepare to submit 
this change.
> 
> Best regards,
> Martin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
