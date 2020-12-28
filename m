Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C49C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:06:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 616802074A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 616802074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gQcW+BOQrtNTT78zXMdki6UYHiNShfLvoZqvbc4jb2U=; b=f5mVcjLo9g/PMphORppRAiSPm
	v9jcDosNrW77ygXKnxhubi0igI6JwrK0URiETvLrm11UZatN/imQ1+Z3Q4z5eyDwssRuohiJiSwPm
	Bf9dl4pI5b8VEZ8pA3dUvSxJMR+5Z/qPaaUNqbXSBRX9wCbzCT86W7IPtl3vnFAJ5KF8nq65MTO1P
	DZoORTsJsDJd4zI9c1SS5N14gQGwV2ishootQuQ2BIjnkhkO4N+aUclnmoqMsG969o0ZvQL0SzdDq
	WhClllAAZxCFoyJ0cRmbHJcRlIn430ZUbYZLbYi7FpG/YeEH2OsUukBSgYmalZ4aVb/eUkADcCf9I
	Xm4i3xmKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktv2i-0002H5-Gv; Mon, 28 Dec 2020 16:06:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktv2g-0002GZ-Fy
 for linux-amlogic@lists.infradead.org; Mon, 28 Dec 2020 16:06:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46305207FB;
 Mon, 28 Dec 2020 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609171600;
 bh=6GZH+u+8WUGAQKjZRQucFo/eXB1TvTVwVbUKfVa9vLU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rnw9CLnrfKYeq5KfGUyB7zNWgThUJi6EsTEbc37agkbfHuoFCyYGW69k1v/kKzThw
 e9byvdWEZXCJP825+k6vAL8xQIC8oiHiDje4+9rtnNHnDRI7POpXF0v+6apEGLmpAS
 z95tLbP6QdxT8B9p7akXG+jLOcKj024nzmrZ04BW2V3KG1LNk6qTy7L1DQkdF6onyg
 sjxjhI6CQ/lkeVqxDf24ZOL55zKViIQs058S3PanU051G4ruW4deyzdFtwZ3XBb8fK
 P0r3Z9AmItQEuur0iW9IkrEZWi+CVdPnsR+jc6z5PpZWX/Q7Nvkn32+beTCEPDs9u2
 oqWzM3k5GU1yw==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <20201218154544.25513-1-lars@metafoo.de>
References: <20201218154544.25513-1-lars@metafoo.de>
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
Message-Id: <160917143257.51553.13640540260612593561.b4-ty@kernel.org>
Date: Mon, 28 Dec 2020 16:03:52 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_110642_634432_0545DB89 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 18 Dec 2020 16:45:44 +0100, Lars-Peter Clausen wrote:
> Using a managed buffer will pre-allocate the buffer using
> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
> destroyed.
> 
> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
> hw_free() callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: Use managed DMA buffer allocation
      commit: e05cde84eabccc0441f837f0661cd4c6f4820513

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
