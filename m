Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B07BC4727F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 19:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE75020773
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 19:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdgRv55y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSJg7BXk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE75020773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtCWiMefv7HAMG3SBv+qy4mlBeSgJtXktHgZbbdjAxw=; b=NdgRv55yipfErUyyZjFPTq6dqB
	S8XY6AMch5RFMEeNp2Cnb3TAROfdixkdQ6+XhPXdne4nYD1E2YvYqYD/c1Px5tX7qi6JBQWItl01a
	+USNTa85LbDc13amoYzpSzsdvF9cw+vOODIhSe9azkRCJ4d4nVmGdCoapJNNV5Blxw6dl8vAZPIdS
	MfiUUa5H+w7eGlQ9SgnhG0QSdyrXOhV3J1U0G5E9oNBHboBbZY8XfLsPMlwzoopHfRGrfM4TS6al1
	5BuhSOvFLzH994wiu93kqdEFz0Cb35/8dTNVyaS6ie/8dwhqupV8/6m64gUcrbz/ry0FfZ4xWHiml
	2ICSYB9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMywi-0006Nx-7d; Mon, 28 Sep 2020 19:36:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMywg-0006ND-7G; Mon, 28 Sep 2020 19:36:23 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D39D2075F;
 Mon, 28 Sep 2020 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321780;
 bh=X+U7EekVVRNsGlr/phtz445aMUi09ZRhF69ImwLNLwc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MSJg7BXkVstJd9vEovsX824VHx5efOh2soe6NlPya2/aNU3Wc3OtyqBFwvECyCPua
 kUi8a23q4fCBu2VgEALElrnnXdhdIZWj/cHHL6OpzjwAEjLtK3yrynoHIRx/xkJWXh
 qlrSnak79xvF5ea0WZw11p7XzwmQGQMaoBfCsNic=
Date: Mon, 28 Sep 2020 20:35:23 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-Id: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_153622_330689_29BAEA3B 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: linux-ide@vger.kernel.org, Valdis Klētnieks <valdis.kletnieks@vt.edu>, David Lechner <david@lechnology.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-block@vger.kernel.org, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, drbd-dev@lists.linbit.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 27 Sep 2020 21:12:10 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.
> 
> Coccinelle ensures that braces are added as needed when a single-statement
> branch turns into a multi-statement one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: debugfs: use semicolons rather than commas to separate statements
      commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

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
