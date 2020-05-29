Return-Path: <SRS0=2vyU=7L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E6FC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32CB22054F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2020 15:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BjXoZZcZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="EXNwcZV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32CB22054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m0fOwZAyq8o0P3kX7b6GhrxQgakaad/Ed5eAqkDMDNo=; b=BjXoZZcZS+do/J
	th5kDcFYv2iUdOoupS5ymGzr8nlvTqQ5d+J3WUGxDq+xpfNmePXaRFkOD9om9p8HvFMBzWc4Kfqbv
	BKbdFrJCpDdwSAtGgI8WGT70/jfDDCEhPhBJRxDUX0BylCJVdF31vGz74V7BzsiFfajEXTjQa69qu
	MCgsKp20du4H9yki4mHDYZz6Okouh9bVDHkfs5bKMD3v1ZadPc9r5ieW4XSeCcYJ+XGDDTWVzk6V+
	O04WPNzpACudintVqoG6pf9SH8iKQd7VgtXv8lnNRi5Nd9Wi4LxpWmPqA9H5j08f84GY2X+RI+T3u
	pRHkaWYL4aBIy+zCcw9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jegne-00061O-36; Fri, 29 May 2020 15:19:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jegnO-0005mZ-95
 for linux-amlogic@lists.infradead.org; Fri, 29 May 2020 15:19:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id x6so3992508wrm.13
 for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2020 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1VA2cI3luBKl+1A9IqPQvaPilBfCEdbV/wVG2oiOog=;
 b=EXNwcZV8afVOfwzR4c0U8MUyODazMaEzwEvIGyp3wVLivLkT1MDmIj4zdnjkv+V4gc
 YaVyk8iluliw3t6wieJTWQp7lWEPezY0040mBRcatrwpxJLKHMbNeAth47OtzPlHExME
 gDTHrm6QR/aBITo4qcv10f+0aYIg9heADIMrw4UyWU8E1WlcFtjSLuZPRAOLFs66gwZy
 rqCL2eMvJnXWAkAoAkBK1e3cLmGsj42oZd0o60FE9FxP+BdWYyo+4SlC0pB0zu7Pmwqr
 LT/AGulEftv1BEHhCHFHR4JSzXv/1JjLJXMn6LLE7qTjxQsza7a32LZuW/L6T7sz9GFc
 xd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a1VA2cI3luBKl+1A9IqPQvaPilBfCEdbV/wVG2oiOog=;
 b=Scq7J1qU/z1lSwYT91jDsUScFh8a6DM63Ax5piaokARCe7lNmkukHGUk6qNCO+Fb6V
 lJbzNYoT3cWFlc4I5pbniDPHKlplhkIAU1PzuKfPGfjzABNQxMV+o9mZ+gdYJlp7nc/P
 KQpJTwlhtTLWyYgEaXfljNsQSYyqR5OrWIb0llpU6y3mhLKHNcfVN30+gFlwk4g6jnAZ
 TNTvzaUxJHGVV+uxjbZyOuFKlu4WnHefJidr60k/rXYpLuEovuMw6wT/zBXvU3lzxQrh
 bCJP5QsVwlL8vXTfprKtwo3WGFVyLOp7N/Wawi++WEdyeBzSd/LLLZ+QPKusuBoxcW8D
 iEPg==
X-Gm-Message-State: AOAM530+dpkJnTNDqi/G+Hm53ysz+tPe/iL+3209DSKJQXQ7XYpebAoV
 YdyH2rWnwzwL2/WyuKlHxo+v+A==
X-Google-Smtp-Source: ABdhPJzQPebNNU06xppIc8ZCSKYkvgk6OTr93lLpMRDtFo/HVqX1vFcPCRezXTfa9vkCVSmurfLytQ==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr9093962wrt.199.1590765579103; 
 Fri, 29 May 2020 08:19:39 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:acf8:18a8:b3a5:a17b])
 by smtp.gmail.com with ESMTPSA id x66sm9220421wmb.40.2020.05.29.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2020 08:19:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/6] drm/meson: add support for Amlogic Video FBC
Date: Fri, 29 May 2020 17:19:29 +0200
Message-Id: <20200529151935.13418-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_081942_388400_306C6208 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
 drivers/gpu/drm/meson/meson_overlay.c   | 290 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  74 ++++++
 5 files changed, 482 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
