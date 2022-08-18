Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B89C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 14:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7uAU8DKu0JipyEY/BBFY8v01iUE9XaBUCU+BheU1QV0=; b=OWzx1AHH81EN54
	di7prfjaWcQOwWDNFBVZ3KQMb4SOydiHJgskh6/Y/TdBzGZtIL3HtEJbvlgmDQKVyzm9m4o6stAPp
	ktZjFrdPmNizKDGXRNxcjlkEe80Ok0+eQLmAuR/jd9BmVWv+V93vmEq9cEtKT8us5m/hk6O2X+PVK
	IHN8DqKKDYR5oXHllOPLGbxH0RggHBQzGoM+58pFkeZPb1Rzpuz8yXf3nzfA2h68lewVOVbbFEM4V
	o7kWOr2BlRoYaMn+2U5DicBZIuW1xi3XBE2cS/WZhnS5GlORW9P3dHId+dsGahET/9Gz7kid+Goel
	NXkD1WzB6IBtHeCORqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgOb-005zTB-FD; Thu, 18 Aug 2022 14:21:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOg60-005oiU-Kq; Thu, 18 Aug 2022 14:02:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CC0CDB821A9;
	Thu, 18 Aug 2022 14:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F081C433D6;
	Thu, 18 Aug 2022 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660831321;
	bh=X5DsdljwcA5Tyg1NxEYQreLfQopZHf/UbXzUkOS92bc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bl3nBR6RS2+BfzxqoZDCbEKHrp+AnAJ56oPp22ZyvWRA5EpBtpF9zsf4OH+vftyKL
	 laLIZ+cZUehW0ubWQJ7KGgWjuOmWD1UohDsQtt19uMEojUKuS86tgdDukUk8TzObdn
	 4iGlLlTAwQw73STOhV3kB25p2xH2QnelPLXAFbpO/f26EMO26i++tDVQ9eI1VB4i/t
	 1/8SrA2E4W3IK7DNEE8cDLkuzVEUNeupqUfcvwvmgWzSZs4eCFzmXTZovOtMx0lrW4
	 cgba0+gEbdIshly2On6gQzRuW62SFeUVjuvUuqEvg5HFX12WoQBB8stZQdGo9aHYlM
	 nbvYXwqRgOBeg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Nuno Sá <nuno.sa@analog.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Miaoqian Lin <linmq006@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Johan Hovold <johan+linaro@kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alexandru Tachici <alexandru.tachici@analog.com>, linux-doc@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonas Karlman <jonas@kwiboo.se>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-iio@vger.kernel.org, Robert Foss <robert.foss@linaro.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jean Delvare <jdelvare@suse.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Aswath Govindraju <a-govindraju@ti.com>,
 linux-amlogic@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-clk@vger.kernel.org,
 Alexandru Ardelean <aardelean@deviqon.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <cover.1660292316.git.mazziesaccount@gmail.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-Id: <166083131403.91659.16911525815673537629.b4-ty@kernel.org>
Date: Thu, 18 Aug 2022 15:01:54 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_070205_067184_47C9F966 
X-CRM114-Status: GOOD (  15.91  )
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

[2/7] regulator: Add devm helpers for get and enable
      commit: da279e6965b3838e99e5c0ab8f76b87bf86b31a5

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
