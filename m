Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676FDC2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 17:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17UcCDvpwrNA9ThInuSTEn7XpKQYKmWo1OocBttjGFg=; b=Hq6aw3LaRAwml+
	CkbPKf9Dub4T8Gmu15QMxQJg1OsANvCdFbVrEwBqag3ktjJ1WmHfcNOJZa3iZ7/aslr5azaY6gpMi
	zVohQQ9CZpt+ouKvKOgFyH4r7ElKwl+osM8IVlk2V3jfThGyGpJ/+o1xPm2coSii2F5q62E0MoFkq
	GioYb9BDjtwC3FyAGI/+P49kDGA+m+SDvDg+WxkVHnvmP2mracczOk8hlrpXOMOKiBBkoxmp8Crwl
	HBYbzHFydLcXd7PICwnzljUIsCWW/F6GqmGHh7U7NlzcfTOqONRA7kslRtzrDfdufQlV00yL1cqnV
	GIE14CBORaMDnTXPxUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNF3y-0000000ESO1-0uy7;
	Fri, 28 Jun 2024 17:07:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNF3u-0000000ESN8-3Csj
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 17:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 033B06211B;
	Fri, 28 Jun 2024 17:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D947AC116B1;
	Fri, 28 Jun 2024 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719594421;
	bh=1RFinm/cPZYC9mpxmSXlKDXt3LLEft9BIYps8Te54Xo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B8K04298o2v0tFF0KY1zlUqG1QWe2B38/9UUfJwyAswB+gdI4+ROcnDz9Q98mh6Ih
	 VMP0+BYNNHiwbY0uEQkuqbzyDCa4UtG7DJb+c9hiNFWRZUFrBmiCJsPNfeaBZY6Jhi
	 0bWv1X4fWRBLeoerfR61nRl9FHqaAIIKiQzqAyBzAuKSzAHbIQSIAnIEigRY4jqOWY
	 SK1zJg5KDgnRg8j86iPFthSCh8yS9lE/W6QLN2IXPLoaEANISF8Dw2MqI5drwyMWEQ
	 bm9X545hcSi1TmXsqOPDJPEben9/qm276GrWZJlobRNjtnVFz3/eqBbujaQ7oG1kzh
	 uDzs/MCGziMFQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240628123256.2019224-1-jbrunet@baylibre.com>
References: <20240628123256.2019224-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: tdm: add sample rate support up to 768kHz
Message-Id: <171959441961.130075.4855510935970492560.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 18:06:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-d4707
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_100702_912007_B8DA77F6 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On Fri, 28 Jun 2024 14:32:54 +0200, Jerome Brunet wrote:
> Add support for 705.6kHz and 768kHz sample rates
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: tdm: add sample rate support up to 768kHz
      commit: 730674b21db12be6ea6b3034c618de5d7a16987d

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
