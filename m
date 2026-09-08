Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C161C79F82
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGwOFZHJ6ki2QrZc9hRaJEwM/y2SPft1xmP4sRG8G2c=; b=TXY5BK0SWVzOp6
	+BSQxhKcUuks0AIpKuzbTPDHmokG4VrNuIRLTbmmlT2i6ylzQw6YJZJdMMzM2btJVRwz5q+KaPGqD
	YXcQ0eD+ElYA9lwLPgTxO4wZr/RVGjhg2EOtTkXpgC+sClSkSg2n0ERTDp/HtRWZSwUlawBj6XX6Z
	wJUi6j6d+6OPtip9Qwwnx22e/gyX3PANb8QxZJpb8H8zDG+4dPeppMSAddcoZJL2yCKtMC83lZX7O
	ZpOBNE4LSG6Ewn1Zn9LJtruQi8R52WuqUX6W5jL2VvKZe5STfuCiVynNuHxmV0dbHF5WqB5ylP/8S
	XM7q6alSa8E8taoTzsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s2g-00000008YXL-1Kzm;
	Tue, 08 Sep 2026 09:23:02 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s2a-00000008YV0-0zwd
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 09:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=RLcfcZ2I8QX4qdQQiyxU4fXIYW6vLUxmkCmhpjwWLWc=; 
	b=XTYF6To+fBCNT9nEVHvbO2KOod7eQqQFQyR3HmEQK6+ZLZNg5K6lrHazd1j6SFdkqGWHDReM8Tu
	fEZr42bZywOJfscdb7vdH7/wUdPlxkmjsyykgj4lR9vrVdikJV6ww1SqJbUIfHZ72mzWE1q2+Lc4M
	ixykFENbNNnEo4c1rynuXWxSQet70mWDTGeEGbMq5jyNZmQ/U1soHfCr/4TeovOAXUQJYiFs4ow+s
	LN43lAXbG4qiMKgNbjnRIx26AsdP8ioQg1wxoa4YmVfHNjRlO+kvYxl6+oGm/h3qFZ7FNJ0KbXn1R
	VqUgagtHJ603w6JIOzNPUd+6FlGGs240Eh7g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x3s2F-0000000BnfR-2zax;
	Tue, 08 Sep 2026 17:22:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 08 Sep 2026 19:22:35 +1000
Date: Tue, 8 Sep 2026 19:22:35 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Cc: clabbe@baylibre.com, davem@davemloft.net, skhan@linuxfoundation.org,
	me@brighamcampbell.com, jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] crypto: amlogic: Fix IRQ handler return value and
 fallthrough logic
Message-ID: <ap_T2wCesl3whdJV@gondor.apana.org.au>
References: <20260821151243.8125-1-raizudeen.kerneldev@gmail.com>
 <apox0f2D6bYOYOnj@kernel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apox0f2D6bYOYOnj@kernel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022256_272743_11A3031F 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, Sep 04, 2026 at 08:19:53AM +0530, Mohamad Raizudeen wrote:
>
> Just following up on this patch. Please let me know if you have any
> feedback or if further changes are needed.

Please repost this patch by itself since it's not really part of a
series.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
