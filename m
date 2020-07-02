Return-Path: <SRS0=naQK=AN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D69C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 07:48:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27086212CC
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2020 07:48:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUZX86qq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cJyoYcdt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27086212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wx2fT/MGidxveiepQ5JuYFHOWOeoWUXTM8LgVbYLjk=; b=dUZX86qqOhtcYYkCRgcXuB6wy9
	3C6tB1SjStXMH53vhoOVTUZBV0Ek9QFECzc05BAUikmaCmAuZoAgB7LBdEJaODAN6kxyV4hIJudQO
	6a/WDdQwg8SXdv1tIFIgmYzIbREPzeWhdBFCDzMCu+9RJ3uprcYBp0qTKQh4gZ7DDBktWvVoY6l3u
	mhXOGRKCYG1H4Df3c9q2ZHtZ3BLwMFD26uMbuDJwvWx+X7SQUEuf3B/9y0RuVGtA0/GX889U91QzK
	vDY3HM/uChdeJsLl0R09HTFUlTBYqi6yBaW3bqu1aKO2BW+dlnuW1Z23zGzTpmg+Fj91r2GQEF8QH
	olGkeWrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqtx2-0000cO-C0; Thu, 02 Jul 2020 07:48:08 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqtwz-0000Zz-3X
 for linux-amlogic@lists.infradead.org; Thu, 02 Jul 2020 07:48:06 +0000
Received: by mail-wr1-x441.google.com with SMTP id a6so26954792wrm.4
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2020 00:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8M+mFGruIPk3CS9J1xbXhvwkPs322aITgShX5ewQVTQ=;
 b=cJyoYcdt4qoPTsDOKgbH8BDy1hkTA/lU8+OoimqiKhJuvup+eJ5pShA3oQLtmM790u
 k0taMEOv17PPxFh1QUb4TjyW+sV4RFR7CWqsJ5SSxPRYUUWWm3zrKaZU1Ic5fOQKPk2T
 9aTDQZIig2oovyHfnrrwP68+s/Qn8FkNG+anTz5kbO1hMCjgd1DACAGD+nXuyCnTjqEr
 IERyt7j3A7oZFIuXaHb5Vj/CkYlr8HxzA3LO/T6j4PQfjHsIlX+GHjHjlbduIxiw+Xap
 0lKy2nYdiq7knHZhIe6P9MLhGi6NeDcLfGrItHHRUv10LYyFcOcDK0MRol834AURfg15
 DWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8M+mFGruIPk3CS9J1xbXhvwkPs322aITgShX5ewQVTQ=;
 b=aVB/qZDyfORrowy8/BvWQXauR/nmjgPRZbJk5ARRJKS0VrxdP40LzIs3r8zKmmJ1Z9
 ldyVMG+t2CJFphbQl3qFFCjsvYic1OxJhc9EV3dLTvSqib/z1qAeMz/RjO6A5w4bAO9T
 2Cya4Cb4CyHJj5VtUOVS62sqMbgVekmYcyNy3PQNz/YHdk/QyhkRaPw8090Cjf5Qhxym
 oGsoEfQ97Ip2SNO4QPYvVIxeMjWO8Ut026HVaT7q4wXADTBlU3gQoWuStvl2uYvVyWUX
 KTalfJSxZXJAZla0jIPvUYARI88wQPUIlyZ/CSOgkDmhusJi3+RZcVwoadROi9/PD8xR
 yrhQ==
X-Gm-Message-State: AOAM530dtL9C3HhvPGy37pUnojzHkZVU6WESM4v8XDPvdaVF1ziNVhBY
 XKVi1Fv4GjJsOuG6s9GJOlWkFA==
X-Google-Smtp-Source: ABdhPJxFuxuBKpXZuocxj+mJU51KU9NfMukKtxA52BnS1Gg6Wc9/gDjoChATQ11FAkuy6Pfk5q1uCw==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr33073968wrw.213.1593676082299; 
 Thu, 02 Jul 2020 00:48:02 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7023:727a:c688:cf9b])
 by smtp.gmail.com with ESMTPSA id z1sm10001882wru.30.2020.07.02.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 00:48:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/6] drm/meson: add support for Amlogic Video FBC
Date: Thu,  2 Jul 2020 09:47:53 +0200
Message-Id: <20200702074759.32356-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_034805_316104_9A18E4AC 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic uses a proprietary lossless image compression protocol and format
for their hardware video codec accelerators, either video decoders or
video input encoders.

It considerably reduces memory bandwidth while writing and reading
frames in memory.

The underlying storage is considered to be 3 components, 8bit or 10-bit
per component, YCbCr 420, single plane :
- DRM_FORMAT_YUV420_8BIT
- DRM_FORMAT_YUV420_10BIT

This modifier will be notably added to DMA-BUF frames imported from the V4L2
Amlogic VDEC decoder.

At least two layout are supported :
- Basic: composed of a body and a header
- Scatter: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder

At least two options are supported :
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

This serie adds the missing register, updated the FBC decoder registers
content to be committed by the crtc code.

The Amlogic FBC has been tested with compressed content from the Amlogic
HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
(Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
(Scatter on G12A/SM1, default on GXL).

It's expected to work as-is on GXM and G12B SoCs.

Changes since v7 at [7]:
- rebased on drm-misc-next
- removed spurious DEBUG in drivers/gpu/drm/meson/meson_overlay.c

Changes since v6 at [6]:
- rebased on drm-misc-next (after drm-misc-next-2020-05-14)
- updated patch 1 commit log for completion

Changes since v5 at [5]:
- merged all fourcc patches in 1
- fixed fourcc definition to have only a single DRM_MOD_
- fixed 2 checkpatch issues

Changes since v4 at [4]:
- added layout and options mask
- cosmetic changes in fourcc.h
- fixed mod check using the masks
- fixed plane apply using the masks

Changes since v3 at [3]:
- added dropped fourcc patch for scatter
- fixed build of last patch

Changes since v2 at [2]:
- Added "BASIC" layout and moved the SCATTER mode as layout, making
  BASIC and SCATTER layout exclusives
- Moved the Memory Saving at bit 8 for options fields
- Split fourcc and overlay patch to introduce basic, mem saving and then
  scatter in separate patches
- Added comment about "transferability" of the buffers

Changes since v1 at [1]:
- s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h

[1] https://patchwork.freedesktop.org/series/73722/#rev1
[2] https://patchwork.freedesktop.org/series/73722/#rev2
[3] https://patchwork.freedesktop.org/series/73722/#rev3
[4] https://patchwork.freedesktop.org/series/73722/#rev4
[5] https://patchwork.freedesktop.org/series/73722/#rev5
[6] https://patchwork.freedesktop.org/series/73722/#rev6
[7] https://patchwork.freedesktop.org/series/73722/#rev7

Neil Armstrong (6):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout
  drm/meson: crtc: handle commit of Amlogic FBC frames

 drivers/gpu/drm/meson/meson_crtc.c      | 118 +++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 289 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  74 ++++++
 5 files changed, 481 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
