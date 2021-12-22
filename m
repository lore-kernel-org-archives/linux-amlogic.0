Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A4DC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Dec 2021 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oj6v9R35/Ew1YAnbf14hQX9SNolNfHuA/R90XuwFF3w=; b=O8FCTedAyzZlSf
	3K8xpWfzDDc4Y8MQGnND1Cpb00ffbr72Nutu6YW2mX5lJXYg8U/u6AFEuNN8iWFWumz+/tAF5iej/
	J48T3zOlDDul5l1OcWp+Ev99WLPJPK4iGW23LlkEFnwnRC5gK30h/svQUk906f/I4reYkUg0f65ek
	ceCb/lBseXOF8JZMPmYKFs4+GnUl0YH1yvf72mN82JZQyGsMGcv8BLocaIN5M7/qARqLykHdh0/Rf
	eE1Dr+kQZIQPKQqPxGGO/5xF3PU3GG8RXwmL+UlXM4TARRWMysgR1aW4biqOcIGuTCmTJKrLIn8fs
	Ii4/3t4APVCTWbOuBrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzwqw-009dX6-1X; Wed, 22 Dec 2021 08:20:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzwqj-009dUA-U9; Wed, 22 Dec 2021 08:19:51 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 22 Dec
 2021 16:19:41 +0800
Message-ID: <92993ded-c15b-ce2e-6fb6-f4ee846cbcf1@amlogic.com>
Date: Wed, 22 Dec 2021 16:19:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 0/3] the UART driver compatible with the Amlogic Meson S4
 SoC
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20211221071634.25980-1-yu.tu@amlogic.com>
 <YcGCs1LYqXNnQwsF@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <YcGCs1LYqXNnQwsF@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_001950_028734_6A54967C 
X-CRM114-Status: UNSURE (   9.06  )
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

Hi Greg K-H,
	Thank you very much for your reply.I'll amend it as you suggest.

On 2021/12/21 15:30, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, Dec 21, 2021 at 03:16:31PM +0800, Yu Tu wrote:
>> The UART driver compatible with the Amlogic Meson S4 SoC on-chip, change the
>> UART interrupt interface function while adding IRQF_SHARED flag. And add clear
>> AML_UART_TX_EN bit in meson_uart_shutdown funtion.
>>
>> Yu Tu (3):
>>    tty: serial: meson: modify request_irq and free_irq
>>    tty: serial: meson: meson_uart_shutdown omit clear AML_UART_TX_EN bit
>>    tty: serial: meson: add UART driver compatible with S4 SoC on-chip
>>
>> Link:https://patchwork.kernel.org/project/linux-amlogic/patch/20211206100200.31914-1-xianwei.zhao@amlogic.com/
> 
> What is this link for?
> 
> And why patchwork?
> 
> Please just use lore.kernel.org links for mailing list threads.
> 
> thanks,
> 
> greg k-h
> 
I will change the address you suggested as follows,
Link: 
https://lore.kernel.org/linux-amlogic/20211206100200.31914-1-xianwei.zhao@amlogic.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
