Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD3C64E7B
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:44:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82EA02086A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82EA02086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KgqfGDajp9XBix6v/GhdyppomxL+iRAYHizS9RzV0qQ=; b=CjLji/glmvhylqrMTAdSAK3QDU
	GsZf6mt45CpI3dKiH9ifoOlS5w913P9r+zTdV0bFkD2/ANjTgxF5ADXE8U5yNFgsKZfTpf7Fxhvad
	GjzELLDjNovgpRZoHlZV1oeXYhcdC3sg89sZsUu908phXdfXT/Lbwpkxt8FkfXEst3LgzJxFkbt7M
	lTQglceupBOmsOHRwnTw2RnoA+gQ9R3JWeyng92BWhISIVHYa8p9/UBxhEJFHNIeVX40c4/0gZE0g
	ez1g6u1vPfJNbPreHJyI8dDmbAAQy4twKSKFJVaDJG7a3tB95jSi8xUF6IX82L18jMbnAfwgem359
	3JFxCq0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkWB4-0006zm-R8; Wed, 02 Dec 2020 17:44:30 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWAx-0006wV-Na
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 17:44:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id 23so4925475wrc.8
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=og2P49iViWEWzWwqprbc7YqWxuiFFqb2QXhaHJuh+Es=;
 b=TI+ZiSjRRjp0Chxn742QSRKoZPM5yqr1orTfYREdY2t7DOMY81ZXUURWTjJazUdUlx
 6PzIuNhj8u11aYjetMj3g+NHs9z3Ze/6JNL6KPB63VoDz1Cp8eizyXbJqC0R/+3lQk6W
 agIXRv2okb7dzCE+NS3u0d0ie2d/GkFfWN9VaxNmsHizFug9A2WZt3A/ez8WnyN1cg11
 Yy13fU1AnKWNKCZUmQJ5WjqMuIiN46GqmjtAlemHaf2V+usG+tgyPYH5rCKTMFT4FWep
 qLZrEQUAcc3WwrovovPzlX6+LmU/NZiNhUigRkHsgDQs9yBLLRPk4uZ9Md7JfdflHw5B
 fUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=og2P49iViWEWzWwqprbc7YqWxuiFFqb2QXhaHJuh+Es=;
 b=K/KujsMI+RGUGWXU4A0PXu6MMCqqBKOnRLcleg4sTTAH7DwU7WhMAELJWMd6s4bR8R
 ngCs9lTbQADo4zK/HhPyUoYd5Te2LMyH+fYwzzI+MZ8GOTNTdvvbGzWux+J8KkT0uo1k
 nBYEIZ4tcOIRv37ODv+psEd4AlBB8+4W+yN10voMoEE2yPLCtmx2eKD37oB3IfF3Gtwy
 Yo3OZXRWx5w1Unfy8LFdysMf9HUuI4sooib8PrZW7gR4IT3Ljsv3u4K1c+AWCzzizwr/
 m6uaeaPUDHEb50co/6WkDYbHk9BquMyiJhmm4V6F86CXgzU4POHBmRJ9Gn1SFslxAbpU
 vgSQ==
X-Gm-Message-State: AOAM531hongZX/e8fAhc5aG+QmqRKYzT1yQF/gQphFM6RDPDg6WYvsQF
 9AGmQ8KRFOeqTW3+fwz/RWl8Ig==
X-Google-Smtp-Source: ABdhPJyu/5eHl3rHLVtbq/BB4JwK3Cb8C+avo9c66STs6euPWenUunbw4GGp/0EpoZ1KpkFoxvgqVg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4781042wrs.366.1606931062420; 
 Wed, 02 Dec 2020 09:44:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
 by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 09:44:21 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl
Subject: [PATCH v4 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
Date: Wed,  2 Dec 2020 18:44:13 +0100
Message-Id: <20201202174417.3778306-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_124424_039602_2DDEFF38 
X-CRM114-Status: GOOD (  13.20  )
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

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
- 0, 90, 180, 270deg rotation
- horizontal/vertical flipping
- source cropping
- destination compositing
- 32bit/24bit/16bit format conversion

This adds the support for the GE2D version found in the AXG SoCs Family.

The missing features are:
- Source scaling
- Colorspace conversion
- Advanced alpha blending & blitting options

Dependencies:
- Patches 1-3: None
- Patch 4: https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com (applied for 5.11)

Changes since v3:
- Removed spinlock
- Removed useless streamon_cap/streamon_out
- Fixed probe failure path & remove path
- Changed default size to 128x128
- Removed useless pix.width/height test
- Upgraded v4l2-compliance to 1.21.0 (11da65eee7a271bba3f21d8117cdac428fe3a91e)

Changes since v2:
- removed error check in and after get_frame()
- moved the v4l2_file_operations lower in the code to avoid adding vidioc_setup_cap_fmt on top
- removed all memcpy of pix_fmt
- simplified & fixed ge2d_start_streaming
- added local buffer type check in vidioc_g_selection instead of using get_frame error
- removed impossible <0 rectangle check, fixed error string
- added comment on condition after V4L2_CID_ROTATE

Changes since v1:
- Rebased on v5.10-rc1

/ # v4l2-compliance -s
v4l2-compliance 1.21.0-4682, 64 bits, 64-bit time_t
v4l2-compliance SHA: 11da65eee7a2 2020-11-14 12:41:14

Compliance test for meson-ge2d device /dev/video0:

Driver Info:
	Driver name      : meson-ge2d
	Card type        : meson-ge2d
	Bus info         : platform:meson-ge2d
	Driver version   : 5.10.0
	Capabilities     : 0x84208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK
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
	Standard Controls: 4 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture: Captured 58 buffers                
	test MMAP (no poll): OK
	Video Capture: Captured 58 buffers                
	test MMAP (select): OK
	Video Capture: Captured 58 buffers                
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-ge2d device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Neil Armstrong (4):
  dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
  media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
  MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
  arm64: dts: meson-axg: add GE2D node

 .../bindings/media/amlogic,axg-ge2d.yaml      |   47 +
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |    9 +
 drivers/media/platform/Kconfig                |   13 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/meson/ge2d/Makefile    |    3 +
 drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
 drivers/media/platform/meson/ge2d/ge2d.c      | 1066 +++++++++++++++++
 8 files changed, 1509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
