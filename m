Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F0C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Dec 2021 10:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LXx5qnFb7jhfk8faDWy+iIZmN2nOAQfUQVWLpStO30=; b=qSeTMVL5nhHdZ7
	agE2LeUIlMKRzcuXykqvO/pYgXaPaGepjHHVo9wpwe0qXgrcQFjLvYPSvBrrOeMbJ6IJ9XmdKRz3U
	F/bYBGRuMw5lGHBRDBq7XncPNbVq6QHfDMvSgRuA2A4tp241rW32dCKEtNE+/arParTXabuIEiwyR
	Vgdpm1zqrMj61KajwPtysbX1V7jd+daXFmweRyDwbS2VQ2L76ReIJN8ILJClC66w+RI/f/hCMeXMp
	hPtDFo2xjUoP4z8RC+Pr8iNPHO8Lzc5xRlMTvJnF7KIP3hX4NUlwjw8NJVhfnx351GadvSA+GPCIM
	bhMgBdqmLrdMxtS6AKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3F0A-005tZF-D2; Fri, 31 Dec 2021 10:19:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3Ezy-005tXn-V6; Fri, 31 Dec 2021 10:19:00 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 31 Dec
 2021 18:18:49 +0800
Message-ID: <0f447686-b0d7-aed7-8c17-88111693ba29@amlogic.com>
Date: Fri, 31 Dec 2021 18:18:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 3/6] dt-bindings: serial: meson: Support S4 SoC uart.
 Also Drop compatible = amlogic,meson-gx-uart.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jiri
 Slaby <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Vyacheslav <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-4-yu.tu@amlogic.com> <Yc2l0Rp3lrfYr6PP@kroah.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <Yc2l0Rp3lrfYr6PP@kroah.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_021859_059989_EBD527DE 
X-CRM114-Status: UNSURE (   7.22  )
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

Hi Greg,
	Thank you for your reply.

On 2021/12/30 20:28, Greg Kroah-Hartman wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 30, 2021 at 06:21:07PM +0800, Yu Tu wrote:
>> Deprecated, don't use anymore because compatible = amlogic,meson-gx-uart
>> don't differentiate between GXBB and GXL which have different
>> revisions of the UART IP. So it's split into GXBB and GXL.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> Again, your subject line is way too long.
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
