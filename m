Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BECC4363C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 21:04:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76678207BC
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 21:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EyKNfp2p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPuYeoyM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76678207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8cNEhQnJacYlg4II35ri5kxxGgJ9f0uWPozpfBDYiH4=; b=EyKNfp2pISpk9B/nhKQ1VdX/h
	1G1JMQQ4x+02fvyUpcTlMrddb74kExGQztYmrD4qxC5Hhag082bBvhrWDzk8XFsIGb+o8kz1ZHF58
	prmi56xFNFtCekHtf8xVlaqwtW69uJdsKfIYhKNIQi3Kbii0ByUT8tmC+qEAolZss69vxcWrJvmUm
	QEDMKrHVILZxCA5mdYMFaeFmF/B94taOI6Hf64jID+RhgDa6MvOqS+CTNGZ6wmvur6TAe3GMLguvS
	iX+GVNKmoQbx8PLzDqgbeoAlKlHUwTSYWZiNTB6jtIOIbFpZXdxQ1OY2OQUnGCYD9PjwOearpxmfE
	PrirISVww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKSyj-0003uM-55; Mon, 21 Sep 2020 21:04:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKSov-0007AQ-F0
 for linux-amlogic@lists.infradead.org; Mon, 21 Sep 2020 20:53:58 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C066623A1D;
 Mon, 21 Sep 2020 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600721634;
 bh=oVPiemudKAENmdJztZvZi1Nm9NdDx7SdlYswo3G3U1w=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IPuYeoyMCSEqMF4qIinMwsHowWTaapqYrasDcXmfWtKxwsUZ0LX+0ya5dMJbRPmzW
 LHU92400fJhHhyHfsK3u7ze7leGoRzZgf/mULLowCov/61IMdTt9OTCrEvKrGqbStX
 gbWOkjgUzdjRECv5j9BC2VM/ReykD4Hr782akHWk=
MIME-Version: 1.0
In-Reply-To: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
References: <1jd02ob7bf.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: updates for v5.10
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 21 Sep 2020 13:53:53 -0700
Message-ID: <160072163362.4188128.18302366911770748384@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_165357_610549_08235DE5 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-09-14 10:24:04)
> Hi Stephen,
> 
> Here are the Amlogic clock changes for v5.10
> Please pull.
> 
> Cheers
> Jerome
> 
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:
> 
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.10-1
> 
> for you to fetch changes up to 7b5c5720a3689c2c16968ee276b7c47edb64ce0f:
> 
>   clk: meson: make shipped controller configurable (2020-09-10 11:47:33 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
