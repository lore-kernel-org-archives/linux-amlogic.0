Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB730C54798
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Feb 2024 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erIuYMhEnLQ9DnCFrTYpwlo+eoKjRC+tOjTguX8zSwU=; b=m5N9PjSlYJIYbo
	ftt6vXmrIzyp45o7pk7kdLk+1XaANSsIXxVckCiykp6eknkT5WUqIk8GrA1xUWiOqv0z2aTe9qNNR
	R/TcanbCVFte5+LALwe4wsvCEWA1bvnAWhOEO3M+GDe9o4bB+MFV5F5oVcikg7aJ9UvldancAdokn
	SOb5EXYyUaAKuE9ytlK+JoMVbqnzLzf+4dNmECWdR30o1aSFtEUHhNKUD1SP64kaD/ZxniNX2N5kt
	puw5tNoiBT8E2rckkBSdvUnNVSYnZAImaDOsbLFUslptrV7bHT7ERrLmqSs9JDMxkiFbeEZnRu4kE
	eFJNALRB288yFELtU/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4Qj-00000006nz7-2apc;
	Tue, 27 Feb 2024 20:52:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf4Qg-00000006nyS-3A4Y
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Feb 2024 20:52:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2C6C61501;
	Tue, 27 Feb 2024 20:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B627C433F1;
	Tue, 27 Feb 2024 20:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709067117;
	bh=QhwLpnKe75p3FHs0ebjZdxIlXMliF5uLtZwMEXQcIOM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eSh5QlaEklbj3USqjdl4SbrYSjThOhf0azwzjroNE7tRsAkFp/gXtAC5lPwk3f5RS
	 A3MiP4ou6kXf2gIt7Y+wa9TKziO9wmAXIxO86SaEbyFrHqtsECmgqw8NBM1b9W9IFB
	 I2ZrnJg3FsNVUBbOgwha7V/h3Td7Awa0fbkcnsbdKpsSA2iiU5qqFfeyQTFYnVakp6
	 EeH4wObiMF9QrZAQbbJxD5PNOHDu1NUtx3qlbWL3rLIqos0LPHV9LKooUxzLCODgbI
	 cEU6mKwtkvlfZ4uo4ac/AuCb5QBm+eLAB/X92Q8aXgqi/ZVhT/VhncTQ3fVi7ac+1b
	 rwkdbJ4FYuKAA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240227150826.573581-1-jbrunet@baylibre.com>
References: <20240227150826.573581-1-jbrunet@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: axg-fifo: use FIELD helpers
Message-Id: <170906711616.430898.9659038339252148422.b4-ty@kernel.org>
Date: Tue, 27 Feb 2024 20:51:56 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_125158_870615_5B86D90D 
X-CRM114-Status: UNSURE (   9.77  )
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

On Tue, 27 Feb 2024 16:08:25 +0100, Jerome Brunet wrote:
> Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-fifo: use FIELD helpers
      commit: 9e6f39535c794adea6ba802a52c722d193c28124

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
