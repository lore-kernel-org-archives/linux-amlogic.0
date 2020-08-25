Return-Path: <SRS0=/aBW=CD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA94C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 10:20:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA192068F
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Aug 2020 10:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2MIKSJYS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA192068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EU2SC2ukht+ARiN///UIjImiggG1erMctA5zbbOPeaU=; b=2MIKSJYSDmv4vCWmWhd3FzLyL
	r0c7d/gpJF5LfTYXA06hwcD7e/0HrQcS6U59uwJlAi8cPgVVZtqQ6Hn9ztXzqWbkZGe4fQqrLDxo/
	hVMCWzFy0NxdYS68ydx6U4jfEr2Uwn84e9VKmeIbf54GZmKWOUe2IvsrjlvKgsVOGnta9/9hMkAdy
	zEZp4xxgv3t5uTFuV2CbeqXs4JWUmC3BBGoY+13Rmx63kGF4OMh6cRxiTluF2GGYdG5CRmHfQ53hG
	IH8+I43nOHasRyaoEmpS5O+wCtklx99H6/e7i2mvTUy6NymSLRufcmdSSRnqgkogki69/aBVNcxip
	gyky0nvQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAW40-0003D7-CJ; Tue, 25 Aug 2020 10:20:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAW3x-00030y-MW
 for linux-amlogic@lists.infradead.org; Tue, 25 Aug 2020 10:20:22 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kAW3t-0006GL-Lu; Tue, 25 Aug 2020 12:20:17 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kAW3s-0004LY-Mg; Tue, 25 Aug 2020 12:20:16 +0200
Message-ID: <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Dan Robertson
 <dan@dlrobertson.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Date: Tue, 25 Aug 2020 12:20:16 +0200
In-Reply-To: <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_062021_795008_69F3449F 
X-CRM114-Status: GOOD (  24.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 aouledameur@baylibre.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
[...]
> In practice, I think your proposition would work since the drivers
> sharing this USB reset line are likely to be probed/suspended/resumed at
> the same time but ...
> 
> If we imagine a situation where 2 device share a reset line, 1 go in
> suspend, the other does not - if the first device as control of the
> reset, it could trigger it and break the 2nd device. Same goes for
> probe/remove()
> 
> I agree it could be seen as unlikely but leaving such race condition
> open looks dangerous to me.

You are right, this is not good enough.

> > Is this something that would be feasible for your combination of
> > drivers? Otherwise it is be unclear to me under which condition a driver
> > should be allowed to call the proposed reset_control_clear().
> 
> I was thinking of reset_control_clear() as the counter part of
> reset_control_reset().

I'm not particularly fond of reset_control_clear as a name, because it
is very close to "clearing a reset bit" which usually would deassert a
reset line (or the inverse).

> When a reset_control_reset() has been called once, "triggered_count" is
> incremented which signals that the ressource under the reset is
> "in_use" and the reset should not be done again.

"triggered_count" would then have to be renamed to something like
"trigger_requested_count", or "use_count". I wonder it might be possible
to merge this with "deassert_count" as they'd share the same semantics
(while the count is > 0, the reset line must stay deasserted).

> reset_control_clear()
> would be the way to state that the ressource is no longer used and, that
> from the caller perspective, the reset can fired again if necessary.
> 
> If we take the probe / suspend / resume example:
> * 1st device using the shared will actually trigger it (as it is now)
> * following device just increase triggered_count
> 
> If all devices go to suspend (calling reset_control_clear()) then
> triggered_count will reach zero, allowing the first device resuming to
> trigger the reset again ... this is important since it might not be the
> one which would have got the exclusive control
> 
> If any device don't go to suspend, meaning the ressource under reset
> keep on being used, no reset will performed. With exlusive control,
> there is a risk that the resuming device resets something already in use.
>
> Regarding the condition, on shared resets, call reset_control_reset()
> should be balanced reset_control_clear() - no clear before reset.

Martin, is this something that would be useful for the current users of
the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
meson8b-usb2 with reset-meson)?

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
