Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD5ACAC587
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Sep 2025 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze66HsANACYRQCH4MO3VGCfc5sngX21uOj7U6miGjcc=; b=Z6zqRJ0Y7tl841
	NTCA5yydsndfN1G6DrQFJOuTaPHYjUdmn67iwzlfEtSm6wy6d2jI5NVQSq68dwVfno3bD6uAghluf
	h2cYWevNKPcFUy6ddh8dceDewt3Inps+MzPvrl8KATwTj/q+ITQUamB2PkUziZ6qPST6FgkQGJ1B3
	rpE7ocNJkl3hhiZasjfhGM+V4Lq6gkl+ZQX12X6wm/vjgezwTJ0P4pkeeGJgrpGG7PoqnnhsSVLxM
	rQdHj6r8Bwh5LqelYFMh3h2f7xf57nOqdYXTIDtFGwFx0s0dCRkHCpI3DCHlfLowJ2N2UXTwJ9T5s
	8XChm1vftUOoZEGftATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsK2-00000006FAu-2y22;
	Fri, 12 Sep 2025 01:11:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsK1-00000006F9N-1o4C
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Sep 2025 01:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D716F60234;
	Fri, 12 Sep 2025 01:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873F6C4CEF1;
	Fri, 12 Sep 2025 01:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757639488;
	bh=ztRk4wm82f1OoWN0gxCnU/O9HPW2W6wBaaArWkzZyEQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sBmc2bmOcN/lbu02VIXdF212EPX7LQ/9ELqoFHlcq4JIiD9ZvNGNNFQ/VAv3VLQtP
	 0LjGgd8bGNS6kGn5i49YcNa5kcH/biFGUfOCKPZTtcUErRNkB7obgBWnHmATIKYGS8
	 YXeoWsFCd1zg+ZYZke4QgTCAhfdsoH6MmtA2tG+suUkoIm0KOZlVnSS9oM4CE0y1Ir
	 Zb96dZBZ5H9HR5TFtx9ehgt2/zbHkvjYo1M05GI6KlEg0BewOqozLVpLzc1yHJDyos
	 BdrEIH+vDi7bo51OUWdJPUooT+E2GcjlisdnZC95uZaVwQgOsaLsVYxz7PxN7Ibjom
	 d7t62W7sc21vw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250909-spifc-v5-0-962bc147d17f@amlogic.com>
References: <20250909-spifc-v5-0-962bc147d17f@amlogic.com>
Subject: Re: [PATCH v5 0/3] support for Amlogic SPI Flash Controller IP
Message-Id: <175763948630.238908.13896906927374897926.b4-ty@kernel.org>
Date: Fri, 12 Sep 2025 02:11:26 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-56183
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

On Tue, 09 Sep 2025 13:13:24 +0800, Xianwei Zhao wrote:
> This Flash Controller is derived by adding an SPI path to the original
> raw NAND controller. This controller supports two modes: raw mode and
> SPI mode. The raw mode has already been implemented in the community
> (drivers/mtd/nand/raw/meson_nand.c).
> This submission supports the SPI mode.
> 
> Add the drivers and bindings corresponding to the SPI Flash Controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: add Amlogic A113L2 SFC
      commit: 0467d6c99d1c64210ee8c9621cd63b12301cab2e
[2/3] spi: amlogic: add driver for Amlogic SPI Flash Controller
      commit: 4670db6f32e9379f5ab6c9bb2a6787cd9b9230a9
[3/3] MAINTAINERS: Add an entry for Amlogic spifc driver
      commit: 6a129b2ca5c533aec89fbeb58470811cc4102642

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
