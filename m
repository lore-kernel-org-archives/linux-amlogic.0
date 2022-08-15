Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA982C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxeqFLn+d78Vy2s4e4vJUY00N6AxBOGrDybMqWgEkU8=; b=ldgv6updUBuhcp
	5XEptuwI9mEVJych7BLTOyEaXyYO0dI1CVcW1x8aViv/MdhDYElsuY4Ex6Yi4UDZTTkPMxSf11S5l
	Kbuvc6me4hpEBlE8QvNvAYF4W/J/BKA26s56uTfDn1bzlY+xPmzJChUwzKgdC0Lt4pwLKfVDFaKoQ
	haiMeGd1OEkl376oUA72jDLjTHi91qB9Xwq+2xYxjKxS2D8err3yS3eS+vmTf7HJpK4Iswkrl7B8e
	cEvqFur1RiKa9jlZE8U9O8g/kDKeYB19nm013jzNFNVJVvD1t+2pwgbTGS2OIOHiaaBVcNLkx3S3j
	vDBR3wI0guc+busUAn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcS1-001A6e-32; Mon, 15 Aug 2022 15:56:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcGz-0012DZ-Pm; Mon, 15 Aug 2022 15:45:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 3598ACE1138;
	Mon, 15 Aug 2022 15:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D75C433B5;
	Mon, 15 Aug 2022 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660578291;
	bh=0cDp9g/DZRNyVyG0xcXbePrDhYuvBMojyZXBHZyUY9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l6IQ1sWU9IPna9cOCYEFqB0HqZ5nlQHnoLXXa0NrRXBVAq8kHLEdH09q01143ONW4
	 7jugllPQkwHCLzVFMmlwxzTbLH0tpat3RU3o7lxO3fDLBffpbLcShNuxNMXLBMqvkP
	 cA7HQxaYo0V77Wq8V4LHRdibXl07pS0KmWCXeNhfkRBWPr2KTxmw67LQ2hwjTBvxWt
	 MaoRevor5ccbGpasSuPro0ZMP6XihJePD6cFSDeDv+3Nuok5rgI8Njr5XuEUTikogP
	 DeuqxKzZgzli+SyyQayzL3zxJCdUoAzLvsNdHXC8aE/WWWu5usxSihNquHZpBkA68s
	 9aKEx8WUVVfUA==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: dri-devel@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonathan Cameron <jic23@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Miaoqian Lin <linmq006@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Alexandru Tachici <alexandru.tachici@analog.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Stephen Boyd <sboyd@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jean Delvare <jdelvare@suse.com>, Alexandru Ardelean <aardelean@deviqon.com>, linux-hwmon@vger.kernel.org,
 linux-clk@vger.kernel.org, Nuno Sá <nuno.sa@analog.com>, Robert Foss <robert.foss@linaro.org>,
 Aswath Govindraju <a-govindraju@ti.com>, David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
In-Reply-To: <cover.1660292316.git.mazziesaccount@gmail.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-Id: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 16:44:44 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_084502_344894_45308CE6 
X-CRM114-Status: GOOD (  15.95  )
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

On Fri, 12 Aug 2022 13:08:17 +0300, Matti Vaittinen wrote:
> Devm helpers for regulator get and enable
> 
> First patch in the series is actually just a simple documentation fix
> which could be taken in as it is now.
> 
> A few* drivers seem to use pattern demonstrated by pseudocode:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/7] docs: devres: regulator: Add missing devm_* functions to devres.rst
      commit: 9b6744f60b6b47bc0757a1955adb4d2c3ab22e13
[2/7] regulator: Add devm helpers for get and enable
      (no commit info)

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
