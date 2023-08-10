Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64893C41513
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5GsWLo/fs6a27/d6YRACewmZvOdrFnXEbJPIDNavQM=; b=Tv5oPJM1e7T9vp
	qzV6Jyqvqm8yy2hll8oqXSwBdMrwkAoUNT9DQAe6q5N+gdQqA3JGJ+li5T+IBDUNR77zfMvTuhq9j
	yhqhUhBK/7xfMuSmf/YMWR78MDFbbeQ3o17Wp5JzoplAdhmSTCF/X2MNyqRK23a9LjAcGpIWHFXpX
	Mvs2WLHS15iTbuwHzOVT19Gy/v1xtbzrl2hGVl7XleFzCGYjz6To7mjUbr8D1Mh8aMLp1lLx3kFtR
	AxHiqqUAm2+zyD7BBwl4p3qbGsrcAlV1f+AGWdzeY+74jm9GJ6k29pAWyhS7LziI85/VZ3vp2C59q
	DheOeOyrVFLGHq4a9OqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6tx-007twJ-2K;
	Thu, 10 Aug 2023 14:44:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6tv-007tvX-1W
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 14:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD4EC65E55;
	Thu, 10 Aug 2023 14:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49CFDC433C7;
	Thu, 10 Aug 2023 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691678674;
	bh=taD2g2HjEYDDGyrJ7xRRjV/D/Ew9sTSpuCtEVhiSMVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZARSl0Qu0dWqGyMxPdHwUP4DCJXIgtofaovntgVIS1O8ERbxLpTmxuHTv9htJBcgi
	 WnOU4Pq1u+xdYUNAJHVHy7ODTKkDFS39Hx7degKqwA4krDXV1XR6zaeQ7RsQRjP2Jm
	 DzbhrPVv9Vqlb0ex7NZlhzM1Pp7wYmXEdWPJGIbNp5zYrz3GM2KYg6fOxCDk4hQu+u
	 8eXtM6ZGUxWZnrK04WseN8x+n0Ebk9FrCUbWn/enYf3qtg5kY492toI26QiP6MwiOd
	 RNVWiZC5PsVaJRDeDGYHKgEDepoObxLt5I2EIif7/uZu0OHYQ+8jVh16FILmtrcPQO
	 osZj5w+PuJ3xw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230809171931.1244502-1-jbrunet@baylibre.com>
References: <20230809171931.1244502-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-formatter: fix channel slot
 allocation
Message-Id: <169167867301.482967.10999028538152637796.b4-ty@kernel.org>
Date: Thu, 10 Aug 2023 15:44:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_074435_554834_FDA23171 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, 09 Aug 2023 19:19:31 +0200, Jerome Brunet wrote:
> When the tdm lane mask is computed, the driver currently fills the 1st lane
> before moving on to the next. If the stream has less channels than the
> lanes can accommodate, slots will be disabled on the last lanes.
> 
> Unfortunately, the HW distribute channels in a different way. It distribute
> channels in pair on each lanes before moving on the next slots.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-tdm-formatter: fix channel slot allocation
      commit: c1f848f12103920ca165758aedb1c10904e193e1

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
