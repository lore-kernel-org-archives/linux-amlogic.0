Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B152FC4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:25:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6552064A
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dbuVvTyE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zyIYpwV7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6552064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=26Pp3L3sNcRfJh6op2Y50/1HGrEGbm484KNw5oDIiFA=; b=dbuVvTyEmwqjY5
	uHPTfgSeUKSgLu6n67FDnHILa3oQowpjKcmqWZwmfx4oJYPtK7qMo6PVLgppdVkBdhKC4gWbOdryt
	IsO/EK8zwHjDMOp9ByXHUWXyqegEQExfZLntsoAiNgQ6dPLS3FIKrmmfwnVUwtGIfLllgGCrf74RX
	WUKepmwRpSh7N7VQWQXveIc4BCfKQJJcduNdHicYMJEmi1P2yEUqgstCsInCxJN2/sFgBZLxEVY4/
	jhdc5owWs+Z4bboGdL0IaKG0dyxMU6qQvW0lDif59LPp0xXXaMFSO3GCIHJ3FqFT01b+4WEXZe4gQ
	YAukuTzcF9Q7/i8YPzHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUhT-00060u-Tp; Thu, 10 Oct 2019 09:25:35 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhQ-0005xx-Cc
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id y21so5976445wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBZJziBCP0Io8mOtg7LNdgKGNqQTzy9M4M3Ibpe8gWQ=;
 b=zyIYpwV78KenVxkg75EKDfnK4bllbOhdikspSpe25/Sqh8qsrZuw0eOnU8Obd0Z6TN
 lBUHJM0Sica6r6dTkw19utZUSwWwIq5rNa1M7QuX1yUKgcZiC+OO+aSRAuCbZ2DNVe6X
 A8NE0KEmWx9hnzN6ixgCvGF8RfrtFH4dU8xQ+WdRpNa+IzKh+qTyN+qkYDhsAdicFTv/
 zuQ1pem7a12ipH3crQ7iCrLnNvuAZUKTlWUNwQNuGlvmelb3AmjlHWCe/ez8yK9jpCOn
 bRRbvvQfX8RzBJLUJxWMGIVgGyRNQN1uz4myBlT+De/jf50kiitn32n79gQXwrcnPdcz
 Qnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBZJziBCP0Io8mOtg7LNdgKGNqQTzy9M4M3Ibpe8gWQ=;
 b=rKxH1jfImDz4RVtOdpvDJ/x+YaB/kIv6Xt48Q81lZqc3d/R4KrO5v0woSnRc8Y9+/2
 EZnbNgV0d0tw4y3MtjMC5CDnmn7CKCxLeuGk5srsO3WsDgJ45T0kL9qDsOnFefZLpmNe
 /Uc1kh5DWeWiX7Oqc4WIqOFonTs724qnI8B12PwWdPh98W4voSx2CAnZXxZ/WF5ceZRJ
 KmldqfI4iz9/V9Yb2zTVpT/gFpbDBht3F38yKiu5qsB3fFb0yvhhn3ZkaNxFlb97t85N
 fZeo7a6hSeJJsCCqdy96UKuML4veXUbt8I3dchdQc0MhJ8KeVCsQLT04O4S7jIieF5oo
 w78Q==
X-Gm-Message-State: APjAAAUJGicg6dmZ1+Pb+CX3RIiQYBPEKa7CNwwI7uNs6DsNyOQ/vl4K
 QN2KjunBR0tln3RF2JaCPNLVTg==
X-Google-Smtp-Source: APXvYqwMySxHV38oK6rqXMAyhha5lJA8caNfQ4pkjOaluJZgT5JIoYWO/VrHE7PRQ9rwHcIUWeIVuQ==
X-Received: by 2002:a7b:caea:: with SMTP id t10mr7189361wml.38.1570699529796; 
 Thu, 10 Oct 2019 02:25:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] drm/meson: add AFBC support
Date: Thu, 10 Oct 2019 11:25:19 +0200
Message-Id: <20191010092526.10419-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022532_494939_4FC81E4E 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
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

[1] https://android.googlesource.com/device/amlogic/yukawa/+/refs/heads/master/gpu/

Neil Armstrong (7):
  drm/meson: add AFBC decoder registers for GXM and G12A
  drm/meson: store the framebuffer width for plane commit
  drm/meson: Add AFBCD module driver
  drm/meson: plane: add support for AFBC mode for OSD1 plane
  drm/meson: viu: add AFBC modules routing functions
  drm/meson: hold 32 lines after vsync to give time for AFBC start
  drm/meson: crtc: add OSD1 plane AFBC commit

 drivers/gpu/drm/meson/Makefile          |   1 +
 drivers/gpu/drm/meson/meson_crtc.c      |  81 +++++-
 drivers/gpu/drm/meson/meson_drv.c       |  38 ++-
 drivers/gpu/drm/meson/meson_drv.h       |  17 ++
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 370 ++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  28 ++
 drivers/gpu/drm/meson/meson_plane.c     | 216 ++++++++++++--
 drivers/gpu/drm/meson/meson_registers.h |  61 ++++
 drivers/gpu/drm/meson/meson_viu.c       |  54 +++-
 drivers/gpu/drm/meson/meson_viu.h       |  19 ++
 10 files changed, 842 insertions(+), 43 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.c
 create mode 100644 drivers/gpu/drm/meson/meson_osd_afbcd.h

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
