Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35578C2BD09
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:34:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AAD24653
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 15:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W688bv97";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RgVylUW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AAD24653
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lyucXwT/UQzJv6SVZ4CDBF/HKEJekB6PlMNLas7gLZg=; b=W688bv97VglS81
	y3CK1Gx5bmfL/NStpoIYsD4saBQt6m0alnPEJJoC42sCPTwq5KuZTZ3+UcUwb13DDtpwlbsCcO/1i
	pc+Fz0zkj8r3+BOXvYLLw+wfCr2vJgmEpXNcDHwUDoGq0W0gqz9WejOUaJoWfni57enmva1Jq3TqQ
	4zAToeyEZWOlLD2oZMz1gJdMmPXatwlR67cRuaBz0iEznxggvYDoLx8qbgmC6iXoM4ZdYauHiq9Uk
	jvBwNQ9LnMz5ll7SBd7NRISjbCLcMq8Ghuegi6oSbMnpXWY3sMPQbDu915cjZDYEQ5ENWCjsXS8oq
	0exI8PGZ5gJPFUqRRqlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ict99-0003ek-TC; Thu, 05 Dec 2019 15:34:27 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ict8x-0003Sj-TG
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 15:34:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id d16so4102755wre.10
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Dec 2019 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIebstkH20puIVZWgC2hGKzku3yRSI4A3CVg92MDVQs=;
 b=RgVylUW7KveDxJ3ohhKWc4l3cCuIRuSxVDGHkWxQkyJAq73UqLAdPV5ykqeEWOigV6
 kPpYyUfLkJwt8IUI7hhNJv/97o+h4NHtlJazgz6EhwrKqxF9drvekDzXRe5tjwM29eUR
 ou0SaXgUYQl6RGpaa/vdtqqHjcM41TwNDT/A4IYz3ZVnjEBr86CwYX+iwkPTmAamoCFN
 h9xXbU3THxhkfLDA6APB86DdG30Tcpup3M1NbJY9FVtUa0dQimhFEg+OSFlfEKDW1EPp
 Xwej+fYV2ZOfw5abJAN/P9svXvtmQEdIUi8mQfIb18Eynf5CuyQAcOdy13tj9b1xXNN4
 uZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIebstkH20puIVZWgC2hGKzku3yRSI4A3CVg92MDVQs=;
 b=IOqKW8puD1rn6FBlXdXLV4CP/HJc7r86yH/QmaQ52V+QMqWRbCV4sKIF4jVDSkL6yL
 dD07d7hpEFqrRuKmWqDLZaHPpdgtkLAGLX94CqkuSZOP6VMfo5z7rmwffXnop4S0ETM4
 8LuAD9CLxpN1VOe29OpuiflAOATQSZBy8V7oD2G5uyCQMhdEA5THFQWdbnqWhyCwdC3s
 XO0qZaI5jjcT7tH0AFQsgn7asAD/6g4OQn+QKmJhgK3si6U6a6npQD/0u+OxOoP8xe8R
 GxAVkQavjOh4sWdySZd55OO4Au1kvFJAxwS3Xvtg4hOe0zJV4iR4Kc4hfoBr5TSJwE30
 BY9A==
X-Gm-Message-State: APjAAAXh9hPTcJoz9J1734Z2EkvzxZ81jqhHi73FHE6maKT2EeeXHbug
 tVj7pQYjF7N5NEMWVVXkfWUz8A==
X-Google-Smtp-Source: APXvYqzISVFwgl00Y4cT7qU6re/o5QIa1Ua3iwxFaohFbaqWWtF4alAmwbSyhxysbWxjiZGXBlFlxA==
X-Received: by 2002:adf:cd0a:: with SMTP id w10mr10564920wrm.107.1575560052661; 
 Thu, 05 Dec 2019 07:34:12 -0800 (PST)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 07:34:11 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: mjourdan@baylibre.com
Subject: [PATCH v2 0/4] media: meson: vdec: add g12a platform
Date: Thu,  5 Dec 2019 16:34:04 +0100
Message-Id: <20191205153408.26500-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_073415_943489_46C49CE0 
X-CRM114-Status: UNSURE (   8.92  )
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
driver for the Amlogic G12A & compatible SoCs.

The bindings are converted to YAML and dt-schemes to ease validation
of the bindings and the Amlogic DT.

Then support is added for the currently supported MPEG1 & MPEG2 decoders
and additional clock for upcoming HEVC/VP9 decoder support.

M2M Decoder compliance is handled in a separate patchset at [1].

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

[1] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com

Maxime Jourdan (2):
  media: meson: vdec: add g12a platform
  arm64: dts: meson-g12-common: add video decoder node

Neil Armstrong (2):
  dt-bindings: media: amlogic,vdec: convert to yaml
  dt-bindings: media: amlogic,gx-vdec: add bindings for G12A family

 .../bindings/media/amlogic,gx-vdec.yaml       | 139 ++++++++++++++++++
 .../bindings/media/amlogic,vdec.txt           |  72 ---------
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  23 +++
 drivers/staging/media/meson/vdec/vdec.c       |  13 +-
 drivers/staging/media/meson/vdec/vdec.h       |   1 +
 .../staging/media/meson/vdec/vdec_platform.c  |  30 ++++
 .../staging/media/meson/vdec/vdec_platform.h  |   2 +
 7 files changed, 206 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
