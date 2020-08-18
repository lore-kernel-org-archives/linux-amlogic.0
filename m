Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48F92C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 16:54:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1683D20825
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 16:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obphDsK5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iun5+gKm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1683D20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1j6Wj9BD3qVgvNQcXGirYk56R4XsoUxUHu40U/Hp4qw=; b=obphDsK58TYIidknJwq2XiaVTj
	+3Mnw0zVFNkYl7MF5HtuoukSzJR0UJpHJjfHMnt2E9afOXTt/C99xWF3NBT+JjqK1v8sFZJnoWbhw
	ImlJUtzYH26Cc18szd3vrWO7mGO04sTjWiynsUJBYRNA4/fuMN3HwspH3MdGjuui55wHov4M5Q+Be
	5TJxUl4AyjYHgYszjmFwa44rKhW/3IcsFzaYAdDuUI1CzpzWxWZjP5z1ByjEml9/3QWUdJOWJINSr
	QoG1v21WSS75Q/EjMduWjxO4FiZFMMf9wT88NCnFJj2vMiT8c/pS90qVX5ux3YyZHKTMHG+EaIlEi
	RQaR8+Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84sW-0001wj-Pu; Tue, 18 Aug 2020 16:54:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84sT-0001wE-VU
 for linux-amlogic@lists.infradead.org; Tue, 18 Aug 2020 16:54:26 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B60E8207D3;
 Tue, 18 Aug 2020 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769665;
 bh=o+F/8MUlDhT4G3FDAIPoSIgrE0yLotwO8+CXdKAqBY4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Iun5+gKm4tPHsYcb3nSxK4BbBKAPkse89tlznPIX2KkHyqObmvaMLTz4PfHnSx3+F
 20m03IEQPtSeFQM7/ReUzHtGAGduJgD4sgNaLM1VBVY1RzirlzilPhaeRaORIeSSPC
 i9GNDLJcxnjGdEqdGhQNt3tCLGoomN+q2euB43Vw=
Date: Tue, 18 Aug 2020 17:53:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
In-Reply-To: <20200801100257.22658-1-stephan@gerhold.net>
References: <20200801100257.22658-1-stephan@gerhold.net>
Subject: Re: [PATCH 1/3] ASoC: core: Add common helper to parse aux devs from
 device tree
Message-Id: <159776961932.56094.9628533027830690530.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_125426_107319_40D560F9 
X-CRM114-Status: GOOD (  14.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 1 Aug 2020 12:02:55 +0200, Stephan Gerhold wrote:
> simple-card.c and meson-card-utils.c use pretty much the same
> helper function to parse auxiliary devices from the device tree.
> 
> Make it easier for other drivers to parse these from the device tree
> as well by adding a shared helper function to soc-core.c.
> 
> snd_soc_of_parse_aux_devs() is pretty much a copy of
> meson_card_add_aux_devices() from meson-card-utils.c
> with two minor changes:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: core: Add common helper to parse aux devs from device tree
      commit: 1ae0965dc21698ba41638c95b5478779f3c4a9e4
[2/3] ASoC: simple-card: Use snd_soc_of_parse_aux_devs()
      commit: d9ffff696c5b468ba5a4ddb2cbc05c9e4dd4b2d1
[3/3] ASoC: meson: Use snd_soc_of_parse_aux_devs()
      commit: 6bc37d32f630363b68059e3fa854383e6abf171e

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
