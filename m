Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC7AEB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jul 2023 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfbGAptvUfYBPgbsPr7lcs4ncUOrbAuU07l1+ZwREW4=; b=MvdelqJLdqmUAD
	xvRxFwDHrAQREj3xTGg7XhDkoKrUyqDRLfnOqUN7C8PISvTIvZNrANFMhcMvjMhB9daafYzZijiQ4
	+nO2S2QbFJeyjuidrM66F26TJP9HWZu60U61xENue+iO8OVgAV9ZsQWQOG9aQruKKaR0y5Xhj53xa
	2K8hLdj93ehrUR+yOxvKgpFcHZEQvr90axPVN6PZeISu1vhZ7kW7G78+I0X4EDiMJ+ARVxXVvmcyw
	y9VGTiGMyznFlutSG3yB5Qre7QOlxSF5zJQbhGgQj2EINAepeh/QADjr2kuq4ZoSd2giGZH4hEWOR
	wJOsxRfqkfaHF2caF40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLSq-00FxYG-2g;
	Tue, 11 Jul 2023 22:04:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJLSo-00FxWq-05
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jul 2023 22:04:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55C4A615AD;
	Tue, 11 Jul 2023 22:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D65C433C9;
	Tue, 11 Jul 2023 22:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689113044;
	bh=sgG4GZ2s6ORnJwOxVKfOxW49a30kTh+UGbUpknPHOBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oa6PeJxwcztQH9DanqQVH5fAhuRixAg62OTeT4DKUnXdNUerUHGGSWIGiGd0wlq9M
	 6LwdMofWimHXsbFwxMHxtf/VQDy40eaUx41eFrWPJ3xT5Z6wbK6X686whBO3jietaO
	 yyzLIuG7E0mVHyGOi6V4FdTrMj12xcwPaMJtYtr0pIuzZxp9t6dx12sHcICn2TBglR
	 oyLfA2mhHzHFBL/WKZlN58By9ES2HfXSfMAzV9enohJIfrk8mRQp2PxBfWSi+qqIEX
	 89A9X0U00PGwNBFe7bvwSVu51f5a10FweTauVReEYr2bpOUJ9m3BLKLgGK5IwxPe3B
	 HLLblQ30yl5mg==
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc: linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
In-Reply-To: <20230703094518.53755-1-mmkurbanov@sberdevices.ru>
References: <20230703094518.53755-1-mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v1 0/2] spi: amlogic-spifc-a1: fixes and improvements
 for amlogic-spifc-a1
Message-Id: <168911304326.642798.13272097605762748928.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 23:04:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_150406_113412_36A72E91 
X-CRM114-Status: GOOD (  11.93  )
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

On Mon, 03 Jul 2023 12:45:16 +0300, Martin Kurbanov wrote:
> This series adds support for max_speed_hz and implement adjust_op_size()
> callback.
> 
> Martin Kurbanov (2):
>   spi: amlogic-spifc-a1: implement adjust_op_size()
>   spi: amlogic-spifc-a1: add support for max_speed_hz
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: amlogic-spifc-a1: implement adjust_op_size()
      commit: 9bee51722cdc1b32193d4ddf6ea6952d666d8f13
[2/2] spi: amlogic-spifc-a1: add support for max_speed_hz
      commit: 54b8422cc64d6236024ec7d72bc63ca3ca90b87f

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
