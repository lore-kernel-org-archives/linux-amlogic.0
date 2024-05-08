Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18165C25B4F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2024 02:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSuqQW0H5WdS5CMWjQq9Hd34mSZnO1SAKn5MlWeOqgQ=; b=sJ5SHcO0WNQt/B
	cGGCI/qDngmKFxQsciUoJWjObLgJTyZpk4b5M/lEygepkLloOIBjzV+kVx9VU9DvT3zh4U1HsypjG
	PevQNk2yeVDOvaHU1gXiHmZiYSHf08LaekZHrGaa0FOAQMeeyCjrYQ3/giiiCOySmLRgFxiY+7Cpc
	hkb+HD3AvIM0dlyWyBTQ50NtRWeBnR2EHCYIiEWUhfSDTF8wa36n1YSNClovIULWUT0nuiP2FV0Zz
	pjfG9xXNxOaUKcD9P2QJ31C6ELc28G6hXIjDtO89qDJqvFNbc6wbL0DCu7mYjmw9UD0fehGDQCg4Z
	CSQgOz6sKTuw1AYU2CpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4XCx-0000000Dmrv-49Mr;
	Wed, 08 May 2024 02:39:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4XCv-0000000Dmr1-1Dn8;
	Wed, 08 May 2024 02:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D36C861A7F;
	Wed,  8 May 2024 02:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02724C2BBFC;
	Wed,  8 May 2024 02:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135939;
	bh=/3khDWZQ/GtML+FhSHCXGuNu/t+fIBx0N0zULUWpjWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uC9nO7qwz/RZe+qVeAYA5qg8DRX2OHooEZGkUg+YOiFYZbymhIt5OYrroDkvwZHx+
	 rloiSSzfzkpfR3JH7MYR+nwgB19ILcw3crrUVKTntXNt13ThipsAWyeevB2r2yv6e4
	 5UcJx3pXdyw//cVj268GeKVZeeXlC8CscMEFYHrvrAsHMAGXLZQj4qiDjiJa6/msly
	 chVJr5LgPieHOEt1Z6CDmFMIZNYKLXUkYS08rHdms6UNqleqnU+9MAV5ZdML0t7FUe
	 4rh/5pt8ZbvdIsh9pgfWDTw1ynQIxfxgYcl1bu+Kl0Fem7Stn0h55Di594V579dsht
	 8SgBQFV9z+Mbg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: Constify static snd_pcm_hardware
Message-Id: <171513593429.1997870.7721601606737894887.b4-ty@kernel.org>
Date: Wed, 08 May 2024 11:38:54 +0900
MIME-Version: 1.0
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_193901_414965_7DBF14FE 
X-CRM114-Status: GOOD (  12.75  )
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

On Mon, 29 Apr 2024 13:48:45 +0200, Krzysztof Kozlowski wrote:
> No dependencies.
> 
> Static 'struct snd_pcm_hardware' is not modified by few drivers and its
> copy is passed to the core, so it can be made const for increased code
> safety.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Constify static snd_pcm_hardware
      commit: e6fa3509cb32df373b15212a99f69a6595efd1c3
[2/4] ASoC: fsl: Constify static snd_pcm_hardware
      commit: ed90156037659473ee95eafe3f72d8498e5384ff
[3/4] ASoC: meson: Constify static snd_pcm_hardware
      commit: 7b5ce9f0c52a5885d34d46bba62e9eaedc3dd459
[4/4] ASoC: uniphier: Constify static snd_pcm_hardware
      commit: 74a15fabd271d0fd82ceecbbfa1b98ea0a4709dd

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
