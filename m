Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62602C47DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jan 2024 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRQoQfnXOyGv3PBOIVtiUEDO1RENKOMZsqx5o/fqEjI=; b=WunymF57p9pxyS
	BbGRwViPv8+6ojehndckfnPaq4Zm4ZsW5PxLK7H2U5KDRg/izjxhBLbkbh0Z2Uzsp+ZdcQpgNeXxy
	RZxWW7pX9AKX/1zUq8KGKOmgdD7fxElOg+kBOGfRAjd0v5HYTvEdRDnMB/owpfwZ7DjWZDl4+lTc2
	CPfk7F3qUuzLD17dncdW5TNgHAISkh4So1Gegbu8OJdQfWN1mjWXSw2uP87DzPPr2mwlEPQB9+zFU
	2D9COLEnzTo4e/9GXR9KjsNO5aTVh/0EjlRzuiI6sNS5Co0LCDbgSab7z+EM+EU4gqbRhA6FMejdt
	CRiIqcX72nibMgtwxUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS1AV-00E5d1-38;
	Mon, 22 Jan 2024 20:45:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS1AS-00E5ZT-1P
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Jan 2024 20:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EC2961A8A;
	Mon, 22 Jan 2024 20:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B5C43394;
	Mon, 22 Jan 2024 20:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705956281;
	bh=dt5C1IAu6gWee39W5ANHJTbSfbM7H6/2F0kZ9c8AxPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N9XOiQN5vt0NGWHxNtRbl73Z2V5PcnE36LQA7oJz6wqXDOWsCo15Yk6o8RCaleRRa
	 dGkrQSUIaZ/po8iaAYm5AmeCqMYSIypJ3FjWbZuVGQ0A0bauE5mVdJiDe95nnFC0je
	 arepL7QdE753biMbtMpcreuEzfHseSJ3xOXAxWTaTCIhwQek8wEm+luNoH5CIsJcLJ
	 IcFrYv9Ai2o4NmlQTVeso/DsUXo8DFkLre1gBuhaw8tUpVinVHlz5sAZNl7rae/8tl
	 //EgDEN3m0871eIrkTPJS8HAD3W4f3P5xokBcEY+xIbIw8HHhEweLPtmgdhH0smgAB
	 Ty9jZdXM1KhrQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
In-Reply-To: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
References: <20240113224628.377993-1-martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v2 0/3] regulator: pwm-regulator: Fixes for
 disabled PWMs at boot
Message-Id: <170595627996.145638.15681759676659435096.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 20:44:39 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_124516_512698_15EC42D1 
X-CRM114-Status: GOOD (  15.84  )
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

On Sat, 13 Jan 2024 23:46:25 +0100, Martin Blumenstingl wrote:
> This is the second version of an attempt to fix booting mainline Linux
> on Meson8b Odroid-C1.
> This series is an update to an RFC patch that I sent some time ago [0]
> and incorporates a lot of the feedback from that v1.
> 
> The main changes since v1 [0] are:
> - new patch checking the voltage limits in pwm_regulator_get_voltage()
> - updated calculation for disabled regulators in+
>   pwm_regulator_get_voltage() utilizing above limit checking
> - new pwm_regulator_init_boot_on() to preserve the output voltage when
>   pwm_regulator_enable() later enables the PWM output without and
>   preceding pwm_regulator_set_voltage().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: pwm-regulator: Add validity checks in continuous .get_voltage
      commit: c92688cac239794e4a1d976afa5203a4d3a2ac0e
[2/3] regulator: pwm-regulator: Calculate the output voltage for disabled PWMs
      commit: 6a7d11efd6915d80a025f2a0be4ae09d797b91ec
[3/3] regulator: pwm-regulator: Manage boot-on with disabled PWM channels
      commit: b3cbdcc191819b75c04178142e2d0d4c668f68c0

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
