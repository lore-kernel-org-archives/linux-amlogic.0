Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4573C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gQNVZXgPhsiaRzCrA1LmpUK6qWLzutpPtFvaC4nb7m0=; b=2gk9FT+DFS7vdEc4e3/a96QFXs
	1BwX84ELS16Q9eyCSBA97wc8Be65YxFHRnPMMavjjWjMY8TVsSAKr874bVBchBRiq+ahV/9ni1A8u
	RojO7axLkTHZ0cXcp6Ct/EkYGPyho0RYGqr7v8imr0Ni4C6c3eoSnSdqofWEB2nN+Pf+vzn4QYpMZ
	WPfh/f2WSlA3WEI3E+Bgjzd0istN7x0gANh2gBwji/LDbmuLGUR5T18rUewDQbhuOzpqZQS/cmP/K
	CssBfODQ2/FR8lN+wNwkkqptMX5rsqNYq8OgqhsgujX7D0HfDkrHJNp+lVz8TgdagsqojlKIjtceQ
	0GPKRAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0oVt-00ENhC-Tu; Fri, 24 Dec 2021 17:37:53 +0000
Received: from mxout02.lancloud.ru ([45.84.86.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oVq-00ENg1-2d; Fri, 24 Dec 2021 17:37:52 +0000
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 4FE9E235CB5C
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH RFC 02/13] mmc: meson-gx: fix deferred probing
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>, "Neil
 Armstrong" <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-3-s.shtylyov@omp.ru>
 <CAFBinCAd4QTZ78S7QrT0Zsduvk=09rJa3gHHb15HLpwspQzuTw@mail.gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <a32767cb-9e6e-6d72-85e7-757399419916@omp.ru>
Date: Fri, 24 Dec 2021 20:37:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCAd4QTZ78S7QrT0Zsduvk=09rJa3gHHb15HLpwspQzuTw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_093750_358012_E71E70D4 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 12/24/21 8:35 PM, Martin Blumenstingl wrote:

>> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
>> to -EINVAL, so if it returns -EPROBE_DEFER, the driver will fail the probe
>> permanently instead of the deferred probing. Switch to propagating the error
>> codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
>> can safely ignore it...
>>
>> Fixes: cbcaac6d7dd2 ("mmc: meson-gx-mmc: Fix platform_get_irq's error checking
>> ")
> I suggest putting the ") on the previous line. Most "Fixes" tag I have
> seen don't use any line-break at all, even if the line gets long.

   Sorry, was a cut & paste artifact that I didn't notice... :-/

>> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> with above comment addressed you can add my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

   Thank you!

> Best regards,
> Martin
> 

MBR, Sergey

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
