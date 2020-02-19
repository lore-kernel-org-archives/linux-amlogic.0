Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61981C34052
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F200A24689
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvkLJ+Wd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZNo6kl94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F200A24689
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OWQJrypQ5kDGfeh7Zffc7j0LOVe5Qopr+6DGg/HSidQ=; b=lvkLJ+Wdx9bxLz
	vRapPQPSjce1VwA/1LwUBkpyaixE7hvkDERND1yaOT4P2nX6Ke9tIvCIPfekNZi0oL8QFwt2fpAUX
	1pAlYptJC9dNN28inXSvpA/QdliAXiR09CropvTsfocyMCRYPXbV34I98YpJn+s/Lm868m9Zwsf9z
	gBgUCsa3D7j8vsFXF83pAFPyJP4uM/E7hMzttxflWJbbNZKgxwesbHV+YLDdJMehqeM1Im837h4Vd
	dgcLM8BwzPum+g+4GhRoZnth8fTzmjP5i1eH5nVYIEta+yXPDFMgiACQHAkf6c85VUPQqo/TMVyl9
	2/hzUmWRUPCL6jkdC+ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Q3E-0005AZ-9a; Wed, 19 Feb 2020 14:10:08 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Q3A-0004Wx-9y
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 14:10:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id e8so712538wrm.5
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 06:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfVIuYDrtn5y2zvuaEuhkRtCqQDzDa2swcY5/OmxUUM=;
 b=ZNo6kl948dUR8EgwFJHDY4JJRlA3PgAEKgMg5agA4kwSlWQ95T+rpdNknxLbNLf3Ee
 iMha8tmJoHdn88qmAGO+W/ov6kJ5G3EW1da90tmKALvCIwX2QjyyoCzaOHtEuHk/Y6gr
 NZfxvEGWmZKvw03XyLGZ7OvbCg592ENzvZEpLvB3N6oVP1hCeVBDUopViZh5DuCmTLxy
 cBsmn1DsfNvdOoyhhdppg6osrOTk0jczBa8GJvlPyjv3lpi6uSmEcjfTkv7vqUqwe9OW
 RhjyrJOv4k41/u2xHyG65yvsxSJVuA4tfUw3v+/rcL863jjCELZ9MqRqvUnM8OEwAW66
 whWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tfVIuYDrtn5y2zvuaEuhkRtCqQDzDa2swcY5/OmxUUM=;
 b=SsMQqcE3qLwOIfP01l9IORm1qgUtFXgybIHWL+UA82vYS0NWIWmbUO0YN1+aOVDRQp
 B5T0KMsxigJJsXQJ8kJOtBSeElGTB4YRRuw3B17IkVKN//n9WAK/rwHhNZvhqKKn2yCD
 6JncPiXxEbSbPz/WljBXexiQ0Aq53l7FHZRyLVQMT8Hdhv+KhA5Espr2Guj5kpPtM7Db
 cyrkUySsC4QSU745A1f5scV8fcWUigupaGEimVPEEEpRsctiLgdGKfXM6LweSTuw13lI
 009fACgJsjcYIb1CUS94DAZbU/5cmfIzugH31ej76TqBP5FRV650qOLGlQWxFjSMagc8
 Q97g==
X-Gm-Message-State: APjAAAUos/lv6SYjkTjdJN9Xy7pchUwXGEB7z2KVvTwVWiXFLA0dd7zS
 rUQci9t56R0zT5XhwALNlS4qPA==
X-Google-Smtp-Source: APXvYqywQSecQkosm+Y6YPuUZfd+vuHF/4qfq94zfyJ7li7wd8GzI3dPHa84YW4KaGURq4oHuMR0zA==
X-Received: by 2002:a5d:6a07:: with SMTP id m7mr8581585wru.332.1582121402806; 
 Wed, 19 Feb 2020 06:10:02 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 m68sm3182789wme.48.2020.02.19.06.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:10:02 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mchehab@kernel.org,
	hans.verkuil@cisco.com
Subject: [PATCH v5 0/5] media: meson: vdec: Add VP9 decoding support
Date: Wed, 19 Feb 2020 15:09:53 +0100
Message-Id: <20200219140958.23542-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061004_352555_C8754191 
X-CRM114-Status: GOOD (  11.20  )
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

This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
platforms for the amlogic stateful video decoder driver.

With this, it passes v4l2-compliance with streaming on Amlogic G12A and
Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
pyv4l2compliance script for VP9 at [2].

The original script kept the IVF headers in the stream, confusing the
decoder. The fixed script only extracts the payload from the IVF container.

The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yuv420
samples and the VP9 Decoder Performance streams at [5], decoding all streams from
Profile 0 and 2 up to Level 4.1, with 10bit downsampling to 8bit.

This patchset depends on :
- H.264 and compliance v6 at [4]

Changes since v4 at [8]:
- Fixes checkpatch warning on patches 3 & 5

Changes since v3 at [7]:
- fixes necessary spare ref buffer handling in parser
- added a comment to indicate how it's handled
- fix VP9 on SM1, was working with G12A firmware, but needed some changed with SM1 specific firmware
- pushed (gxl) and switched to missing (sm1) vp9 firmwares to linux-firmware repo

Changes since v2 at [6]:
- Rebased on H.264 and compliance at [4]

Changes since v1 at [3]:
- Fixed compliance for delta frame resize, but proper ref keeping is broken
- Added warns for delta frame resize, to be fixed in a following patchset
- Added VP9 probabilities parsing and transformation support to decore the VP9 performance streams
- Fixed refs keeping, avoid deleting necessary refs for next frame
- Properly used the kernel clamp_val() macros
- Zeroed the workspace to avoid refs handling glitches
- Add lock around the flush & stop to avoid race between IRQ and drain/stop

[1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jellyfish_1080_10s_5MB.vp9.hdr
[2] https://github.com/superna9999/pyv4l2compliance
[3] https://lore.kernel.org/linux-media/20191205092454.26075-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/linux-media/20200219140156.22893-1-narmstrong@baylibre.com
[5] https://www.webmproject.org/vp9/levels/
[6] https://lore.kernel.org/linux-media/20191217111939.10387-1-narmstrong@baylibre.com
[7] https://lore.kernel.org/linux-media/20200116133437.2443-1-narmstrong@baylibre.com
[8] https://lore.kernel.org/linux-media/20200206084152.7070-1-narmstrong@baylibre.com

The compliance log is:
# v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.5.0
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
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Maxime Jourdan (4):
  media: meson: vdec: add helpers for lossless framebuffer compression
    buffers
  media: meson: vdec: add common HEVC decoder support
  media: meson: vdec: add VP9 input support
  media: meson: vdec: add VP9 decoder support

Neil Armstrong (1):
  media: meson: vdec: align stride on 32 bytes

 drivers/staging/media/meson/vdec/Makefile     |    4 +-
 .../media/meson/vdec/codec_hevc_common.c      |  284 +++
 .../media/meson/vdec/codec_hevc_common.h      |   77 +
 drivers/staging/media/meson/vdec/codec_vp9.c  | 2142 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
 drivers/staging/media/meson/vdec/esparser.c   |  150 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |  218 ++
 drivers/staging/media/meson/vdec/vdec.c       |   15 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   35 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
 drivers/staging/media/meson/vdec/vdec_hevc.c  |  230 ++
 drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
 .../staging/media/meson/vdec/vdec_platform.c  |   38 +
 13 files changed, 3210 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h


base-commit: 1f79cb81ff15c036c996237aab684d806fa18c97
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
