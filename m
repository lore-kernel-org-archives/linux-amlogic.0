Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F0DC54FCE
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3878220789
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6M4QrhB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rsqJnKuH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3878220789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1uJnE9woDNxxUFVq1PN9OYrrVXrJ9N3yPZagL1nTfXs=; b=m6M4QrhB4AoXtT
	/SimWmXC7ABILaxVPClbWjSLApIqePQWu67Ij4H5r62uWpCHWnBj5k4hqmuImpxkRxImjODhDDZu3
	j/Nz+hZAIjWET92JEpZ5SuKB02cfmfsoSYC5JQEc8W6A1NTdH6K3ePpQJkvhYZCIBC0kRwxIL6skO
	E0RrfXTt78L0NQBCXNM/zg9Gn3b1kztlKVXsdioh6P1faoFkcuoKSOJzh58j+Q6z9dap47YzjXUyl
	Qm1hExZwRkzfYrCIpSKzG/EDYnomaChwlJctx41KKF1hWV3KmWyNQ5PN4yl8EuE1d+T5doPuEZgFb
	ktHPJEb6ljWTbwWUrbIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkPt-000735-0E; Tue, 24 Mar 2020 14:20:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkPp-00070Z-1s
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 14:20:26 +0000
Received: by mail-wr1-x441.google.com with SMTP id w10so21698068wrm.4
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb0nOXTsvfnsHlBe6h+96Sc/Y2vhw/oF3Rb7LgSL9sA=;
 b=rsqJnKuHuJQAYKkoP4MLaf+A11zN64qwqgkLFd3IWiVck21lSHX1ysKm/r30C/khku
 OVyPTf6lqP9Qpei8+lcLVc5pah1ULccIygs7LUSwT1020WvjwlGCYQYBU+BtX0whmHed
 ujnq4xAzQk4jzQCvis3sCQtC7fadrvw4lUtVS2YjRcPjDwnrLOOAYAxGXVJatcl2n98V
 CML/eF/8FdwfbJSZFfG6OPXKHNqgAhdGz3gRS3+wLmbXFKl7tnD4+C22jcgOk7YHFnSD
 DqpB+nqm/M+YwkBzyeq8Slsg2EsuiwS96qjd7ey4QJDLDPmstzzjkrnNLx8NkstHD2S/
 YdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pb0nOXTsvfnsHlBe6h+96Sc/Y2vhw/oF3Rb7LgSL9sA=;
 b=bpL5LeJGYdyHer5mcQ1ql9IJ/YTTiHdQ1rYjAfJkTsNDzsqWS4sXxNWFzQ0LEMI64a
 inupYGHASzYoiMHm8iJWQzdCC5JEpeoovUDScPuHT2iNUFp2qwniBn/TQQsvCRv2nsEK
 nPKMbw68SqWgJ/VD+YVk2QhG80htvZeDS9o/nHx9bzFRXAvxrSs7gRoXV+WbI/Cdc9n/
 +jHjEh2ZKWjP0Ila62BopluIzGuGzSqNrJOoXSI5QHzKgafcmSnvlPwnvyl2cHJAXSez
 hqTY+EFNYvsX/IEGa8SjaL8z8c5qT/c/P+9gZ9ydF207rypbA8oWpsjFUdn2YurYVm+p
 sYMQ==
X-Gm-Message-State: ANhLgQ1mxxE5VYC+dNVZbS2wGNWGtys9vCNkAyZgHgCqoEBEFs9J1gBr
 rZSO/4xLFKQPKXrfbaO0kMrWaA==
X-Google-Smtp-Source: ADFU+vtcO35jlay/gxVcEpkyIV7bq9dlC30QrfhSlVYiFA9hMEECf/zlJKLj8mUQKhkft+409j05Jw==
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr37764304wrs.96.1585059623310; 
 Tue, 24 Mar 2020 07:20:23 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/meson: add support for Amlogic Video FBC
Date: Tue, 24 Mar 2020 15:20:09 +0100
Message-Id: <20200324142016.31824-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072025_095901_B8ED7D7A 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
 linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
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

Neil Armstrong (7):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames
  drm/fourcc: amlogic: Add modifier definitions for Memory Saving option
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/meson: overlay: setup overlay for Amlogic FBC Scatter Memory
    layout

 drivers/gpu/drm/meson/meson_crtc.c      | 118 ++++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 257 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  66 ++++++
 5 files changed, 441 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
