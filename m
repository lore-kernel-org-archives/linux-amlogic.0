Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8FC624DE
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2026 21:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRN/pM8BkNVRcBI1eESnFvFQHZo90dF677YKb+L4V/s=; b=fjwn0qpvezrAC8
	R0LetfU4hCPomWt1pAOdoKrm9LRUXmnDhnPHtuRBBIFStRa28DkZTd4SJ8dqK5lhWZ9pmsQ97IpMg
	mzCUeGLBoPvUp3bQ1E1i9Iji/Gli5ito6vPUPc4K2xmZ3QcsnXyn0YxZFQawSj7c07fH0npiaGk7Q
	Syf88lv8FdCV7ZBak5Ij5qz/kH/ZgmCdTFmFx3RTIHaNoQ4cJLFeyq7qO9hCbDdxf1v3IWkK5jzlU
	HS8b7U8JW11eC4mHfG1w4eF0Y+1Pap//6MbjdL9vpN8OY93TtTBXbBVee3woePeUkCEdkEUZo8dG/
	jzIuVtRrn71MI2l0NxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bpq-00000003M43-40B7;
	Fri, 04 Sep 2026 21:52:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bpp-00000003M3v-2drv
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Sep 2026 21:52:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65F6C41E68;
	Fri,  4 Sep 2026 21:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FF21F00A3D;
	Fri,  4 Sep 2026 21:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788558753;
	bh=UVrkCuu11lO2jLxhwTb0RktChudHatDr/XIWbtQPRJ8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aPgS7bnzvgxMwfa68V5kdEfcEvrZLGd4hvfezzhdeGq8+bOy1jCL4sPYm9J/EbDYF
	 gkPn7q0PoBPXjqJV/OLTJLR4CgXgemuy9IKdOTvyPB63n4XSWlTThwOSE5s7+W+AO4
	 bIv+8zGiCh8U7evnLU/n/w/c65lp2vTXaojCltmSWmb2X9QtXw1fg+VycJm3gKxiUN
	 X1sa+GFQH2bCctfRLIdBVNAN6FIXAJI5hO12qx4FxiHCF0C26hofTDdKTJvgfNz/KQ
	 QCsMajHdfNWeYy/jhZFliinQJ9jYGry2L6MBC5fdTpfgZbaN8HCnib59/nm0FHAIRt
	 Klnr19gs2DHKg==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
References: <20260731-a9-spisg-v3-0-a15da3f70029@amlogic.com>
Subject: Re: [PATCH v3 0/4] spi: add support for Amlogic A9
Message-Id: <178854160331.632048.14728363088107524038.b4-ty@b4>
Date: Fri, 04 Sep 2026 18:06:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1649; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zjdkNkDUmonpYU0Jbjz+zmmE2qaeROdmXnVtOHiS4H0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmz2b7imfFO58cCzluHQ/CY6Goj/swmGs9TWX0
 nLpvYPkRyuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaps9mwAKCRAk1otyXVSH
 0NGaB/428q5frnEDu6OiYRheIcp0oUTfMczZRKqjcktVO1KRJV8tnPgfqRdLE+iRgJvus+Kj6KJ
 tBEAjeE0QCuEwIzvETLElAdP1QQx3LAs/bCH6zqbfpccDlzUaX3t0vwFB4qdK6ilZqA/KgSROaV
 toJ2SOywUOdqZ9Cq7yCjbIDK+FMafs7siTt24u0z9PMprkkN0EkOJxx0Eu3eGWHGGP+bxfkuwh0
 DnZ/jE66flHee/aa4OMiG4eA/K4ZkJ/log07zVQ1HHfjXPpfnhOP4F7TjqyXLsGv3XSp/oLkKXe
 zO7eI9WoP0mk/Ltl3lgZUNE0exWMa18B/RTx/9ciEePfMt3Y
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Fri, 31 Jul 2026 09:08:24 +0000, Xianwei Zhao wrote:
> spi: add support for Amlogic A9
> 
> Add bindings for A9 with some features, and driver for A9 base on A4.
> 
> Fix the incorrect keep_ss of the last descriptor.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.4

Thanks!

[1/4] spi: dt-bindings: amlogic: spisg: Document A9-specific properties
      https://git.kernel.org/broonie/spi/c/29359ee126bd
[2/4] spi: amlogic: spisg: Fix transfer size limit and timeout handling
      https://git.kernel.org/broonie/spi/c/754d2bbd92f5
[3/4] spi: amlogic: spisg: Fix the incorrect keep_ss of the last descriptor
      https://git.kernel.org/broonie/spi/c/253dfb1839c6
[4/4] spi: amlogic: spisg: Add support for A9 controller features
      https://git.kernel.org/broonie/spi/c/b552119acd63

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
