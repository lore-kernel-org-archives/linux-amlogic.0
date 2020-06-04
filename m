Return-Path: <SRS0=K8/M=7R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8449EC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54DE820772
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jun 2020 13:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijVuq1G+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="O51Osu4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54DE820772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCNic7u9qd1DvNgNkEUPZpgZUu3FNSq8jxmypKQlgCI=; b=ijVuq1G+SB7S99
	0w9B14tUk7o+vnEZ3Lc6KfSJdqf2SFONJNHd4TqSYwuOu4oSoybHMMfpPossU61shZwVjG25XlhuG
	pGGbh8NVeYt59v9N1GSOoM4Un4RkIln+9A23kLdyXlRDE6TgRbzG45Lw1FYyhoGJ+ei8nTGMbYVV7
	fsyEZmrMs5mkvCeqdeR/ALHucfWWT2dUM9FXBhe+13cNA8OMF1tEn99jiLISqp9vunzTQ157+CViy
	ynY4RwFuLVRx3lKdOcWXe5reP1JK2C5CieMRnmZrFEqE8i2SFksq4X8sYpq5t+sm/PVT2KLw9wch/
	FBfSSQZWVytpHai6Qk0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgqJX-0001IF-KR; Thu, 04 Jun 2020 13:53:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgqJG-00011s-89
 for linux-amlogic@lists.infradead.org; Thu, 04 Jun 2020 13:53:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id h5so6198149wrc.7
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Jun 2020 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNKgisTvCxKeIfzFNw79PawPgsdQpi+VTBw2eOrL7UI=;
 b=O51Osu4UdCOGnotGhmGHJ94XsvwJxmD+RL/BS27sj3XsP9eR4kHTb7INzvbmhlBvlN
 rkWYTnjyEYtr0YDzMY3DYmpmeBHD2VZQvLtyScigshpv1/y2n7nlH55NZ53DLwvzu8by
 F1ZhUQ3WBqgq9FXPVN5C5mTbOQ6NvqI0rcuRpD0nK/pH2TBrBdpobdxf3G3nRR1vekki
 iO3f9lHdG9jEFpKK4mFfiAuFO/Pa8ZBPE2z6kKu7JTDk6G+cEQaRzinD7/0foyg048Gh
 9khvPqsS5YZSCB+wa+8s2lk2PFqPmadl0+6QZSiJcMHWbBEI+8U71HcphuUVlhgucVKj
 mTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RNKgisTvCxKeIfzFNw79PawPgsdQpi+VTBw2eOrL7UI=;
 b=QZTh5V6qARAAGfHflZS+wT7xShNwQKPnQbtZ0HR1fQB9uWCQURKJJCzhK3od9hg43Z
 5k07QB9eNYn9Iok4X6GKzAl2cjXvhH15GKVJ3ygfKyhVb/Ca4oYO+E24MAOSTv8TTSCO
 QnzcW5o6OHAVtxi7UpvyQvRVraKrI3MS/iRZ3e7dJ5NZsj/O7qD/mET1747PL+4j5p5W
 CVtxOdQE8LvtDw+/trpjtj9BNYbvREnK8h0UMPnlv/LLPs9N7C541lXzo01/8d34os9F
 +Pb/EjNQjhLOU8/RzCSRnDEdPo9MxQCC6p7Hj5p41HPs1r6r8CXUSHfOkEwGrQ8qxzDB
 V9Nw==
X-Gm-Message-State: AOAM530MPiSO5DeEE4JoDZuil8qfpwAE2LjRiXuS9cPJC72tu8w+YBcX
 3HW0WFRC6eBht8PM+2W2LUnJNA==
X-Google-Smtp-Source: ABdhPJxqdqJHN5Y5b9X1Q7kP0UxYnF1bBarO0Pdw4x0ipWE20qFJ7SzK27MiQOP21FgZk4r2/ND1+Q==
X-Received: by 2002:adf:e782:: with SMTP id n2mr4462910wrm.417.1591278807326; 
 Thu, 04 Jun 2020 06:53:27 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 i74sm8185599wri.49.2020.06.04.06.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 06:53:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil-cisco@xs4all.nl
Subject: [PATCH 0/5] media: meson: vdec: Add support for compressed framebuffer
Date: Thu,  4 Jun 2020 15:53:12 +0200
Message-Id: <20200604135317.9235-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_065330_339872_17310580 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset add support for compressed framebuffer while decoding VP9
8bit and 10bit streams.

First, it adds two generic Compressed Framebuffer pixel formats to be used
with a modifier when imported back in another subsystem like DRM/KMS.

These are aligned with the DRM_FORMAT_YUV420_8BIT and DRM_FORMAT_YUV420_10BIT
used to describe the underlying compressed buffers used for ARM Framebuffer
Compression. In the Amlogic case, the compression is different but the
underlying buffer components is the same.

Then, in order to handle Compressed Framebuffer support, we need to handle
the switch between 8bit and 10bit frame output.
Add the necessary changes to decode VP9 8bit and 10bit streams into
compressed buffers to be imported back into DRM/KMS using a modifier.

Finally, add the necessary to add support for negociating the compressed buffer
pixel format with the V4L2 M2M consumer, and allocating the right
buffers in this case.

Until a proper mechanism exists to pass a modifier along the pixel format,
only the generic V4L2_PIX_FMT_YUV420_8BIT and V4L2_PIX_FMT_YUV420_10BIT
format are passed in v4l2_pix_format_mplane struct for consumer.

Maxime Jourdan (5):
  media: videodev2: add Compressed Framebuffer pixel formats
  media: meson: vdec: handle bitdepth on source change
  media: meson: vdec: update compressed buffer helpers
  media: meson: vdec: add support for compressed output for VP9 decoder
  media: meson: vdec: handle compressed output pixel format negociation
    with consumer

 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/meson/vdec/codec_h264.c |   3 +-
 .../media/meson/vdec/codec_hevc_common.c      | 133 +++++++-----------
 .../media/meson/vdec/codec_hevc_common.h      |  13 +-
 drivers/staging/media/meson/vdec/codec_vp9.c  |  29 ++--
 drivers/staging/media/meson/vdec/vdec.c       |  46 ++++++
 drivers/staging/media/meson/vdec/vdec.h       |   4 +
 .../staging/media/meson/vdec/vdec_helpers.c   |  68 +++++++--
 .../staging/media/meson/vdec/vdec_helpers.h   |  11 +-
 .../staging/media/meson/vdec/vdec_platform.c  |   9 +-
 include/uapi/linux/videodev2.h                |   9 ++
 11 files changed, 203 insertions(+), 124 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
