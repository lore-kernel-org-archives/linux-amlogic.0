Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD5DEE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5LFXBi2v1PNkOG/CFEIgway3bDg2rRmjJEeUrJBNLM=; b=YwMR5l6zDrrRyB
	1gwWccfwjWtfFaOvxoH5RG0b5w9vFoW2PCUE5b+re6PDDj1+UwHUSM0CbPeZuLBTYmwSFpKE6Fbu+
	v/UGQfL4vInPXGRaTGutXegJPoh8hwy8DhKoY+9XEedK9LwmySyKnYd/atrGTggj9gEK+JcS2s8xw
	G9VxJOEFIgOpV8ZxIXJ8rVJaqaOhFHRjGJpb+xyjGpZRTPvsSh0WMVf2AmLkwNQjAgLtxGqQMqyza
	ESdlGcorM07aPlvbG07+9lsu0kEcnQ0qLToQ2w+9qWAYf6cdQvswS4tIpD9J91NCLekzzBOag3NPo
	+mZ1uEidGFf+PQj8ycsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiVu-000p20-1F;
	Mon, 11 Sep 2023 15:07:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfiVr-000p1M-2F
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C56FF61122;
	Mon, 11 Sep 2023 15:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9EFEC433CA;
	Mon, 11 Sep 2023 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694444862;
	bh=V/6hBx5mfx0fd3CGt05eTAr9zX0uhJnhj4yOo8q7jvg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GpTK2/sRNv5OM0TZC09QCDJ+z89ykEEW0HzWjtUQQQyDMbUAlotSUgO3hDmQms3mC
	 SjHNXCrzzH3pciauKJw+s6l2epY5XBuDMYEjF8WWilN+uhJJtdvn1MroneBHbJikO9
	 ewk5EM+L8Kn2cZI1+UBtOJK6H5sJ76fg2iEmUh+H421I4e2ywu6oVxJQP67AiuWDuF
	 IMh11Tx5q4HozD4yYj9J3IhfxRKmfivF6zQKuRP6hdo40cIrnZTkynN0lxhBVL94NC
	 t73StKrOtJSZL5ROTYjSKz8v62D/aAEB7UiJurIMUmXXFYTL4zoZOG59zI+8qGN6VA
	 fBcSaSQjbXlYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230907090504.12700-1-jbrunet@baylibre.com>
References: <20230907090504.12700-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: spdifin: start hw on dai probe
Message-Id: <169444486047.1851820.2260771441651865260.b4-ty@kernel.org>
Date: Mon, 11 Sep 2023 16:07:40 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_080743_794083_22A3A109 
X-CRM114-Status: GOOD (  10.26  )
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

On Thu, 07 Sep 2023 11:05:04 +0200, Jerome Brunet wrote:
> For spdif input to report the locked rate correctly, even when no capture
> is running, the HW and reference clock must be started as soon as
> the dai is probed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: spdifin: start hw on dai probe
      commit: aedf323b66b2b875137422ecb7d2525179759076

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
