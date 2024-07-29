Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5F4C3DA61
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5EfQvn+cPcFbxbN52W3I/0kbk3Bp+Lrakudlt/5rhs=; b=v3kQcX5ubj/l5D
	BQXqLaHtMeOHXNb/ai4FDYpKLQGUCzKXRQcGFKH+Q0irV4kUoXbHNFnQ0d5x6cmaAcEfMdeHs+dlH
	W1oD53Ur4R8HEVoYemGClaehCClw4IS9qVIVCFLcvuWPQWm80zrMpXK1NzDIfEyHvCvmyzA0PA75J
	2aFtBiYOGAiF+r9WSi0VLtsR6PE9FWiMjQBVdNnTRrJaIv1MQpPd3Kua/+wMqQ8ZJd04JhYXSd2MG
	UvnOxUSbM/JXbkW3Rnb0lWH1rCE4DOqJSLXpzEO+wmXUaw9CI39bbr9114FyCX7BfU2QCvFsFE0Cc
	6iUp6B2OCqZUs6BXJFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSUl-0000000BtlA-1VFS;
	Mon, 29 Jul 2024 15:41:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSTl-0000000Btan-0XW1;
	Mon, 29 Jul 2024 15:40:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E0EA61A70;
	Mon, 29 Jul 2024 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D483BC32786;
	Mon, 29 Jul 2024 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722267604;
	bh=wKdj3CdUMZhq1FC2Rcs2NuHX4NE/37Pw0kuRGmZ5Acw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dZ0MMTImS5D2SilE9nR8Y+aTcLd6ndmPnVpA24sgTvKpN1bXkrKTjAUrDspUlBNKS
	 3csDMyVO/0589HMRccSu/UVf6GEGUEMwkgualwy7MhsqCeBFy8jxD2IcgnRoFV4X/L
	 1bRDW5vMCUZd0fRyiGgvI1L22ER8dP6cskRRmVm6BHj6xPAiq8DvsOqBRKovyjD09g
	 Fl15lgRCiOh2DaKGyn4XOipbQWzKsj3IGOIHsq7O+SpsMbKkCwDgQzgDTyNljeCnhr
	 oBrFjrcxFh6+iZUVJugr+UWQ4nSFK6FkBXcr+51RfPhgvXcT5rlSIpoH9kxZen5ziu
	 x16pheBIZwrgQ==
From: Mark Brown <broonie@kernel.org>
To: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, yixun.lan@amlogic.com, 
 sunny.luo@amlogic.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240716091151.1434450-1-nichen@iscas.ac.cn>
References: <20240716091151.1434450-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] spi: meson-spicc: convert comma to semicolon
Message-Id: <172226760159.71144.8527591939775545472.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 16:40:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_084005_250852_639114DD 
X-CRM114-Status: UNSURE (   8.42  )
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

On Tue, 16 Jul 2024 17:11:51 +0800, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: convert comma to semicolon
      commit: dc58d15ae7f247f642ea4751a276914eefa31865

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
