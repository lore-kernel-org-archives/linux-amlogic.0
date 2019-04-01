Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DEDC10F05
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47644206DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 13:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cs4+kzhq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Rv+Q3CT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47644206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DmuGc6MMouVjYVt977k4yCIR4FGkHuRFO08hIJtDq5I=; b=Cs4+kzhqjPbclF
	3lp28VTsv7oFyDQDgeFv00mq869jpzpm5UoZ46bnNv+eznEmiPs0ZQYJAaHLwzUa1uO5q+TeUeKrO
	ozp4DR3+lXk3lZceyfCSb6J1/vOITqGBT5iF4R5u0LrPsIVNoVWowT9n4kJRbdaK2rk5L2YEHV7Db
	nAOY42a4Hs9PzJ/wYYaUA0FmlRNAxd3ZYqJ/UoYkiL8I9F0bKoDIbWd2N2wWDOXlVEcKSfa99mEnV
	2HMxAP3/xTsLDc5BYZXB4LqC2eEWnvlaeKO7Xz6PnhkUfqIbUE3Fb3uQlyCEwATKTLUasr3LO2264
	FAOFmJvjByL0cMc7w5Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAx9V-000453-1u; Mon, 01 Apr 2019 13:39:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAx9Q-0003hq-IH
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 13:39:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id y13so12121324wrd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCTHvOZsBvueuOicqszFQpte+OeSMDu4MKaTKizUSBg=;
 b=2Rv+Q3CT36xOcvTXxRfi+5Cptac7SrD4P4b+wwIofVCydg6zeP7tcoXG6AE1lb8zJz
 jOZvhVIAlgk/4NmL6xS9SKSZDY4i3X6vh2AXz0yzlwMaumpTEI8JzkAhEhqOwMivGC6m
 1a+reENnJvaOoqQDebLDRWMGQA3pDf40jjGNNzb0FBMqVGWrzA4IEnZORjSS3AUoTEAM
 4H2z2tf1NvKryV46GfYutaLnAhWaJTzaPNVIeCwasckVgQYxaUOFWSkFrQphE8NUK9xU
 b94GhAcvLtSbavGTuQkbHyuT6mfgUomGbKhL5qIPeLXHPzJukBD9Q8RG/D6uTP4AmL58
 Rouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCTHvOZsBvueuOicqszFQpte+OeSMDu4MKaTKizUSBg=;
 b=Mw8/6lYouehJbhG1zFtCYL+fZeilT7gAIgPTXxy5KDrggdytJntadjp1ci2IdS4D4j
 BujIeCHGIh8jTjV+KElg8P9l+90Lbc+FjNemfMf7BOoLDI4KjibE7SG+aiB4uHR8vwCO
 2RsOWi2QUfEFm8EVTjkFbJr1Rh0+5+5mK17lWPik62OeuuTok2FuZyue26vg3hgjIM0X
 HDABU4dVvwFcrkFYX0j0ANRaRxQ6chwwx5DgK9NwfDn1a/4b30Hse8jSyCpSQKiVGD6V
 uXENfpROPfEqeucPHdRCd8OCVn/4/cs6Tuov/T9byO/8GDIY2haQpjF+s+B+Rsej4BHA
 956Q==
X-Gm-Message-State: APjAAAXvOc7xnw9r+D8DSdBPf5wJSOua3Ys17KKjiPCMKKVQN5nkaKLJ
 wGhu9ISGtyRUxOyYekdZYMjgOg==
X-Google-Smtp-Source: APXvYqxHYFaac/fg0ZshVMlYId1t+snycq+LRzxEax7WpA8hTGCAYWdRCU4Oj/ZzwKj4eMIZ6O06dQ==
X-Received: by 2002:adf:ebc8:: with SMTP id v8mr40980317wrn.172.1554125938424; 
 Mon, 01 Apr 2019 06:38:58 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id v184sm25205996wma.6.2019.04.01.06.38.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 06:38:57 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 0/4] Add Amlogic video decoder driver
