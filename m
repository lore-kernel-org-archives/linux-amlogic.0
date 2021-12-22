Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51166C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYhKr94NLMBi69IqxVmHtnrgGTD30VgBzyuT80ATX7A=; b=WnqIqNgN1ljecf
	1XDVSna6Bubc6SU1CEFSeYRZKNTasPj7ZdP0OLl5HYGKCoQnG+c3F/BhKahFTfnGgsJEH8USZ/aer
	IBvC0J6HfYG7hvkK9UT1HkhS7ghFO5CDD7c5TzfYX1ynqVQOlAgWL0mHio1zjtdvixcJZWUMMuAAM
	/msjUM+7HlPoU8UQEGxpJOUGP+NlCiSgpm5oteDF3P2v0QwXdv94RUzpCebcijDURRV1t2DVnRsTS
	CqzTXxkzoyjE7fJ71EWv2dmqCFy7fORlx7rysBhb7eXIvjJIQcax5OTlW1ctyotnsR7//7m1CgEZE
	tG1Q/g47NmeqW+X20wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxEj-009kBb-RI; Wed, 22 Dec 2021 08:44:37 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxEX-009k9I-JF; Wed, 22 Dec 2021 08:44:26 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 22 Dec
 2021 16:44:23 +0800
Message-ID: <81e31307-609a-bab4-0241-33d574b7ef44@amlogic.com>
Date: Wed, 22 Dec 2021 16:44:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/3] tty: serial: meson: modify request_irq and free_irq
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-2-yu.tu@amlogic.com> <YcGCj2jGpzl+sKcT@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <YcGCj2jGpzl+sKcT@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_004425_671596_A750258B 
X-CRM114-Status: GOOD (  12.00  )
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



On 2021/12/21 15:30, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Dec 21, 2021 at 03:16:32PM +0800, Yu Tu wrote:
>> Change request_irq to devm_request_irq and free_irq to devm_free_irq.
>> It's better to change the code this way.
> 
> Why?  What did this fix up?  You still are manually requesting and
> freeing the irq.  What bug did you fix?
> 
I think this is exactly what you said. It's not necessary.
>>
>> The IRQF_SHARED interrupt flag was added because an interrupt error was
>> detected when the serial port was opened twice in a row on the project.
> 
> That is a different change.  Make that a different patch.
> 
The main purpose of this change is that I found some users in the actual 
project with the following usages:
(1)open(/dev/ttyAML0);
(2)open(/dev/ttyAML0);
The open function calls the meson_uart_startup function. If this is the 
case, an interrupt error is reported.So So the IRQF_SHARED flag was added.

I'm going to do this for now, remove free_irq and request_irq 
function,then add devm_request_irq in meson_uart_probe function.
This solves the above problem without adding IRQF_SHARED.
> thanks,
> 
> greg k-h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
