Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F3FCA179
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2026 19:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1M+cquaIflKKqA8BzwKk7pVJLgAPXXtpAtSJFinOjsQ=; b=ko4bELfPrD8Z0p
	c3Rm9+kjoyOhCOpET6z/tb/A0xHOdWxy6tkgn5nWe/CVoWYm6lXofBWqghrktW7WJXVp9wxr6PjX+
	8ODVlFxNgmYEJDe33xypFlVLIXWPADrmZTSLTuWxPZx3jR53bR/lexu6Iym4t/w3Nys5a3rfbrFQu
	0e6PVaK3DUZm6P9dT9VgeD4Xjg8wYexMJgNRO5i2hCPSxp1YnHQdlg/ylwRy3KJHZmCkAf9Ecb+/k
	mtz/tdMNdoUwOCCGuQiWL3h9gcvuKs6I6DEJpxVXYKFEFomJ3vmGIFIUT3T3djtRC/A0BoKeulrAz
	S5k72pj6NO66cFo6BtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfwJ-00000007xRb-11dp;
	Mon, 09 Mar 2026 19:06:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfwI-00000007xRP-1zMJ
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Mar 2026 19:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8336E600AE;
	Mon,  9 Mar 2026 19:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30BCC2BC87;
	Mon,  9 Mar 2026 19:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773083209;
	bh=9d5O6O+Ep5zzd/o1g6XAtTHKMqeRROriSSYMY8Crhmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ndsDJaEUzC2AnODnw1sj2u2kFmiZdE6bTzyA8bs3Cx3MmnbcnhdupJalotXFQBLSz
	 gHNlFeYwXQhD2YBgG4s1vwmHrheIGvF49ORqEC/0GysQO/Io0wgYDDWZqf7IEFT7Gr
	 EZQdvsF4yCy8ErQUBY7aFTJsvY2bHPYNgEpc7U1IbxAoS8tXFmmAR5EF1uQOGVP36c
	 VrdCPJ8Pn7/cFYcBwpQQzv2j/xxybduYhfJYeYbf3T13+6vefVvfvcwXLpYIj1bJ20
	 Cm6zhIAzGm9eFZ9UnyxRhz8vF+xKJQYYkHVxNjPvIaXWgXPgwXvJLBkX5R2ZThY1do
	 vyBfp5jRZ3hjA==
From: Mark Brown <broonie@kernel.org>
To: Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260306-spifc-a4-v1-1-f22c9965f64a@gmail.com>
References: <20260306-spifc-a4-v1-1-f22c9965f64a@gmail.com>
Subject: Re: [PATCH] spi: amlogic: spifc-a4: Fix DMA mapping error handling
Message-Id: <177308320766.255456.17100678441910106235.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 19:06:47 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-83dbb
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

On Fri, 06 Mar 2026 01:24:32 +0800, Felix Gu wrote:
> Fix three bugs in aml_sfc_dma_buffer_setup() error paths:
> 1. Unnecessary goto: When the first DMA mapping (sfc->daddr) fails,
>    nothing needs cleanup. Use direct return instead of goto.
> 2. Double-unmap bug: When info DMA mapping failed, the code would
>    unmap sfc->daddr inline, then fall through to out_map_data which
>    would unmap it again, causing a double-unmap.
> 3. Wrong unmap size: The out_map_info label used datalen instead of
>    infolen when unmapping sfc->iaddr, which could lead to incorrect
>    DMA sync behavior.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic: spifc-a4: Fix DMA mapping error handling
      commit: b20b437666e1cb26a7c499d1664e8f2a0ac67000

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
