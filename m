Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ECBC4363A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA437206E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwQNv5a3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CTr8HxwA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA437206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nyLsE/we0kT6+khtmDkqubUFoCLXHHGt7l06x0osmIQ=; b=EwQNv5a3QYnlGxDsReuLLsAoB7
	1pl82hcqsWUoEVF4n3VBT2mt+sRAZThAbwb7NcjML6/dcMzN3j6Pc12iKYfbUMiKuYR7la+f9+Rlc
	ErsLyp8fL42vvTj3k4zaxRAaxvEaUrt2z7y02nroJI7DZPikaya59z3uvf9EcAAfl9PI8+LpwqN62
	cOdI0VFcYTXiwdbYZPdc/dnnN8lMLNhtZpvH41VJrVeIqg/CtfJ2v3ltV5sRyktA7REFtjw0eKrki
	6/c4pi4wfCFK9ruXT5+fhznFr9/kknr5syMDecXuFehKkV8dj/pT1ezRub2c1Ev7c30Yaw41Cwz+1
	vlZDf7DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYVX5-0000Ku-Ku; Fri, 30 Oct 2020 14:37:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYVWy-0000Iy-QI
 for linux-amlogic@lists.infradead.org; Fri, 30 Oct 2020 14:37:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id l8so3163704wmg.3
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2020 07:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNJ7K1TJmsYMR5itLjFjlihOiprWWU7zuitod0PiKvs=;
 b=CTr8HxwAHGc6ShL1X7yvlTdqlow0Nb10ISQ9uQ7Wka7jyRqsNwEFAfv9Si5g2VHMxW
 Bz3Tv+AQYtMX1zvHlsOtsRdN1SYPbRITcQJiriaS4kGdfjui1ifg8w8cB96kUSx/i4nh
 mXnLvULUarK8C8k34wcJN6GgKSqTa73CruoCa6LDB8nJ+Y+yEe7JiXsYrra/qDvuqH/H
 z7dT5qtZ+3bXz9gRLVvQVvWst3Ik7P5a5yUlyS5Wcim7/7xJfSt1lc2nfA3taLZS+Bal
 u9gJe/K6mI7QzBYGATtikQDo4bIE7KwEKwmcEbxUFw5CxD5Z0fD0Kw37ILD4fwzzWfOA
 y5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lNJ7K1TJmsYMR5itLjFjlihOiprWWU7zuitod0PiKvs=;
 b=JMKDwUFQ3K5lUKvZp8nRTMLdveZDiKsNIMISPtPhYoY6/wJ2N82h3i3XqF7VM431Me
 konJTrFdZFIgB3JS5p96dL0WWzvhyEtZoXLqm+9TqkMiHWdZPKxpEnddBfyqox1APK/F
 r/v1FMPthMUVUyUo88ptW6OocOEAHMxdV5og0LznxdxKul7UZKeEJV81hzYhagFVzsG9
 jWGdeE3CcQPTZCIwLW9DWPNzcbvGqr09DnMj6yR/LBt5JI5BgKWpDRnUds42YJ806qux
 EGGSiraZ3G1UrsuItqIN6AdgKI1mkG9ZBoL43LeQ/GL2U6QrWwm5QBaKgpJgEzXa+WNZ
 qohg==
X-Gm-Message-State: AOAM533pHFfecHSpZqrNLX+DlosdzG/xCAxA4F72e2+RoLj1l8r7KnFO
 YtvJmFW6Y1azGgLZanTPmOzpBg==
X-Google-Smtp-Source: ABdhPJxLBvaADHWstiRIFtYVpEuEUUBPHak0Hggtc+Q3Y8bcFIcp50jupsadRZQyi4CKFaX6mzMnmw==
X-Received: by 2002:a7b:c0d3:: with SMTP id s19mr3090592wmh.102.1604068647296; 
 Fri, 30 Oct 2020 07:37:27 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
 by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:37:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl
Subject: [PATCH v2 0/4] media: meson: Add support for the Amlogic GE2D
 Accelerator Unit
Date: Fri, 30 Oct 2020 15:37:11 +0100
Message-Id: <20201030143715.577641-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_103729_010449_DEC0C18B 
X-CRM114-Status: GOOD (  12.78  )
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

Changes since v1:
- Rebased on v5.10-rc1

/ # v4l2-compliance -s
v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t

Compliance test for meson-ge2d device /dev/video0:

Driver Info:
	Driver name      : meson-ge2d
	Card type        : meson-ge2d
	Bus info         : platform:meson-ge2d
	Driver version   : 5.9.0
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
 drivers/media/platform/meson/ge2d/ge2d.c      | 1105 +++++++++++++++++
 8 files changed, 1548 insertions(+)
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
