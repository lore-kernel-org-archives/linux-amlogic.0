Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B049C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Apr 2022 13:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHEDg/9p3iFS9/IZuumsqiGqkRa5vlUGkrS6UhUSRZM=; b=yiOY+xJGqkNHCf
	j8lmM7tSOX6Ibk2OZ9GxohRQWP2ZQOkPt99ka7aA/NdiE9NlXeEBFG9nn4kZepRzhWqDZLOJCv/aA
	fOL5wEXKSz+rOuKSNqQyyybv1s/JNYibne7gkXfcJNkCdCD+edjlTVtXsBClhuOWJKnfZAnvLFQf+
	pUnTlPPlFS45Th5BknyIHKhkco8nfw07XTEtDDznSmVsMGh8JiLFCsGXnij2OH92qN7+di2DmCCds
	Y3ZNZKeV7R4XmJZUSU9355bvPd5OhByL+Cw9IHCo5hVyxB6xzE6yNAf+jdThi9tI5Qtn2G2kydIQD
	5RutpLLSLIManBlJ8/1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc5il-006Hhn-F7; Wed, 06 Apr 2022 13:29:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5iQ-006HZI-B1; Wed, 06 Apr 2022 13:28:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2907D615B1;
 Wed,  6 Apr 2022 13:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7329CC385A1;
 Wed,  6 Apr 2022 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251732;
 bh=HlOW/rtcooRbC/awUJEDc/IhUFjAooRRWlUwyIeWzk0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AlbjvL82cmQ3T9Y795YHAd/6YC1Dw9MkbRoVaRz7zzJJJPZsh/b10LMIwRWxrQ3jG
 O/I8MhrZpH8c70e9OQKoIBX0fgoCy2TQIegLQSwo3cdaE2zyVQSEGsXYbTV0Q5ZFXp
 AJgDWdkhsUOdWmJ0uiB74asWDoKTYuzOM+e4epnJ6wsO+vg6MwM8hGTC27zno0ShN+
 tjqTisRyehuF5ys/MmLB0BYeMXrPd1xomDcTrUsFtm9gStSl9TGUum4U+necRmv367
 fMuyLvhBQbbMfPsJ+Bwh9bIi4QCZXJISG4JEaFrY8Q/VpOfc47XxyQTUMDaVmzeLtL
 02yHYm5qsjpPA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, narmstrong@baylibre.com, khilman@baylibre.com,
 perex@perex.cz, jbrunet@baylibre.com, lgirdwood@gmail.com,
 hkallweit1@gmail.com, martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
References: <51953618-79b6-0df7-2d28-d5dce4dc86c7@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: aiu: fix duplicate debugfs directory
 error
Message-Id: <164925173019.83821.614218458873558335.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:50 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_062854_513441_9FAEFEE9 
X-CRM114-Status: GOOD (  13.75  )
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

On Wed, 9 Mar 2022 21:20:01 +0100, Heiner Kallweit wrote:
> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
> 
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs(). The proposed solution allows
> other drivers to adopt the same approach with minimal effort.
> With the patch the error is gone and that's the debugfs entries.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-core: add debugfs_prefix member to snd_soc_component_driver
      commit: d462f6ed2aeac30c0b440a91fb05d964956935f9
[2/2] ASoC: meson: aiu: fix duplicate debugfs directory error
      commit: 89bac792faf03fae5a9564bebfaacab53a029932

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
