Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0166FC5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B622242E
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEUBpfkq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7B8L37k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B622242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IsZIhfFsq5d7DWoXKFK5Xtrdo42gcJD5odMk26vv6aw=; b=IEUBpfkqGpXXhctFuHCwrX+Cb
	rF+FXOCCZrer9eNoisUgpNbcBrqlOXhGwJj8Vsc2hqAqkw54ETWt9SmLqz3bBv8WnDi6NY3HbyL49
	9kH3i3J6l6BbZ/htKocBXejcLgl3veGz5hRo6MhF5yWXck/ZnYAnvlyrkDO1t5uuzQ53U49Ga3r5j
	pGd7Ly/zV3MWKTDWzqhPxBFbb4Ypk16ASSCcRgkLuCYBHahQ9ehP3HDQZW7axU+wUJG60TESxL0ou
	OZ7z3gaJ1L6RwZMEUQiDFxLk3a9s24+dncKCSVIYNY5B5w5fBeHSTTeHml28tFoMGGWOA9f32db62
	qZ+MN+mGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2dO-0000Jw-Dw; Sat, 14 Nov 2020 20:58:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2dL-0000J0-RX
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 20:58:56 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11A632242E;
 Sat, 14 Nov 2020 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387535;
 bh=Y51KJWly+cXvpdfsPzX2sOULAb0WXaebfYYmoq5wEOA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=j7B8L37k1Hx9ysm2Mqzh+LVzR4vYo6t1U6QXfo55+xSCyxbtxzyu75YYloVFZSD70
 YTKWDlVE+wksQ8ecDl9NVNs56irYwwpaYfeJ2R3uYUTzGFYMAdcqLUCl6szaoPUf+I
 Eo0WmSTFGiLmriNuAeOFcwa+GmuNw9bfcfD2vObI=
MIME-Version: 1.0
In-Reply-To: <20201021163847.595189-2-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
 <20201021163847.595189-2-jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] clk: add devm variant of clk_notifier_register
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Sat, 14 Nov 2020 12:58:53 -0800
Message-ID: <160538753380.60232.3216881025872069497@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_155855_966196_7FE4AC4C 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
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
Cc: Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:38:46)
> Add a memory managed variant of clk_notifier_register() to make life easier
> on clock consumers using notifiers
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
