Return-Path: <SRS0=zsg5=VO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335DEC76192
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jul 2019 10:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E2D217F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jul 2019 10:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGoKc1vy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09E2D217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPWE6lTsvgKADu8vLUDqQVUNj3Hir/vd9c0MV5xBY6I=; b=PGoKc1vytZKKiy
	xhcG5Tf7tq0iny4xlSupC/HZYqwSJ2waIbbuw5bj84qpL9Mi6Rkh+5YaMgLmS4ruhJjJ+LK/5LEXi
	h8233EzMG3R5ej77aTqG5O75LSGaMND+AVsvuak62oAu4jIhtTq0NNSVNyJvmGpcSIfr2M8l1Dbej
	kIfiRAET5nToWRZIPMVUvdVZxWxgh1yMN7YDqFwdk6xBCmSbbd6JHAyzGiVTXM3iYnx/paqmNZtyM
	fbhkVdt+zlUTQscxNRWIYhp/aXTmZn/FdvcnonQ4CvOm5/eu+lbsBUp1bXMDWGsxhp1wV6YM40gNr
	tKgDHEYnHLk4u+tWmeUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnhf3-0001mb-CR; Wed, 17 Jul 2019 10:59:49 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnhez-0001lB-Hj; Wed, 17 Jul 2019 10:59:47 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F142F8034E;
 Wed, 17 Jul 2019 12:59:33 +0200 (CEST)
Date: Wed, 17 Jul 2019 12:59:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/19] drm: drop use of drmp.h in drm-misc
Message-ID: <20190717105932.GA5188@ravnborg.org>
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716065022.GA18452@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716065022.GA18452@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=e1VmrhLkSVZGwi_aLusA:9 a=CjuIK1q_8ugA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_035945_768087_899047AB 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Alexandru-Cosmin Gheorghe <Alexandru-Cosmin.Gheorghe@arm.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Deepak Sharma <deepak.sharma@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Kevin Hilman <khilman@baylibre.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Robert Tarasov <tutankhamen@chromium.org>, Emil Lundmark <lndmrk@chromium.org>,
 Jani Nikula <jani.nikula@intel.com>, Jyri Sarha <jsarha@ti.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikulas Patocka <mpatocka@redhat.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jul 16, 2019 at 08:50:22AM +0200, Sam Ravnborg wrote:
> Copied all recipients on the cover letter.
> As the list is long this mail may not hit the mailing lists.
> 
> 	Sam
> 
> On Tue, Jul 16, 2019 at 08:42:01AM +0200, Sam Ravnborg wrote:
> > This patch set removes a far share of the remaining uses of drmP.h.
> > Common for all patches are that the respective files are maintained
> > in drm-misc.
> > All patches are independent.
> > 
> > Patches have all been build tested with various configs and various
> > architectures.
> > There are likely introduced a few build issues that randconfig
> > build will reveal, but for all configs I have used the build was OK.
> > 
> > This patchset does not conclude the quest to kill all uses
> > of drmP.h, but it is a major step towards the goal.
> > 
> > Please review/ack.
> > I plan to apply the patches to drm-misc, but feel free
> > to do it yourself.
> > 
> > There will be conflicts with the ongoing work on ttm, gem etc.
> > But let's deal with the conflicts when they hit us - it
> > is simple conflicts in the list of include files.
> > 
> > v2:
> > - Removed merged patches
> > - Added ack from Emil Velikov to the full series
> > - Rebased on top of drm-misc-next
> > - Hand-edited the list of Cc: as get_maintainer.pl in some
> >   cases looks up too much people, due to cross kernel commits

I have collected the additional r-bs and acks and pushed out the full
series. Thanks for feedback to everyone!

	Sam

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
