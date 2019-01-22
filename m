Return-Path: <SRS0=xxvR=P6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FD4C282C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547BD2084C
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jan 2019 08:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NjnZebLW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JAqpKWef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547BD2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9X/A/CxmOyi2HZEPvAb8tbEaObP3DX3j4NbBCnnLiE=; b=NjnZebLWLnId1W
	dL6QphGQUBp+sftgcUX0uV237ACzX/ORVPHb8vnCcPxB9a9ZW5eTL72PEWe+eWM+ofCD8G6gooK+4
	P4Av6cDlx1TQvNB/TA4A0rhg3SbhVO8qTVIUdgBuCIe9je/CitQeXWagx9VNghOVDPwjqMG6x2S+K
	lkRcuj10iRBsMC1+EE8GKSD+lsMLis3uWpuN8r7dsSoVHDwMpEFQWnQOhNOMwlQfGcJFfZj8tmiEB
	JQKmKuEj/37PZd9+Qcp1k4nWpnU7+wxmozo2pOAyrNTRobpjk4TasjoZnifN1LY7t07ozv+GU4Jxj
	uTajouuyq0bqTbf7jScQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glr2W-0003hc-Sa; Tue, 22 Jan 2019 08:04:08 +0000
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glr2F-0003Rz-2Q
 for linux-amlogic@lists.infradead.org; Tue, 22 Jan 2019 08:03:54 +0000
Received: by mail-it1-x141.google.com with SMTP id h65so18925256ith.3
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Jan 2019 00:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Syz3w5shfKU03CRg/FlS++679Lm7R5GpEIXI8UEMKo=;
 b=JAqpKWefehuaNt0Qvb3M0k2K3z1oFQ8Nox2oy5czaf4vTWIA32EmFoKNfRfjlsoT/i
 i3E+lG32p1/4LqWufFYz+bMeVzxItpRy9d1J+8A55lcpAZWEtlQgle2vbLq+OlVrOH7x
 KpYbEiVDYzzAk2hNws+TpocOMtpnvK6CeVE34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Syz3w5shfKU03CRg/FlS++679Lm7R5GpEIXI8UEMKo=;
 b=p7TiSPgHe7GcnzKeRx5ZazVyLg9/ucNuvu1ERpxoftQF1GOtlhFtORMRGfhnSBHAcr
 khuz73nbvUagc4+9qz8TwTZpzrwrJBPgRzSbDT2wMg5TOFwC5q1tuUbtygwJnb7dxtcN
 q7Hh4/LdTN54ORFLBnZHQQq7vY9EJvjALoa4JMGUGXbDS+7Bpe2wYcD5h0xFi1pbWtdn
 PnbIQbBS8p9XYxHiYhYNX301VpmeBy2cD5dhqOC0/1aSXYgLTQ3AAhIi9cXD9BRz1QXm
 5JYzeP3M4S0UYm9sbOiud3w3bZlOFwbNdbncRBPzBtcCLfbHKMAkZFLIkoCO5E0HKttQ
 E7Dg==
X-Gm-Message-State: AJcUukfNtKHc+h1JyM501yBU1Tnk68Vtn2iBjVypT0peQo/vm34EuQls
 4tENqr17yWSXgrHCBSr53hmOZHLS5uTS6pxJHPm4tw==
X-Google-Smtp-Source: AHgI3IaSUhfZRCtrbe2ENHC18/zT0bn+kGk8z+bxXZ+/UY7ss+m81axiyhxuMy5rCoQi27V6DiuFUB9EPuP06OatQRo=
X-Received: by 2002:a24:94cb:: with SMTP id j194mr1502533ite.117.1548144227888; 
 Tue, 22 Jan 2019 00:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
 <20190116181018.GA27364@ravnborg.org>
 <20190117164541.GE3271@phenom.ffwll.local>
 <20190117174531.GA14041@ravnborg.org> <20190121221329.GA6512@ravnborg.org>
