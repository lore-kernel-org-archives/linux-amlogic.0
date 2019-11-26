Return-Path: <SRS0=RHkW=ZS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FA7C432C0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 09:37:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 371BA20722
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Nov 2019 09:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A7eKIn2H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tAq0BQX9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 371BA20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QB4xfXkYtx2aUhDzmvuxqCMpGHo58D3sCRwK/0M5H7A=; b=A7eKIn2HMrHtyA
	GGxzo0tSwZDF+eGAahOLg125TRXj8OZUpHw9XmSfM8xNZzx/QlDSxWqMbqHgD5t55uiPE3o/M1qyK
	zERt/ee1Id+4dKwjYJ9dXSeZUEtf49t7cqlkPut3Pw/hDKRQ+8JuLgZGlML8/VjpbkXe2SnbrXDJG
	+7xw0paTBjSnuoD+oTzCHzecyrHECwEg7QyadJBkRZZs1FlO2KdvcyaubR2AT0gEWaXeZ53cHB1aJ
	d44aBcmqW/FfXiP2Rqo1SEgRj1XhN/XZDZBrcWi3PiUqozjloxXnmlDjB4ri5PEbZsIj3wEQ7kSsn
	+s49klSDYErN45VYzHUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZXHx-0006bb-Sk; Tue, 26 Nov 2019 09:37:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZXHt-0006Xc-JU
 for linux-amlogic@lists.infradead.org; Tue, 26 Nov 2019 09:37:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id a15so21565855wrf.9
 for <linux-amlogic@lists.infradead.org>; Tue, 26 Nov 2019 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzhDyQ56LBzm46HNNl3HQXj0Cwtw/+D8lGNvZCeLFfU=;
 b=tAq0BQX9fU6dNUlVbcSM20CfwA1J8XWvdziNBxNa2ERzJKecEWe4GyQ/n6mc0Bu1kA
 BK+RtS5EftHYJO/GOLGcR1sEzvmtEz+2e0fCsqNSbt4js84jN2bbfHTv3UWwonqchUJL
 BFjopSZEY7sTyFj0u88jTvB663o0wheQk7+Yd6Zs9rJPpwGIr7HvCyaWm1obmoNZMpnI
 EQnWdlvUOK5EdRn2+FwCiqAlEnC2fxv1w9oP8NKfYVsmPx38Zi76d9B+qzLrogW6yPfb
 n8XyiiTi2YF5r1+6zuPVXA8lY45qKWjEInTyPOlJNEZ5XFZiVs+hDcIutvI9ckRLdzxS
 Jp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UzhDyQ56LBzm46HNNl3HQXj0Cwtw/+D8lGNvZCeLFfU=;
 b=PmNNw2Ty1tfKspru8pqdp4vBugp6dAslmrcb2/2Syv6yWlsleM3L0eN10dTm8v4cAV
 xPiWhNLR/hMGDGxXBiIWuhaQCxnA7VU5jFHsHjdSRPgdPP1ja7GvFy8KQv9PM4hXOjHV
 1G8khJfubfi7WUak8LqakCME58CUiVgfwNgfG7/k1Hypvk/uRFKqoOdexpFqBJQGuYsr
 i/CfJExxFV1wL2hAk1ur/9EqSWZUh/LTl8tNoIpyO7UOfCfsatTeTshFXFsFMF0N8p+7
 dCQ87q9JSc6vEpJ1KdWfkC8IOv09cvybypETqzSiCi3ePbVbD047zVShejmZhatL3401
 wQOg==
X-Gm-Message-State: APjAAAVpFSXbwnDi1A8oLttp+ggP41+19LY+P0f9LRiX118ekRPena6+
 FdwooGgM/L+mWXIhdc/Yhj9YBw==
X-Google-Smtp-Source: APXvYqwpcan2QJ1uHURAp0mno8I427wdib6hDOxjlnDdGOsDgMqMmd6oqGy2A4ymy5A8BZJ5B73VoQ==
X-Received: by 2002:a05:6000:103:: with SMTP id
 o3mr3709043wrx.80.1574761055575; 
 Tue, 26 Nov 2019 01:37:35 -0800 (PST)
Received: from bender.baylibre.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id y67sm2464082wmy.31.2019.11.26.01.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:37:34 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v2 0/3] media: meson: vdec: Add compliant H264 support
Date: Tue, 26 Nov 2019 10:37:30 +0100
Message-Id: <20191126093733.32404-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_013737_714473_21317E86 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

This patch series aims to bring H.264 support as well as compliance update
to the amlogic stateful video decoder driver.

The issue in the V1 patchset at [1] is solved by patch #1 following comments
and requirements from hans.

With this, it passes v4l2-compliance with streaming on Amlogic G12A and
Amlogic SM1 SoCs successfully.

This patchset depends on G12A and SM1 enablement series at [2] and [3].

The compliance log is:
# v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s 200
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.4.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 200 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 200 buffers   
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Changes since v1 at [1]:
- fixed output_size is never used reported by hans
- rebased on G12A and SM1 patches
- added handling of qbuf after STREAMON and STOP before enought buffer queued

[1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
[2] https://lore.kernel.org/linux-media/20191120111430.29552-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/linux-media/20191121101429.23831-1-narmstrong@baylibre.com

Maxime Jourdan (2):
  media: meson: vdec: bring up to compliance
  media: meson: vdec: add H.264 decoding support

Neil Armstrong (1):
  media: v4l2-mem2mem: mark DONE any OUTPUT queued buffer after CMD_STOP

 drivers/media/v4l2-core/v4l2-mem2mem.c        |  61 ++-
 drivers/staging/media/meson/vdec/Makefile     |   2 +-
 drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
 drivers/staging/media/meson/vdec/codec_h264.h |  14 +
 drivers/staging/media/meson/vdec/esparser.c   |  58 +--
 drivers/staging/media/meson/vdec/vdec.c       |  92 ++--
 drivers/staging/media/meson/vdec/vdec.h       |  14 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
 .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
 .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
 include/media/v4l2-mem2mem.h                  |  14 +
 11 files changed, 779 insertions(+), 120 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
