Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6E8CD5BB0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 May 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=firl7VoWA+SOzHYXztibr0Zh6Y8D8Cox5/9cw4SxW8M=; b=iT6yrQtqrUo5cP
	rTx692aTO1DDGYCgXNCOVzpLsRGNVClEdzCdZ3tbDfLb49GSDpLVpdESpYyGXVVEgRRbR1cOIk4Q0
	+G61W6NqnSyS19X7jNgZjOCkr5jda01KFbtGyhmcbGKXvUgJSxigcLeEnB5dA3ilfqIXrbfMPC98f
	EbDfvmIzWc/dSW1BnYvhlK9BAOIvN2jhALmhf/+LA3fr43HE2OI8rQnrXfKlbP+E60Kt9qy6aE1hl
	9R5y76Tn0R4+zh1TgEiF3m/SNSjEh1iX3r/DmEE5/3LFKovNgvok+gD2HerYB7w8PGY0koAET+SUL
	rTp9D/F3iCRt3GPIGUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN1C-0000000AVAR-1HMp;
	Fri, 22 May 2026 10:22:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQN1A-0000000AV9d-2D8K;
	Fri, 22 May 2026 10:22:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 018BF60136;
	Fri, 22 May 2026 10:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4141F000E9;
	Fri, 22 May 2026 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445331;
	bh=9Hs/lgWDFKj1AQ6Sx0xmJaBWVngeOt8sYXNKLfOmygA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=I1QqadFRJvu3SoQ8DTXwajbf7bu6/zBCeT02a1FGYR65Ny52gIB2g/vwxXnDlPFI7
	 5qYMainQ6gFE/AsGETVodi7f6HYPFn6EUFzqkF6qHmBZAUXfUl0L0LRdbdNDvK41gO
	 l+283jNvNJaJOnYVVdJfjC5Z6lhvn+nKyfJLeiJKY1erw/F3J9N2oeWD8CIh48QTwK
	 7uuBoFfwbGVFFMTvwkKX5G0rlaSr4fDXNkhG5TR9qnOSBbmFFNau/slGWByx0bIfR1
	 9xdeiG9EdA8m1o7SzVWK/GjSruN1TovrppXqr4Rq9+N7DgxaP93AgnUb/hoZV+8mHF
	 ogFz8O1y8Yd6g==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: aiu: align I2S design to the AXG one
Message-Id: <177936336749.58022.15311643425508742115.b4-ty@b4>
Date: Thu, 21 May 2026 12:36:07 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ebbjq7a6Me00P6HJYA9wBoYwNTnmF9z6Nwz/Is0tWGg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5QDdh25F8efTMW8DSO5nr2kjOL88DYkanVW
 nA4ayETn2qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuUAAKCRAk1otyXVSH
 0C8xB/9sCgUlqx0uf9DMyJzHr/V511MqhHwb0rKH3r5PjP4QFs0hvDlCTfu19cBKtcGGG55MjtT
 DfoxiIPr6e30pcpPF5ifHFRuspYEank2tlJqSJyaRGzV9YFZqriUw7FJVyOt6Ksbo3kX9KcKRx9
 e6u7z+3NbgKQWQjDI3g/hbD1rkMUgqMgZAqvemXwvYmzWqtv9RefwDr23uumysJKeQBsftj1L1k
 B6++YWFCITy3HeZYeFIxkNsow9v9U+OMJqIUudoNh9pX+5RifhMn0HDQzGMjA23OUUS0+21h6Yv
 85OezqwcqgpTJNEF3/lUHXAGx3gomW3I3ZEwri6rFlM9oM+D
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Fri, 15 May 2026 17:10:36 +0200, Valerio Setti wrote:
> ASoC: meson: aiu: align I2S design to the AXG one
> 
> This is the first follow-up patch series based on RFC [1]. The goal here
> is simply to reshape Amlogic GX's AIU implementation for I2S to follow
> the same design as in AXG's TDM. Keeping the same design allows for
> unifying the two platform implementations in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/4] ASoC: meson: gx: add gx-formatter and gx-interface
      https://git.kernel.org/broonie/sound/c/4efe33e7a2f0
[2/4] ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      https://git.kernel.org/broonie/sound/c/3383866c1b77
[3/4] ASoC: meson: aiu: introduce I2S output formatter
      https://git.kernel.org/broonie/sound/c/df6057a25c52
[4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      https://git.kernel.org/broonie/sound/c/ca3543cf247b

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
