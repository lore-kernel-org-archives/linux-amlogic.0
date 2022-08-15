Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B77C25B0E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Aug 2022 20:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAjOeb3QhLddB9RyXFEwgNl/fb3vwk4M30k6POirc9Y=; b=o345a7qU4bd3v8
	xd7KtczXEHQJgyh5kQY2JWsG6ebVFxFm6g1fZGQUvk6UIFHWCyo4G5ol1oAMFtHHFxln8Pal0kX1t
	RKQZkDpNhOBNt7yc719NozPUHWEvK+F4sFPIJV4XfMHdWjiqD2Kscm78ZaRqn93z45A8CbZ2M69jy
	GjpyNRcnD1uj5ln8svxGzYVeG0ocKbKXfWghh3RpmKDJPwLsmHViegNrJvx7iaqXMcA/2L7KOLMqy
	Qpra0YkJmnENN6YCGHWJAD5CYsCdwGF7LFLd3MACW45OrFTyOT42HFPjD6YSUxsM4osgfKS/qCemV
	e9pxrtQiPiCHlZOwOVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNhAu-005FK3-Ig; Mon, 15 Aug 2022 20:59:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNhAq-005FBE-Jt; Mon, 15 Aug 2022 20:59:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91C08B811BE;
	Mon, 15 Aug 2022 20:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308B1C433D6;
	Mon, 15 Aug 2022 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660597137;
	bh=P12qdTrR/mo6a+68fRbwwR4HzHO3gQf0fab4VOnBYgI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BcsIiow7hvM6mlGnKs9wh7ZNo2tlc/huKm2krV8jvy09DrS5X70XXaode4XGPfimB
	 oIiJ+10bBwXDKsn5AbMelcUhpMOWN2/rU3AxHTJeWEodJRtJ3ubT5keZ3PbCd1hYrQ
	 DRTuL3P+/cj8v7Zs5y6I2kiDvUu6ezkXlmk6ePkmeyDMXUj1w1YTacEYoloze0OBOa
	 nOUelwRoboaZyN2aMfvd3uTosB6wQr9Lw5Mxt1a/87W3S1wZCp39lL6lu4k296IxCM
	 Q3SeeLM+vl6MYUK3MqwQgB1RuCzKtXb/n/RUO+gjRl5Tklq4D0IgZdSZlwdWhpsMCY
	 EWQsEDwVk9dPw==
MIME-Version: 1.0
In-Reply-To: <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com> <166057828406.697572.228317501909350108.b4-ty@kernel.org> <YvpsRbguMXn74GhR@pendragon.ideasonboard.com> <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, dri-devel@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, Miaoqian Lin <linmq006@gmail.com>, linux-arm-kernel@lists.infradead.org, Alexandru Tachici <alexandru.tachici@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turq
 uette <mturquette@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jean Delvare <jdelvare@suse.com>, Alexandru Ardelean <aardelean@deviqon.com>, linux-hwmon@vger.kernel.org, linux-clk@vger.kernel.org, Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>, Robert Foss <robert.foss@linaro.org>, Aswath Govindraju <a-govindraju@ti.com>, David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mark Brown <broonie@kernel.org>
Date: Mon, 15 Aug 2022 13:58:55 -0700
User-Agent: alot/0.10
Message-Id: <20220815205857.308B1C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_135901_032464_B8ABC24D 
X-CRM114-Status: GOOD (  52.81  )
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

Quoting Laurent Pinchart (2022-08-15 11:52:36)
> Hi Mark,
> 
> On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:
> > On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:
> > 
> > > - With devres, you don't have full control over the order in which
> > >   resources will be released, which means that you can't control the
> > >   power off sequence, in particular if it needs to be sequenced with
> > >   GPIOs and clocks. That's not a concern for all drivers, but this API
> > >   will creep in in places where it shouldn't be used, driver authours
> > >   should really pay attention to power management and not live with the
> > >   false impression that everything will be handled automatically for
> > >   them. In the worst cases, an incorrect power off sequence could lead
> > >   to hardware damage.

