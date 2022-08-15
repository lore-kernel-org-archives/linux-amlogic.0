Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C59C00140
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHWDr59iNwIAlxLgDLjZvcUtU9qvqcZSNPJcqhqKIYU=; b=X2W7cBcq3CBmE5
	ZLCaMNweBrTFVJz/WBFLvR4fXcDnJMF8g3rorWK/zBCZl0dtFuwM7W51nxTCqye14k7j3OQor492R
	IFISj8fH0Qwoo3FvmTyxnoeDXss/wN2f6W2pkDdXjHFetw416cNZzipTATX97d9Nwm5alp1x4L0Qw
	251wkNPnJKWcRiR8xDTluXMWoLlOTZ4w9oC9rG7g2IgNcOWVy1+snJwekS7O53RHm1eSJBv6UlgX5
	qzudfBRprZ1gmQvuyFvRn5BUdEB4mSYTGg6tXOMJd8DaH85U8ycR4jm7wic9QQu8HQ592abL6uv6g
	1XDjXNMmSVgc3SC7EM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfHF-003ZnY-Dt; Mon, 15 Aug 2022 18:57:29 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfCs-003V3a-6b; Mon, 15 Aug 2022 18:53:00 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D64BA4A8;
	Mon, 15 Aug 2022 20:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1660589570;
	bh=+NuBkTND3XJbe0x6qRQNdw6++aFzQI/aMn3RnRA3zuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxMsg4+lyXFAsJ1KdT0hv1rtWamZv86bDDoAocHocIP068XeNYqDfhnhTZWb/jCJq
	 /GqhI/f+i8J4E/VuECQ2mxJPVlkMLJnUwis4hFyasXRjpdu9E0tQyvtIMuBbVtbyQm
	 6dqLB3c4hn+OofwgiIyK1grU1/FJaTXy7oV2RphU=
Date: Mon, 15 Aug 2022 21:52:36 +0300
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
Message-ID: <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_115258_635099_C1386693 
X-CRM114-Status: GOOD (  32.17  )
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

Hi Mark,

On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:
> On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:
> 
> > - With devres, you don't have full control over the order in which
> >   resources will be released, which means that you can't control the
> >   power off sequence, in particular if it needs to be sequenced with
> >   GPIOs and clocks. That's not a concern for all drivers, but this API
> >   will creep in in places where it shouldn't be used, driver authours
> >   should really pay attention to power management and not live with the
> >   false impression that everything will be handled automatically for
> >   them. In the worst cases, an incorrect power off sequence could lead
> >   to hardware damage.
> 
> I basically agree with these concerns which is why I was only happy with
> this API when Matti suggested doing it in a way that meant that the
> callers are unable to access the regulator at runtime, this means that
> if anyone wants to do any kind of management of the power state outside
> of probe and remove they are forced to convert to the full fat APIs.
> The general ordering concern with devm is that the free happens too late
> but for the most part this isn't such a concern with regulators, they
> might have delayed power off anyway due to sharing - it's no worse than
> memory allocation AFAICT.  Given all the other APIs using devm it's
> probably going to end up fixing some bugs.
> 
> For sequencing I'm not convinced it's much worse than the bulk API is
> anyway, and practically speaking I expect most devices that have
> problems here will also need more control over power anyway - it's
> certainly the common case that hardware has pretty basic requirements
> and is fairly tolerant.

I'm not extremely concerned here at the moment, as power should be the
last thing to be turned off, after clocks and reset signals. As clocks
and GPIOs will still be controlled manually in the driver .remove()
function, it means that power will go last, which should be fine.
However, should a devm_clk_get_enable() or similar function be
implemented, we'll run into trouble. Supplying active high input signals
to a device that is not powered can lead to latch-up, which tends to
only manifest after a statistically significant number of occurrences of
the condition, and can slowly damage the hardware over time. This is a
real concern as it will typically not be caught during early
development. I think we would still be better off with requiring drivers
to manually handle powering off the device until we provide a mechanism
that can do so safely in an automated way.

> > - Powering regulators on at probe time and leaving them on is a very bad
> >   practice from a power management point of view, and should really be
> >   discouraged. Adding convenience helpers to make this easy is the wrong
> >   message, we should instead push driver authors to implement proper
> >   runtime PM.
> 
> The stick simply isn't working here as far as I can see.

Do you think there's no way we can get it to work, instead of giving up
and adding an API that goes in the wrong direction ? :-( I'll give a
talk about the dangers of devm_* at the kernel summit, this is something
I can mention to raise awareness of the issue among maintainers,
hopefully leading to improvements through better reviews.

-- 
Regards,

Laurent Pinchart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
