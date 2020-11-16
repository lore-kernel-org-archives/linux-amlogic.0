Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E57DC388F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 23:34:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D306C24654
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 23:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XrichlBk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlvKzOhl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D306C24654
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BMOY7zX6J6tdR8Sa9tJ+ctBLLnc7tnqw31ITVoiF1R8=; b=XrichlBkW+EcfhaNKM+B+j/hQ
	dl5sF3KoBIfcxYw96mo3R6NSCwVJN38YeJc27Id/jv9eCm6j+mit0S5aZQPqytTJoLa5wHpVqojiZ
	s3Nt0qYc6wHGgiqKyYp86jsBd8D5uWq4xxiecTnHGcLpNZiAA5SfXCGIu6/iqfu4bUMYk20Zthg+z
	RwGXkGI8QWVIVuQcj86VvxX5bnZsFneaE/mjzOO6h5bdOhKCtteU2CYMkp33942GnVLFpiSK/6zZV
	EqK/zZJ649ofzM+eagN/NrzzGyVBSnw5qmIQQSgvoPBszzuBJUqFXnOjTR3OaOoAQWPg0ml0zVfkX
	2QR2micEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keo0P-0005Ar-HE; Mon, 16 Nov 2020 23:33:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keo0N-0005AD-8B
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 23:33:52 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7491822280;
 Mon, 16 Nov 2020 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569630;
 bh=lG8vjtafSwJlzpTe4ZWzO3xTe2KC9KSe1kymL1F6xJo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JlvKzOhlcrAT+uQ0LdSTp/rSUQoUXnPxaf0cJ3Bqu40UHuJVjP8qQpoMkmuwF3Q4f
 sla8xzK9k705EWOb6rMqXtHlYAwVmFXSFv1kGdT0WuVJWxoOQRn2EoA00j6E3QZy05
 SQSalKDIKfH3CXMc85AXKBnZBwByPKw7jXvo2YGU=
Date: Mon, 16 Nov 2020 23:33:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20201116172423.546855-1-jbrunet@baylibre.com>
References: <20201116172423.546855-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: fix COMPILE_TEST error
Message-Id: <160556956525.29683.11005029623520003708.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_183351_438054_EC2E94FE 
X-CRM114-Status: GOOD (  14.93  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 16 Nov 2020 18:24:23 +0100, Jerome Brunet wrote:
> When compiled with CONFIG_HAVE_CLK, the kernel need to get provider for the
> clock API. This is usually selected by the platform and the sound drivers
> should not really care about this. However COMPILE_TEST is special and the
> platform required may not have been selected, leading to this type of
> error:
> 
> > aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: fix COMPILE_TEST error
      commit: 299fe9937dbd1a4d9a1da6a2b6f222298534ca57

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
