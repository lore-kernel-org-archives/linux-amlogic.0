Return-Path: <SRS0=oQoi=CE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5169EC433E1
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 08:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E85420825
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Aug 2020 08:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccYCntoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E85420825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HJnSn0ztAapHEIP3PUIcIOX4FgwoV5ud/oseESTBBCk=; b=ccYCntoJa7eocHvWM+DhfSz/4
	HmHP0TLOtjblKHfO8m76I53JPUsuvxuRTR/419kUjQ0+MSpj5+PxWcRghxqum1PNEK6U7bMHuaG3T
	I0SlEPICgURJW2MjkPeguuyBcvewGM4X6eJkQq6NnoUWCFZNYzq0rb6mOOwy+HFdbjoZ++w7Z/uDZ
	WVnKSAd4lkJR7CS70Z7FLHwIkHbijWwAjSG0eE3e7lr/uLVjDvUfC/HPh+jaZEBo8EbvmEe6VbgKF
	zEc4v8eTKx/8MH5vKHFVAX8xVU27L3ZEealrQ3Y/7TIOz67oIik32nnhC0qd2V5qwnsgMd74lKPpB
	H3ZfVMRQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAqZr-0004Xk-W1; Wed, 26 Aug 2020 08:14:40 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAqZp-0004WV-4u
 for linux-amlogic@lists.infradead.org; Wed, 26 Aug 2020 08:14:38 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kAqZk-0003vq-K1; Wed, 26 Aug 2020 10:14:32 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kAqZj-0006wv-MK; Wed, 26 Aug 2020 10:14:31 +0200
Message-ID: <79a2e84548697be86be3d8fde4a1975ab37d0c00.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Dan Robertson
 <dan@dlrobertson.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Date: Wed, 26 Aug 2020 10:14:31 +0200
In-Reply-To: <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
 <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com>
 <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
 <1j5z964xis.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_041437_231884_7B9FCBBE 
X-CRM114-Status: GOOD (  35.24  )
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

On Tue, 2020-08-25 at 16:20 +0200, Jerome Brunet wrote:
> On Tue 25 Aug 2020 at 12:20, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Mon, 2020-08-24 at 16:26 +0200, Jerome Brunet wrote:
> > [...]
> > > In practice, I think your proposition would work since the drivers
> > > sharing this USB reset line are likely to be probed/suspended/resumed at
> > > the same time but ...
> > > 
> > > If we imagine a situation where 2 device share a reset line, 1 go in
> > > suspend, the other does not - if the first device as control of the
> > > reset, it could trigger it and break the 2nd device. Same goes for
> > > probe/remove()
> > > 
> > > I agree it could be seen as unlikely but leaving such race condition
> > > open looks dangerous to me.
> > 
> > You are right, this is not good enough.
> > 
> > > > Is this something that would be feasible for your combination of
> > > > drivers? Otherwise it is be unclear to me under which condition a driver
> > > > should be allowed to call the proposed reset_control_clear().
> > > 
> > > I was thinking of reset_control_clear() as the counter part of
> > > reset_control_reset().
> > 
> > I'm not particularly fond of reset_control_clear as a name, because it
> > is very close to "clearing a reset bit" which usually would deassert a
> > reset line (or the inverse).
> 
> It was merely a suggestion :) any other name you prefer is fine by me

Naming is hard. All metaphors I can think of are either a obscure or
clash with other current usage. My instinct would be to call this
"resetting the (reset) control", but _reset() is already taken, with the
opposite meaning. How about _rewind() or _rearm()? Not sure if those are
good metaphors either, but at least there is no obvious but incorrect
interpretation. I kind of wish reset_control_reset() would be called
reset_control_trigger() instead.

> > > When a reset_control_reset() has been called once, "triggered_count" is
> > > incremented which signals that the ressource under the reset is
> > > "in_use" and the reset should not be done again.
> > 
> > "triggered_count" would then have to be renamed to something like
> > "trigger_requested_count", or "use_count". I wonder it might be possible
> > to merge this with "deassert_count" as they'd share the same semantics
> > (while the count is > 0, the reset line must stay deasserted).
> 
> Sure. Could investigate this as a 2nd step ?

Yes.

> I'd like to bring a solution for our meson-usb use case quickly - even
> with the revert suggested, we are having an ugly warning around suspend

I understand. Let's still do this carefully :)

> > > reset_control_clear()
> > > would be the way to state that the ressource is no longer used and, that
> > > from the caller perspective, the reset can fired again if necessary.
> > > 
> > > If we take the probe / suspend / resume example:
> > > * 1st device using the shared will actually trigger it (as it is now)
> > > * following device just increase triggered_count
> > > 
> > > If all devices go to suspend (calling reset_control_clear()) then
> > > triggered_count will reach zero, allowing the first device resuming to
> > > trigger the reset again ... this is important since it might not be the
> > > one which would have got the exclusive control
> > > 
> > > If any device don't go to suspend, meaning the ressource under reset
> > > keep on being used, no reset will performed. With exlusive control,
> > > there is a risk that the resuming device resets something already in use.
> > > 
> > > Regarding the condition, on shared resets, call reset_control_reset()
> > > should be balanced reset_control_clear() - no clear before reset.
> > 
> > Martin, is this something that would be useful for the current users of
> > the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> > meson8b-usb2 with reset-meson)?
> 
> I'm not Martin but these devices are the origin of the request/suggestion.

So these two phy drivers are used together with dwc3-meson-g12a?
Will you change them to use the new API as well?

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
