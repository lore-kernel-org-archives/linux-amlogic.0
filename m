Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7761DC38A2D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Oct 2022 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGS8BQtA4O8i1raFPciEGVijFBZ1JH7byLU65ZIFTp4=; b=SLPsW2bvg7QeN8
	+E0mZ7NdcrX3AQwu/L4PM8ZPQOUcbNcis13l0o1jZLxe7GB2mTIQoFXFhjUvXgWs5uHDcYl8REDg8
	9eNWaLkEbqbHo0PZ7+f1pjBdBZ9qHJ2fsTxvZv1W3bRmbQjuFdo0ue3GEtXUTtySkXAzsCnDFAkQD
	l3LRi5TXhVvBLHA+YX7v4PP6ZWp/WyDhi+hdnym9Mu3j5JRjS0uuiQYiJF/nH3OaGaQQaAejU0m5p
	UmI8EJJ6EnVBbRkWstZSA562oFct2YzQS6NjuZTtvQTEd8cdvxDc0RPaoG2cq6+Gu8AOT6bZ+xA2q
	luH3QUTPiNN3xbhDNmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkcB-00ASAQ-OZ; Wed, 26 Oct 2022 17:54:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onkc8-00AS9E-N6; Wed, 26 Oct 2022 17:54:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED1EA62001;
	Wed, 26 Oct 2022 17:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A17C4314E;
	Wed, 26 Oct 2022 17:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666806891;
	bh=1zMYOW4OGqV7CIj0igClXnh2UOdKvHi5CykJj1DT2RE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XLqyn7YMuswnyGGt7j1DK4BhUt6nikzGyFyef7OeUi58Z3AN9F5DbDCp742WZVfBd
	 i7QPJC01uRsTKKPUjKl2NTUFWPV8Fu9iIxQfexwvM4nkL9xxOyDntWwWitUnoDYdmN
	 AFad8QNHSDUeY4+XEXJ4fe6vhBI+YPwt8PQO6K1lT1uXwX/GF/zZ62UV2S5c2L8dAI
	 fOK0o636grFSLxbw7IfslXrO2usd1JU9ZE6RFp8rx1SPsxEE9vxipkb4t9NuEpUPhz
	 pB8LijwQd7oWQn8Or2MBSsQ9/pMU2viz+xzkwUJ04jsg34XKonpx15lNI2fbbV+zRt
	 ZXwMI5XFOhlTg==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
References: <20221026-spicc-burst-delay-v1-0-1be5ffb7051a@linaro.org>
Subject: Re: [PATCH] spi: meson-spicc: move wait completion in driver to take bursts delay in account
Message-Id: <166680688974.833294.9389296907324181570.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 18:54:49 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_105452_815006_4EC850DB 
X-CRM114-Status: GOOD (  13.55  )
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

On Wed, 26 Oct 2022 09:58:28 +0200, Neil Armstrong wrote:
> Some delay occurs between each bursts, thus the default delay is wrong
> and a timeout will occur with big enough transfers.
> 
> The solution is to handle the timeout management in the driver and
> add some delay for each bursts in the timeout calculation.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: meson-spicc: move wait completion in driver to take bursts delay in account
      commit: 04694e50020b62b10bd0d46ff9e9708a6e1c7eb3

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
