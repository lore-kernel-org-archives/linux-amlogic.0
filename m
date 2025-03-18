Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C2CC282EC
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Mar 2025 22:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1DyRo3tuzt8iM6bZod2PLONRE52P5arL+rBzBEOLaA=; b=5AkvjRgN7xPCtA
	rUav4EXS+OZvUVCA8Q/Jcz63EmCSlCKXIF2ivZVJAkSm5JdDHYLiKgLMtsgm37L2U8bxH+Q3MeSTh
	VCH3cAgiERXYpnTxUZ0GAtsev/A96cRKk4g7Uc9SABk7w8lGZ5UCOD9txIUGG4Vlbx5eL0AT9v9jz
	ylYcnNccUAYw8uxwsVNLoTFIG3E1h7feZZ7hQc5yqL3ZjRtvhUW/G6dPKWBJ55eDbipE5Tqsczw9V
	JOwlV88NTlRU1bK3EzCB4Ku/Pd6Lx6DYcxGZ4JO/VSlf3RAdGidz7BpfFeV/fivgmqnbs/sUyf74O
	j1COPydF+pA6z7HOvQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufWU-00000007GVD-2eFA;
	Tue, 18 Mar 2025 22:34:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufSO-00000007G9E-1b8r
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Mar 2025 22:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A8823615A9;
	Tue, 18 Mar 2025 22:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFE7C4CEDD;
	Tue, 18 Mar 2025 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742337043;
	bh=m872xVM1kixyrUBbMrPU1JscAYon4mXziGcAgMf+V/8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sYgfUGQ4gf/ee4qnfUhP5/KoFqNFpezOyqIxh594fyD3atAXcik/VpdJ1sRWAN8ux
	 zzdehlzPATZLnyYUmZn8xfg21K0eB/isZ5nLzfqXTz7A45v+TiEK5yrUGnBI6ru+RS
	 zX5BNmWyNSexKLWsHyAf0H1hqWe+3kCrWl3OryCe6cujQ/o6GjWhO9jC6PoGCG4SQ0
	 dSwsfYYdEKp2e4U95YdUoaqg3w9DixPS7C3xq6RZ8J3JDX1mYYKxZdPdb2kJAoRVl9
	 xZuJD5J2sKCgDgxIo7EB3ZqWNuot87wVYB6EJhahjiu5vueP+8B3ekRE4dkXed/ClN
	 ghY/DP6MbWHtA==
Message-ID: <12307eaac58f0dc901510b62667938d3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
References: <1jr02z39mo.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL]: clk: meson: amlogic clock updates for v6.15
From: Stephen Boyd <sboyd@kernel.org>
Cc: 'Neil Armstrong' <neil.armstrong@linaro.org>, 'Kevin Hilman' <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Mar 2025 15:30:40 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Jerome Brunet (2025-03-14 08:38:39)
> 
> Hi Stephen,
> 
> Here are the Amlogic clock changes for v6.15.
> Nothing out of ordinary this time around, just a few fixups.
> 
> Please pull.
> Cheers
> 
> Jerome
> 
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.15-1
> 
> for you to fetch changes up to b3c221e752c4e46fd86d6e15153fa8c38bc3f250:
> 
>   clk: amlogic: a1: fix a typo (2025-03-14 16:20:23 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
