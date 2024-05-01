Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE83C25B10
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 May 2024 13:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLQWBzZXgrKQVjbqfJy7fkVr3mPSg7fh5gEos21TFuk=; b=q2b8q44P1Kut78
	FiP5w74phpA6Q2Um1IUPTjBbd+z9datUcc2lVH82+0PTvyOB9iyIOvZirvIv+XRwSg+ZREoUzfmIG
	Blq7ns1EuL+QOkZ8/QN7EEJgnhZ08sKsCVRBsiquJ4APjwsvStbf4G//gWOykXXK8mDsZ+L9zElmg
	/To9gy4U3Ka1tpb2TC2diIQpV2Rnnufm0ObEoTgE1NSioqiSqEGKe9FOdfjQxwFWvxxzQ/HItpSKF
	Bu+9gCIocqmo7QLgDTzUXds3+X5ClPygH8WsdSXg0knIcsC/QUU7WTbEz6JVUd1RvMCqxsECF9ov6
	LSQmwmkD/5yQnpziza9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AF7-00000009i34-11DW;
	Wed, 01 May 2024 13:43:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2AF4-00000009i0n-2Jei
	for linux-amlogic@lists.infradead.org;
	Wed, 01 May 2024 13:43:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE264CE12FD;
	Wed,  1 May 2024 13:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C60D4C113CC;
	Wed,  1 May 2024 13:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714571002;
	bh=O6VvEOG1FYYxiSATtFdjPAV7d0igftAeyhbDcL2/oH0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qh8W1fcNhbalI3y+nG4MQoEDqYZzv56KKCouGMwdNtQQ6ImtLhumgFcinolCuOUJ3
	 dcwtvnQW4NvKJ0UwzADP0Z+EjWW0JZG1qkdgE8wsDY4ZxesO6g5ilAgOaCXBLjRCx7
	 x8XY6qza8LaQndjO8KrQVKvVMaYWi+StgB6Lwb/HZoM4UNDclvuOoM8f3SJM3Yryhe
	 i6FWm4V1uYMTgTsn9jgg8JkZuZg8qcf7Y9NwtUaUAvlDbAiUC60Bxx0xPRad7Wy4gn
	 MLEk2n+A5XwxvsRgivZVy4OMGldX2CCvQ7usaj0zPkPRDBal6g1ZLWgVSp6yV7sG6/
	 S1byDemKE4IKw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: tdm fixes
Message-Id: <171457100123.1888704.3713341677013104535.b4-ty@kernel.org>
Date: Wed, 01 May 2024 22:43:21 +0900
MIME-Version: 1.0
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_064326_904592_3680AF7B 
X-CRM114-Status: GOOD (  13.53  )
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

On Fri, 26 Apr 2024 17:29:37 +0200, Jerome Brunet wrote:
> This patchset fixes 2 problems on TDM which both find a solution
> by properly implementing the .trigger() callback for the TDM backend.
> 
> ATM, enabling the TDM formatters is done by the .prepare() callback
> because handling the formatter is slow due to necessary calls to CCF.
> 
> The first problem affects the TDMIN. Because .prepare() is called on DPCM
> backend first, the formatter are started before the FIFOs and this may
> cause a random channel shifts if the TDMIN use multiple lanes with more
> than 2 slots per lanes. Using trigger() allows to set the FE/BE order,
> solving the problem.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: axg-fifo: use threaded irq to check periods
      commit: b11d26660dff8d7430892008616452dc8e5fb0f3
[2/4] ASoC: meson: axg-card: make links nonatomic
      commit: dcba52ace7d4c12e2c8c273eff55ea03a84c8baf
[3/4] ASoC: meson: axg-tdm-interface: manage formatters in trigger
      commit: f949ed458ad15a00d41b37c745ebadaef171aaae
[4/4] ASoC: meson: axg-tdm: add continuous clock support
      commit: a5a89037d080e0870d7517c61f8b2123d58ab33b

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
