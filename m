Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FA1CA0FF1
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwUvedidLEJWB5JgQY9iba3FHE3Q1ZhfdUUWe2A+C44=; b=Cpz5envQg9+yBc
	NU2Ytz9mENp2mMOSX1MYatYYSpiEKmCBhx61KdURexm96ZevgG0yrsQbg6RmK37PcIh8lpeUYaGxw
	wnnX9aX1sO34WujjFKC37WALauu+VbJwL1D+s0J7U8DufnsJOzRFo/k2G1rcTGvZJZlrD66zdVU62
	7EXgWHW30cMO3uHg9mpL3kGNDmaqY0rgnvUvPcPXojLYJC/ef0AQgI5ZiWrgLKFjVjOQu40MVJdYT
	kN4jb2AMxv4mwQ83hfeyqLgVLD3M3bfMLx4wDBTnEbbfHTzN6Zz24XUu3kDK6mxdjzmDsgi50P5P2
	9OeJjs2bbHksWM3gbTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk1eA-00000006PCe-2drF;
	Fri, 30 Aug 2024 13:26:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk1dZ-00000006P03-13hZ;
	Fri, 30 Aug 2024 13:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7B056A4476E;
	Fri, 30 Aug 2024 13:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73574C4CEC2;
	Fri, 30 Aug 2024 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725024360;
	bh=yNTgcxt0Jvmr1cytFFcqGGu1C6A7n+7i6AMHuwra94s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BI+ILC2WBeJTDWqQrcORGhSJsg6K2Pz+RbA7txVBNCZbIFbJGr1sLhCKonLQQsV9L
	 VvITUft3oYcXxBAYx158mDpAeIJW1LzwZeXXDjLwltTWiLfAAj28T9sJo3vXsG4ZiI
	 TPxCvcnL4dwMiVPDPcFIZKyWXgSpEqQ1RdArVD/Y1JOh6uPrgIlEBvI9pCTsMW5vuf
	 P+8dAXUHiBMNlDsNZphv+FSnM+U9s0vEkLCaAr6bIYV9plDFnVsUZbEu60htGMAcnY
	 wTOtyqUK4vXhSIO1g8dlRiNt4JNg7YiNYa1hgKGKLucL90XuPxT321iwazF/agsdeI
	 lJa6oh9ZKcY2A==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: dt-bindings:
 amlogic-sound-cards: document clocks property
Message-Id: <172502435719.145062.8812088921353096920.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 14:25:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_062601_387321_DB7A2725 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, 28 Aug 2024 15:53:53 +0200, Neil Armstrong wrote:
> Following an off-list discution with Jerome about fixing the following
> DTBs check errors:
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>     sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>     sound: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: amlogic,axg-sound-card: document clocks property
      commit: 4b1d9019b26fd654ebc2d0d2e100ed56ef1821f0
[2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document clocks property
      commit: f189c972f86b00318cf2547b62e461cb98374e34

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