Date: Mon,  1 Apr 2019 15:38:41 +0200
Message-Id: <20190401133845.4171-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_063900_609464_06AE91EF 
X-CRM114-Status: GOOD (  20.62  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi everyone,

[V5] It's been a while since the last patch series regarding the Amlogic
video decoder. Unfortunately, the firmware licensing situation is still
on hold as we await communication from Amlogic. As such, we do not have
the firmwares in linux-firmware yet.
I decided to push the V5 anyway, as changes were starting to pile up.

This patch series adds support for the Amlogic video decoder,
as well as the corresponding dt bindings for GXBB/GXL/GXM chips.

It features decoding for the following formats:
- MPEG 1
- MPEG 2

The following formats will be added in future patches:
- MJPEG
- MPEG 4 (incl. Xvid, H.263)
- H.264
- HEVC (incl. 10-bit)
- VP9 (incl. 10-bit)

The code was made in such a way to allow easy inclusion of those formats
in the future.

The decoder is single instance.

Files:
 - vdec.c handles the V4L2 M2M logic
 - esparser.c manages the hardware bitstream parser
 - vdec_helpers.c provides helpers to DONE the dst buffers as well as
 various common code used by the codecs
 - vdec_1.c manages the VDEC_1 block of the vdec IP
 - vdec_ctrls.c handles the V4L2 controls exposed by the driver
 - codec_mpeg12.c enables decoding for MPEG 1/2.
 - vdec_platform.c links codec units with vdec units
 (e.g vdec_1 with codec_mpeg12) and lists all the available
 src/dst formats and requirements (max width/height, etc.),
 per compatible chip.

Firmwares are necessary to run the vdec. They can currently be found at:
https://github.com/Elyotna/meson-firmware
There is an ongoing effort to bring those firmwares to linux-firmware
but they're not in yet, currently blocked by licensing issues.

It was tested primarily with ffmpeg's v4l2-m2m implementation. For instance:
$ ffmpeg -c:v mpeg2_v4l2m2m -i sample_mpeg2.mkv -f rawvideo out.nv12

The v4l2-compliance results are available below the patch diff.

Changes since v4 [3]:
 - Updated for 5.1: 
  - cropcap -> g_pixelaspect
  - dma_zalloc_coherent -> dma_alloc_coherent
 - enum_framesizes: changed from STEPWISE to CONTINUOUS, as suggested by Hans
 - Reintroduced support for CREATE_BUFS. It was a driver bug where I wasn't
 accounting for the amount of buffers created this way (only buffers created
 via REQBUFS were).
 - Added the patch introducing V4L2_FMT_FLAG_FIXED_RESOLUTION to the V4L2
 framework, needed as MPEG2 on Amlogic hardware only supports a fixed
 resolution during a decode session.
 - Added support for events and V4L2_EVENT_SOURCE_CHANGE, as it is now checked
 by v4l2-compliance for stateful decoders. I was planning on introducing this
 for codecs that actually use it (H264, HEVC..), but it doesn't hurt to have
 this in the initial commit.
 - Added support for controls, mainly V4L2_CID_MIN_BUFFERS_FOR_CAPTURE

Changes since v3 [2]:
 - strlcpy -> strscpy
 - queue_setup: account for existing buffers when clamping *num_buffers
 - removed support for CREATE_BUFS. This caused issues with gstreamer and allowed
 userspace to alloc more buffers than the decoder can handle in its fixed list.
 So for now we just disable it and only allow allocating via REQBUFS.
 - rebased & tested with 4.20-rc1

Changes since v2 [1]:
 - Override capture queue's min_buffers_needed in queue_setup
 The HW needs the full buffer list to be available when doing start_streaming
 - Fix the draining sequence
 The blob that we write to the ESPARSER to trigger drain is codec-dependent.
 The one that was sent in v1 is specific to H.264 and isn't guaranteed to
 trigger drain for MPEG2. For the latter, a simple MPEG2 EOS code
 should be sent to the ESPARSER instead.
 - Slight enhancements to the way we do vififo offset<=>timestamp matching

Changes since v1 [0]:
 - use named interrupts in the bindings
 - rewrite description in the bindings doc
 - don't include the dts changes in the patch series
 - fill the vb2 queues locks
 - fill the video_device lock
 - use helpers for wait_prepare and wait_finish vb2_ops
 - remove unnecessary usleep in between esparser writes.
 Extensive testing of every codec on GXBB/GXL didn't reveal
 any fails without it, so just remove it.
 - compile v4l2_compliance inside the git repo
 - Check for plane number/plane size to pass the latest v4l2-compliance test
 - Moved the single instance check (returning -EBUSY) to start/stop streaming
 The check was previously in queue_setup but there was no great location to
 clear it except for .close().
 - Slight rework of the way CAPTURE frames are timestamped for better accuracy
 - Implement PAR reporting via VIDIOC_CROPCAP

[3] https://patchwork.kernel.org/cover/10669875/
[2] https://lore.kernel.org/patchwork/cover/993093/
[1] https://patchwork.kernel.org/cover/10595803/
[0] https://patchwork.kernel.org/cover/10583391/

Maxime Jourdan (4):
  dt-bindings: media: add Amlogic Video Decoder Bindings
  media: videodev2: add V4L2_FMT_FLAG_FIXED_RESOLUTION
  media: meson: add v4l2 m2m video decoder driver
  MAINTAINERS: Add meson video decoder

 .../bindings/media/amlogic,vdec.txt           |   71 ++
 .../media/uapi/v4l/vidioc-enum-fmt.rst        |    6 +
 MAINTAINERS                                   |    8 +
 drivers/media/platform/Kconfig                |   10 +
 drivers/media/platform/meson/Makefile         |    1 +
 drivers/media/platform/meson/vdec/Makefile    |    8 +
 .../media/platform/meson/vdec/codec_mpeg12.c  |  209 ++++
 .../media/platform/meson/vdec/codec_mpeg12.h  |   14 +
 drivers/media/platform/meson/vdec/dos_regs.h  |   98 ++
 drivers/media/platform/meson/vdec/esparser.c  |  323 +++++
 drivers/media/platform/meson/vdec/esparser.h  |   32 +
 drivers/media/platform/meson/vdec/vdec.c      | 1071 +++++++++++++++++
 drivers/media/platform/meson/vdec/vdec.h      |  265 ++++
 drivers/media/platform/meson/vdec/vdec_1.c    |  229 ++++
 drivers/media/platform/meson/vdec/vdec_1.h    |   14 +
 .../media/platform/meson/vdec/vdec_ctrls.c    |   51 +
 .../media/platform/meson/vdec/vdec_ctrls.h    |   14 +
 .../media/platform/meson/vdec/vdec_helpers.c  |  441 +++++++
 .../media/platform/meson/vdec/vdec_helpers.h  |   80 ++
 .../media/platform/meson/vdec/vdec_platform.c |  107 ++
 .../media/platform/meson/vdec/vdec_platform.h |   30 +
 include/uapi/linux/videodev2.h                |    5 +-
 22 files changed, 3085 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
 create mode 100644 drivers/media/platform/meson/vdec/Makefile
 create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.c
 create mode 100644 drivers/media/platform/meson/vdec/codec_mpeg12.h
 create mode 100644 drivers/media/platform/meson/vdec/dos_regs.h
 create mode 100644 drivers/media/platform/meson/vdec/esparser.c
 create mode 100644 drivers/media/platform/meson/vdec/esparser.h
 create mode 100644 drivers/media/platform/meson/vdec/vdec.c
 create mode 100644 drivers/media/platform/meson/vdec/vdec.h
 create mode 100644 drivers/media/platform/meson/vdec/vdec_1.c
 create mode 100644 drivers/media/platform/meson/vdec/vdec_1.h
 create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.c
 create mode 100644 drivers/media/platform/meson/vdec/vdec_ctrls.h
 create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.c
 create mode 100644 drivers/media/platform/meson/vdec/vdec_helpers.h
 create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.c
 create mode 100644 drivers/media/platform/meson/vdec/vdec_platform.h


root@libretech-cc:~# v4l2-compliance -d /dev/video0 
v4l2-compliance SHA: 40fd5611c5176137c80616f6ee93b36f0d88f2d5, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
        Driver name      : meson-vdec
        Card type        : Amlogic Video Decoder
        Bus info         : platform:meson-vdec
        Driver version   : 5.1.0
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
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for meson-vdec device /dev/video0: 44, Succeeded: 44, Failed: 0, Warnings: 0


-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
