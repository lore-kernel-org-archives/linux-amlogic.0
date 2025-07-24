Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DD5C87FC5
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jul 2025 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIS6PMAvAqk+9jGyVssPZ6zhzS/tI6TJg6ieeacMKZM=; b=za/Rr6zQEoZp9M
	cFWgCHCh9PAtdVzUHZhiZiZ3dAnyggYX6UUAtGPINWHpMFH1I9zxGIye42QQC+4TLIBs++3JZog1M
	tfPpxaDe70FxEX2RJegejMH45+D6aCg6vMNWPc4WUjzg+ibC4KDhClPhnz7gMZOm0JYSSthIB6GA0
	zbRJzGDZH1KZPl8pAN54BaueLD10VCD7tMGhkEA8mm5ioEV8G7BQnLcAknS9WL+kIqMO78foqWn2n
	+5v0+JtylSkgFNR2GghIjX17+ZzpewELXiW3K2g/5mkJa7HcN1sjU1jywYZMTkg3Zei+xerKVJAg4
	5TRUg55xPA3zXRACtKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Nj-00000008Ter-0av9;
	Thu, 24 Jul 2025 21:21:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Ng-00000008TeR-3S0q
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Jul 2025 21:21:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 149D3A537C6;
	Thu, 24 Jul 2025 21:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2AFEC4CEED;
	Thu, 24 Jul 2025 21:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753392095;
	bh=zP2DdL1xyvFlCv0kqOkPf2j+8jsIWjQBQpmTzHlCJOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lWBIpQB+HvMkPLdKaaZhUjh/jHk9/ugOCKjA70G3i1pTlkvpOicBB0zMpD1sJSV9I
	 q4/gQJ7hFE3JvMdecit2W2oljAPHTJ7JNs7RAWxoNdCv/n5KjexhVzPd9uUNQ0kFKw
	 d/li68Cb44Ohg+7YharoiO1YeXA6Chw7xlNLCHuJbj5oZrCUk5be3H6v0SU+ue31s1
	 aTVkYURhgOYpH9VRFeki3CHlQ86CJKP6FH5vmylhCRAUBe+ecHQbSbXgjANkXW1TP2
	 L6QxGU6DiU/s2rsgoiul9alp7wfYaF0IJd/gf0ovcPaApFfhty0ZosOCEkQjHInmQt
	 9CuQlsrepLCxg==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250718-spisg-v5-0-b8f0f1eb93a2@amlogic.com>
References: <20250718-spisg-v5-0-b8f0f1eb93a2@amlogic.com>
Subject: Re: [PATCH v5 0/3] support for amlogic the new SPI IP
Message-Id: <175339209371.157729.12033130863447409564.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:21:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_142136_932725_1D97BA99 
X-CRM114-Status: GOOD (  11.98  )
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

On Fri, 18 Jul 2025 09:52:15 +0800, Xianwei Zhao wrote:
> Introduced support for the new SPI IP (SPISG). The SPISG is
> a communication-oriented SPI controller from Amlogic,supporting
> three operation modes: PIO, block DMA, and scatter-gather DMA.
> 
> Add the drivers and device tree bindings corresponding to the SPISG.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: Add binding document of Amlogic SPISG controller
      commit: 78d35a20783941c8ba5cf912349728c6e1bee84b
[2/3] spi: Add Amlogic SPISG driver
      commit: cef9991e04aed3305c61c392e880f6e01a0c2ea4
[3/3] MAINTAINERS: Add an entry for Amlogic spi driver
      commit: 0ef2a9779e9decee52a85bc393309b3e068a74a6

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
