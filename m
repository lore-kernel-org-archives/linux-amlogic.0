Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CD2C27C5F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJAtMD4zzT0JSgXW4RYbXvx1ZD344t83fWn8XNXZ3L8=; b=PVsGprhBAHszcd
	h8qH15dOJn17SphecHOBAeC6k2UO7Os+Gvg4N4xn6rgTSBSPXvr32A27+Arvvwo6b/u0/Mxwk9Pdr
	vSVTYh/v/O4OHeryN3SpMnLsAZq0r4Vdpz5a2WI+sWpNF3uyq+63PgWBdO8PT496JRAzEmXmxdMk5
	8ZXLLHHbamaVv3Lge/cbMqXYGkdYjgOnOM2YIr5EvCHsCRogxYOyKSIfMt877jxALHHveENfvdon9
	GqgjPlsPXI2LkxWNsn/XDbd3AMkFBuy59/oJ+ib8SoXYjb9xcZlzpjg6INOCRtlLRdPf+mGosvKQa
	XIRejSfXWlEA9mF20b7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmp5-00000006ZW8-25tY;
	Mon, 10 Jun 2024 21:45:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGmp1-00000006ZTg-3AHm;
	Mon, 10 Jun 2024 21:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4E5B60C27;
	Mon, 10 Jun 2024 21:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D995AC4AF1C;
	Mon, 10 Jun 2024 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718055898;
	bh=Sd8suPdpp5RbZfeLYPbJ0VqHNENaSDraEfVm1uGPQLM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZaF4NkayO0+crSFWB39jRCKqxDMNZI4nh/3xTJlJq6EfFpBPkaBYZHuvVaNyMfmmX
	 AEoXgQchJvq01AvOVQ6tzx18AJDT0HsPyqL/+yUoILX6kzvDTSkHaMVnHZoZNrBV1R
	 kLoJNLdZiDhXpJUUnkSYOzsGCteN9uvXjphxgPOcR7piemosC4CQwixhAgslUAprmJ
	 FUsKmZA2M/V0Xk9HBLHFyXqUV6CCKamnf6L3t5JhbHlHU/gUXBsDw/vuKrsqxKt/sN
	 RHRnOrnDFxDGQVt5c9hIkkrkkambgC9kTonpxf5IEEsqQaT0XAuI8NQ62dTzwvd5lU
	 B9huPe1ORzg8Q==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sunny Luo <sunny.luo@amlogic.com>
In-Reply-To: <20240524-spi_pclk_setparent-v1-1-99e0ce70b66f@amlogic.com>
References: <20240524-spi_pclk_setparent-v1-1-99e0ce70b66f@amlogic.com>
Subject: Re: [PATCH] spi: meson-spicc: set SPI clock flag
 CLK_SET_RATE_PARENT
Message-Id: <171805589269.166358.18171996919240702689.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 22:44:52 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-4c370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_144500_022707_95C06A42 
X-CRM114-Status: UNSURE (   8.71  )
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

On Fri, 24 May 2024 14:35:09 +0800, Xianwei Zhao wrote:
> Add SPI clock flag CLK_SET_RATE_PARENT for using pclk as parent clock.
> This gives SPI more flexibility in frequency selection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: set SPI clock flag CLK_SET_RATE_PARENT
      commit: 022bd9c520d8f9dd51f29326eb369b8ec958f687

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
