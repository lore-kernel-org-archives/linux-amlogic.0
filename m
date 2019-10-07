Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8192ECE58D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 14:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75F1206C2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 14:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHc+EhWX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u/ZpKjhi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A75F1206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LoTH2EFe7p6cAnj5QXVelEQ9uyNxOhVvb9YG1Fiqx2w=; b=VHc+EhWXMINtgM
	ckWXCr7y6qCFWL4gHuuP0whkJlG/dU1kOHx6VqwqNz1SlL8dlM0EjiCVTPMonxOHNjJPJ6tGKQW+l
	hmZRudPpNxF/dvatiGqipIfb9tbB04SmrJHPXPD2qr9RU2t723sXuW1xLVwHgv/HyEoaeet/agc80
	jILsr8frWR0+LHiwIIIKtfZvc1+LYip76vW938fDHsu97zwMPRBL6mViqK2WJJHdi+pCeJ/wdV++1
	DfWYfV9E813cGLcaAXHZB1vZX+s5wb/9ES13f1MEmHuY2hLKPq8epZNTpfFx9jnYkKljGcC2n1EZk
	1iMslD3TbIXVosGjtHZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHUTl-0000Xu-G3; Mon, 07 Oct 2019 14:59:17 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHUTh-0000WB-92
 for linux-amlogic@lists.infradead.org; Mon, 07 Oct 2019 14:59:15 +0000
Received: by mail-wr1-x444.google.com with SMTP id b9so15750517wrs.0
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2019 07:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vilLtZV/3cPsoe5D69Ef7zst8isSbKkZO1Y1Pm2Cqc0=;
 b=u/ZpKjhiowf7PaElE2EEAF3J1csGr2KdXAdpJBm5Bqp5+gVCtF+RjNgXVVX/8doKuG
 MZB9nb/r7aEgcTsvukW26bmUM4TTvAeIUcpgCRclwlZsktjVekazM6PukdKTEeOE9x7f
 RA33Af5AZf5DPiTdnlC1dsqVuaS6ViHr9A36NaQdFCcqaLU7byvVVYii0IcgC4Hgt5mh
 Np2vU5IQ9wiIiixACVf/xecLxBHPQfpEdMgpAbHP//jzIyJC3i6hlFAktoQj9TdwgOFk
 Zj3YbXhJQ5Xdh0YPwoaNmcmtiTZedSyRqNj3NNHyAmcoQcohKs/BsSWI9EBJI5fMJ78r
 PWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vilLtZV/3cPsoe5D69Ef7zst8isSbKkZO1Y1Pm2Cqc0=;
 b=EE0dCxqZZfqFx2xSbvHMYw7Tc1BvbAqsiCxL1yjXVZZHz9RqxJHHdZ5G9AJzBj3Pf9
 Jar9cnoG+hVR8w+ByqaiezLTEDjVb3tE7+fX0I1DYTzE3/t431OZdu3KgLxC1yDgzgt2
 4TPRLgiWLKjxSTWQkaFQg8ucY8YeZKeBR7A1Gcjy0Xs0NkjOgAt4BXA4o+dGYporikly
 vZzNAZ1EpnWYC5JPPA5fMh/8z7uovpTKyEZYNZLQy3KVrqAitmsiOWeXQmfB+5jTX41p
 jvYfI0P8fFghkON7avW/wy19Ul85Ki5kelIiRjfrwnP7QqX+3Hp8JWMAkxJPpYPkTq36
 0byA==
X-Gm-Message-State: APjAAAU+PC9XUY7F/KNqcIfYSeKPrahJWvmc0e/ezieITOjkt/EeIoKJ
 CpdvGuuq8+FBreIsGJjMTfT4KkR3S3g=
X-Google-Smtp-Source: APXvYqwdvMHMACemynEre5GbAwLLqQxaKlJYDmTZ3Mj9Oua30AmbMMMNpmeE3UZ3a1Oj6FKt8FXVrQ==
X-Received: by 2002:adf:f348:: with SMTP id e8mr15404455wrp.237.1570460351453; 
 Mon, 07 Oct 2019 07:59:11 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id d4sm19348985wrq.22.2019.10.07.07.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 07:59:10 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 0/2] media: meson: vdec: Add compliant H264 support
