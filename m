Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810BDC18E5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B3E206F8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mGw/+qa7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="klP7C+Qx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B3E206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uaa++MG/IYbTksVkzKfmE4VVLz97gf13tFdpGOQOmB8=; b=mGw/+qa7qn3Rmf
	52B9ifY2OTRc+4UK5yxixwbyHTc2D51F79jdUvF8Wb0RJo6y0pJWdTAGWi5ykrn8JOc8PwVt+FJRw
	TSmfUSgJ0828RyMfI0ctDC7VaJK+VD+x+CL9n9teTgBC4h4OIHzcTdkWxINmPo2vY97dHf6W3hNgo
	AFZOBtgOWAn8HJGRh0ztowIVcxIl6ZvqKxv903lnO1pIid+1TH33XFuf5unQpd0fVMoNfhm0PHf0i
	AHTix7AJEJItBJjVKdj8lfHJ5KmMK7yW/07N8TPfZXSQ8NrSm+buMACQ7zVVZCj6xzoCKCDh1RUhv
	o/R9rzsrz4xxCTPn2X0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1kW-0003LY-7C; Wed, 25 Mar 2020 08:50:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1kB-0002bm-7P
 for linux-amlogic@lists.infradead.org; Wed, 25 Mar 2020 08:50:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id u10so1800679wro.7
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2020 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoXHfuXYzc7+p6uA7OR0OLG4JPoyNaGh9u2qRQoG7QA=;
 b=klP7C+QxkpkwvekqXQb/Ju4yyTjbf+2WirsTFD+RvppuVSgw8RLF4oDkiJV5Vk4lMd
 xqXSWWCekWRsLvvY6YJd8ek781hrgVRUnrwPML6G++2ZxVBfd7aiFZY/dnxdJCZ1Alz/
 C3xF4AHS7bnfY5t5mSinwvd8ZGuwTBNPL142jGG5FwxBD6S0Mj0AhGVekurjgwDehbwx
 wTAti/zk4YsU/j2wJHyfzaT8sKWSpFa4nF0dUBGhV5rwRSVH34qF7ROPfO/SZrYiB+Wj
 SpjhV6zueQA3Spsi+OJoE82nK0zOOYF9+7m+1eEFFf6hIXTT0bQHCmzUzl3wcxdSVZEm
 rQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WoXHfuXYzc7+p6uA7OR0OLG4JPoyNaGh9u2qRQoG7QA=;
 b=qQJwYHFYT95mbLOMv24vtpHg8bI4SoutnF2+YIcUdDCcALeLGMl1utslqHqdjXed3R
 BwMVCpbjaA2atal6V4xDk9qWDEm8RzEMcxpqIeA1Zg9w0b3HQRls3D5uvEZhmrqpz7tS
 w19+64SSydvAsioOO+Y0DgAnQqhc+G2PBckFv85Pj4hmnzX91rSE0CD0Ph+aNq1mBYYr
 IVPKvN9LvoyR+9I6RjD2raeKekrXftbM+DdmT7M45SrX+3DgNVzppUEVqloVrEQ8Y9Nq
 1C09zLV6ybejNTGCMIDAsA330vHDlNu57fA/b7DCk+Qgh45841KlQJ7ORT8J8RhY6PWm
 2OoA==
X-Gm-Message-State: ANhLgQ3ipAK0D4EWGzo1wB9A7aUfh884VszN7RBesDrTvnQtJWLzbG+a
 rGheOEL23Ol9kIZ/RWPWBWAW5Q==
X-Google-Smtp-Source: ADFU+vvN8eNsV/lG7CyAMfmUF+xPvxc5unukjUQek0cvYyrrZYY7nWzlFjHzEeIz6hgWFSoiPKW9XA==
X-Received: by 2002:a5d:630e:: with SMTP id i14mr2218077wru.260.1585126229049; 
 Wed, 25 Mar 2020 01:50:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/8] drm/meson: add support for Amlogic Video FBC
Date: Wed, 25 Mar 2020 09:50:17 +0100
Message-Id: <20200325085025.30631-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015035_380093_A86520AB 
X-CRM114-Status: UNSURE (   8.40  )
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

Neil Armstrong (8):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames
  drm/fourcc: amlogic: Add modifier definitions for Memory Saving option
  drm/meson: overlay: setup overlay for Amlogic FBC Memory Saving mode
  drm/fourcc: amlogic: Add modifier definitions for the Scatter layout
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
