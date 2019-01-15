Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58518C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 10:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295A22085A
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 10:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdBlAcLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295A22085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DyvV8k9Rwd55FMnLL1eKKq1mxofd05GFbae4i+glAE=; b=tdBlAcLm5Mzb6l
	RltShMrnKGpJPVAmV8ZXln+OpCtuP81yFUVe4Paxf6YX3TtOq91v/VEdvgJVPaEE1hmLDMmB92uzc
	/qFqHNZOzQ7MIsy26KSlMDHK9swBuE4yrkul5nxmReUu5yP6WKQdu4tBdaQ7dNzfCzIrE1bVnpFob
	x5QTSo47Lmnoj665IR6CVjdK0RK/bLiX+zsO9te1GV0isnUJT9p5F/ImmwboutQbZS9E9F4z791GM
	M3lw4ayPtqRkQmE4j7GNasYym0948R3tGrm0XFGoHGJ6lD0D9/TtdiuZWfPjcR5Tz8sLe8NkSAkC8
	0af7PQfAgkGlGeX3lu/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjMO6-0001o3-Sn; Tue, 15 Jan 2019 10:56:06 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjMNr-0001bM-PT; Tue, 15 Jan 2019 10:55:53 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2019 02:55:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; d="scan'208";a="138414978"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.72.79])
 by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2019 02:55:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
In-Reply-To: <20190115104137.25695-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190115104137.25695-1-daniel.vetter@ffwll.ch>
Date: Tue, 15 Jan 2019 12:57:33 +0200
Message-ID: <87tvia5gte.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_025551_832395_490E65F9 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xen.org,
 linux-renesas-soc@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> Having the probe helper stuff (which pretty much everyone needs) in
> the drm_crtc_helper.h file (which atomic drivers should never need) is
> confusing. Split them out.
>
> To make sure I actually achieved the goal here I went through all
> drivers. And indeed, all atomic drivers are now free of
> drm_crtc_helper.h includes.
>
> v2: Make it compile. There was so much compile fail on arm drivers
> that I figured I'll better not include any of the acks on v1.
>
> v3: Massive rebase because i915 has lost a lot of drmP.h includes, but
> not all: Through drm_crtc_helper.h > drm_modeset_helper.h -> drmP.h
> there was still one, which this patch largely removes. Which means
> rolling out lots more includes all over.
>
> This will also conflict with ongoing drmP.h cleanup by others I
> expect.
>
> v3: Rebase on top of atomic bochs.
>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (v2)
> Acked-by: Benjamin Gaignard <benjamin.gaignard@linaro.org> (v2)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: etnaviv@lists.freedesktop.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: spice-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-tegra@vger.kernel.org
> Cc: xen-devel@lists.xen.org
> ---
> Merging this is going to be a bit a mess due to all the ongoing drmP.h
> cleanups. I think the following should work:
> - Apply Sam's prep patches for removing drmP.h from
>   drm_modeset_helper.h
> - Get the i915 drmP.h cleanup backmerged into drm-misc-next
> - Apply this patch.
> - Apply Sam's patch to remove drmP.h from drm_modeset_helper.h
> - All through drm-misc-next, which has some potential for trivial
>   conflicts around #includes with other drivers unfortunately.
>
> I hope there's no other driver who'll blow up accidentally because
> someone else is doing a drmP.h cleanup. Laurent maybe?
>
> Jani, ack on this?

Acked-by: Jani Nikula <jani.nikula@intel.com>



-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