I think the main issue is that platform drivers are being asked to do
too much. We've put the burden on platform driver authors to intimately
understand how their devices are integrated, and as we all know they're
not very interested in these details because they already have a hard
time to write a driver just to make their latest gizmo whir. Throw in
power management and you get these wrappers that try to compartmentalize
power management logic away from the main part of the driver that's
plugging into the driver subsystem because the SoC integration logic is
constantly changing but the device core isn't.

We need to enhance the platform bus layer to make it SoC aware when the
platform device is inside an SoC, or "board" aware when the device lives
outside of an SoC, i.e. it's a discrete IC. The bus layer should manage
power state transitions for the platform devices, and the platform
drivers should only be able to request runtime power/performance state
changes through device PM APIs (dev_pm_*). If this can all be done
through genpds then it sounds great. We may need to write some generic
code for discrete ICs that enables regulators and then clks before
muxing out pins or something like that. Obviously, I don't have all the
details figured out.

The basic idea is that drivers should be focused on what they're
driving, not navigating the (sometimes) complex integration that's
taking place around them. When a device driver probe function is called
the device should already be powered on. When the driver is
removed/unbound, the power should be removed after the driver's remove
function is called. We're only going to be able to solve the power
sequencing and ordering problem by taking away power control and
sequencing from drivers.

> > 
> > I basically agree with these concerns which is why I was only happy with
> > this API when Matti suggested doing it in a way that meant that the
> > callers are unable to access the regulator at runtime, this means that
> > if anyone wants to do any kind of management of the power state outside
> > of probe and remove they are forced to convert to the full fat APIs.
> > The general ordering concern with devm is that the free happens too late
> > but for the most part this isn't such a concern with regulators, they
> > might have delayed power off anyway due to sharing - it's no worse than
> > memory allocation AFAICT.  Given all the other APIs using devm it's
> > probably going to end up fixing some bugs.
> > 
> > For sequencing I'm not convinced it's much worse than the bulk API is
> > anyway, and practically speaking I expect most devices that have
> > problems here will also need more control over power anyway - it's
> > certainly the common case that hardware has pretty basic requirements
> > and is fairly tolerant.
> 
> I'm not extremely concerned here at the moment, as power should be the
> last thing to be turned off, after clocks and reset signals. As clocks
> and GPIOs will still be controlled manually in the driver .remove()
> function, it means that power will go last, which should be fine.
> However, should a devm_clk_get_enable() or similar function be

This API is implemented now.

> implemented, we'll run into trouble. Supplying active high input signals
> to a device that is not powered can lead to latch-up, which tends to
> only manifest after a statistically significant number of occurrences of
> the condition, and can slowly damage the hardware over time. This is a
> real concern as it will typically not be caught during early
> development. I think we would still be better off with requiring drivers
> to manually handle powering off the device until we provide a mechanism
> that can do so safely in an automated way.

Can you describe the error scenario further? I think it's driver author
error that would lead to getting and enabling the regulator after
getting and enabling a clk that drives out a clock signal on some pins
that aren't powered yet. I'm not sure that's all that much easier to do
with these sorts of devm APIs, but if it is then I'm concerned.

> 
> > > - Powering regulators on at probe time and leaving them on is a very bad
> > >   practice from a power management point of view, and should really be
> > >   discouraged. Adding convenience helpers to make this easy is the wrong
> > >   message, we should instead push driver authors to implement proper
> > >   runtime PM.
> > 
> > The stick simply isn't working here as far as I can see.
> 
> Do you think there's no way we can get it to work, instead of giving up
> and adding an API that goes in the wrong direction ? :-( I'll give a
> talk about the dangers of devm_* at the kernel summit, this is something
> I can mention to raise awareness of the issue among maintainers,
> hopefully leading to improvements through better reviews.
> 

I agree with Mark, the stick isn't working. We discussed these exact
same issues for years with the devm clk get APIs. Search the archives.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
