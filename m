Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783DAC43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A52820657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r5xUT/Kt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CcyAyENf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A52820657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dHg9Sxvgd6reM1/I3k2+vo7Mc/pCpLnsXmE8mayynGA=; b=r5xUT/Ktq1Ikdu
	yMCCZRqCv9tVRn1SCwm4TqNRcO2BCAeU7VRFZTpbFIO6lEZDPbo1hsPxolbL8+W+c3iM9O7lLe/3O
	Q6rjAKbv8Ytzo7gz2Ocqx3yY3Pkn2nQiPEiYXsBCXWyJAefLrUJD/x/8pfB9hieHli2oyhaRw9YIv
	pejuzn0jgt/Jv45ZWhvMvjq7q7lXiLoCPSCQYLh/CcsiL9EOGT77MtfUh5823p+RaHe1we8zxxZaB
	SyHMa2sZRwTpbVdVsFz+aLPzKN9OuEe1aBLRDx8oLeH/6/kQEWuR5XlQizlrzsHRI277aiYLhVPOb
	xcsPXEA5BdYGfmaB0rlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuH-0006fX-DI; Tue, 15 Jan 2019 12:33:25 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuD-0006ed-VG
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:23 +0000
Received: by mail-wm1-x343.google.com with SMTP id f188so2994123wmf.5
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnmW3I3aEOcM2Y+7WXt4KDIp2EOVSptX4pBq7/8Df+o=;
 b=CcyAyENfCtVN7ZMfdOP4p0aG2ptP1DAWTQOveShiI46S3YXa5YG6CqxzqBBhVYRmBC
 kPYS8aQTS2cXViD1mBxRhIwKbyf+8CB/Q8+pYa7MOMhI2oxvHm08+AaklkPzwfg0ix92
 6eQkJLaNjN7Ruii6803zaZHfEZ/MOETftwED9VQgtMrbYCS8L1WVBz8Aj/4uJjx5g1+I
 ZS2djorDqCXjjLfecgoaaNmD+1jjBJZ9rdUTksyF3jB4o/PGgGUvF1EAIHM6Pywj1c+c
 RXCddnLuA5O68BmA85aZ9BeBjsQ+aGlxncB3Qdu7Ur/swd3M7JVzVTaSXujgiOJps6Lc
 Ulvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OnmW3I3aEOcM2Y+7WXt4KDIp2EOVSptX4pBq7/8Df+o=;
 b=GuPQ4Wq1NuiB1MOK26E2XK7PAdY+vPn/+gWHkTTGK/WKxCNteLc8aDcZQtsW4VnTVy
 yU6WdICiVadogetkHKh5lSLSxvjnZ+8BByygqSXBzNMjX7j4NftPiSk2+LYfkJcap7V8
 QIj4VPEmzAy1u1IuQcaCKbhRYkTlILJx6I/eThmoJl1UtgbVCwGNMWKy7BXWRw9gxhAa
 PQfrny8Tyh+MNWlqtHBfFk+3wsR2b/KIAnW4hcWfuSVtLnsl/n2oq8kjWKG/z/QxrFkC
 2Uq0JS+3hJNxwn77tzS0WxA3jy/KOjXWCCOxjm/rgevBt1rzIra1R/niqKoZBEx+o7ad
 mnxQ==
X-Gm-Message-State: AJcUukfTBpFWwKTab1xgeuDF8q8WWx2qQUt8bEanFvP+ZZXn7fCLqvCm
 Q3HVBGAViITvr6pnQT0wP59+Zg==
X-Google-Smtp-Source: ALg8bN4JQ2jEGUeUu2Z6Tlisa1zjk3iTHIYjpA6uu4+OeEo6P4OMbzX1XyoQkWD9Jl52Pn73gUuLRw==
X-Received: by 2002:a7b:c951:: with SMTP id i17mr3410360wml.70.1547555599796; 
 Tue, 15 Jan 2019 04:33:19 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:19 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 Philipp Zabel <p.zabel@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 maxime.ripard@bootlin.com
Subject: [PATCH 0/8] drm/meson: Add support for HDMI2.0 4k60
Date: Tue, 15 Jan 2019 13:33:07 +0100
Message-Id: <20190115123315.11069-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043322_004330_1FA5621B 
X-CRM114-Status: GOOD (  16.63  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset aims to add support for the following HDMI2.0 4k60 modes:
- 594Mhz TMDS frequency needing TMDS Scramling and 1/40 rate for RGB/YUV4:4:4
- 297MHz TMDS frequency with YUV4:2:0 encoding

The first mode uses the SCDC helpers introduced by intel to :
- discover where the monitor support SCDC
- setup the SCDC parameters
This is implemented in the dw-hdmi bridge driver by handling scrambling
support during the bridge setup and by exporting an helper for the PHY
setup to setup the SCDC configuration for the 1/40 TMDS rate.
This code will only be active if the encoder support a TMDS rate > 340MHz.

This patch could eventually break support on different SoC when connected
on a 4k60 monitor with SCDC :
- i.MX correctly discards pixel clocks > 216MHz
- R-CAR discards discards pixel clocks > 297MHz since [1]
- Rockchip discards invalid pixel clocks not in the rockchip_mpll_cfg table
- sun8i correctly discards pixel clocks > 297MHz on a83t
- sun8i discards discards pixel clocks > 594Mhz on h6, which is already broken

First patch should fix support for Allwinner H6.

The second mode is implemented by added the missing 4:2:0 bypass handling
in the dw-hdmi bridge driver and adding a "mtmdsclock" separating the
pixel clock from the tmds clock in the mode setup phase.
We also enable support for these modes in the connector only if the platform
glue code explicits the support.

Only the meson DRM dw_hdmi glue allows ycbcr420 modes, so no breakage
is expected here.

The remaining patches adds support for :
- 1/40 TMDS rate aka DIV40 in the dw-hdmi meson PHY setup
- 4:2:0 output and clock setup

The dw-hdmi support re-uses the support done by Rockchip engineers on the
Linux 4.4 BSP kernel.

These modes has been validated using a MuxLab HDMI Signal Analyser in
addition to different UHD TVs supporting full 4k60 or the 4:2:0 variant.

Changes since RFC v2 at [3]:
- Collected tested-by and reviewed-by tags
- Changed if condition in "add HDMI div40 TMDS mode"
- Updated "Add YUV420 output support" with the same if condition

Changes since RFC v1 at [2]:
- Fix all comments from Laurent :
- Add define for HDMI 1.4 max tmds clock and SCDC supported version
- Call dw_hdmi_set_high_tmds_clock_ratio() in dw_hdmi_phy_enable_powerdown()
to unbreak Allwinner H6
- Pass in_t(u8, bytes, SCDC_MIN_SOURCE_VERSION) as SCDC version
- Finally add comments for SCDC and Scrambling process

[1] https://patchwork.freedesktop.org/patch/263616/
[2] https://patchwork.freedesktop.org/series/52950/#rev1
[3] https://patchwork.freedesktop.org/series/52950/#rev2

Neil Armstrong (7):
  drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support
  drm/meson: add HDMI div40 TMDS mode
  drm/meson: add support for HDMI2.0 2160p modes
  drm/bridge: dw-hdmi: add support for YUV420 output
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: Add YUV420 output support
  drm/meson: Output in YUV444 if sink supports it

Zheng Yang (1):
  drm/bridge: dw-hdmi: support dynamically get input/out color info

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 182 +++++++++++++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 128 ++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++++---
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   8 +-
 drivers/gpu/drm/meson/meson_venc.h        |  11 ++
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   7 +
 9 files changed, 374 insertions(+), 66 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
