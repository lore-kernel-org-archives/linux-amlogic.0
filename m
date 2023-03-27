Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B576FC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yh0AI9AvuH5QJLY9tyijMuXDGQSTc5jOxh8WMLiHTog=; b=OurIZB5P5o0dLk
	3F69iWfZF8/7QBdUDLOL/s+J/ObFMByfKIwL4+hUQqkV95xzpuTPXWOS4Q1gF4OdeOoIK00ZcKQN/
	xwkuuJYp9FZMq9FFI9dgEdO+0qEV3vsYzmi43hZxxeKy0Qa+ISuO+nk3Zaf4YIiWGtvzLFCyp0+yN
	/VKubsiJhi6Cc4o+Wqa8JUJaJHCreOiM9e10xNjBGjSLQ4ZzMmyCj8jbBMWXYM2UN1jD7ourgI9K/
	EpFQt82OLs9v5nfrziThEhfm3RFNUXEDj6pksjXvNX/mJLGt78RDNlheszXLULUgRs4zTWP5FnEVu
	cicJ3X7xFPqwDEKa7Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnzy-00BLcP-2g;
	Mon, 27 Mar 2023 14:39:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnzv-00BLbJ-2l;
	Mon, 27 Mar 2023 14:39:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 83CF061291;
	Mon, 27 Mar 2023 14:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC74C433D2;
	Mon, 27 Mar 2023 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679927937;
	bh=jGbljjZ6sYKW+hsa5vD5FzntKFGqn2nf7NT5nxgonnQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jhgI7ezSTUi1ScYCNYo154omb7+Pe8JrT6VuOZ+Np5p4z7gGxcUJlw0TunGvqB2kn
	 CYQzMJZp7QTZnIULs2sUqNcTRmLk80lh+SRiJ3LVTxjL7RXo2V79denL3GuTltFgTe
	 2CgrtU5FEvIXj1gP790yNMDB3LJKYOoMDSB7KVMmqK3EC13KPwkJ7P+xWXUgLtJ2Dx
	 UrQZspoBfFlNELRz03lc2vWscyn/BiluW5Tv5R27cDbX4I2Lhe466x038cZbw+vnyX
	 5tbT818ScrWzBXy+rOP0Fn3kkznO4XBqlAvV/Zart9tWGKe/cDllSWrUYlGZ1WJCyM
	 Z2sXsBkMFlMCA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
References: <8dab942d6ce47657a9c038295959be80bb2ee09e.1679834598.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: meson: Use the devm_clk_get_optional() helper
Message-Id: <167992793479.3167684.14938651737373308205.b4-ty@kernel.org>
Date: Mon, 27 Mar 2023 15:38:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-2eb1a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_073859_953103_D4A44397 
X-CRM114-Status: GOOD (  11.60  )
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

On Sun, 26 Mar 2023 14:43:38 +0200, Christophe JAILLET wrote:
> Use devm_clk_get_optional() instead of hand writing it.
> This saves some loC and improves the semantic.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: Use the devm_clk_get_optional() helper
      commit: 65d4d7259bfec376b6b1483b4fe4058a5ba2259b

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
