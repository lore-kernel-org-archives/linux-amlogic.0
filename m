Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA183C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 13:34:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A5760FE3
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 13:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0A5760FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVjZ97WlR6h0d2nVZixiTbtTaWTo99TrMW9CE/mFptg=; b=GCx2sEaoixcKzX
	71ylH9euWLHO5yGP0HkyVVgdvPxvpBxosHbfJVER9QlG/mA4Qi4Ghb4ECqj++6abUGOJ4/D7g1JBr
	rt0avpLQKt74czkbWKXmaMTcgOeFAtuUjla/CsMxnntroj+c77RRZo/Utmh7CepnfUi95blWvFWcM
	x+7RK5TYCoEttMlEZLselcoOmCQBva4HNCp/GSL4tx4hhfHZQJXsnzMMJi2mJKSTMPQsUbdmaRoIu
	OR836QKT+QQpTcpfEgLICUOt2fKWmPLGm7Y/n/Kucv2al1xxFVxfl4AfLgTh795BoxpRtm5OxdNIp
	30RqCaANjR263vNpzocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meHAQ-00CohC-CS; Sat, 23 Oct 2021 13:34:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meHAN-00Cogq-JY
 for linux-amlogic@lists.infradead.org; Sat, 23 Oct 2021 13:34:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AFFB6101B;
 Sat, 23 Oct 2021 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634996071;
 bh=xLPxRUzLKQ4rn5/2l6LyXgKNELhYzrPv2Oduj7+M1JQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XRXRSbS5cQz7qDmckPaA0wjEtyZ1TjMo6Ge9Br3KQC207cx7SJurnQdQjwVG5f29C
 8zpWGe36Qk6lAjBexiSZtE9SZeZVVvXgRnSeXSg9jZcJrjKyF/Dc0PB9MT9NUn6Fau
 2e28BLqdenG6Nry9CcLi8BlIHqjs3vhqhcaJ2eTeOmTGV9IlF6EEFNt649STZwwS81
 YPzkYHLuLxYUlbrYB6xbNmgxMtsfpw+nfa1HyaWWZrgN/+lgyr5LrybIyixyZOjC4e
 djNODggOPvdQ0UzYn5laHt6JOaqcnBi5cNDxu3WiN4VAP/+TFjZU9v9jJMSMqtKP+j
 cbfPICzRbHzhA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ASoC: meson: axg: fix TDM channel order sync
Date: Sat, 23 Oct 2021 14:34:25 +0100
Message-Id: <163499605422.842779.12859165358802966225.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020114217.133153-1-jbrunet@baylibre.com>
References: <20211020114217.133153-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_063431_715809_BD16419C 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, 20 Oct 2021 13:42:15 +0200, Jerome Brunet wrote:
> On the Amlogic AXG series, the TODDR FIFO may get out of sync with the TDM
> decoder if the decoder is started before the FIFO. The channel appears
> shifted in memory in an unpredictable way.
> 
> To fix this, the trick is to start the FIFO before the TDM decoder. This
> way the FIFO is already waiting when the 1st channel is produced and it is
> correctly placed in memory.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: meson: axg-card: make links nonatomic
      commit: e138233e56e9829e65b6293887063a1a3ccb2d68
[2/2] ASoC: meson: axg-tdm-interface: manage formatters in trigger
      commit: bf5e4887eeddb48480568466536aa08ec7f179a5

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
