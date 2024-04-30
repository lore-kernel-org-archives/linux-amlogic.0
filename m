Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CAC4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2024 14:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkIAkMi7igrxfxa8n0E9uQeJVne4aB3gLWLnwPPBLY0=; b=nGSddV7AVWInml
	/QWUmvdy6V7/4UDcxwcNdAB2lBjOVMjM4UwcAJVXak25/aX+GMaQ/uSxFI24eIZJQLYyW1QZ9plG0
	QCH0RYGxqPw3NIyM+VwoDCrpa7i10ib2eZYWVCgAZYx/OAH7xDgm/sNpVI7uRfb+wU5TWuklU43vx
	QT7pxqrtlzB3kYYD0jpsRcR9trm//NoMem6ydl4DXyhrAQ/6JI04AxRgKukqRL/7LK0dUHxtTeect
	lfhBEYGi8HSIb3z/K++oinPVGgqlrEr9W5XdbVWEXcNhqwNYMr0SxMOnPI/zCbAZIb5GZFf4JXJDp
	8+8Pzi0Os24kg6KYSs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oWM-00000006q26-3v7n;
	Tue, 30 Apr 2024 14:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oW3-00000006pq3-3faE
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Apr 2024 14:31:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47E3D614DD;
	Tue, 30 Apr 2024 14:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04429C2BBFC;
	Tue, 30 Apr 2024 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714487491;
	bh=TpIld0LnjkQmQ5PsI5skb5CrdOEKjutEJsH7FAf0+NE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fhfzw95xZd3KJTF+cCGdHv5EaYCh88EHjU8X8xTwZ8XiZqYVfYcPkaRQIohdggJPy
	 WmRAfI/LaTfKGjSQP1hyncVMwFyA8Sjw0pWDoNgp8LVjWtUZGhTP2JpzjCw+8n2t0u
	 5+CzBUAJRvmzeeENLs9h3wUE0UFAXZw1yWN1kf4qwal+onpYkR8VfpWkNVFuJuJcH5
	 ueJ88sdZ8zG2RBw5pmuOTlQnkkwi7n7dHsuWoZlax1sN3te04Oix8U3fOq8PrYZBXY
	 uI3BLckXTXKzLTAz3frfU+05s+09aa9IiXJ0W8BH1il+W7oBRKNKP75YtSy44fXAiS
	 LAcE/5vF+PgEQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240426134150.3053741-1-jbrunet@baylibre.com>
References: <20240426134150.3053741-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: cards: select SND_DYNAMIC_MINORS
Message-Id: <171448748960.1870439.10234664957673529561.b4-ty@kernel.org>
Date: Tue, 30 Apr 2024 23:31:29 +0900
MIME-Version: 1.0
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_073132_210578_0BE8ACC6 
X-CRM114-Status: GOOD (  10.18  )
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

On Fri, 26 Apr 2024 15:41:47 +0200, Jerome Brunet wrote:
> Amlogic sound cards do create a lot of pcm interfaces, possibly more than
> 8. Some pcm interfaces are internal (like DPCM backends and c2c) and not
> exposed to userspace.
> 
> Those interfaces still increase the number passed to snd_find_free_minor(),
> which eventually exceeds 8 causing -EBUSY error on card registration if
> CONFIG_SND_DYNAMIC_MINORS=n and the interface is exposed to userspace.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: cards: select SND_DYNAMIC_MINORS
      commit: 6db26f9ea4edd8a17d39ab3c20111e3ccd704aef

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
