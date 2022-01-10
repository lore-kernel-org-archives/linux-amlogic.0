Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A982FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAAMdKgegCKG8vAn/l/h43s9abJEfMLCDpOyJnobL9A=; b=yJmJz3ZKCNu6L0
	EsmtnU0XqTEF7Z4gyGFkM6coZNO4BdmFOQK6Br3rN1+aZonpnGkD4mKWVanyYVGfqnWAAjxiO6cxY
	PaB7PXT3708DJPGDalEzPHsr8SzVWRt5j3f9TvM/KAxZRDiYaXIm6GTQegMG0e4ToLT4GSXJD6VFD
	aJaIOyCse3IiA/Mx9Rdmzk19SzPvlkM2zIbHF1NTAyeY9YioJYzeVem6TkHsIr+cqWMvY/W9e5+Bu
	sXxSV4EWQa5TqFDafXyGXUNb1A+UrOgakMtaNqqkG+sxAJzKnmW/hP9Y8rsvwPlFSr9EkJr63mGJr
	FDu+1YisBIp6C3TVZMFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rBV-00AVHt-RV; Mon, 10 Jan 2022 09:41:49 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6r5p-00ARxm-3Q; Mon, 10 Jan 2022 09:36:02 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 10 Jan
 2022 17:35:51 +0800
Message-ID: <a19771e6-d1d4-d1ef-9819-21e2147aad16@amlogic.com>
Date: Mon, 10 Jan 2022 17:35:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V4 0/5] the UART driver compatible with
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, <linux-serial@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110085604.18042-1-yu.tu@amlogic.com>
 <1f4b9288-c7ff-c895-425c-187d058642b9@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1f4b9288-c7ff-c895-425c-187d058642b9@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_013557_227250_97245BE0 
X-CRM114-Status: GOOD (  13.21  )
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

Hi Neil,
	Thank you very much for your reply.

On 2022/1/10 17:27, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi,
> 
> On 10/01/2022 09:55, Yu Tu wrote:
>> Using the common Clock code to describe the UART baud rate
>> clock makes it easier for the UART driver to be compatible
>> with the baud rate requirements of the UART IP on different
>> meson chips. Add Meson S4 SoC compatible.
>>
>> Yu Tu (5):
>>    dt-bindings: serial: meson: Drop compatible = amlogic,meson-gx-uart.
>>    tty: serial: meson: Request the register region in meson_uart_probe()
>>    tty: serial: meson: The UART baud rate calculation is described using
>>      the common clock code.
>>    tty: serial: meson: Make the bit24 and bit [26,27] of the UART_REG5
>>      register writable
>>    tty: serial: meson: Added S4 SOC compatibility.
> 
> Weird, the subjects are fine in the cover letter but are all truncated in the email thread:
> [PATCH V4 0/5] the UART driver compatible with
> [PATCH V4 1/5] dt-bindings: serial: meson: Drop
> [PATCH V4 2/5] tty: serial: meson: Request the register
> ...
> Only the last one is OK.
> 
I saw the subject was a little long, I changed it manually, do I need to 
regenerate and send?
> 
>>
>> V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
>> discussed in the email
>> V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
>> the DTS before it can be deleted
>> V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
>> in the email.
>>
>> Link:https://lore.kernel.org/linux-amlogic/20211230102110.3861-4-yu.tu@amlogic.com/
>>
>>   .../bindings/serial/amlogic,meson-uart.yaml   |  10 +-
>>   drivers/tty/serial/meson_uart.c               | 244 ++++++++++++------
>>   2 files changed, 177 insertions(+), 77 deletions(-)
>>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
