Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7657EE499C
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 18:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+L+82aM2hV6r0k6TB0stkHniWPpf5aUm+qsPjEp34Y=; b=oJy3Hu5nkpZHb5
	V9ttEJ1R2SLAQguXlQEDqrM2kj3jC1MurhUo0QBoce6xXBD1v1c4kUpCUo0dI9RJLZmIdHYd8VlYZ
	HHMXi7JyLM1qbgQxTPzbZ7LDkn2aviJbjYAKkPUqD53iSJVS0pMdIvU29X3bL7WNpK6DLUxUVKfvQ
	OuLGLDpvpq8RnnpeUKxJXFB1W5sMcaN3tlZDHJK+G8uSKq5xZ1kjWwOGo5W+M7qImIdAnlgAyeoqt
	NMLM66tkAigcfO2HE72X+DT+HtQEAcpRaK/ONNcMx7mGuZxlE5egAy6ayPV98q51NP8XghpWUgR6l
	HM4FLVFOiIk0aWj82CRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRn1-0000000Abel-1Tqp;
	Wed, 11 Sep 2024 18:10:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soRmy-0000000Abco-1jD4;
	Wed, 11 Sep 2024 18:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0DEE25C0778;
	Wed, 11 Sep 2024 18:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC9FC4CEC0;
	Wed, 11 Sep 2024 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726078199;
	bh=t70OeUTPl2Hdc8vLGhMSBtVwCkdkMR0JsnyjS2GNsAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q2qvIMzYmdwsOs/n5Y9KRsjyYolmc+I+asb8nY4g+jh9t4K8HMgVQ4c3t02X2UxwW
	 Wx9E5Pb8uTCiXd+NUd/ucIsuB4h3UXgqys2jgIIQh+JHUnuiV7ZXtlU7LMhgXwOO/M
	 5SQzYsOxfWM9rbz+DdmGx0JoiVgorZy3n1u4GbGpiJ8ruUTvhbd8FgACUyftHzh3TR
	 3Dxo1PFFp95CBfspFYF6p0aaaMg8bAsmBivqueyPczALrh2rBhABPcdFnbYKQm0fQq
	 AhYmaHgDzIsDglr/5IafcOx2w7bfIuJ/GpXz1qEKB5oezpA3CU/snUCJwLsm2Gl3ea
	 sFLBOplnrJ42w==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: kernel@sberdevices.ru, oxffffaa@gmail.com, Stable@vger.kernel.org
In-Reply-To: <20240911142425.598631-1-avkrasnov@salutedevices.com>
References: <20240911142425.598631-1-avkrasnov@salutedevices.com>
Subject: Re: [PATCH v1] ASoC: meson: axg-card: fix 'use-after-free'
Message-Id: <172607819595.127216.9881900790170289531.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 19:09:55 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_111000_529992_72E38E8F 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed, 11 Sep 2024 17:24:25 +0300, Arseniy Krasnov wrote:
> Buffer 'card->dai_link' is reallocated in 'meson_card_reallocate_links()',
> so move 'pad' pointer initialization after this function when memory is
> already reallocated.
> 
> Kasan bug report:
> 
> ==================================================================
> BUG: KASAN: slab-use-after-free in axg_card_add_link+0x76c/0x9bc
> Read of size 8 at addr ffff000000e8b260 by task modprobe/356
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-card: fix 'use-after-free'
      commit: 4f9a71435953f941969a4f017e2357db62d85a86

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
