Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01865C48BF6
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 19:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5NJdlacN/XkQFMms9BnP7Cr4J1TshGzl056g25NZ5k=; b=Sn84G5YXxqAa24
	60uAhGdB0FbJTZcmHfvOUaPw30wLJLCoq7q98tHoruJLr1Pnf2YqOdlpoBVcq8ZjKWJ0b8uEfx/GT
	uq1fJ7n132cd2Js+2W4pp/kSvDv2pwwVX7KQOPK045uhoZtJwVRv+ECgooBrgyTgWQ6RWXGbQfDYn
	L3Z1i5y7lmagZMuviR3pMp+PKChcIPWzUsJzXbPbTewGFb3MPpis2nAnrP7MPa8SO/hDYuDoVT1UB
	/v4TNLlu+WI3ccvoZ5VoXmk+JT2QfmxrFF3DBR0R3Ou5GDnWdK6NMUl2ddyhiXJZtSMZCCh6/nfM3
	fdAYK0RcBsMXzPxcySdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regeM-00000002O0k-1SmN;
	Mon, 26 Feb 2024 19:28:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1regeJ-00000002Nz1-24B7
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 19:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7406ECE0451;
	Mon, 26 Feb 2024 19:28:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AB5C43390;
	Mon, 26 Feb 2024 19:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708975704;
	bh=w09eVwNl/udBZSm14ewjIAURwXfKkMekAoVbB7ELkK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XDn2P28FvP1BUb8/iHdXPrLLEU/UcXEvXdDNNArcIcqJZmopOzPChOLnkKiKAUbz+
	 CEO/zV216e0VjFSo1EC1Rr1j1BQwwcmRzHnCSefgLLFUvsFX93B7tWb2h5owJ7cvzP
	 C5fIRWg6+iD1/GsiKk6BG3mPMXvi42pwxqZoV/C6QUwMODC2pEdR5WfKDUD3VkgWHU
	 YvWaPutNbMJ/zAab0RAZp8eczvG8dfWNQ3srVwb92OgjuNdZNzoLm6YKSFVUgPQaOO
	 eOUaH8+EmPDYO8gVQK7cxttQtpmXlit5AvbP8uGv0FX4g74BbZBBj+7nIbCRiMI6ij
	 pQV0W0w4n4olw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/6] ASoC: meson: axg fixes and clean-up
Message-Id: <170897570345.121037.4947854271427341182.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:28:23 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_112827_767342_B2540DE0 
X-CRM114-Status: GOOD (  11.16  )
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

On Fri, 23 Feb 2024 18:51:06 +0100, Jerome Brunet wrote:
> This are various fixes and clean up gathered while working on Amlogic audio
> support. These help better handle higher and unusual clock configuration
> for TDM, SPDIF or PDM.
> 
> Jerome Brunet (6):
>   ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
>   ASoC: meson: axg-tdm-interface: add frame rate constraint
>   ASoC: meson: axg-tdm-interface: update error format error traces
>   ASoC: meson: axg-spdifin: use max width for rate detection
>   ASoC: meson: axg-fifo: take continuous rates
>   ASoC: meson: axg-fifo: use FIELD helpers
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: meson: axg-tdm-interface: fix mclk setup without mclk-fs
      commit: e3741a8d28a1137f8b19ae6f3d6e3be69a454a0a
[2/6] ASoC: meson: axg-tdm-interface: add frame rate constraint
      commit: 59c6a3a43b221cc2a211181b1298e43b2c2df782
[3/6] ASoC: meson: axg-tdm-interface: update error format error traces
      commit: 48bbec092e4cf2fe1d3f81a889ec176e83aee695
[4/6] ASoC: meson: axg-spdifin: use max width for rate detection
      commit: a2417b6c0f9c3cc914c88face9abd6e9b9d76c00
[5/6] ASoC: meson: axg-fifo: take continuous rates
      commit: 8b410b3c46128f1eee78f1182731b84d9d2e79ef
[6/6] ASoC: meson: axg-fifo: use FIELD helpers
      (no commit info)

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
