Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B08BC169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:06:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BB8521848
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvA+Ifk8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv+77EZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BB8521848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Message-ID:In-Reply-To:From:
	References:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsBsMdQ8NcvolRSmUzApYWrmZup1yGRdzsTXK4XiwSw=; b=UvA+Ifk89oTj+d
	lT7jyFbBWLt9mIIPxJUCEkA1sUyU+m4xO+gYFlmUbrjFRBbfTkyFkofNxSYx+es2z4sc65TYHnkFv
	2rUEVOYIdQ172nj1IsbGhFnd7S3f4O7Z1X8i1AboQywkzBgXWyzqVBfJjhan9xR2fVZG/yy5xUwrF
	kcJWQVli4GgsTQuF+XUwjMLtsOgjWrmHUyyTjEGUyf42qKFN6gJHXG+LZm+D9GMpkihlIC7kQ/+rg
	cVFPxRMxvo1tFBSigXvtHXPn5qwrSv5adatyxy/9ntFiJ5MwtFKGPhkNC0vo/hOATahRO+BeEe3WM
	QeqFpH87aObp9UfUvNHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goXmK-00044G-PG; Tue, 29 Jan 2019 18:06:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goXmD-0003w7-BP; Tue, 29 Jan 2019 18:06:28 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD0C321848;
 Tue, 29 Jan 2019 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548785184;
 bh=2yqifEVp8p/wtqQsMimWWQxMoGswE/SnJ85PKW8+Qg8=;
 h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
 b=Wv+77EZBWgnRs+dCp+kFzQltA76x7F57C0Fe3eAAeCT+Ewiua1B82FToFR5gYzVzC
 8tOc6dHSDj/eC6uvAmeh4+49k+i6iePBUEhPhkcjsIEgUkL+maXYWbITtV4nZwx//G
 +rHa1BDwzsf7Jj37/non2zRAV130q0QD+HHDxC6w=
MIME-Version: 1.0
Subject: Re: [PATCH 05/14] clk: meson: move parm out of clkc
References: <20190128180430.28689-1-jbrunet@baylibre.com>
 <20190128180430.28689-6-jbrunet@baylibre.com>
User-Agent: alot/0.8
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190128180430.28689-6-jbrunet@baylibre.com>
Message-ID: <154878518398.136743.15771636170808285043@swboyd.mtv.corp.google.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 29 Jan 2019 10:06:23 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_100625_954378_A3CEC821 
X-CRM114-Status: UNSURE (   4.44  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-01-28 10:04:21)
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Why?


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
