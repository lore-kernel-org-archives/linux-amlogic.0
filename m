Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4296C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kB/O6vPC5Y9NeJVHTHOq0tFlANd7moAVliToeEwUVOg=; b=WrPWk2ku0EnpY3
	W6oOW8yfMDlBKM2B/LanX82DmF1VTbpIK4WELKUSTWz4Ux+asyanaYeImxYbiieGAUgAuUKg7Q4zy
	uF+Wg8IQh20Z3YAohExAOjkiUtaExZJh3i0t8Z3M85ddZor1a2LR/7wKRXJjF1Mxer2ATnUS/ztaL
	ZbqLVyOiLzIK48vMcXM1y1Rak5lstG9PgVMUOF7evMScQwNpPlVkwshRPVIv5QGK/GpBTbirU1nLg
	0SAp8I3nU+NmdbG0vY8cAfCyda9ggmPLYGQLpNWjZSBMCOyD8HBdFvWGj4b2IhMDj/yAZcq4BD20W
	YcXkBr06DaF+7urSxWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwiD-009qDm-Bm; Thu, 26 Jan 2023 07:30:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKwiA-009qDJ-5x
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 07:30:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BA25616E8;
	Thu, 26 Jan 2023 07:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE86FC4339C;
	Thu, 26 Jan 2023 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674718216;
	bh=YnYWB3x55mMTUNnUE9DhqZgIZJ2l4QVcj3NAixK6vpo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=QdUQ0eHDiNIX8yz6rNLnfFLyf/PWhvIzDKh/a5xj9VAVuHjnnZ3HSaDRvzea9zE7I
	 UYhQseaLar/mhxMHkWd3tYFjSHUXPhTSFjiAFu6FZ40Ft96bJnNIzXbnW0HLKdA0iS
	 XvVoxT8PRMBZ02IuY49icQA/GBo1+mggMISsmm4vRJ9U35/mr5lQZR0uwrXXoUBM45
	 zrDAyMRGiAlUpDdCIxwyiDmTXXFq8sh7hOpw7A+OaBzLoVMm2SRBCxPV2A4zjhZ45t
	 iQAISa50G+187Ij9ym5Rfood24UzxspUOfID2HeGigzShkoFNGYz6Ym/Tk91rgRbtK
	 Zl28b93uUdniA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BF884F83ED3;
	Thu, 26 Jan 2023 07:30:16 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 net] net: mdio-mux-meson-g12a: force internal PHY off on
 mux switch
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167471821678.31738.7019222500176784682.git-patchwork-notify@kernel.org>
Date: Thu, 26 Jan 2023 07:30:16 +0000
References: <20230124101157.232234-1-jbrunet@baylibre.com>
In-Reply-To: <20230124101157.232234-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 hkallweit1@gmail.com, qi.duan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_233018_281722_D6BF0C84 
X-CRM114-Status: GOOD (  10.03  )
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

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Jan 2023 11:11:57 +0100 you wrote:
> Force the internal PHY off then on when switching to the internal path.
> This fixes problems where the PHY ID is not properly set.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Suggested-by: Qi Duan <qi.duan@amlogic.com>
> Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> [...]

Here is the summary with links:
  - [v2,net] net: mdio-mux-meson-g12a: force internal PHY off on mux switch
    https://git.kernel.org/netdev/net/c/7083df59abbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
