Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E836FC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbPWz7KUX3O5WkOzdSK6NuK8MEfq3k3fKmxEg2nyIQw=; b=B7tYpUIo9GSxjX
	RM7cUy9nnSfEAH+3X3RhrinpLuvzwetGjWMs/6T7kP5ovqwmeneqpYasedq+ALKmMOTfhhHA6biQO
	PTh+p5dOvYfLX6BvYDhySyU7AmAoNlDM4B1BFGAmG+SNkiiG8FrwE2yuWDKQovemm1PGa0qCGnN2F
	9yePHIdoy60Iq+FrflJ+Wm80avh5jOHDzc268dlBYBnhVoxO25LoruLNH+9/UBdMGpR1Ui0stSyFV
	9+ZZZGDuWQPxB2tMbUoLlK6M9bO7XtOVnpTCBEZZJFhi+Cd6ZutNdVIHW0c1I3mJXUuDWjIaXEfSo
	ufsrzT4B+cO/JtdERtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhcJs-00El5i-R2; Thu, 21 Apr 2022 19:18:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhcJp-00El4k-RW; Thu, 21 Apr 2022 19:18:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B03B823F3;
 Thu, 21 Apr 2022 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAAEC385A7;
 Thu, 21 Apr 2022 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650568698;
 bh=HOdy8VUWf3kV6Iqxji46w9RRT+an7kD/+0PjvVrebC4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jgiChYOtfVG+bjOC1HbHAqw8uFBBlouq3zey0JPnHtMBGX77EGYggPfBdRx4ye+wB
 zAqaZI7cmPrEdaX1d9gwMM5oEk4K4vCTWHOJLj4SjyaitBPMuUNJ5XigQ08cYmzrD+
 WgWVFOsSUzGEv1UTqitLwEvy+8qQ4Akog/+lvRV1gDwpmX6ixAvbZ6Gk+O14CCqS/8
 4MfP/DoDYqLE3rCEZyDSN2+iNhfO7T7H6zeErp5WDY+yjDMEZIS+L6X0Z78Md1TJIJ
 97GJgz7YtYk5/Au9gt/dDybGqrD2OFQ2gxzyZULJg8ut4ZYkidolE/CnjN3Fn71pJl
 Ye2oJZmiR8+Mg==
From: Mark Brown <broonie@kernel.org>
To: narmstrong@baylibre.com, jbrunet@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 dimitrysh@google.com
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-Id: <165056869649.409171.13055364117592401974.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 20:18:16 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_121822_078449_4155C813 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, 21 Apr 2022 17:57:24 +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:
>  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] Revert "ASoC: meson: axg-tdm-interface: manage formatters in trigger"
      commit: c26830b6c5c534d273ce007eb33d5a2d2ad4e969
[2/2] Revert "ASoC: meson: axg-card: make links nonatomic"
      commit: 0c9b152c72e53016e96593bdbb8cffe2176694b9

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
