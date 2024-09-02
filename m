Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C675CD13CF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 10:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOXOvBBldQWNafWIvDMWKccF/vwP9C3kLxpmLVCL6Do=; b=QoSmJgDuKVklPE
	wF3NotJM0VEjjMoCqs+w5grUFMusbxUOCARYlTBOziZNFUhcCBLfHkXt22dT3SFIQ0IvHY52v74x+
	Ie9rQd6n3MVFqBoHLI3AE9Jnc27SZcZ87+PuhjRUVD3iavCPUBL9b0W2+0WZG5UbTI/VC+rbD/l9M
	giU8MgKBRbORBTcBskZZQIQ485oxK0/HuDwsqR0Y9VLGapoLzr4vzj5s1uze7LOmyS+TCpo8vbxOC
	gPSGwHlf/5Fl6ai/FRKR3+cqPiChNsNaiV6MXIVH3pHB31QC1vwgM0V8+REW69NO5VLkFFk+hYRep
	dn2CyDASp0ckN90+YmNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4Tg-0000000DxIu-1IDc;
	Mon, 02 Sep 2024 10:40:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4Td-0000000DxHw-2a9G
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Sep 2024 10:40:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Tb-0003TF-PN; Mon, 02 Sep 2024 12:40:03 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Tb-004smZ-Bp; Mon, 02 Sep 2024 12:40:03 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sl4Tb-000hZg-0w;
	Mon, 02 Sep 2024 12:40:03 +0200
Message-ID: <e99c50a2200247abc2df570d3b6bc03d3954fb7d.camel@pengutronix.de>
Subject: Re: [PATCH v3 8/9] reset: amlogic: split the device core and
 platform probe
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd
 <sboyd@kernel.org>,  linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Date: Mon, 02 Sep 2024 12:40:03 +0200
In-Reply-To: <1jbk16s7oo.fsf@starbuckisacylon.baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
	 <20240808102742.4095904-9-jbrunet@baylibre.com>
	 <812c6ddc-1929-46c4-bac7-4bd0f5ccc213@linaro.org>
	 <1jsev0wj8y.fsf@starbuckisacylon.baylibre.com>
	 <34bc2d1ceef7bcab3d9b78de588e996c2d2ecdd3.camel@pengutronix.de>
	 <1jbk16s7oo.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_034005_673380_B376A6FD 
X-CRM114-Status: GOOD (  21.76  )
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

On Mo, 2024-09-02 at 11:53 +0200, Jerome Brunet wrote:
> On Mon 02 Sep 2024 at 11:47, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Mo, 2024-08-19 at 18:49 +0200, Jerome Brunet wrote:
> > > On Mon 19 Aug 2024 at 18:33, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > > 
> > > > On 08/08/2024 12:27, Jerome Brunet wrote:
> > > > > To prepare the addition of the auxiliary device support, split
> > > > > out the device core function from the probe of the platform device.
> > > > > The device core function will be common to both the platform and
> > > > > auxiliary
> > > > > driver.
> > > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > > ---
> > > > >   drivers/reset/amlogic/Kconfig                 |  10 +-
> > > > >   drivers/reset/amlogic/Makefile                |   3 +-
> > > > >   .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
> > > > >   drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
> > > > 
> > > > Are we still in 1983 ?
> > > 
> > > I don't quite get that remark or how it is helping the review.
> > > 
> > > > please use reset-meson-platform and drop pltf completely
> > > 
> > > You are requesting auxiliary -> aux on the patch.
> > > So which one will it be ?
> > 
> > I would prefer to drop the -pltf suffix completely and also to drop the
> > "reset driver" -> "reset platform driver" documentation changes.
> 
> Hi Philipp,
> 
> I'm not sure what you mean with the last documentation bit ? Could you add some
> details, I'd like to get the next version right.

Of course, sorry for being vague. I've replied to the patch with some
comments.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
