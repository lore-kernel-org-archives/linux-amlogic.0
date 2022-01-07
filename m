Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56354C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GWVBvjilQWjtL1kd1VmKQ+N2LUNANycLAkj8/EB5JIo=; b=VtVMrlFYpQnoUr
	wQWRbJHUoh4NIP938NQ2XD2nX5wNLLKDwXVDPhwS+VMHY8efAYceTPlUHCRpzKh2IQOOX3rTHc6yx
	YHRRDOtBtFOss6D3usWsDgqTIM8E+20mWpLWujnhGvYpK77jqjJB3aDiD8OAhA1zAerwAkA3ogarl
	L54O6iyD+Se7cDEZNCeBoI7uVrF/s348UyL4KcMfIXWxnN9rrPBHIKqQTAvIBjRpD6YdC6mNVktnD
	65lh+UjhQcf+glatYYvMbEiW6Rgp4YR/dypxSUVIpI9QkaG/PK2At1pd6p4YpOPkx7c5pe0kgtv2v
	PdbtwYoUpQBFEF2yvrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qek-004K4h-P4; Fri, 07 Jan 2022 14:55:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qeM-004JmH-8O
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 14:55:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso5555934wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OB1egdVUErhbIEcGNr9v6weyeR2HVWTfX0w5sfnPT8=;
 b=23kNyt/oSxQ3KeKDbsaqaKBfUsp7ntvPK7l7R5DcvRrrqteLCLDOIUE2EXy9y3cwUT
 U+8Sy4kng1/ON5Oe9tj4doiMQgEOEbnXm5z8qMDlQRI0uzJ49jI5+rbHkHkxYklybntN
 y08Kq6lTo/wN18Ypin7P+UVZcwhXtTr/W6M7qdtpfrIO0LqdYl4nWyNREV91skSSDnOd
 +KYL4/0GpLtBY/IMfMgZixsZ7Wq05QS+bClHOp5ZCB8xQCgWTecCB2mptOyqS03LxWr/
 L1M0GJZhxlRdVvUxzeQQpNY79cEk8PzkxAj6KNB7okRa66QcERl76iFqKRG+xxh2U5ws
 xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2OB1egdVUErhbIEcGNr9v6weyeR2HVWTfX0w5sfnPT8=;
 b=qstzTdBcsVU+quaTpWBNF5QMl2gHbOrU9ewPcXKk1V/KqEnLiJhTZeh9JUzxH1cVd9
 ZVwkAHCB5RriHDvVgpK4iqub75tiYPFMz4dI9KFhbBBs3Uf6SvYYoPOPk7V8ECbDXNa2
 EoddDZuPagyrHaDqSU91iMkPBaKI3yQmYrQzvoFCoRwhVtzuz6Oxr/+PciQL08Wq+Im4
 Pw05A3zSs1X12TCq8q90lV7XtmdhPX/vXmvuzR9t/M930jrwSkY07+wUenYrVQA6b4BR
 usm/L7J18LtKmUbwExEmw3OEF81baaOEa1CTtSNSjMbtN9UmhOURfaUi7RtHrPw0wo/7
 cuGw==
X-Gm-Message-State: AOAM530o3VxAOxYttoTKL5a3UsOkuNRHcM2yAIbWYo3yiDcL43jnCu9y
 LwsOMsgC0ljPwz20nr/qDe6tWg==
X-Google-Smtp-Source: ABdhPJw/hF0g74U9jqW1SRjLFDdY6ypEE7h2nALHUm54k6OflJfKc5qsDc8wlGXt8MIhuedZT5cEJA==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr837414wml.50.1641567324545; 
 Fri, 07 Jan 2022 06:55:24 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:24 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/6] drm/meson: add support for MIPI DSI Display
Date: Fri,  7 Jan 2022 15:55:09 +0100
Message-Id: <20220107145515.613009-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_065526_374955_D22E658D 
X-CRM114-Status: GOOD (  16.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This adds support for the glue managing the transceiver, mimicing the init flow provided
by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
Analog PHY in the proper way.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

This patchset is based on an earlier attempt at [1] for the AXG SoCs, but:
- the AXG has a single clock source for both transceiver + pixel, which makes it an
  exception instead of a rule, it's simpler to add support for G12A then add AXG on it
- previous glue code was a single monolitic code mixing encoders & bridges, this version
  is aligned on the previous cleanup done on HDMI & CVBS bridges architecture at [2]
- since the only output of AXG is DSI, AXG VPU support is post-poned until we implement
  single-clock DSI support specific case on top of this.

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com

Neil Armstrong (6):
  dt-bindings: display: add Amlogic MIPI DSI Host Controller bindings
  dt-bindings: display: meson-vpu: add third DPI output port
  drm/meson: venc: add ENCL encoder setup for MIPI-DSI output
  drm/meson: vclk: add DSI clock config
  drm/meson: add DSI encoder
  drm/meson: add support for MIPI-DSI transceiver

 .../display/amlogic,meson-dw-mipi-dsi.yaml    | 118 ++++++
 .../bindings/display/amlogic,meson-vpu.yaml   |   5 +
 drivers/gpu/drm/meson/Kconfig                 |   7 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |   7 +
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     | 383 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h     | 115 ++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.c     | 159 ++++++++
 drivers/gpu/drm/meson/meson_encoder_dsi.h     |  12 +
 drivers/gpu/drm/meson/meson_vclk.c            |  47 +++
 drivers/gpu/drm/meson/meson_vclk.h            |   1 +
 drivers/gpu/drm/meson/meson_venc.c            | 230 ++++++++++-
 drivers/gpu/drm/meson/meson_venc.h            |   6 +
 drivers/gpu/drm/meson/meson_vpp.h             |   2 +
 14 files changed, 1092 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
