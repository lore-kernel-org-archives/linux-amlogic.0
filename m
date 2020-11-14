Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135E6C63697
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8173A22409
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zoLsx65O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hzz86fKa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8173A22409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qxygRZKiWwhpe+1oeQxWNfMbh0g5c4vaSyT0zdehc58=; b=zoLsx65OVZcj81nbKudFXhZMb
	QWqTXxEBMIw/UsmAZ1Y6S3HAGwaGN8ANZ2+n3cdQAxEUyMZYpLfJzr/KBzfMO87S/EoziERor2vvf
	3lM+xKztC8AgiUHNgX6v/0rkpM18DZp0Heg5eJy9YDdPYV9xOBpeCSbbQdNVIne3MAZDccuXhiF3X
	LMkCzYGf3lPDi3vYwivku5hd+IYH5TOR79+io8P4Pn4zbrGLr3z8/PrGVK3kFukKPgx8BTvzOafBt
	fUOKIor8QGH4DRRlwIgXXruZVvXWZspIJg0q2HJGyLNsrZwSQYlPC4rrE09OvOy4DsrEAotzbWSrD
	CwH9+A6+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2ZH-0008FW-IS; Sat, 14 Nov 2020 20:54:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2ZG-0008FB-1A
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 20:54:42 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D31022409;
 Sat, 14 Nov 2020 20:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387281;
 bh=AAWlZMqfOMFE0lUdVK1+7DgEtt8dUhPOyBL3cidS0JM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Hzz86fKa+mzDR3nLAnM1IIe2bjf05OqzPzOItt/RgTxaTFbsVvzaF01Z60gbpufE8
 Ti01F62ZPumBUz8Ir+giZtOhPuUFZOebZ9kX0hK45DOsyX6tIzzy/jlJ16cRPp5tZ0
 acaDY8C7Ih2SULdGtwwE/8ro7tP+8Y/0udqKd+cM=
MIME-Version: 1.0
In-Reply-To: <20201021162147.563655-3-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
 <20201021162147.563655-3-jbrunet@baylibre.com>
Subject: Re: [PATCH v2 2/3] clk: add api to get clk consumer from clk_hw
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Nov 2020 12:54:40 -0800
Message-ID: <160538728023.60232.13014253270340960379@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155442_147582_9ACA31C9 
X-CRM114-Status: GOOD (  10.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:21:46)
> clk_register() is deprecated. Using 'clk' member of struct clk_hw is
> discouraged. With this constraint, it is difficult for driver to
> register clocks using the clk_hw API and then use the clock with
> the consumer API
> 
> This adds a simple helper, clk_hw_get_clk(), to get a struct clk from
> a struct clk_hw. Like other clk_get() variant, each call to this helper
> must be balanced with a call to clk_put(). To make life easier on the
> consumers, a memory managed version is provided as well.
> 
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
