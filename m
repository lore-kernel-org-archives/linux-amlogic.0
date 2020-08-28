Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582B6C433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 18:04:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2307C20936
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 18:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbdtwUZA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVnAVtK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2307C20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7nBnbEFYZMgJVz4JFVafPUwJx4cMlWnHL9ZQal85Ng=; b=rbdtwUZANPBsaTwf/iD7Vs/6Wq
	Xew/OY/lS4dTWlVk1DYdqfcSeUaRG+qTHNmSnUpuHyS78djxYz7IaXU1NPMypeI17qdXuc1SZ6xjV
	b2dn/VUnSkxMPGES8KiZ5o/POvGEoeCBUpFgtycc4bSnRB4cH3AYfTbwilTBOOuI5Vc26oKnso0Mm
	klhGh0/md6kfNs7+TvYeWkZqDPF8Ehz4brwWoDljbcsQGYDBb2GSidox1hdDciKf4rF/4tiFoYFAW
	oPXPBqIvfEcEeTVm2v8ATXr7rUy7UgHhoXkKiwpDctt+ISkYEIb3S9lc3UAI/e57ywvCAfg4BOlO8
	HSf6i7cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBik3-0003tF-95; Fri, 28 Aug 2020 18:04:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBik0-0003sU-3m
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 18:04:45 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B06E20936;
 Fri, 28 Aug 2020 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598637882;
 bh=frjSPFJ+75o4QdoDtU1nI4HxnaQxhFcRXTKiq6ZSpg8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nVnAVtK6fs7r+1K5wDFx9R1apyIw853o9edYRooJ1u6l/v7NEn6wMK50EbnHrsF90
 twOiHIeb288j343Rjyd/YK9IKCRJoPmgkoQPPPLhaIvyHKFsNXcoR6GeF2jfowH93T
 CjCbHWbMgnKONJ4XFnQcBZsGAvKgyF1ckLcDR40Q=
Date: Fri, 28 Aug 2020 19:04:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200828151438.350974-1-jbrunet@baylibre.com>
References: <20200828151438.350974-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-toddr: fix channel order on g12 platforms
Message-Id: <159863784461.17371.15318009139642856704.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_140444_340835_51C923A8 
X-CRM114-Status: GOOD (  14.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2020 17:14:38 +0200, Jerome Brunet wrote:
> On g12 and following platforms, The first channel of record with more than
> 2 channels ends being placed randomly on an even channel of the output.
> 
> On these SoCs, a bit was added to force the first channel to be placed at
> the beginning of the output. Apparently the behavior if the bit is not set
> is not easily predictable. According to the documentation, this bit is not
> present on the axg series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-toddr: fix channel order on g12 platforms
      commit: 9c4b205a20f483d8a5d1208cfec33e339347d4bd

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
