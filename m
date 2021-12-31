Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F4FC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 10:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex6s7X54dYhl4wG2o3zVuYBBMJA6xoOPszcvSahOtCw=; b=HDgxhs5WOWiCAy
	6/by2XdGLNhcAsn1LMqXLcp/WH0Dvfob6IRkDaeg3BJC9vVg5Xz/wQ0Zz5Fj94dcD4ViFvDZjPN8p
	CGN2tLeqtuyRgrqQ+63pbbyJv6iRVLFC2zMXNMNsPZixtK1Gh7FwCan6AAk1S1PX8qkuGP9o3AgeI
	6pQJATMOuCgr6Ak7qMKyp9Soa6zwvtRLciLy0cuNBvfpWLtJS1P7Q2WbsUlPaH8DShBb9keJtBuq9
	NE7Oae/2yMRkmNO6AOhlM7hvamg2fpaL8bDRwlihKZki5g9L+WW1o/V9Ho4YOz8VaJD6cf1teBR+f
	zxZRAgZmJbgvbSB0/yjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3F4q-005u9v-7u; Fri, 31 Dec 2021 10:24:00 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3F4f-005u8N-08; Fri, 31 Dec 2021 10:23:50 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 18:23:46 +0800
Message-ID: <f0a8cf69-bc51-1cb0-8c1a-6751a4d42eca@amlogic.com>
Date: Fri, 31 Dec 2021 18:23:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com> <Yc2lwhYKQ03pGho3@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <Yc2lwhYKQ03pGho3@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_022349_076561_93FE8FD1 
X-CRM114-Status: UNSURE (   5.82  )
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



On 2021/12/30 20:27, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 30, 2021 at 06:21:08PM +0800, Yu Tu wrote:
>> Using the common Clock code to describe the UART baud rate clock makes
>> it easier for the UART driver to be compatible with the baud rate
>> requirements of the UART IP on different meson chips
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
> 
> Your subject line is very odd, please fix up.
> 
I will correct.
> thanks,
> 
> greg k-h
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
