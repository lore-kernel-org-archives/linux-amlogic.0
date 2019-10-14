Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89550ECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:38:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A54B21744
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 12:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LhaVfqal";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mz58iYxS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A54B21744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DAxzlkK0xJFyRkutoN9On0JyE1x+afTqEUajs6oQ7Lk=; b=LhaVfqalL2J07k
	xF/BnNhbVAcqsy5atwcNh1Zu6dSJdFa9FpNSTdRNrj0n8+ogRQj51TZtvfR7riCbBb8P7QmeV6Ooh
	XabBKOCWx7ylh+vjHNCPMBQiamkAX8e/B3ij6bbcTxK1EIav8zlZS12fqKoGdyZhNqyt2WbYO43OG
	YzB5Cbc9ZOmQaIHJxcu57rBf/7WxG6eVJaX3mU+EHGGwLWBHJEzOqrlrm8wAw/otYAsDLRr9510M9
	sfrICKV8dxe7oHL4RSZjrUNPiPOhWNrqE3w1o6VKEWNtbbYtaoa10HhWXaVyGV/hdpBOO03w8SVqX
	JJ4ce15lyA3/+k1gUdBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJzcT-00086M-8f; Mon, 14 Oct 2019 12:38:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJzcP-00082a-CN
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 12:38:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id j18so19530503wrq.10
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHlgrBNnQvZHdlIhaAIwv1P7BiVcNY7YDyLmFn9uKVI=;
 b=mz58iYxSQEYvYf9X0tiVoBtwk4DpjvkN3/8wfK1vhAFu/n1X/1t+LEo+7+LgmeDQQA
 s4Y98uW35kkjrTLOwvRflsDq+B9qxcprU9J6wEJ0v8XewRroDzR3ihShCkB4zv3sLNl4
 KNwSA1L8XO9OO5fDEB5+xGr97e8TVBI2HLPPCtjHVdYWwHCkNJtvcGZJg154gJEvtxF5
 rrJobAtc/hw4Ath1WvhV1+fZuLMqiK+HSRcaDOu5B4NsOjqu+ff/1liJ/u8A8LiXqoTV
 ybTFITLEt56+xLWFLN3Bt4xjD3MbMS6n+g5o+HLB5HDX5FvNspjFvGPW0NhPhRTrq903
 HJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qHlgrBNnQvZHdlIhaAIwv1P7BiVcNY7YDyLmFn9uKVI=;
 b=NHAC1SyljdSiLyf8ngm61RZvPNBE1E9SLW7OBE4iOdDX7nJ/318CMQMxlICDFStpnQ
 J18fJwxPMVHDvOS0zIxYJ/f5gBoUOBNFVX7O/VlvJctbr7pv3czArJGpxod+S7KV+gJ7
 l1CYk8IvqnlzWK883YRx398oQYJeykeaqaT+7YCJwoW+m+MgMA8+PjQcTRw/xtLNocjz
 HLxGCgmwiYbo7yBZuT5yKdMkYCTrLMxMf5JAX2JT4rzqzjNVjohDMt6SxP/z6F0EPToV
 Rw/8kwQCD2eRUfR6a7j66xM6yCVhUho5ASzteobTkBEm6pgpOkW8OK99CoXyWThR/to4
 Ue7Q==
X-Gm-Message-State: APjAAAVwFwPAfA/CpNKC4aC3ZjUKzIKt/lVTZU0bexDXAfXFAAv08Uss
 beMxpLJ7fe7yKO3yOJ9kkwxQ3g==
X-Google-Smtp-Source: APXvYqwMn8mKSsHjusTUrOEZvm5C0ca3mShMRyG8qq1fHYhQEd05XeLBSOf4JIln1DHYZGqjzagwvw==
X-Received: by 2002:a5d:6592:: with SMTP id q18mr27503680wru.382.1571056711338; 
 Mon, 14 Oct 2019 05:38:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/meson: add AFBC support
Date: Mon, 14 Oct 2019 14:38:19 +0200
Message-Id: <20191014123826.27629-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_053833_434809_95B9F025 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, ayan.halder@arm.com, Brian.Starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the ARM Framebuffer Compression decoders found
in the Amlogic GXM and G12A SoCs.

The Amlogic GXM and G12A AFBC decoder are totally different, the GXM only
handling only the AFBC v1.0 modes and the G12A decoder handling the
AFBC v1.2 modes.

The G12A AFBC decoder is an external IP integrated in the video pipeline,
and the GXM AFBC decoder seems to the an Amlogic custom decoder more
tighly integrated in the video pipeline.

The GXM AFBC decoder can handle only one AFBC plane for 2 available
OSD planes available in HW, and the G12A AFBC decoder can handle up
to 4 AFBC planes for up to 3 OSD planes available in HW.

The Amlogic GXM supports 16x16 SPARSE and 16x16 SPLIT AFBC buffers up
to 4k.

On the other side, for G12A SPLIT is mandatory in 16x16 block mode, but
for 4k modes 32x8+SPLIT AFBC buffers is manadatory for performances reasons.

The Amlogic GXM and G12A AFBC decoders are integrated very differently.

The Amlogic GXM has a direct output path to the OSD1 VIU pixel input,
because the GXM AFBC decoder seem to be a custom IP developed by Amlogic.

On the other side, the Amlogic G12A AFBC decoder seems to be an external
IP that emit pixels on an AXI master hooked to a "Mali Unpack" block
feeding the OSD1 VIU pixel input.
This uses a weird "0x1000000" internal HW physical address on both
sides to transfer the pixels.

For Amlogic GXM, the supported pixel formats are the same as the normal
linear OSD1 mode.

On the other side, Amlogic added support for all AFBC v1.2 formats for
the G12A AFBC integration.

For testing, the only available AFBC buffer generation is the Android
Yukawa Dvalin Android Mali blobs found at [1].

Both SoCs has been tested using buffers generated under AOSP, but only
G12A was tested using a runtime stream of AFBC buffers, GXM was only
tested using static buffers loaded from files.

Changes since v1 at [2]:
- Discards XRGB modes with YTR, only allow XBGR with YTR
- Add non-YTR modifiers for G12A
- Disable completely XRGB modes for GXM, until we find how to disable YTR
- Add proper argb remap for XRGB modes
- Enable OSD_STAT sync signal

[1] https://android.googlesource.com/device/amlogic/yukawa/+/refs/heads/master/gpu/
[2] https://patchwork.freedesktop.org/series/67832/#rev1

Neil Armstrong (7):
  drm/meson: add AFBC decoder registers for GXM and G12A
  drm/meson: store the framebuffer width for plane commit
  drm/meson: Add AFBCD module driver
  drm/meson: plane: add support for AFBC mode for OSD1 plane
  drm/meson: viu: add AFBC modules routing functions
  drm/meson: hold 32 lines after vsync to give time for AFBC start
  drm/meson: crtc: add OSD1 plane AFBC commit

 drivers/gpu/drm/meson/Makefile          |   1 +
 drivers/gpu/drm/meson/meson_crtc.c      |  81 ++++-
 drivers/gpu/drm/meson/meson_drv.c       |  38 ++-
 drivers/gpu/drm/meson/meson_drv.h       |  17 ++
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 375 ++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  28 ++
 drivers/gpu/drm/meson/meson_plane.c     | 224 ++++++++++++--
 drivers/gpu/drm/meson/meson_registers.h |  62 ++++
 drivers/gpu/drm/meson/meson_viu.c       |  78 ++++-
 drivers/gpu/drm/meson/meson_viu.h       |  19 ++
 10 files changed, 880 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.c
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
