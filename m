Return-Path: <SRS0=4XcC=CC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19284C433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 10:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92D120738
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Aug 2020 10:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzZVR8AM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92D120738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g2hoEM8BrsUvD6/kXP7lbBcTbwycpKXH9mRbvPOWZw0=; b=KzZVR8AMmE5c2FZRAeMnN15tj
	leYfaE3+j5M7Zs1aD6lzXj7vqOvGcjZ/uQkEPibF5GV2ByOcA6gwH8q6Sru1tTdsLWlOKsGZys1TX
	G8c/W5Uv1u7+XMcThyu1U6rypAhwg6URu+PtcSoPhMDj19hxfkF9G1oBVXAtQoT8qoY6Hy4mE8gix
	DqhixbFWeTMWdbwbUEiiSioxlqxPGDb5/NZA408jIaQXwiFPNmuxrtaju+6uix7tuO90882cGGOjO
	QTTwIUXuRm00Jt2lvfbHEDGPOIDBvV0gvdXOUfZ/3/QJsNR5dtK9fJiKQ1FkozRvyrnE66iQGtiP/
	opoCnWucg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9fL-0004tc-2X; Mon, 24 Aug 2020 10:25:27 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9eR-0004Oo-DL
 for linux-amlogic@lists.infradead.org; Mon, 24 Aug 2020 10:24:33 +0000
Received: from [2001:67c:670:100:3ad5:47ff:feaf:1a17] (helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kA9eJ-0003Tl-3A; Mon, 24 Aug 2020 12:24:23 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kA9eH-0004u0-Ro; Mon, 24 Aug 2020 12:24:21 +0200
Message-ID: <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Dan Robertson
 <dan@dlrobertson.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Date: Mon, 24 Aug 2020 12:24:21 +0200
In-Reply-To: <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_062431_939099_A0918125 
X-CRM114-Status: GOOD (  29.17  )
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

Hi Jerome,

On Wed, 2020-08-19 at 17:03 +0200, Jerome Brunet wrote:
> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
> 
> > The reset is a shared reset line, but reset_control_reset is still used
> > and reset_control_deassert is not guaranteed to have been called before
> > the first reset_control_assert call. When suspending the following
> > warning may be seen:
> 
> And now the same type of warning maybe seen on boot. This is
> happening for me on the libretech-cc (s905x - gxl).
> 
> [    1.863469] ------------[ cut here ]------------
> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
[...]
> This breaks USB on this device. reverting the change brings it back.
> 
> Looking at the reset framework code, I don't think drivers sharing the
> same reset line should mix using reset_control_reset() VS
> reset_control_assert()/reset_control_deassert()

That is correct, users must not mix the assert/deassert and reset calls
on shared resets:

/**
 * reset_control_reset - reset the controlled device
 * @rstc: reset controller
 *
 * On a shared reset line the actual reset pulse is only triggered once for the
 * lifetime of the reset_control instance: for all but the first caller this is
 * a no-op.
 * Consumers must not use reset_control_(de)assert on shared reset lines when
 * reset_control_reset has been used.
 *
 * If rstc is NULL it is an optional reset and the function will just
 * return 0.
 */

[...]
diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-
meson-g12a.c
> > index 1f7f4d88ed9d..88b75b5a039c 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  		goto err_disable_clks;
> >  	}
> >  
> > -	ret = reset_control_reset(priv->reset);
> > +	ret = reset_control_deassert(priv->reset);
> 
> The change introduced here is significant. If the reset is not initially
> asserted, it never will be before the life of the device.
>
> This means that Linux will have to deal which whatever state is left by the
> bootloader. This looks sketchy ...
>
> I think the safer way solve the problem here would be to keep using
> reset_control_reset() and introduce a new API in the reset
> framework to decrement the reset line "triggered_count"
> (reset_control_clear() ??)
> 
> That way, if all device using the reset line go to suspend, the line will
> be "reset-able" again by the first device coming out of suspend ?
>
> Philip, would you be ok with such new API ?

I'd like to first evaluate whether the already available APIs might be a
better fit. There is already the option of handing off exclusive control
between multiple drivers via the reset_control_acquire/release APIs on
exclusive reset controls.

If all drivers that are now sharing the reset line would switch to
requesting resets via devm_reset_control_get_exclusive_released()
and then prepend their reset handling with reset_control_acquire() (but
ignore -EBUSY) and the driver that got exclusive control releases the
reset via reset_control_release() during suspend, this should do exactly
what you want. Note that reset_control_release() must not be called on a
reset control that has not been successfully acquired by the same
driver.

Is this something that would be feasible for your combination of
drivers? Otherwise it is be unclear to me under which condition a driver
should be allowed to call the proposed reset_control_clear().

> In the meantime, I think this change should be reverted. A warning on
> suspend seems less critical than a regression breaking USB completly.

Agreed.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
