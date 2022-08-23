Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D125EC32772
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Aug 2022 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxY9tg0gZ7NTbL3tVtABl1gBOsToFseglGwl3Mw/XkU=; b=kqEfUj9yGc8M2n
	vP6LDA78sQr+xXuPgBerf+h765iD1qzCoq9uGsZUP48G0PrZ98FVQBeFYkcJjt8OD2Fe0rqXkIbUQ
	UM8RHJRB9vU5NBXI85N75AR30Mygm+DV0naK/vDZqvuE1xeui5ZPawfxqo+FSjH17fiMteBR+b6tM
	EiKQe+N1tVLsyZLXM5EMeCII+DW14FZMLYO1LsSkyjZ5NC/lk9JUCtwTlwg1rMH+bjOETQU7pvIoI
	0/fw2a2abHHsUmJyjQwdb4EcRJ55yEyLffA4xv8mYkGjYRk5+K9GFh/jgSkj7FCnWzJMOxoHKpoJt
	rfxFgiQMOTc/YNpTwyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYz9-008I7h-Rn; Tue, 23 Aug 2022 18:50:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYyt-008Hk4-Ml; Tue, 23 Aug 2022 18:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 358DB6171B;
	Tue, 23 Aug 2022 18:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01422C433C1;
	Tue, 23 Aug 2022 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280629;
	bh=nmKhuu0H6Ctnqky5A5KnLiUKuE2JCD8f4yeVBOb27DY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S+VkSR1lDtb3OUe5P9NME+KHmd4RosTBmqROo6DCvQltfgWMqXQG7Ie0M/UB4XHI/
	 r73QsNGJ5oE7EmD1xjwOvWTqHWYpRfc024xt/P1gM0c2blZAKiviqdKyNFAvuy32nU
	 xDNUizqGh3SfKJyyPqGJ1AlrWQndx8G224V5HWsBA100tCQhf+Twwy8CDB0ah+a6nm
	 2i+P90YtBt1FHUWsmqOuhZC4AOefDVGtyesAYYy9WbD/44Y0WqvflVHA8vwc7hKfFV
	 LGaZtsfIbKqI4FdZWpiNlir5zkowA80vbXDZtxX4ITLJXav4Uw+Dx9IuvfjWH1bIEf
	 6cHtR3wmfaPUg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Miaoqian Lin <linmq006@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Nuno Sá <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Peter Rosin <peda@axentia.se>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Xiang wangx <wangxiang@cdjrlc.com>, dri-devel@lists.freedesktop.org, Alexandru Ardelean <aardelean@deviqon.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <robert.foss@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Alexandru Tachici <alexandru.tachici@analog.com>,
 linux-clk@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>, Alexandru Lazar <alazar@startmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Lars-Peter Clausen <lars@metafoo.de>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-iio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <cover.1660934107.git.mazziesaccount@gmail.com>
References: <cover.1660934107.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v3 00/14] Use devm helpers for regulator get and enable
Message-Id: <166128062169.1031899.17830320984922202786.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:21 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_115031_859925_EE1F66DB 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, 19 Aug 2022 22:16:48 +0300, Matti Vaittinen wrote:
> Use devm helpers for regulator get and enable
> 
> NOTE: The series depends on commit
> ee94aff2628b ("Devm helpers for regulator get and enable")
> which currently sits in Mark's regulator/for-next
> 
> A few* drivers seem to pattern demonstrated by pseudocode:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/14] docs: devres: regulator: Add new get_enable functions to devres.rst
        commit: 9048b9912f767ea9609e520678def446af804771

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
