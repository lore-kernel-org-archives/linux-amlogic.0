Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D92C76188
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9Xpc/r7a/fEi5go1VzZJkYwTfi3NIrTAj3MXNMP50E=; b=m4M/XIL/+zOyE8
	LlyRq1KYQV+3Dl9u7WRKqhZsMheuuYthqxcLuZscS4+uJo6oQoSKLVadzp/pTID4U4mjU9L07AbxC
	l34hTvsaVBUvWTYn4g+kUwWpmRmdmqebnmHILdGUVF0nkFdz9wYRQW1IlyQuUa3uKmKLj7NzXBEy3
	JQB872h6Pyyo1Q/KWBngA99jjoOIW/v4vzprDUMHTppiPT1SOWuNBmqfuUCwQmNE/oCXcr1Amcf+R
	tbd/7BZqPyI8jIhnTdayPWI7bI/EfCVt4gDAJHypp8cVQoT4UU0AiTbqWdYhs945K6hzryPIr3JPX
	/PpjvkC2jBU5130/NkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQCY-00GUZb-0p;
	Mon, 03 Apr 2023 19:50:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQCU-00GUXY-2S;
	Mon, 03 Apr 2023 19:50:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3E30762944;
	Mon,  3 Apr 2023 19:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83EEC4339B;
	Mon,  3 Apr 2023 19:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1680551445;
	bh=lOZoZur0dlMwg23s/E6ookGvEsUZzxEjsaf7n78uxD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEBMvaSDo6Kx3uTTuk0gcIjpmL+QxmtvplsE3iV+Yad8oVUuYckRsG32R0nXIl7RF
	 df7SulQgWa+RfGcINl7HL+vcKeBJS6LuhRgnjoJDfbS2hMh3ZIjZ5Daw8Yc0FSZbkY
	 koEdBw32GguOTg412wDd6ymUfsqZp5iBNOEaSJDk=
Date: Mon, 3 Apr 2023 21:50:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Deepak R Varma <drv@mailo.com>, Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>,
	Sven Van Asbroeck <TheSven73@gmail.com>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Marc Dietrich <marvin24@gmx.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	linux-staging@lists.linux.dev, kernel@pengutronix.de,
	greybus-dev@lists.linaro.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 00/24] staging: Convert to platform remove callback
 returning void
Message-ID: <2023040305-drudge-scorer-b59c@gregkh>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_125046_899262_42D1001D 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Apr 03, 2023 at 05:39:50PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this series adapts the platform drivers below drivers/staging to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields a resource leak.
> =

> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> =

> All drivers in staging already return zero in their remove callback, so
> they can be trivially converted.
> =

> The changes to the individual drivers are all orthogonal. If I need to
> resend some patches because of some review feedback, I'd like to only
> send the patches that actually needed changes, so please pick up the
> remaining patches that don't need changing to reduce the amount of mail.

Note, I can't take drivers/staging/media/ patches, those go through the
v4l maintainer's tree.  So I've taken the non-media patches from this
series now.

thanks,

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
