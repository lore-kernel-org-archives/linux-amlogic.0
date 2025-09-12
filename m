Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207B9CAC58E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Sep 2025 01:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ9ZwDKh9JXK6zntqFMKtn2h5Cljn7zVgbKBM+4rVMA=; b=x6XHyZad6p40G9
	MahN82qQyTlOV2DOvJH01OV7zX7fzFkwRJ96kZo0slFHTNkYf671B+A6xHzRvrd0dHsuEHUNr6GCn
	+CPx31KcSycurPEBeh2kZJoU8zwwazS8dMYoO8batC8kGsBhoYNfTp1iCTiKEUpqTOe8ueBk+Molz
	W2HoUbyt0GZi2Pu3rV2SHmpyeKCjytzLeDXRXSJehlF7TSJNFMOSWjJb2H/ZeTzcxLHdjX/udyj0Y
	P1w3cnfG/9mnDBCjmcgBr+V8IT/A0xvd+iEclmZBlRcezEKvxP/JjhCaQrP/OfKocpxrGYm2AtuE4
	3kW+3U2VsoTjWPnQcKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsK0-00000006F8u-1pNo;
	Fri, 12 Sep 2025 01:11:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwsJz-00000006F8F-0YJl
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Sep 2025 01:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F015601AF;
	Fri, 12 Sep 2025 01:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF4AC4CEF0;
	Fri, 12 Sep 2025 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757639486;
	bh=BCQ6ooMUqjJ44vEm08o6flrbCyjr9CZj34vyNm7zsJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PsKmCw3c6dLI9HzTstQVy1COehG5HkNSo06sr+cOYMAvIH2/z+vxujB30kkBAdsxh
	 FJ9GzYib6C7RsWJrdqqs4RmB73XKJoi30rzPy2DGLJcY2lBtswMPlHLCJbYRk65Mya
	 0TroozGbiy3o3Jxkfjn++XOhUNqjelz51XMHn8DRjF1NGCeyD0lWDjg8yo44ojKQQs
	 tVD7yZd8n54vU3fOSs7Eo5pgpQyHx1f5GKK3NRRr8rMg1hIIFSFGvEGsWhBR3mVo69
	 qZjDzQJ1TrX9sIsTVcdHI4YmOWBuQMSkr+425c4zVLHRoxBzV3WCpste8SkVvM3tCE
	 dPJw/0vlJcMfA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
References: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
Subject: Re: [PATCH v4 0/3] support for Amlogic SPI Flash Controller IP
Message-Id: <175763948411.238908.9952245869421618986.b4-ty@kernel.org>
Date: Fri, 12 Sep 2025 02:11:24 +0100
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

On Fri, 29 Aug 2025 13:16:12 +0800, Xianwei Zhao wrote:
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
