Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC4FC52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L26Cjjb6ggmNq/dOBSuVqCXUHRvZTgY5a2X3pSRKHoA=; b=HSU09A+r9YTmhV
	0X+9zHjO4rhIu2leHc6LeUec12rp/wm5kHyMLb0W7H4/2B/XCRnj7dOvtDEqirGkYVt1OQdZTR+Zk
	Q/rDlcpXfySGYyWgZe2dNSIOEDyo921Dh8NgbcjJewPyrpVR+UBhFz3FaiUs2tlHLClYKpPGo0WGU
	n2UJBwoVapB60SCefrT2RvY56iAK9g4Da5QOnzVcoFO5GtkxqHDh31ifvFZeVKk865k/SZPjEg63o
	rWerIBVzhvoUHS5j8Yn9qLBaA7R6l/Ayqhz6pt45TFInD/5TPaNsbtVVRLHksmsb1dVsaRsSzoQV1
	BXyFch0LSzxOpy1O8Amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdskz-000000043qy-1lyy;
	Tue, 13 Aug 2024 14:44:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdski-000000043lV-3nzN
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 14:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 036CACE1178;
	Tue, 13 Aug 2024 14:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A115C4AF09;
	Tue, 13 Aug 2024 14:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723560236;
	bh=l92DpSo2C7PT4PTRh0Gd47GHy1fmn3ge34So7cjSvLs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pi9lkKR2+k/XOgNlIpO67yV8X20vQLRSJgesFuzF1eZBB6a8kht3H7et4PE1BVved
	 7jPcqWPqrGfM4dWqmswmu/BBINl8rwhRQul1gNxdflQh8qmoNgxzAXI58hV2NNlEKM
	 LJ8lsaZqKvhNvchHaK7jsD1pjqKKRsFSZcV0Eh2uHSvr/4wt9kZecgoKtW7vVEqXMP
	 QLrhB2Exy8LSZTvka1KV5OHPKcJNjCenFMJM6eOCuKhR+u0H6j3N7NVP9GLK0iZCNI
	 CxvLy+bKrJoyawp3xcPFCFEQl8oKDKKI9g2nzC6nfZJtW1n/lW7/5wLKEcvbYzJcP9
	 YdNT17KMqijxA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
In-Reply-To: <20240806102707.3825703-1-jbrunet@baylibre.com>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-Id: <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 15:43:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_074401_414888_BA1B48E5 
X-CRM114-Status: GOOD (  11.34  )
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

On Tue, 06 Aug 2024 12:27:03 +0200, Jerome Brunet wrote:
> With PREEMPT_RT enabled, spinlocks become preemptible.
> This is usually not a problem with spinlocks used in IRQ context since
> IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
> of a threaded irq handler won't be threaded and this causes scheduling
> problems if spinlocks are used in the upper half, like with regmap when
> '.fast_io' is set.
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
