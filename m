Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A8C433E0
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7416206A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M6pcGco+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s0Mz/Wdq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7416206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vFw3ZuEownJiugJP38UBKHW1XEjRJ8pNkecnPXYtCV8=; b=M6pcGco+9qJmXZd4eWWco6XS7i
	+zs1XAScBc9U1SuF5NUUdBd5hib/PPEZ3xymg1g/oIZNkVVtTTxtttcJwLfdmjtY6v3rXGViEKdjN
	Gh6KMdax4Zd/ZAypncRd3R/hSY/k39+bdP/7YWRVq8VWIpHRnMghBllsbUqNLyg9IF4I3bcjKzx4O
	lifTX7tG+Tc54TCgJLP+TUMBu59E0UD9SHEYAZ9z52nS75Y95kyweEpjTsvtB9UfxyZlBM+dxf+rG
	hyMtKsPbvUVKPAyvL6cdnv9n/okvvIJeiCN0OCBMbPtMmPQ+iwhZkAOHOHWzV8So21mkiESB2Gq3O
	NIesD2HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGjm-0002Kq-Pp; Fri, 03 Jul 2020 08:07:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGjT-00029q-VB
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id z13so31689444wrw.5
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1TNzycKuUCG/Lpw8LCZ7YtLXjAvDFp2TFsGPUACq2s=;
 b=s0Mz/Wdq8iqu3dPfohf7u7IAcdckwYBi+DxKcwrRE4abFYeLQqdL+pBXBr4ow5g9cq
 3n8fkCLWPAbRJ/wTcif1Iv8lrF2TD7HwYVov6GvAh3CNLk39Sme8m26ckcqGhUnkn6Bn
 VZF4v5m3IpLhAUmGAoBdpDq2DdhnkWO5x2+R/s4xz68MmnHXJ1yDy2Jb9U+wKO+SX+7g
 SXMozQhnUH5lOON2n3f2IlmKZNCC16CkEW7qxClyJ6/zaUmnUJ/yBIM2fXaUru47gjyV
 vwSuqsxqUeNitO+JKHdCp2N2h8vZ292KsnBh+XdsYxhz4KSX//OyJzLvbOzJMAGHP8mq
 Oc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1TNzycKuUCG/Lpw8LCZ7YtLXjAvDFp2TFsGPUACq2s=;
 b=l0E7Cbj590VEg3FBn+4PxyioUHHORxq1853BBDYG9+6ffhm0pNc8oFztp/NTRkM7q4
 6OUx7FRmhUFPexAIWVT58oDOv19A4EtwC+zs9PBsCojegjlZ5xGEoqEcuIcQ5G3xhYqK
 dQscRPmkX4z5oN6e8jcW8dKup57IK5v+lX7yawWUPJNzm2VSUFSWtXccPaB2980aFNrP
 aV5R41oDFgxx55No2tMLudI9EarQuht0D6GvSa5cKbGAuldY4zMg7imOPsd6Wr371mHt
 fnjBydD3sRHX1GxsDp3w4qkhxnuwO9xy3eAOlmab/Hf9gkrgQPA9iOUlPNzs/oqTzKQu
 IlTQ==
X-Gm-Message-State: AOAM531QL67VKEQuzli4dDCc2eSSO9GVPzikfSUAMXdJNZ1uvrQF/KTR
 loiU25scqptflxeOdoVzE5xrTg==
X-Google-Smtp-Source: ABdhPJyg7KEBrWbXbNhkwuxhamaT+87wYHYXZdWBW6ZFOSDlt0fJRgbFVLhpqyvx5pqYzjUvi5GUlQ==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr38512820wrm.271.1593763657349; 
 Fri, 03 Jul 2020 01:07:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 0/6] drm/meson: add support for Amlogic Video FBC
Date: Fri,  3 Jul 2020 10:07:22 +0200
Message-Id: <20200703080728.25207-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040740_188342_5DC112DF 
X-CRM114-Status: GOOD (  11.65  )
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

Changes since v8 at [8]:
- added clarification of scatter mmap behavior as suggested by daniel
- added ack and review tags

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
[7] https://patchwork.freedesktop.org/series/73722/#rev8

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
 include/uapi/drm/drm_fourcc.h           |  81 +++++++
 5 files changed, 488 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
