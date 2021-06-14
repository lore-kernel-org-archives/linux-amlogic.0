Return-Path: <SRS0=Jm29=LI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01F1C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 19:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B9B8611CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jun 2021 19:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B9B8611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lg10DUDVa3BWv8/mhi7SHgkR+E+tsNwbUXM5DTr595Q=; b=Fb8D+Fr0Aq6Tul
	EsqjV9Qlumwb1FAJvxJ10ZVYDsvluX0WlSwVZoI3N/APNyUKrnMCAtngYkzGPgkD79amLQ+eNLNM9
	NZSb/JqcLzig+00GS/s7YEfwwIDIkPTeuCcjmJnpyClYb3vwIuIrHFELF9HwdU1Xmb6oHjvsntFlA
	fCVMoYnpmQ6V6m7WdV2Q087w4oC/5zXpU+Uw3UTH4HUdIJutgUC40DgQCEbtvoLvOHot2Eq4S/xzo
	r+za5/FKKdRu22NDMySZdvH4F9JXPOM5ybODiB+VEQBEfr4+ifIK9fF0hi4W7ItxtyXzjiRmjFjB9
	GB8PbgiLQd1B57sgsx/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lssfB-00FxLv-8F; Mon, 14 Jun 2021 19:54:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lssf5-00FxJ4-1D; Mon, 14 Jun 2021 19:54:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2886C61246;
 Mon, 14 Jun 2021 19:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623700458;
 bh=lXE4ojg3vZj00rQa1Ur3m9EtSTs5cJ9y0Aq2+yVMsFQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BGr52i6SQTs4RQitog0bgHqDGHFM6c915vC6lqKr6Tu2zBYG4P5SvTYu2oEOqLH/n
 Q6g2gl6jHIUzHS1jIp9RzkEYENknJX6no2Ahduz6n4CO7yjJdeY5NL/3mVlRblQWpg
 nQa66e7nEvZ+kuKWvnYKJfxXme1xaFWwUBLE2p7nZ0LrhsM52y8HAmOrBQ6OXDhZk6
 CTKUCyDIlwOqdA1iA8qPcl3ts4hXOogMEpWHE97cxuMx9iU8YTaJa3rSFqxKsTImZi
 31I9QnzKIsY7HwRnFLZIdR/kZaZ+OxFmIB4KvYeJnCnAWNh4NH2tq7qCWK1WpmyRdf
 pE4kVqd1vH6gg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-spi@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, zpershuai <zpershuai@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] spi: meson-spicc: fix a wrong goto jump for
 avoiding memory leak.
Date: Mon, 14 Jun 2021 20:53:31 +0100
Message-Id: <162370043178.40904.8100844708897155437.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1623562172-22056-1-git-send-email-zpershuai@gmail.com>
References: <1623562172-22056-1-git-send-email-zpershuai@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_125419_108394_5181DBBA 
X-CRM114-Status: UNSURE (   9.89  )
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

On Sun, 13 Jun 2021 13:29:32 +0800, zpershuai wrote:
> In meson_spifc_probe function, when enable the device pclk clock is
> error, it should use clk_disable_unprepare to release the core clock.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: meson-spicc: fix a wrong goto jump for avoiding memory leak.
      commit: 95730d5eb73170a6d225a9998c478be273598634

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
