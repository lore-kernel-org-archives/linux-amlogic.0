Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494A7C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 16:14:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 160812183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 16:14:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moxMY5LY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIUUjc6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 160812183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2kZaYAdlhzSmvgzeyWhhEIMW6MyoePib7+zMic6UEM=; b=moxMY5LY8cnDa3
	XwDt9hz2MznV+w+aUsxQ+jRw0hSprGqsSLIQt0Yw+YqdprgaLNxOP+A6A2ygtuy+NS53vaWT9iuLs
	Qh1H4OXVAXr25uypa0sSUaWXYpCLhVryBHwYBfFGF0BHefOCuvakCMWBSVeiEb7vafkBBYJIsjKCu
	pihUY4Hwg0hOvaQll/b1AqK4yjgK9gMklPCGK1iwIeMqXUAgd9XBJqClGBuHGoENvtV9owmZtE3zX
	byo4r0tViUibRo1obQ7Kw4M5wknr3BSg6XxlL3N+Jn3Yo8JKiUzh5wORjBLEN72rYKJr1SWYbOt8c
	lznw/hjBughMEULFymlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6drg-0002CX-H1; Wed, 20 Mar 2019 16:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6dre-0002C7-4R
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 16:14:51 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 632582183E;
 Wed, 20 Mar 2019 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553098489;
 bh=xWb6a3OT5EbC7LPFjRw6+Jt9LU1t6SR/toxDvr/mVL4=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=OIUUjc6i1G/OY61i5Dlx1VJINOZJTDO5SlVRZ/bMqAdB6B6K7ZF3t/iDcbKBIs0k+
 t/OG8KZt2ouNKmEYCg4BG97jQFc3fjNEJVZ+8JrDHUBIikW/pDpA8PfQM5gG221xCy
 +PMjl67o8yjHS0a7efmNkTVY+QUEDsil2TRCnTTY=
MIME-Version: 1.0
In-Reply-To: <1aff3a5c-75d3-5fd3-1aed-88eab2add828@baylibre.com>
References: <1aff3a5c-75d3-5fd3-1aed-88eab2add828@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.1
To: Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155309848856.20095.17946675922821809396@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Wed, 20 Mar 2019 09:14:48 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_091450_192555_B9F898B0 
X-CRM114-Status: UNSURE (   5.30  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-03-19 13:03:34)
> Dear clock maintainers,
> 
> Below is a request to pull amlogic clock fixes for v5.1
> These changes fixes a couple of simple mistakes I did while adding video
> clocks to G12A, and a fix from Maxime fixing the Video Decoder clocks
> rate rounding.
> 

Thanks. Pulled into clk-fixes.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
