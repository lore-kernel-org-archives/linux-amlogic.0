Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBC3C63697
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:36:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1CF206B5
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 16:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oAHkI9c1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1CF206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NajqeCYvMULDuVbAlHx50DFb0euR0V0imnEIOQknow0=; b=oAHkI9c1FK3NTvBy8MDd/a3HW
	J0HxyvlH6SmsGcegbLxl9UwwgRVOK8Kkv1msScrZRRF/kLFbbOPqZ0AeSiVm7GXAHlEoDc9Zuj1hB
	HnA4Ie46jRr6JjJSBTA5eMmP7HTXoXSmobJ00r0WO1+W+fYSrbG4O7w+k0c0aYmyvi+/t2ip21Eiw
	wFPl+6JxEQY0FV8fMLi619ZJwTQ1RZL/sFnMezLP1me/dV06MrY081hquWYGchcY2wZWZTy2kAKZT
	NM9Rc880zggzk/TeeAQzYr5L/51ICN/ER5+ADvWLHqVhP/ivaXXo+lECetFbSa33G9FEGerEveej9
	8KYaOsOeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kehUM-0008WP-Hf; Mon, 16 Nov 2020 16:36:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kehUJ-0008VU-EQ
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 16:36:21 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kehUG-0005k5-BS; Mon, 16 Nov 2020 17:36:16 +0100
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kehUF-00028h-EU; Mon, 16 Nov 2020 17:36:15 +0100
Message-ID: <48332a44241f3c06966420277060b6048c1f77d0.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>, Jim Quinlan <james.quinlan@broadcom.com>
Date: Mon, 16 Nov 2020 17:36:15 +0100
In-Reply-To: <1jima91e92.fsf@starbuckisacylon.baylibre.com>
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
 <1jima91e92.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_113619_531228_0A2571DC 
X-CRM114-Status: GOOD (  22.27  )
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
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 2020-11-13 at 16:13 +0100, Jerome Brunet wrote:
> On Fri 13 Nov 2020 at 16:04, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
> > > The current reset framework API does not allow to release what is done by
> > > reset_control_reset(), IOW decrement triggered_count. Add the new
> > > reset_control_rearm() call to do so.
> > > 
> > > When reset_control_reset() has been called once, the counter
> > > triggered_count, in the reset framework, is incremented i.e the resource
> > > under the reset is in-use and the reset should not be done again.
> > > reset_control_rearm() would be the way to state that the resource is
> > > no longer used and, that from the caller's perspective, the reset can be
> > > fired again if necessary.
> > > 
> > > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> > > Reported-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > > Change since v1: [0]
> > > * Renamed the new call from reset_control_(array_)resettable to 
> > > reset_control_(array_)rearm
> > > * Open-coded reset_control_array_rearm to check for errors before
> > > decrementing triggered_count because we cannot roll back in case an
> > > error occurs while decrementing one of the rstc.
> > > * Reworded the new call's description.
> > 
> > Thank you, applied to reset/next.
> 
> Hi Philipp,
> 
> Would it be possible to get an immutable branch/tag with this ?
> It would allow to move forward on the USB side, without waiting for the
> next rc1.

Here you go,

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

for you to fetch changes up to 557acb3d2cd9c82de19f944f6cc967a347735385:

  reset: make shared pulsed reset controls re-triggerable (2020-11-16 17:05:28 +0100)

----------------------------------------------------------------
Amjad Ouled-Ameur (1):
      reset: make shared pulsed reset controls re-triggerable

 drivers/reset/core.c  | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  1 +
 2 files changed, 74 insertions(+)

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
