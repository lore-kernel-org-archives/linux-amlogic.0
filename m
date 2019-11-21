Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E25FC43215
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:14:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 039BD214D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 10:14:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u81MyEKU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CzFSpjV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 039BD214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3UFzSQMyAx/CGlyfXFid8cqvfM1TPZjr4q2S3ZTEFE=; b=u81MyEKUaXSN3F
	oYX6ZfUWcx7r73+nhvzRZdU7SbSUSPO8n+lnOdf6wdJZ2D6XgPCJ1Ufi8CBpbaGBVO1f5Z2DHJqrl
	Yqv64M3i9rUEo55ruUhRTjDDLT/plgnbt2q+S4wukh83ZYvEHfqlqDvsvatctWXhm9exTThkgj0gv
	EKkoX7RXcLtOKZ6f+7dWtZWVQbY5DwTnv+/SzI3Mrmqz+sUb2OqOUx2zsd8HZMCkH3sWFx7gL7SNW
	cuuPoMPN0g4EcWmpA8wZHVgpif/m/QqpQrjj0q2wIVJkCqqZULe4xAC1u22Sw5ejaAY29OSMLL7za
	8Nf2Xb9AZYq6FNe17N+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXjU0-00044I-L1; Thu, 21 Nov 2019 10:14:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXjTw-00040f-N9
 for linux-amlogic@lists.infradead.org; Thu, 21 Nov 2019 10:14:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id n188so1070594wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Nov 2019 02:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n7DzjzsuSLvj9pdWFStqaFJF8gdHM1T9f/YXYyoJOjk=;
 b=CzFSpjV143IUsg5swiQ/xd6HekWPa8WT+SHymkLFYW8WZccwKp/V8QjnOfEjuNP5t8
 w1z9rdRXOZ+T7qZDUi3vPMh3P9JWM+j4gZ7XTw0wFUO1vLMosw9OCFMGHaa13EE/zh/v
 pc3Y+j7ILOj0i+k14bnEZTcqxcxkpAo1TwUCm8geSaM9PF24vQ771JN0p19hpN84c4JP
 EgQ3njdMGF/c0Ra+WHZDIEOONMVnKYqIQ4QldDIeGamQNwG7x4mZWuDD1929IZk4gj1y
 omx3QqMOxGBNqbSdF+oD4fm6Gb5fknsFczRcokiQ4ZUgZ1tN1xyTizuJfONw9k4j0V/Q
 1/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n7DzjzsuSLvj9pdWFStqaFJF8gdHM1T9f/YXYyoJOjk=;
 b=VmrUa554Ntqam3kIO3eygY1OzOF8GqLPa+d6Wo83LR4UrPEO/9WmI1adQ8vwqC73hE
 GwVUv0OwJ5oOG4PK3hUdxylV6JPWHW2ODcbionBXsv8Gue23eT+8gi6wleT34YKHswON
 4RaUC3U4QKjpkWTDZb+YwSR2qe22pdEKx8QPFfq2Z9iDLdvgOT6bMoWw2LXTT3ivMD1E
 b/nc0mtgs0ZYYAKILAWWgJNxfBwc1Ae0APcI6HNCbhzKKGSaB+PDLeK5OYYUPoTnGifz
 nihX7BPBqQjjVp1vpix2ewiC4+S7ixUotj6bBuMtopj3uLOaqpY8EFDn8jeqgDPFoV6H
 2Aow==
X-Gm-Message-State: APjAAAVXtRPzGj/Snt41NZj4J2GbtB7sazU1VmWral/WQNZdhnlOPFUj
 +gLIcUEma1LpNNgDDwxhHK+tJA==
X-Google-Smtp-Source: APXvYqxPADgVv5/yD9ctzuTcZNw5cUFWHwvJhUI0DOZzRCGful8vLGq7ZwkZBc87z0uvxwTFov8oDQ==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr8689497wml.21.1574331271418; 
 Thu, 21 Nov 2019 02:14:31 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o21sm1289932wmc.17.2019.11.21.02.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 02:14:30 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH 0/3] media: meson: vdec: add sm1 platform
Date: Thu, 21 Nov 2019 11:14:26 +0100
Message-Id: <20191121101429.23831-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_021436_833047_1AE23AE4 
X-CRM114-Status: UNSURE (   7.44  )
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

This patchset adds support for the current Amlogic Video Decoder
driver for the Amlogic SM1 & compatible SoCs.

Then support is added for the currently supported MPEG1 & MPEG2 decoders
like for G12A support.

This patchset depends on G12A support patchset at [1].

M2M Decoder compliance is handled in a separate patchset at [2].

# v4l2-compliance 
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

Total for meson-vdec device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0

[1] https://lore.kernel.org/linux-media/20191120111430.29552-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com

Neil Armstrong (3):
  dt-bindings: media: amlogic,gx-vdec: add bindings for SM1 family
  media: meson: vdec: add sm1 platform
  arm64: dts: meson-sm1: add video decoder compatible

 .../bindings/media/amlogic,gx-vdec.yaml       |  2 ++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  4 +++
 drivers/staging/media/meson/vdec/vdec.c       |  5 +++-
 drivers/staging/media/meson/vdec/vdec_1.c     | 29 ++++++++++++++----
 .../staging/media/meson/vdec/vdec_platform.c  | 30 +++++++++++++++++++
 .../staging/media/meson/vdec/vdec_platform.h  |  2 ++
 6 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
