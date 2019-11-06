Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBDBC5DF63
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394C92178F
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzgT7NI/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbxLaUUa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394C92178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0lkOCzmWiSh07WXIYsFt+DyE1z6BPZ0+6t+R+ec+Yk=; b=VzgT7NI/nxskZ3
	IcLoa+QLz4H+RJwXihtepJfrkBWvwKi24PO7CXPOqiGIk+Ey/NdlEMu4IK4Q9c/+Roe+12m2GyJEq
	iy5gcd9ndP6dYK8NKYf3MvZhU0V3WwBliVB5oFf4ZYf8jiypAjqG8VJ2voJzBE5kwJ/q1uCuoJd/b
	eNXebl67+KLR3COA1IO0qjku/1hMRyAFVKDqOn1b3J5bllpxzVz6WOiZTupFrP57Kwq4sXoggAIOy
	GwYgAyH3kKaEYuzFjkgIiaSImK6wzRg6XUlZCHrb7D2CibggC9Z9rBe0yLeKeuZNQ239hQjdc6Bpj
	yvUM0iDVgwBYvcaEgggQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSQym-00064Z-0A; Wed, 06 Nov 2019 19:28:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSQyj-00063y-9N
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 19:28:30 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF0CA2178F;
 Wed,  6 Nov 2019 19:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573068508;
 bh=NF2bSZxZIsTQZx9/i88LUBuo8zO0EdADUFOoow/kws4=;
 h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
 b=kbxLaUUatCArIb0K+nXFiQ9rfamRxJ0ettvHBIfnXJZ0DjOiNSyKkk2Oj01vBVVAz
 z9TZwzWiM3+GvNVqS2g8ubEMsGJpzIDvQ0FM5ia1ks/3p3N8Vn0hVa6bwmLi2LN0at
 V+1fKC3VsIgztUXWX8+vqBGymUTQcpuV5ZVRP50c=
MIME-Version: 1.0
In-Reply-To: <1jftjbljwn.fsf@starbuckisacylon.baylibre.com>
References: <1jftjbljwn.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: Amlogic clock updates for v5.5
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
User-Agent: alot/0.8.1
Date: Wed, 06 Nov 2019 11:28:27 -0800
Message-Id: <20191106192827.EF0CA2178F@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_112829_349770_06E13BF1 
X-CRM114-Status: UNSURE (   8.87  )
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

Quoting Jerome Brunet (2019-10-29 07:13:12)
> 
> Hi Stephen,
> 
> Here are our updates for Amlogic clock for this cycle.
> The main topic is sm1 soc family support in the audio
> clock controller
> Please pull.
> 
> Thanks
> Jerome
> 
> The following changes since commit 90b171f6035688236a3f09117a683020be45603a:
> 
>   clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu clock muxes (2019-10-01 14:51:15 +0200)
> 
> are available in the Git repository at:
> 
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.5-1
> 
> for you to fetch changes up to 50bf025b75902d326fdb8078be3d278e1b693576:
> 
>   clk: meson: axg-audio: use devm_platform_ioremap_resource() to simplify code (2019-10-14 17:06:27 +0200)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
