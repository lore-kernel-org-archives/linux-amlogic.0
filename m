Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35881F53D7F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2026 17:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DiX2QlqNUHNPyRNfJtVK9L8agqaW+AJ5f6OiPFfA9wM=; b=eOWgbkkNqSCgKF
	gB9lM9wCbzi9Ox+8q5sFp+Tj1p8kQ/5cO4x1JClQfcOGq3fcg6Iduzz4tqCDgFaJfsffnB9hmsgxD
	PGIgrKq4pC1QorP44XjrKMaOhoSlW5sDcta9KNPNcCfMOHivdrL8sY2M8zmUsE21iSdnu2tiL1m7A
	snDHNFPww6UHSSRGwMTSRinZ860mLVu7I6XjrW/8/nqtVK0YlU4PCclm6dQyit4C56GPk5nsApRi8
	SAX04flFRXDjqHidL/pby7PKV1nUv5oG2eyqWj34Xapu2PJZVmob3gwnBFluEyFXMdhSddkqZA4+H
	ztQcc6pIHFeFUY8RAoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7i-00000004cPi-08x5;
	Mon, 16 Mar 2026 17:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7g-00000004cOA-3cji
	for linux-amlogic@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8+NFNNfPKQpy5aedubp3IIdmi/1hneNF5uqPEJiejD0=; b=IjHLYDUSnLR20pwN1voFKIS5+T
	dkrTBhUTAtggdlQBN5zuQgu9MHAY0kJEtFIBZNhHdv8Q8b3u5tXRCygPe6mUALfdk9BNDO2/6TGvj
	0OlCe0nZC9RUcvxBeEpgH3/hCtrjalsmFqfD3C46asDiax3458yQY2e7LEo2TpYEVmvZ7FGMxgzwL
	FF54B801KP1TL2Ze2+NsHuqG0J7ByUNYlj1VsGIZCVWzv5rUBdd1U0MESF13ye/3sxxjMdNjabWcZ
	4DXkviVm/MA6az7KgFc171hcATGNVjlhmSIyPrZE9uP+nCePELJETtlPnLYpYiI8FTQ7ttEMB5lA9
	svJM9vfw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2C7d-00000007O8i-1ikV
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Mar 2026 17:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 593A443AEF;
	Mon, 16 Mar 2026 17:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D77C19421;
	Mon, 16 Mar 2026 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683573;
	bh=OEwG9/7Qz07DUhhGU75z8KJ/0FJEh4JIXFXDtPd/Vho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YfpeH4oJXAuDCb/CEbnrT5EwJC3+z5nA6nBgvGcMnSVIyoMig8cS/e+omu436gBg9
	 KrdTXMau1nnEND386IT4Qtz2FW3GSeJ7rQrLF7ZqAOEe3Yx2iqprkM/qVVgXM4KLcU
	 laDdiODnzjJiqootV4gQMANn2X0EQWlTjHtTOHyiZmB2HWE15jzc0A0EZ3TU1JpZ5y
	 dam/mooAk7AvOR/6Jz6fvQzz0Uk0RkTQ3SpZHPvxEKwkNQ9D/at2gEFvgAxHUaxp2j
	 wCPg/WLwPFEnd+VoyKwIH2U92U/FvxCrm6iC+JR/HZQtpZAnEg2L5DxkYmheUefgro
	 TlaDHcUKbaeBw==
From: Mark Brown <broonie@kernel.org>
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Felix Gu <ustc.gu@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260308-spisg-v1-1-2cace5cafc24@gmail.com>
References: <20260308-spisg-v1-1-2cace5cafc24@gmail.com>
Subject: Re: [PATCH] spi: amlogic-spisg: Fix memory leak in
 aml_spisg_probe()
Message-Id: <177368357179.147197.16355665844565795171.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:51 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c239c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_175257_672302_729891E8 
X-CRM114-Status: GOOD (  11.87  )
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

On Sun, 08 Mar 2026 14:49:21 +0800, Felix Gu wrote:
> In aml_spisg_probe(), ctlr is allocated by
> spi_alloc_target()/spi_alloc_host(), but fails to call
> spi_controller_put() in several error paths. This leads
> to a memory leak whenever the driver fails to probe after
> the initial allocation.
> 
> Convert to use devm_spi_alloc_host()/devm_spi_alloc_target()
> to fix the memory leak.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: amlogic-spisg: Fix memory leak in aml_spisg_probe()
      https://git.kernel.org/broonie/misc/c/b8db95529979

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
