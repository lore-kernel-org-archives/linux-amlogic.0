Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0740C52D73
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 21:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1zaYlShZ7iw5cQUJ3yB0Ml6RNrx4Q5nn38jsI8g7034=; b=Ey7idWkzXgZVmW
	O88undIwMVeGCyHvmWMlfIY3DXYpAt5TKTJ4tENZOFTOducxE24MBNuE2qjE6GhayS646dxYzJLyG
	9pD2NK5HjHLlPoUhCCl46zci2Hvctqk4TTTelOUMrKRsXNWgw0EmQee5B8TcwGfHjMzpTTQx/sy97
	sADOqp6GsM5FxC1qSZ3LDVWYBt4SYSM54DZhP94QORT62+wTaohWSFhURo0gXdM/dCgBucvLz3UJ+
	aeRL0COB0Nr8bd7anPsZHToMlbKS0wXYPyfbztYZxPuXOqYaSr7801WJXfRsMuQzLDwEfJlgNEkdf
	hX98Uu5KDqIHg9o+iLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scAyV-00000009YTn-3SbV;
	Thu, 08 Aug 2024 21:47:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scAyS-00000009YTE-010s
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 21:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0436B60659;
	Thu,  8 Aug 2024 21:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB115C4AF12;
	Thu,  8 Aug 2024 21:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153626;
	bh=U55zr8nmJOAbnMqspv1F23aPrgO2gDK8goya8/ZMJb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KGm1kxPNo9FWiD+NdC9BHLIxg3omvTRrbd5okPmbZyrqZKpxgtKS9DuFOjKkus7sq
	 eTCmr5Vd2pdquUsV6/N+BZwDd01ac3jp9fXy3xf7WKVn52y25Algdz58SH/qSG6w9W
	 Mn/OGN86xhD3laejbCwPjG2B5K/x9v+EkDGYVG3NSoRl7M6PuGOJpbWlySLF3nHWzr
	 ndxbEoMDRKf7Ppr34bhxznfcV23yr8ToT0FVPiKQqNBnmlocoTI6VialKiyBVtG0xW
	 OAP8B5QzrBLMgDI+t6dnYJuaBIjfUA5VXqvvMbppBuibK2dwxWOvUOGurPJV1X9ELB
	 mWYWszTXEDGPA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20240807162705.4024136-1-jbrunet@baylibre.com>
References: <20240807162705.4024136-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue
 with PREEMPT_RT
Message-Id: <172315362437.480667.7263502304351371986.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:47:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_144708_350076_054F9C89 
X-CRM114-Status: GOOD (  11.60  )
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

On Wed, 07 Aug 2024 18:27:03 +0200, Jerome Brunet wrote:
> With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.
> 
> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
> handler won't be force-threaded and runs always in hardirq context. This is
> a problem because spinlock_t requires a preemptible context on PREEMPT_RT.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
      commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

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
