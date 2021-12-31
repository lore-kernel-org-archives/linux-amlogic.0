Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE813C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZK/N6HcnN/IuBti6zlpGhs/ldDpWRok4HtqxAP3RNSM=; b=4c8uziU6kkObSO
	oSgDo1JqpM0nGythv+1SV8n4MqcR0t37bVaq/InS7evK7tIY+oXE+0yfuTqeprBoUsxxZoubUzD3I
	Y7gPlR9WD8f6L3h7L6n56Me7FMg9tF9QNg85WbIPebUOHUHnEpUQxLm2S3DdvwrI7fJTegPDFvxQW
	Yvwovdag5Swae68VO4FZR0RdV8pg+enQ4wKztMzpFA+LDwyeRh7sUjWoBLOkuOXKV6BchnY0o5X6T
	HOgx8P7jQm9iUjw91tyoA8RwBvPk3Cf+khHzRzcepjTFHG5fCczthiPA0EJL9r2kHTKN7hxYRuKZN
	E9MadUq3zRqJAO6IrrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3FIL-005weB-2y; Fri, 31 Dec 2021 10:37:57 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3FI9-005wbw-C3; Fri, 31 Dec 2021 10:37:46 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 18:37:43 +0800
Message-ID: <50127eb4-dfa0-6b80-36c0-8c246eb4d164@amlogic.com>
Date: Fri, 31 Dec 2021 18:37:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 6/6] tty: serial: meson: Change request_irq to
 devm_request_irq and move devm_request_irq to meson_uart_probe()
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-7-yu.tu@amlogic.com>
 <CAFBinCAzDSw6jmpU-S2KGZ32D+U1fNqLgKMmkPSdz=-XN4isDA@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCAzDSw6jmpU-S2KGZ32D+U1fNqLgKMmkPSdz=-XN4isDA@mail.gmail.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_023745_449137_B0133F6D 
X-CRM114-Status: GOOD (  12.04  )
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



On 2021/12/31 6:41, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 30, 2021 at 11:22 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>
>> Because an interrupt error occurs when the user opens /dev/ttyAML* but
>> don't close it, and then opens the same port again. This problem is
>> encountered in actual projects.
> I would like to hear from the serial driver maintainers whether the
> described problem is a userspace or driver bug.
> 
> If it's a driver bug then this should be sent as a separate patch
> (unrelated to this series) with a fixes tag.
> 
> [...]
>> +       ret = devm_request_irq(&pdev->dev, port->irq, meson_uart_interrupt,
>> +                              0, dev_name(&pdev->dev), port);
> You can replace dev_name(&pdev->dev) with NULL to achieve the same
> result with less code.
> dev_name(dev) is the default value, see [0]
> 
I think you are right, I will remove this patch. I learned a lot.
> 
> Best regards,
> Martin
> 
> 
> [0] https://elixir.bootlin.com/linux/v5.15/source/kernel/irq/devres.c#L64
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
