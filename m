Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3CBF53D82
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 17:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKGAwM263YCgnWhAxwgY9HBxoXipHaws69hcu+4+XFU=; b=w7iMzZPYDtdJtx
	iaVB3+gB/c+q/L/AVLcoNqbrYfX3BKMZPNNfr7UqqeGVVx7QboeA1uzfQJtXK9WdKGs3yfLAW5Pzb
	Gun/iK/w/vIf7linJkiZNOggjE1A6N8TRwkHSX93cEjF8zERxdtdRkwqQnOuQ4Bo7G16M/8pjTGXJ
	vqu6rl9HEkDZLSIlg8RfqOpcHf8gc2Sf6jks5fQfpDpcsNpfo899JB3bNo6HJITuA+VWxJULYPlul
	/kb3eBrOz9F5/sofHK74nGuhsh7clyJN0hNbFceJXnei1jOa89p1wuyFCtxxeVBKdohK3zeCYV4H7
	yrvFDA8rGnSU+AG/28zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7d-00000004cND-0kZn;
	Mon, 16 Mar 2026 17:52:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7b-00000004cMP-1iqG
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 17:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EE1294424E;
	Mon, 16 Mar 2026 17:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCE4C19421;
	Mon, 16 Mar 2026 17:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683574;
	bh=RMMdwUBKrsM2fcZYyAiOm2zP3QvMKJ2MU0w5P34paeM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MGE836MAujJMtajPP1K5ZufO3peej0xs9cP9x4ui+8IU7IiI7nVnVcw8gAKS0w/IU
	 XlSXngYbVwvCGq9Wrs37k7x96nheMn1D/+jdYx60BRrb46QT7aRUVQa8GeuPCHz5l5
	 He/t6t2hDnoNWEoNjGDaSzBt9T1cdTVwQLcJ8eL95d2YUBYfwFO7ST+L44NofucdY1
	 gei1KIRbs5ls9WnQk5rAKZ85tBuF/4oF6LApFNemKanQnDszs8ENz57/5A04Lo+GZc
	 g6WHBLcHjjfefk5U1IDJqzhTUGcdBMpbJqFlSBmsPZeABLEjeWNxtE5BTgiuzAlhFd
	 DeSMdLS0Vleog==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spisg-1-v1-1-4e209faf228d@gmail.com>
References: <20260308-spisg-1-v1-1-4e209faf228d@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: Use IS_ERR() instead of
 IS_ERR_OR_NULL()
Message-Id: <177368357343.147197.2388005468869139656.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:53 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c239c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_105255_476162_85761DA9 
X-CRM114-Status: UNSURE (   8.05  )
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

On Sun, 08 Mar 2026 14:59:50 +0800, Felix Gu wrote:
> devm_clk_get_enabled() and devm_clk_hw_get_clk() return error pointers
> on failure and never return NULL. So IS_ERR_OR_NULL() is unnecessary,
> replace them with IS_ERR().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic-spisg: Use IS_ERR() instead of IS_ERR_OR_NULL()
      https://git.kernel.org/broonie/misc/c/8abf84f76a54

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