In-Reply-To: <20190121221329.GA6512@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 22 Jan 2019 09:03:36 +0100
Message-ID: <CAKMK7uF_8yRycA4ZUyudH7dM23DOiFEkKStAbbAvD=79y_UE_Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_000351_199822_FA0FE5CA 
X-CRM114-Status: GOOD (  32.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, xen-devel@lists.xen.org,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jan 21, 2019 at 11:13 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel et al.
>
> > >
> > > Yeah the drm_crtc_helper.h header is a bit the miniature drmP.h for legacy
> > > kms drivers. Just removing it from all the atomic drivers caused lots of
> > > fallout, I expect even more if you entirely remove the includes it has.
> > > Maybe a todo, care to pls create that patch since it's your idea?
> >
> > The main reason I bailed out initially was that this would create
> > small changes to several otherwise seldomly touched files.
> > And then we would later come and remove drmP.h - so lots of
> > small but incremental changes to the same otherwise seldomly
> > edited files.
> > And the job was only partially done.
> >
> > I will try to experiment with an approach where I clean up the
> > include/drm/*.h files a little (like suggested above, +delete drmP.h
> > and maybe a bit more).
> >
> > Then to try on a driver by driver basis to make it build with a
> > cleaned set of include files.
> > I hope that the cleaned up driver can still build without the
> > cleaned header files so the changes can be submitted piecemal.
> >
> > Will do so with an eye on the lesser maintained drivers to try it
> > out to avoid creating too much chrunch for others.
>
> I have now a few patches queued, but the result is not too pretty.
> I did the following:
>
> - For all files in include/drm/*.h the set of include files
>   were adjusted to the minimum number of files required to make
>   them build without any other files included first.
>
>   Created one .c file for each .h file. Then included the .h
>   file and adjusted to the minimal set of include files.
>   In the process a lot of forwards were added.
>
> - Deleted drmP.h
>
> - Fixed build of a few drivers: sti, tilcdc, gma500, tve200, via
>
> Some observations:
>
> - Killing all the includes not needed in the headers files
>   results in a a lot of extra changes.
>   Examples:
>     drm_modseset_helper_vtables.h is no longer
>     included by anyone, so needs to be added in many files
>
>     drm_atomic_state_helper.h is no longer included
>     by anyone so likewise needs to be added in many files
>
> - It is very tedious to do this properly.
>   The process I followed was:
>   - delete / comment out all include files
>   - add back the obvious from a quick scan of the code
>   - build - fix - build - fix - build - fix ...
>   -   next file...
>
> - The result is errorprone as only the allyesconfig + allmodconfig
>   variants are tested. But reallife configurations are more diverse.
>
> Current diffstat:
>    111 files changed, 771 insertions(+), 401 deletions(-)
>
> This is for the 5 drivers alone and not the header cleanup.
> So long story short - this is not good and not the way forward.
>
> I will try to come up with a few improvements to make the
> headers files selfcontained, but restricted to the changes that
> add forwards/include to avoid the chrunch in all the drivers.
>
> And then post for review a few patches to clean up some headers.
> If the cleanup gets a go I will try to persuade the introduction
> of these.
> This will include, but will not be limited to, the above mentioned
> drm_crtc_helper.h header file.
>
> For now too much time was already spent on this, so it is at the
> moment pushed back on my TODO list.
> This mail serve also as a kind of "where had I left", when/if I
> pick this up again.
>
> If there are anyone that knows some tooling that can help in the
> process of adjusting the header files I am all ears.

Yeah in the process of splitting up drmP.h we've created a few smaller
such piles of headers. I think in some cases it's just not going to be
worth it to fully split them up, e.g. drm_crtc_helper.h is going to be
a pure legacy helper, only needed by pre-atomic drivers. Splitting
that up doesn't seem to useful to me. Similarly we might want
drm_atomic_helper.h to keep pulling in the other helper headers. So
probably going to be a judgement call on a case-by-case basis.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
