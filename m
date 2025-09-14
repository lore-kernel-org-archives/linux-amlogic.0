Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A75CAC593
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Sep 2025 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q29W7xDHRWEFnOxAvkfiSvv/DH5Rw6WcJJUv7Tc60+w=; b=d5HJJR+gmjNj+V
	cBpdkLZNrKWRywrNav2Ivfyxqe7GEzoTy7JWVKaZNEIgTPipez+IzK/Tpwqd+A2YOByIHxTTIEXrr
	eUv0ZOAjKUaeZiIeDNyDMisMuD/cXDfH4wkNZhb/gU1sxXOo0BHgcuPxo0Pi3eNBkZcrX5KmFhJyQ
	+GxrzXTdrN7X+qPZaEQMeput9QTW0+kjlrmDFgQ6TZTFDodVncj4Hn6TcImyXNZKIedoI3z84oUxt
	RtWElg5ygTRtlWZPfPXW9IsRFaAvy2/0prer8AS47xFOkYDbufh46NQOLrRXHR42OTUbzvv55Dq6U
	hXUFAFVhnaEwTMArTIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxvzn-00000002L4L-145Y;
	Sun, 14 Sep 2025 23:18:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxvzj-00000002L2I-2RB6
	for linux-amlogic@lists.infradead.org;
	Sun, 14 Sep 2025 23:18:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6E358C6B39E;
	Sun, 14 Sep 2025 23:18:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A762C6063F;
	Sun, 14 Sep 2025 23:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41428102F2A84;
	Mon, 15 Sep 2025 01:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757891931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Kz/TYiAiFScWT9Eog/3uaFprqjRgxDp0fqtkMBbjrK8=;
	b=qTU8QY/IcW9PdJdHfnnSnriw55iAxbvX/V0HYJzDwh9/ccxZMgctDY3iHtACLrEG0uKRSf
	ojX3S7JMYpfZKVXND4tgQ0SSFRVG/ypARvwv8/B36uV2FTCRDOBYED4p+Msp08qcktnH9Z
	em8OKo2BPBenm6uJzIjPI0E+y6mJkWqaoDugILwJjIfjQoPTr34627ybfkL2Ks2RSxBt+1
	ynSQVUJayQm+YuY14kNVSfjnej6KYOJGGyvoiZfPE9Q7DBcbM4tXjw00qsJNvZATeIPRqs
	CwpCsDeGS4koA54fo591RbH3mvLfq+2HJlDecORy/pOaI/WgJdrGKxlEF+QhqQ==
Date: Mon, 15 Sep 2025 01:18:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: (subset) [PATCH 17/21] rtc: remove unneeded 'fast_io' parameter
 in regmap_config
Message-ID: <175789183742.411954.10264880654023329075.b4-ty@bootlin.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_161855_816688_6B45F0FA 
X-CRM114-Status: UNSURE (   6.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 13 Aug 2025 18:15:03 +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> 

Applied, thanks!

[17/21] rtc: remove unneeded 'fast_io' parameter in regmap_config
        https://git.kernel.org/abelloni/c/c90c7ebf8f73

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
