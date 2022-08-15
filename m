Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CE3C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZXCR5BosPJEzdgiczAs/hkTcUJor4Qw5vdeokwDJBAA=; b=ZmXBwrTJfuj52g
	k+PqAIE0pfxjJ1jTnKohv309a0yQ28fNHJtmaVgjHjYFca7wTVlrhbF4HGTnkhPwfjNPywFM11oa/
	G3SQsGK4cJtzh92adFCrB/oMBcp2bSKVkunA3glITBzp4OyWkPOHW+KHPh+0SvCFJlfUIPaLXOJRs
	ezuEiZ9QSA/q9bZD4LYmUBbqwANdH4swQPzkMbf/TqralnpJ6LxmEpLwalGvSfcMqEIMxkmWpNRfn
	+SSTKxQg4rbW7qpVFVCwHp10n5TVlrL1DVZvTMTCQGiOsdisrbBrH0rPxDEwv43JlS7DoBJz5BfiK
	mpcnJkJV1KXXHoV8FqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcZz-001GLp-RQ; Mon, 15 Aug 2022 16:04:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcQj-0019D4-M1; Mon, 15 Aug 2022 15:55:08 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26F5656D;
	Mon, 15 Aug 2022 17:54:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1660578899;
	bh=S8j7GbNbq17SRBvgGdMvUVVVDhDYQu28yqUMRIme4pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkMqLgeA3Hlou6eQxDNwuj/cAMOGRuZWf6psOJwAoE+lkqdgWTBYLUFWFiFmirC11
	 MV/sX2S9rJ9pHMvTFjbnnwFQbUhcqWxVXtYbPHGpZY4nQn8qmWU8YDavgsBevmlt5n
	 2eecXKodkdAhl5/HdCyGSGest6FWKhs5flNo+vq8=
Date: Mon, 15 Aug 2022 18:54:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	dri-devel@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>,
	Stephen Boyd <sboyd@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	linux-hwmon@vger.kernel.org, linux-clk@vger.kernel.org,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Robert Foss <robert.foss@linaro.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_085505_938118_021DFF0A 
X-CRM114-Status: GOOD (  24.60  )
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

On Mon, Aug 15, 2022 at 04:44:44PM +0100, Mark Brown wrote:
> On Fri, 12 Aug 2022 13:08:17 +0300, Matti Vaittinen wrote:
> > Devm helpers for regulator get and enable
> > 
> > First patch in the series is actually just a simple documentation fix
> > which could be taken in as it is now.
> > 
> > A few* drivers seem to use pattern demonstrated by pseudocode:
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/7] docs: devres: regulator: Add missing devm_* functions to devres.rst
>       commit: 9b6744f60b6b47bc0757a1955adb4d2c3ab22e13
> [2/7] regulator: Add devm helpers for get and enable
>       (no commit info)

I didn't have time to reply to the series yet, but I think this isn't a
great idea. There are two issues:

- With devres, you don't have full control over the order in which
  resources will be released, which means that you can't control the
  power off sequence, in particular if it needs to be sequenced with
  GPIOs and clocks. That's not a concern for all drivers, but this API
  will creep in in places where it shouldn't be used, driver authours
  should really pay attention to power management and not live with the
  false impression that everything will be handled automatically for
  them. In the worst cases, an incorrect power off sequence could lead
  to hardware damage.

- Powering regulators on at probe time and leaving them on is a very bad
  practice from a power management point of view, and should really be
  discouraged. Adding convenience helpers to make this easy is the wrong
  message, we should instead push driver authors to implement proper
  runtime PM.

> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
