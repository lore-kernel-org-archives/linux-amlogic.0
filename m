Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC359C47097
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89304613EE
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89304613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UT+6l9VAkyR5lKmaButfJ53bg4w+dnqXv2qK2jpdc5Y=; b=iZnp+IyJ/to29b
	cDKLioaJYG4b8D/HUM+7tsds9Qd1mVMZVkrYkxACpgPASxz/6lQ7/CM6HRWvrqiD9UmBKFbgRaM7Q
	nqNsaV7AXPbHI/xhTDQRyUdbyzSKqE4K7j4kfv8JhZymRPU8ex1Dkb+fJJFQqhvLD+ba3d1HAwfiq
	pvfY9YAw35NMkPWpY7PW+2ce9zlZP27iZbVaybikHWaVMDnDZz7wPk7j1jog56HcckgeURxQ4GGk8
	yEqNZLwfMsBYjXh+fxkQXLADs4YZxLvrb0S9TmFBPev4BWBzOtBRlFUsQsb4tHbd08yKJp7YMfvna
	Jlbj5up7akfGn7847X2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1losJD-00AEae-Vy; Thu, 03 Jun 2021 18:43:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1losIt-00AESL-9G
 for linux-amlogic@lists.infradead.org; Thu, 03 Jun 2021 18:42:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53EEB613F6;
 Thu,  3 Jun 2021 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745770;
 bh=QX2fUiCiUmkxlGVHfxkr10DT8U2SkzWtLEr1gPbhSJI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P/yoLykbA2nbCiCPzNXK5wuNLtsWUWwzswOFPDtigEoGBh919yhCp5x/Fxn86U0KU
 C2Om9LQzx6vdrWoHWCcVcxLKIjfuOhrscbhTrwKJIILodx9mLI4x7ZR41lMjrlmGAo
 xGwur70iBcThRy4us3by+zZ7UkI0tWISZq6ivvVYnCvYBsSZeUCuDkIk99VS3FKXiI
 E3DoWJYF2dLclCqPv+A6qGo3v5+jt0yvuXEl7TJeOLwW1+5/aqBIYCyayajqTP8f/W
 OAqdC+w9OnUmge4auSIjBj66YZjpMuB/qhWovoHfSA5kDRfxAPQk7UQWVftM/Lxnxm
 tzhICfRiwbsig==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: meson: gx-card: fix sound-dai dt schema
Date: Thu,  3 Jun 2021 19:41:57 +0100
Message-Id: <162274557551.14795.13902548000738010349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210524093448.357140-1-jbrunet@baylibre.com>
References: <20210524093448.357140-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_114251_372587_0CA785AD 
X-CRM114-Status: GOOD (  11.98  )
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

On Mon, 24 May 2021 11:34:48 +0200, Jerome Brunet wrote:
> There is a fair amount of warnings when running 'make dtbs_check' with
> amlogic,gx-sound-card.yaml.
> 
> Ex:
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
> arch/arm64/boot/dts/amlogic/meson-gxm-q200.dt.yaml: sound: dai-link-0:sound-dai:0: [66, 0, 0] is too long
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: gx-card: fix sound-dai dt schema
      commit: d031d99b02eaf7363c33f5b27b38086cc8104082

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
