Return-Path: <SRS0=Q/al=QR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD694C282C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 21:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0FA2145D
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 21:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X02LBSgl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0FA2145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9f7WuYj9RmZhgGJEge+VF6f1mdhSpPeCQZT1b/uEE04=; b=X02LBSgl1M0+t4
	G2uZovOJ9lHhQpVRMX+IjsgKy2th6I9Gn5lGxPsa3l7N7NUUd6DDen2s9fjFeGbXq9igaTuR0I+Ln
	QToXgwLEZxeTtEOYy7xRreHHzK44pXxD6AZR8d3NB9hf8kB92uU8jrRz4YTRlPs60a5ZWGlnSkzwK
	zjUftC89M2Ce+A6uhD3eP3/1U49gQ7Ue3gZaQvu7Q7EGpI5fvlVM5UR+5FWE32trZvruNPvPpK6ck
	bbvh0ygMeLSMqdNlNx1Bh6/XXdYWPkcGna2ZKssrs0hdjhOoikRrnS1sxtCHCjvEVEX8dRA8gDGxS
	sHmUGiSB4dSwfM6g75Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gswYH-0005So-66; Sun, 10 Feb 2019 21:22:13 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gswYE-0005Oj-2L; Sun, 10 Feb 2019 21:22:12 +0000
X-Originating-IP: 86.202.231.219
Received: from localhost (lfbn-lyo-1-149-219.w86-202.abo.wanadoo.fr
 [86.202.231.219])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3F402C0004;
 Sun, 10 Feb 2019 21:22:00 +0000 (UTC)
Date: Sun, 10 Feb 2019 22:21:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v7 2/2] rtc: support for the Amlogic Meson RTC
Message-ID: <20190210212159.GK23062@piout.net>
References: <20190209001813.6792-1-martin.blumenstingl@googlemail.com>
 <20190209001813.6792-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190209001813.6792-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_132210_308230_E0582976 
X-CRM114-Status: GOOD (  14.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, ccaione@baylibre.com,
 linux-kernel@vger.kernel.org, ben.dooks@codethink.co.uk,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/02/2019 01:18:13+0100, Martin Blumenstingl wrote:
> Add support for the RTC block on the 32-bit Amlogic Meson6, Meson8,
> Meson8b and Meson8m2 SoCs.
> 
> The RTC is split in to two parts, which are both managed by this driver:
> - the AHB front end
> - and a simple serial connection to the actual registers
> 
> The RTC_COUNTER register which holds the time is 32-bits wide.
> 
> There are four 32-bit wide (in total: 16 bytes) "regmem" registers which
> are exposed using nvmem. On Amlogic's 3.10 kernel this is used to store
> data which needs to survive a suspend / resume cycle.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> [resurrected Ben's patches after 2 years]
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/rtc/Kconfig     |  11 ++
>  drivers/rtc/Makefile    |   1 +
>  drivers/rtc/rtc-meson.c | 410 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 422 insertions(+)
>  create mode 100644 drivers/rtc/rtc-meson.c
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
