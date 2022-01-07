Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4488FC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnZ/l0Qi8UHyPHEi7bGO24kUxL7uvNQM41tXbi9Ahsc=; b=Zx6EFu7YkNC6g+
	ghpfdoMg3kC2M2eAKRuHMVLlwXKZXMszeGoi1qcnTWFvQEbbwOadcFn2F7M8yvR+rnfKsqm+Bnvu6
	OtKmau5l1kjPjV3W2o8AdOeFvIP6qH+ur4zuwzX9pouGoXDn13MlZrgXtSIHfYdYRSmwXiS+zyvD4
	aWkOL9Xqo5e/XQ6wVCgDenWYLCwsABuNaAUjKwbQfskESTHK7yLq6OCkJCj5qqsWN8t+spaRXGeJL
	8kwEZLlVDnuMwMO/+bgIy4Eww8srkbrm13pq7ao0ev815pfJroWoBX7QwBqtZjAmLPKinIev2CUAV
	oqdHHAUKXWbRRfE3E0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qJ3-004CSE-G9; Fri, 07 Jan 2022 14:33:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qJ0-004CQo-KF; Fri, 07 Jan 2022 14:33:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 280BD61F04;
 Fri,  7 Jan 2022 14:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F979C36AE0;
 Fri,  7 Jan 2022 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641566001;
 bh=Eph8sqgV5sdpwR5dgEulgL6dC/4txofb6JyaHjVOvEE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hxuHQUOBXSHsYmSrM2Zjp1XQt0v9f1ayP7oAtcFi+2AI8Q+NtNJRpO8lwKP2J9D/d
 dgcDEEA7QttrnJZxqUh9ERERdAolPRkMD4mx42Q02oIZJQ7G64U5hJyPe1jzR/ggC0
 P9iOCAzN9UVX7bo4FbyueOaiYNKYFdWe512SuZuL0SeMvBzSQJ/yQDcSXjfpU9ogab
 1MBuHLxVbzRnYq31zg+3FivA2Og4lDt1EFfQUZQ6+s3ee9IjM6y2843+J2kNhr4vWx
 BTWQz2xVJsj2uGcAPi8pC8pJQZ3UrxhVokiFIqIy86DceOuxZo/J+nPyqindLUb854
 snn4ueNAM8O6A==
From: Mark Brown <broonie@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: linux-spi@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20220107075424.7774-1-linmq006@gmail.com>
References: <20220107075424.7774-1-linmq006@gmail.com>
Subject: Re: [PATCH] spi: spi-meson-spifc: Add missing pm_runtime_disable() in
 meson_spifc_probe
Message-Id: <164156599935.2077509.18070348001401229585.b4-ty@kernel.org>
Date: Fri, 07 Jan 2022 14:33:19 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_063322_734987_5586F11F 
X-CRM114-Status: GOOD (  11.70  )
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

On Fri, 7 Jan 2022 07:54:24 +0000, Miaoqian Lin wrote:
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
> Add missing pm_runtime_disable() for meson_spifc_probe.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-meson-spifc: Add missing pm_runtime_disable() in meson_spifc_probe
      commit: 69c1b87516e327a60b39f96b778fe683259408bf

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
