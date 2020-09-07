Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9A0C2BB84
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2453021481
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ODVmB3sV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eq8pdz4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2453021481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qOQBLkMb28VpqX0M4zexoMqo9HU5ac3Kn3HMvxzJaNk=; b=ODVmB3sVbsp6S2iMLipk/v1BsC
	ROYXrWHCmXh9kX+4reWR8hTbe4kejqpcu02vv43ECrQuwT4FHFCqDOiBlmnwM25W0qgTVR4kKCrtl
	hFUKBksXUIbn9DuY/Qvnw50Y030lnTzmfodm6g94dAht2PmVyylhfPU+xRL/iSirb2+wGMsEpm+6b
	aPer/qCo3s0BFC2hLwrdX5JNSEdSdgaKWFs4vI18is8rLTM8D0i+qEW9+hGsJ0dNV/nHI6tc8FgHN
	h9ZK+08Q8Kr/nLLRhE8LnTAhrpOcvFxpZS7D/mmc3ajx8lHTUf3RA5pzbSeiyCZKh8WmiawFNXN/n
	HCTojpeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCMD-0000zy-DO; Mon, 07 Sep 2020 08:18:33 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCMB-0000zD-F0
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:18:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id c19so11791772wmd.1
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVkpcj81glnSnuras7YrChzwHxX/+ElP6dnTPDpVflM=;
 b=eq8pdz4bEvw8Drm9IiyKHHS/9tFdgbwA08m44Eo5/3AjXDsoVvgB9xtCqI9yTDhZHe
 JWhhbtGcwt6X672OqK0uhjV9ZpDs1Wdnkrdm8HSe0aMBznreCxHk7OroTON3aUfddLm1
 NC7fuE0Ak5aP4nwxtYkewvg/z0Jq9O03FCVjJetdv4XeVtDXiq+/CAXBQIDTxuM4AraI
 A0oDMSoo3d7XD6D3VHC5oDtBsyl3T/aSCS37kU3emyahVkV4GBseZ06BTPRVOUCjQQHw
 UdA8A5B3ZNrRfqyEoUmZH8v1Ac+suW/fzeN/twc47tAJbxfPkd7NYADS+cFIg3nobAEI
 5k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XVkpcj81glnSnuras7YrChzwHxX/+ElP6dnTPDpVflM=;
 b=HVOSIJxj5jjUzGqwd6EgM5UK8PXzxoSM7X8l+NtBaNVWq4424rna27r1m5drtzpBEz
 mH4zA++eU6NeQREGcUBNde6H/4V2P60U7AsKJq51B75AZu93qG7fe8AdgfWo1FCX6Dgv
 z1iN30YZn/nlCNZsCIAtOSa2FIcJf9KmnQHJem13dukjpw2yLwdS2CD9LczRy0q4bxjK
 rYU5zlb/TBivSlZ4LP16BJMr01fN7bdK/GPOGSJRRKBuf+TZOInmrpP1VawtRr27AbRC
 sUdS2wrNsiOMRFtgSC8CmVV1b76LT9hkLHFFdEMwIxCrCJ2Pp7oqwNtP8N4hplnCv2MD
 ELcA==
X-Gm-Message-State: AOAM533iQxF/DCtkTfFwktvfEY7ozxZReegSQj2ZGr4BL3ogKafgw9km
 JbfhRGt1gizoOKUQvWC2/epG7Q==
X-Google-Smtp-Source: ABdhPJwn6ZvGBo3Zj+uG7oJh3C4n8ndDDZO8Lx+buWNryuDkwiOI7oTl6RG79ry/EWhvW7HUBLE4WA==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr19191231wme.8.1599466710211; 
 Mon, 07 Sep 2020 01:18:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 0/6] drm/meson: add support for AXG & MIPI-DSI
Date: Mon,  7 Sep 2020 10:18:19 +0200
Message-Id: <20200907081825.1654-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_041831_520947_A2BACC6C 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG SoC family has a downgraded VPU with the following
changes :
- Only a single OSD plane, no overlay video plane
- The primary plane doesn't support HW scaling
- The pixels are read directly from DDR without any Canvas module
- Doesn't support HDMI or CVBS
- Ouputs only with ENCL encoder to a DPI-to-DSI Synopsys DW-MIPI-DSI transceiver

The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
Amlogic SoCs.

This adds support for the Glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
is derived and feeds the ENCL encoder and the VIU pixel reader.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

Neil Armstrong (6):
  dt-bindings: display: amlogic,meson-vpu: add bindings for VPU found in
    AXG SoCs
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  drm/meson: add support for VPU found in AXG SoCs
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: remove useless recursive components matching
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++
 .../bindings/display/amlogic,meson-vpu.yaml   |  36 +-
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   1 +
 drivers/gpu/drm/meson/meson_crtc.c            |   8 +-
 drivers/gpu/drm/meson/meson_drv.c             | 163 ++---
 drivers/gpu/drm/meson/meson_drv.h             |  10 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 562 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_plane.c           |  74 ++-
 drivers/gpu/drm/meson/meson_registers.h       |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 230 ++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_viu.c             |  50 +-
 drivers/gpu/drm/meson/meson_vpp.c             |   6 +-
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 15 files changed, 1176 insertions(+), 95 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
