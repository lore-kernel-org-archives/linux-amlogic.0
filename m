Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9385CA0EC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 23:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEtM+0QS1kbN/cFeyGEqSkoQjUF2cWueXIrelDPFhn0=; b=K7Zc3KtbteR1zD
	cd55C85skhfDoyuVbjYXlQBWBrozAwqIgmIxs0mcNXwCpbND9I7f8JiOpVvsnwjdlaJdJ9EAYqdr3
	6kFo1auA1tQvspXDg5gEL4n+HWZ0sCps4PqkdXnfuFiOwlTcSAnsJcWg7wvBX8bA9FdbVhj5sB+An
	fvtYiGkDt4kivyvzlnRiHzrWnvIwwpUpgRXeAj6yF9EfMiIugMI5u865vbVvYMEt1vS3Z6VDXv6cA
	9So19eDb105ao0k9QDyJ3g0U5Y4NUC2ujKjk+sW0Wn7ePZEEt9GId65RVq1G/PZz77Cw4VTev6uWT
	a2N2nK6ruRgcd5hs3JTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqn0-001dr2-1j;
	Mon, 11 Sep 2023 23:57:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfqmy-001dqD-04
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 23:57:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id C1F1ACE19B0;
	Mon, 11 Sep 2023 23:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F3FC3277C;
	Mon, 11 Sep 2023 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476670;
	bh=9OtbIZUFBDxgyKkdw+GLmc+PCE/ZFLEZDyNbZabaVqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vMKpS6+Pu8B/ZHOewr5w0gXcJNEhTABbIJE36iU/vzxR70DAj8UEZEIyiLzFXfMMa
	 uXy6G/31UvvxAB/XaimBtjUbH/FO07qD8KUOwBsO2V9fzqA/7J/fMD0z9OEJjPoqFN
	 Ql8bSzf45eVy6ptY+N6Ynr96CPWFFA60aP4xu2THa24ZAdevpYXdZiwcW4V+BKeTTA
	 /1Mgs2zO2oMB5C/Aj0pQqz2/mkwwGdy87WQFOUia/GeqRH+A6JJH8N9VhebU+jyV0I
	 RHqgWCIZ8k9MAGvolokKzzmQvEv4Gqywq7T0sYHGZDopn9pCyIRp4vYWdEk+eMv3IQ
	 uwODw1UhMeQFg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230907090910.13546-1-jbrunet@baylibre.com>
References: <20230907090910.13546-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg: extend TDM maximum sample rate to
 384kHz
Message-Id: <169447666857.2387538.11157727345218045709.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:48 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_165756_231506_27E893E5 
X-CRM114-Status: GOOD (  10.73  )
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

On Thu, 07 Sep 2023 11:09:10 +0200, Jerome Brunet wrote:
> The TDM HW on the axg SoC families and derivatives actually supports
> 384kHz sampling rate.
> 
> Update the fifo and tdm interface constraints accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg: extend TDM maximum sample rate to 384kHz
      commit: 43f2d432e47ebf2d7518fdef50d7cc70da376b0e

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
