Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1EEC35640
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C893C20679
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UYnGlI0A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MHq30fHL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C893C20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8lWXhQjAMd8yZZRmiMqm4NQLZ3dgiFHwtAy+ilD4hE=; b=UYnGlI0AaKuNd6
	W9Tuak4ywya+C/519PX2dExWqt72K026HxO/7wYjiJPviwTmLyNMtAHwKGekwN9S4Py5NR68831/e
	oqGRBa9YckBcon/9wdTtOuEs+N1Rcf4WfJUS87X3nnfU908gxFdTq9LzcW3pGPDlGXNSO6+fSXnta
	7/2ouKjurNXURro6i8ALSPW6RR94cvoDsh+ZCD3/wg+e4uRQtSdSMdp+ASTkocBj6Y+sqMk9a6rNj
	B0b3hJMko+k0OI291GX32QQ/iu57U14jqETPHouxsbiEeZz4Df4PCqrjAaTsEoGF2UsNxHyZkEwxY
	2dUhYjXDUN1bxMFEvSdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54J1-0006jS-6S; Fri, 21 Feb 2020 09:09:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54Ik-0006Vk-E0
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 09:08:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id t23so860421wmi.1
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 01:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kb32uRYkhezIHBTmj+5SdLW5ETiBbDtA9WwDv9jFqg=;
 b=MHq30fHLCK1yAJBfIiqeZy2r0lRKlMQNNi0H+yiAO1uObLJy/V8lgFd0bW7GRlbdZA
 pVm+zKouDVsFeYirga2GLz6wxiIIIXU73yRTJnQWpy3+2jzqpfvbRD0GzW1r6Kfwahhq
 9em/BTeVTo9+SWaF0nC8xs4UoEhcx2w7NhKWVJpP77auP3klD1qQPWIwj1tSXmIRUmPp
 rRm7bqD8lP+V5f8+tZn6Iy7XDqtZJXzu3n1VCNq0Nyq+cSXoXbaCPtApVhwnN2UFx/8a
 8Pk7xV8Me2jOJ+nIvyIBR0AVtt5DEm/ZQQhklA60Qwjfv4CEyIeXbYS/rSRF5eBX9XZP
 0wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3kb32uRYkhezIHBTmj+5SdLW5ETiBbDtA9WwDv9jFqg=;
 b=dPvu7WDfXbTQveWP4TVo3r11lrlcaEE8LUseyo8Z+1DgwiiNSWogUmBOBR70FTICPI
 m1Ir3EXnssBXbEDqPUVLgeUFGyWhxsfVH5XHanWYMBQmUOZPLfSs1PjhJZmNmtIAVZYt
 o4OgbnkAfgXiudf5e6dhIPcdLndGVQLg1CDBds51U8WaCuaP3Kss0frtmjtv3MHoy+r+
 dgRmAdCvMXwIeY80aMNXE8A6+O9gf1MYXHLTw9jbEmMI2OEKzs0U7RaxlSz5Mt6Y7Ng8
 izZNRGcXIDk06uZJScCjYFpowA6RglTRlhRFSA2o+DcoJHTqkNmXyxRLTc9SXnkTR4H8
 /fIQ==
X-Gm-Message-State: APjAAAU/BHcb6quz2OCJmw+ttk+7GPi5mzdOFnTdMDjLKXZeZle2PW/9
 UO2dRyVOJ4BGydt1tY3v4x7DbQ==
X-Google-Smtp-Source: APXvYqyASv2VhtyTE+GbLI9Iyxv1oYm6p8uGHIxc63RjQjtV3HCvpFF/TwD2nkmX9SvFBq2eEeVOoQ==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr2419247wmm.179.1582276128899; 
 Fri, 21 Feb 2020 01:08:48 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 h5sm3173288wmf.8.2020.02.21.01.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:08:48 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm/meson: add support for Amlogic Video FBC
Date: Fri, 21 Feb 2020 10:08:41 +0100
Message-Id: <20200221090845.7397-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_010850_475346_60E081D0 
X-CRM114-Status: UNSURE (   7.20  )
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

At least two options are supported :
- Scatter mode: the buffer is filled with a IOMMU scatter table referring
  to the encoder current memory layout. This mode if more efficient in terms
  of memory allocation but frames are not dumpable and only valid during until
  the buffer is freed and back in control of the encoder
- Memory saving: when the pixel bpp is 8b, the size of the superblock can
  be reduced, thus saving memory.

This serie adds the missing register, updated the FBC decoder registers
content to be committed by the crtc code.

The Amlogic FBC has been tested with compressed content from the Amlogic
HW VP9 decoder on S905X (GXL), S905D2 (G12A) and S905X3 (SM1) in 8bit
(Scatter+Mem Saving on G12A/SM1, Mem Saving on GXL) and 10bit
(Scatter on G12A/SM1, default on GXL).

It's expected to work as-is on GXM and G12B SoCs.

Changes since v1 at [1]:
- s/VD1_AXI_SEL_AFB/VD1_AXI_SEL_AFBC/ into meson_registers.h

[1] https://patchwork.freedesktop.org/series/73722/#rev1

Neil Armstrong (4):
  drm/fourcc: Add modifier definitions for describing Amlogic Video
    Framebuffer Compression
  drm/meson: add Amlogic Video FBC registers
  drm/meson: overlay: setup overlay for Amlogic FBC
  drm/meson: crtc: handle commit of Amlogic FBC frames

 drivers/gpu/drm/meson/meson_crtc.c      | 118 ++++++++---
 drivers/gpu/drm/meson/meson_drv.h       |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c   | 257 +++++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_registers.h |  22 ++
 include/uapi/drm/drm_fourcc.h           |  56 ++++++
 5 files changed, 431 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
