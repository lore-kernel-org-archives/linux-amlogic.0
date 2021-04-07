Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5B3C43460
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79D0361246
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 20:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79D0361246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ACw6/Vb/x1kQbKjIOV+lFMg7L25NZAlwcnU82D2dS+U=; b=cuDXCsqIaCd7xrDU7pm7TZOyU
	vuq8VXWdV+CdpXHlQ0p3kzVMvlFGrgjnnp57yXzyhWBD2UKDaODp70hxeCiFSXvV9I+SfqA/bvTZ+
	dDFrdlOWd6XbStw9oJkaDwOOdv77qVxcFOIP6mnAawu5TAvZhEgLQ3GkDF2zLgUGl0HxsXxn7rMSX
	PW8v7NU5rD01JJ0iiM/Cpi827xdF05svEbBojcImySeQLWouW9yuMMWpDGrfGi5IvnlyKoFmGGZUM
	/hmIAGnSj4sZgRlSluPQb2s5Z6MIR3OaUau5gdRz+Qxbxt9tf8NVOUWTyzt6MrNYp7T2zPS2Pd89/
	mhn8wWb1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUElM-005wnU-S2; Wed, 07 Apr 2021 20:26:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUElJ-005wkD-4X
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 20:26:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF06D611C1;
 Wed,  7 Apr 2021 20:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617827211;
 bh=hhSwEIiRpS2DqdUTQ61WIoCRvLh6PsG+8huacQb3mew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MfUNOg/DryAKcb+XuiDNOZsFxcFaABotIU+7EjRUqKSJTyXyzcnwwOuCccSFOOx01
 P+rD4vL6w0EkcMp8RKLN4eRDB2zkqkK/RPOPAy8JwAUyaUYXKB1L8VsY5KZ+loNM7H
 pTuJlSzA40pVLY6mu9sCczApMz1FkZZ0DL8uoN07qwaaVdlfO3W9wtGL8OBiFE7UaR
 6CbD1FTd/tlE4bmQTLA4CAyltFIpwp1ROhlS/Ny6yyuCkjnR1MrMHPBD3veGp8+NvA
 VwZV32xBRnGp3fLpIOeX6s2udf9NyNA1ATfx4DcBlShP6ZiEdoMshrXoWYqFteZVbu
 O+mZk72Pg0UvA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: meson: axg-frddr: set fifo depth according to the
 period
Date: Wed,  7 Apr 2021 21:26:21 +0100
Message-Id: <161782703231.42756.1997457817107247439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407145714.311138-1-jbrunet@baylibre.com>
References: <20210407145714.311138-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_212653_402421_2012A3A8 
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

On Wed, 7 Apr 2021 16:57:14 +0200, Jerome Brunet wrote:
> When the period is small, using all the FRDDR fifo depth increases the
> latency of the playback because the following device won't start pulling
> data until the fifo reaches the depth set. We can adjust this depth so trim
> it down for small periods.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-frddr: set fifo depth according to the period
      commit: 6f68accaa8641b70b698da659216f82f87537869

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
