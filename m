Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B818CCEB2C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPDhqyPAtf7SfXMtS6gVFaIoeMdR/MM/yP0vW7EKYqM=; b=O8y85KGAdY1HZ6
	fqreJhVlcKCGxn/8qiEytaMKBpWZ22KYukZKAe4ZvmbLo8OO0aiY6IvG3AEmBHjKOxeJPZwo7EUS4
	PQZIhio+ZlNm5IgQRR4KMwSImiXdSwIQTLMCMYuKCAFvyhh13c5EwXYObfoRt7n03J2W0cuhN8WRK
	OBq24KXxHeR3fBT9mUvt2Fb+9Couh9ExkONhhRFlchmTFLQ840qYO49h5jyh1Q8DjKpNyz92W9fV7
	oklfaA6EXfLokMOla+Ah4YNTXHavQeacGI0pY1tBj15qC/vuLh8nXKs41B9kJbxYLeWoI0baunnSd
	7G4zbXrfjWpcSFYw8Pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNzO-00000000uHw-2578;
	Mon, 30 Sep 2024 21:31:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNug-00000000t2N-1eGs;
	Mon, 30 Sep 2024 21:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECFB6A416D9;
	Mon, 30 Sep 2024 21:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9E2C4CEC7;
	Mon, 30 Sep 2024 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731596;
	bh=veuninIKx7QYinPBmCwwfQiyLb05lA5LCrphoSHqTqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GiURxv7sbbjhMHaH0tDr0g8pA8QZQOGxqmbeExzAcFohmWfqqAC9sK3+ZxrvuqUdh
	 BBLm0a/5EZnAzIyJALuSxxPRrxyzXPBZd4nLdhA+0oluSxdT47u7S6tl6FeMGrgOQl
	 AzZM8Ha8JYrgEQVX3rvSETBj8CZGDXN2eGr+iW+hnyRgqx1Rze0MY452pWSRKghgQu
	 7cjY9gdO1mwInCsE6xZjbMG8NQOBfowhWcBtEctqqHJhg+cYDRGAZoVYCgCyz8yHxC
	 0Dr4X/S5Wm3D1HhznhD4moZDv4BBKbLXKec5uZrZO6oyTtg7uJK4WVqMkTg3fipgYE
	 v7NloAuTt4AYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
References: <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-iface: set continuous rates
Message-Id: <172773159468.2197048.15947948691093286494.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:34 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_142638_552483_0170D41B 
X-CRM114-Status: GOOD (  12.98  )
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

On Fri, 20 Sep 2024 19:22:05 +0200, Jerome Brunet wrote:
> The axg TDM HW does not depend on a selected set of rates.
> The hardware itself, just takes an input clock and work with it, regardless
> of its rate. In this way, the rates TDM can take are continuous.
> 
> What might force the use of specific rate are the PLL available as clock
> and/or the codecs facing the TDM HW. Either way, this constraint does not
> belong in the TDM interface driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-iface: set continuous rates
      commit: 3a02cc576accdccb22ffd2d6ac1f9788c7b4c7ce

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
