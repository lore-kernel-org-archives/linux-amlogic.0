Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC94C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqgS8bPRxf6+gkRONlbGcTnzafUQgHbbl1+BFH/6qtw=; b=VCXxOCsfImFRPb
	hzuApEbMS77GNydzeYIhIYaoW1JojOrHulp9Z+xqAh+Otf11se0W0NmpcdNwQ05+yEdsZ6+OhKH/M
	jx5dBXk1qJMYxv2Lu4xtRzj6hnMkNSXg2JhzlvmEflpOA64tXpJYAU7SFGuSHNEIgdjCZefdpcRCI
	+ZsZAgosl7feDkeJhc3gprZLmyeLoxV7JdIkP7An6WgCB4U1DRvMlApeCfXzflvRavtA9hRjGpCSU
	H8NoCdQrqAhztUHu89qv9gy7aviGPl4SnEZp/MEDgWPQYW63jFIzVfILL7pDwp+MKcwi8oto5jxgQ
	y6o+zDqxsQmQEWYxMY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzxUq-009o5M-0n; Wed, 22 Dec 2021 09:01:16 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzxUd-009o36-8P; Wed, 22 Dec 2021 09:01:05 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 22 Dec
 2021 17:01:00 +0800
Message-ID: <04a4768a-5136-8b6e-baa2-b6ac21afe14f@amlogic.com>
Date: Wed, 22 Dec 2021 17:01:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/3] tty: serial: meson: meson_uart_shutdown omit clear
 AML_UART_TX_EN bit
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <20211221071634.25980-3-yu.tu@amlogic.com> <YcGC8hlOEbzH8rc8@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <YcGC8hlOEbzH8rc8@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_010104_071061_2EB58E8A 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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



On 2021/12/21 15:32, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Dec 21, 2021 at 03:16:33PM +0800, Yu Tu wrote:
>> The meson_uart_shutdown function should have the opposite operation to
>> the meson_uart_startup function, so the shutdown of AML_UART_TX_EN is
>> logically missing.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> 
> What commit does this fix?  Should it go to stable kernels?  Please put
> that in here if needed.
> 
It has not yet been revealed that this is a bug. The reason I changed it 
was because I thought it was an improvement and it might be a hidden 
bug.The AML_UART_TX_EN bit is conspicuously missing when comparing the 
meson_uart_shutdown and meson_uart_startup functions.So I think it's 
best to add.
> thanks,
> 
> greg k-h
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