Date: Mon,  7 Oct 2019 16:59:07 +0200
Message-Id: <20191007145909.29979-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_075913_322239_BB6F64B2 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

This patch series aims to bring H.264 support as well as compliance update
to the amlogic stateful video decoder driver.

There is 1 issue that remains currently:

 - The following codepath had to be commented out from v4l2-compliance as
it led to stalling:

if (node->codec_mask & STATEFUL_DECODER) {
	struct v4l2_decoder_cmd cmd;
	buffer buf_cap(m2m_q);

	memset(&cmd, 0, sizeof(cmd));
	cmd.cmd = V4L2_DEC_CMD_STOP;

	/* No buffers are queued, call STREAMON, then STOP */
	fail_on_test(node->streamon(q.g_type()));
	fail_on_test(node->streamon(m2m_q.g_type()));
	fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));

	fail_on_test(buf_cap.querybuf(node, 0));
	fail_on_test(buf_cap.qbuf(node));
	fail_on_test(buf_cap.dqbuf(node));
	fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
	for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
		fail_on_test(buf_cap.g_bytesused(p));
	fail_on_test(node->streamoff(q.g_type()));
	fail_on_test(node->streamoff(m2m_q.g_type()));

	/* Call STREAMON, queue one CAPTURE buffer, then STOP */
	fail_on_test(node->streamon(q.g_type()));
	fail_on_test(node->streamon(m2m_q.g_type()));
	fail_on_test(buf_cap.querybuf(node, 0));
	fail_on_test(buf_cap.qbuf(node));
	fail_on_test(doioctl(node, VIDIOC_DECODER_CMD, &cmd));

	fail_on_test(buf_cap.dqbuf(node));
	fail_on_test(!(buf_cap.g_flags() & V4L2_BUF_FLAG_LAST));
	for (unsigned p = 0; p < buf_cap.g_num_planes(); p++)
		fail_on_test(buf_cap.g_bytesused(p));
	fail_on_test(node->streamoff(q.g_type()));
	fail_on_test(node->streamoff(m2m_q.g_type()));
}

The reason for this is because the driver has a limitation where all
capturebuffers must be queued to the driver before STREAMON is effective.
The firmware needs to know in advance what all the buffers are before
starting to decode.
This limitation is enforced via q->min_buffers_needed.
As such, in this compliance codepath, STREAMON is never actually called
driver-side and there is a stall on fail_on_test(buf_cap.dqbuf(node));


One last detail: V4L2_FMT_FLAG_DYN_RESOLUTION is currently not recognized
by v4l2-compliance, so it was left out for the test. However, it is
present in the patch series.

The second patch has 3 "Alignment should match open parenthesis" lines
where I preferred to keep them that way.

Thanks Stanimir for sharing your HDR file creation tools, this was very
helpful :).

Maxime

# v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s250
v4l2-compliance SHA: a162244d47d4bb01d0692da879dce5a070f118e7, 64 bits

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
	test Scaling: OK

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
	Video Capture Multiplanar: Captured 250 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 250 buffers   
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Maxime Jourdan (2):
  media: meson: vdec: bring up to compliance
  media: meson: vdec: add H.264 decoding support

 drivers/staging/media/meson/vdec/Makefile     |   2 +-
 drivers/staging/media/meson/vdec/codec_h264.c | 482 ++++++++++++++++++
 drivers/staging/media/meson/vdec/codec_h264.h |  14 +
 drivers/staging/media/meson/vdec/esparser.c   |  34 +-
 drivers/staging/media/meson/vdec/vdec.c       |  70 ++-
 drivers/staging/media/meson/vdec/vdec.h       |  14 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |  85 ++-
 .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
 .../staging/media/meson/vdec/vdec_platform.c  |  43 ++
 9 files changed, 654 insertions(+), 96 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
