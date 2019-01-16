Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B27C43612
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 18:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B2EC20840
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 18:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uk7GWyV6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B2EC20840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8T3Cl5pFWIgrTzEUY0UaLFShORJSTPaSZMLoGrrpdI=; b=uk7GWyV67nFNXq
	0rg1v4w2twPrpVVKmeOcc1d41EbRo4BbCmsZgswypExe7Dfxjdd1ThavpE1ScR4CUj5jS39ufWrSL
	JzWOneDmd2HrxHttskgyyXCylyavhn2yKATbSt9SiPL1NCK1XWLT4xqI4rJ/MGoS4n2WS6JbjEO8M
	Bi86DfpY5mcx2o05jdrOfaVdkfY7mqeebE05Uw+FR1eSMYwRZ1moQvjPMEiqnZxMZpg9TPEiYBZ7L
	Vn5XeLa+xXM5sxCb2rPMo7oeg1R/yvDN/iBf0pWTFzdBKm8TMqupX60s3pbw2cgjysYwXfzm0TiPz
	sBjkQRo1hKBtu/dpitWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjpdz-00019T-Om; Wed, 16 Jan 2019 18:10:27 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjpdx-00018w-1c; Wed, 16 Jan 2019 18:10:26 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A95CA20049;
 Wed, 16 Jan 2019 19:10:19 +0100 (CET)
Date: Wed, 16 Jan 2019 19:10:18 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Message-ID: <20190116181018.GA27364@ravnborg.org>
References: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190116163442.12622-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=p2dIKQH6C7GrL7qBjIgA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_101025_257064_341F4415 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, nouveau@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 CK Hu <ck.hu@mediatek.com>, spice-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xen.org, linux-renesas-soc@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Daniel.

> v5: Actually try to sort them, and while at it, sort all the ones I
> touch.

Applied this variant on top of drm-misc and did a build test.
Looked good for ia64, x86 and alpha.

Took a closer look at the changes to atmel_hlcd - and they looked OK.

But I noticed that atmel_hlcdc uses only drm_kms_helper_poll_init() and
drm_kms_helper_poll_fini().
But there are no hits on DRM_CONNECTOR_POLL - so I think we maybe
have a driver here where we have plugged the drm_poll infrastructure,
but it is not in use.

>  include/drm/drm_crtc_helper.h                 | 16 -----------

The list of include files in this file could be dropped and replaced by:
struct drm_connector;
struct drm_device;
struct drm_display_mode;
struct drm_encoder;
struct drm_framebuffer;
struct drm_mode_set;
struct drm_modeset_acquire_ctx;

I tried to do so on top of your patch.
But there were too many build errros and I somehow lost the motivation.


>  include/drm/drm_probe_helper.h                | 27 +++++++++++++++++++
This on the other hand is fine - as expected as this is a new file.

But the above is just some random comments so:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
