Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5B0C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Dec 2021 18:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zydz1VA4xm6ROsgB9aIW9FBDd8A2lXFo+GfIt8kRF8E=; b=OwUfYdb/Mk7Pc3
	u5WG/bv94MZ/x55KlD18vKa5JiunmVS4jM3KUL2HfpFagGppxbCwFS7tPnDVsW8gnj2gB2nbKnVwu
	qwJfKHv+Yk5Zd+bC82IuNofCEninhbeK+ZxwfKVaoRvf9wPNKYiOsxH80tvUFM13E5hlJ30D3+UfO
	F4VBiQmqv0geSxk4EEaRMgvOpGsfff+oxQyO6MHOhhlPkuVCdNriYefEU2o5gO18pPYuld+m6oFbG
	czz7oIMRi5hQ/k7P4qMGlEI4IIMKSTrPiOHxbdsYoZ4iG7urcYd6Ihy+hyxUPySk9ZbGNukjbaKDm
	pCJwte1fKkX0B2I0ZxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxYn3-002DEf-Hc; Wed, 15 Dec 2021 18:14:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxYn0-002DE3-DE; Wed, 15 Dec 2021 18:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FFA06164E;
 Wed, 15 Dec 2021 18:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4193CC36AE0;
 Wed, 15 Dec 2021 18:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639592044;
 bh=Qb6bAw7Yfc9ExsT/6JSWE8AUnkp9FXA4Nxscx9lbVAc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b/m6fdROGoRDZ9dZZ5ErnWwO5gN1DTjK4jrqwDidzf+r6gRauKxDaVlmlQrTVQ6x3
 Fzs5w8j8HS6OabcUKAtpmPQrz0NVGIoQxOY0J1+2INW688ZF9b4DAhcMN8ujCd/iv1
 FYCUNM6tMXUXn+cdNVYgnhdfVRFqEJPoKy4x4zaNdSyjw3h+ZFEweUVKu8WgpfTEj2
 NC26IhuT3UmDnEc65mjt9NvdsFZF8fQaRF0BNM39UV4kgx1cmSC3tzrao98a0gjpzl
 iMoEsBtPvm+J+A5uh2msne5ApRiEtBP2AnEotLQd/ANPtt1d0o3et3eop2y7kK7vjO
 VCHiyrCBTOCAQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, jbrunet@baylibre.com
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: two fixes (for 5.16)
Message-Id: <163959204298.2212554.815832977637183114.b4-ty@kernel.org>
Date: Wed, 15 Dec 2021 18:14:02 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_101406_530016_CE3C651E 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, 6 Dec 2021 22:08:02 +0100, Martin Blumenstingl wrote:
> In this series I am proposing two fixes for the "aiu" driver, used on
> Amlogic Meson8, Meson8b, Meson8m2, GXBB, GXL and GXM SoCs.
> 
> The first patch is the result of me trying to understand the way how
> we get the DMA buffer and address for the audio data. I'm not an expert
> in terms of DMA. From what I understand we need to inform DMA core
> about the limitations of the hardware. In case of AIU it's DMA address
> registers only take 32 bits, so DMA core should be aware of this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
      commit: 1bcd326631dc4faa3322d60b4fc45e8b3747993e
[2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s
      commit: ee907afb0c39a41ee74b862882cfe12820c74b98

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
