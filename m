Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE27C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA9520838
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 22:28:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y4J/XwMX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WzaL/zUJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA9520838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLE+e2U+5AQpk7z9H03PFrUz/dNz6pUuPoxL46DfTIw=; b=y4J/XwMXp09VeVQiCCjDYAl3cq
	krbwiDYAOiN0C9lVRS9Mvaeg3C0JDSLnSKFcC4En7uIzif2plAFAzFa8aXsNy3HiCiv5bCt7+k0lF
	1Pf1fULSIWvvlA6yySwMITSb3x+UFZSyFMtdXU6ciPD2Phbq7kz2ymK8F/1uzEO0fDTjGYxFA2x5V
	dtYccH9ZYXb8WkrTBkpf/Zc/gwCGXRJKlkrd/QdsiKfZnwQPP+RcK3YYfR74/O7KW8ZER1hxex1n9
	3vD4A8NUrC7PlPuKdhTO8JBNAHRB0tHNb+qQjfHcOUhJN60bs41f4EIhIghE8b5K0w76xBsLX47+j
	goQ6DgeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1H2I-0004hG-P4; Thu, 30 Jul 2020 22:28:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1H2D-0004fL-Kb
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 22:28:23 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23CBD20829;
 Thu, 30 Jul 2020 22:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148100;
 bh=oCtQbMc0yIjwTyoUHceGAsyCS/EgZDfLbcmV5WPOPq0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WzaL/zUJErKB3SDcOhK2ZY2fXDqKFTF5FjgwwZn6aP1IpBFKKvuCcgIiZVnarVC5k
 K3PjnyLsLJJtnuTmWVgq3kb2WjdUC5p26skGiZX5BmQpXsgswCRAwA7VrJam5ojv37
 EuoKoYOjT06TXuX+cxfnzVDVi10I4G5TwNlYRUh4=
Date: Thu, 30 Jul 2020 23:28:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200729154456.1983396-1-jbrunet@baylibre.com>
References: <20200729154456.1983396-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/4] ASoC: meson: tdm fixes
Message-Id: <159614804534.1473.9918282900203412134.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_182821_898424_4A4F1557 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jul 2020 17:44:52 +0200, Jerome Brunet wrote:
> This patcheset is collection of fixes for the TDM input and output the
> axg audio architecture. Its fixes:
>  - slave mode format setting
>  - g12 and sm1 skew offset
>  - tdm clock inversion
>  - standard daifmt props names which don't require a specific prefix
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: axg-tdm-interface: fix link fmt setup
      commit: 6878ba91ce84f7a07887a0615af70f969508839f
[2/4] ASoC: meson: axg-tdmin: fix g12a skew
      commit: 80a254394fcfe55450b0351da298ca7231889219
[3/4] ASoC: meson: axg-tdm-formatters: fix sclk inversion
      commit: 0d3f01dcdc234001f979a0af0b6b31cb9f25b6c1
[4/4] ASoC: meson: cards: remove DT_PREFIX for standard daifmt properties
      commit: e44815a295a50027a9953f3ef62827d14631b96b

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
