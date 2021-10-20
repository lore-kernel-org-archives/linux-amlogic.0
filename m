Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2B2C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36FB61354
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 11:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D36FB61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QG7Nk4bTsSnNlizjKGbFHSHeAxC4ZZt6U/GcG0QCFb8=; b=TM7tiF30hmOvdZ
	6zz79YskftROnr67kksmKLql9S3YzXtceWiiWfGEyvoK7grx68gSQIEPXTiH8vxWIAKmbdJjeECue
	MkhfIo0sSjBdHJ1lx+P1gEZJe9GrWAIWxNVXrokSNYaenjXCHc3gyvQWl4o9l5nklEda/+ceqUdcm
	IIhWWVlYZ0im62ApQppwMdS/yAk3O/4R2BbCq//6+b0n/8Rgsh5SiQfIpuONmQ0o0CEis9C2JhBYR
	jgBUh5lOiZQGtYlW/muV4lb99lveLjY4KBDYEf154+ozbwbn+Ds79yhpOBvVk7NFOGj0L99fi5PJC
	0ZPFY2g5Ti7t4GDIy8Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md9mA-004ISZ-9t; Wed, 20 Oct 2021 11:28:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md9m7-004IR5-Ft; Wed, 20 Oct 2021 11:28:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B39FA61359;
 Wed, 20 Oct 2021 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634729329;
 bh=Hc5cuk9glDaRbaSAq4FdX0qHDgJuvg1tQjkipEezNvM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LZF5Rfu3GUprtBYrB0BU2YZ4eiM3rLK3Jig8bOQm5cQ3FghfMbGuEB0HiI3mjDEL7
 HcI92HqOvIYR+xyeSL+cWhNkp3RjFLDOowqPlkUO3yWnehhLcwcU9KykqucYUPLXm8
 t37If7zQ/usbfxpBS+fK1PU2bjFJ9Dju4VQX6u0DnmtyiP/kzXYER6BTYInbKQCqWI
 Kp6FzguBtH7sH/PW9v75AiutVwbLb4GQefEqmsUQ8NMVvICf+mOSRai/GDSxoCSB4A
 4ixMHcXIa6D+V67GUnqNFJCeBCAooaizOZZUT6UXeokfbMx6+j6kBjbjDs7ZF6aVtT
 pEXW/S7NDTcKw==
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Matthias Reichl <hias@horus.com>
Subject: Re: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Wed, 20 Oct 2021 12:28:36 +0100
Message-Id: <163472931364.2896549.2043578112545946668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211017160028.23318-1-christianshewitt@gmail.com>
References: <20211017160028.23318-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_042851_569803_00E1C73F 
X-CRM114-Status: GOOD (  10.27  )
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

On Sun, 17 Oct 2021 16:00:28 +0000, Christian Hewitt wrote:
> Implement driver_name to provide an alternative to card_name for userspace
> configuration of Amlogic audio cards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: implement driver_name for snd_soc_card in meson-card-utils
      commit: bc387887ae22d6ed6439e83968b5be3443a8e57d

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
