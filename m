Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56904C282DD
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234A6218FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Su2b+yyS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FTb54Ft0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234A6218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Yo3Rwe0zglI5lPacIzO5aoX+UURYakX0renXzGdcpbM=; b=Su2
	b+yySNyFh1CI2kxhL1vPQz+cq4g5jrzP/3hzvjmwxjVfUap4HSfp/QRo+rl0nu7RmvObuqXtGhFj2
	BF6lTi1omXrUDrSS8v5wK3Qn9tj8uw6MF7T+4sqxFeiGaI5cMFViM4uXx2thUbQjlb3BoaWwMYrWn
	xXrdDf6AVpC+Yv2mfboFU6MCfSlkwp7AYqkEOQBLKrQmpjfc57wDxRQAo6Mx1WZLfa2lNFKv4PY8U
	4hYw2PECx1EbTEGhTdhkyT0a7uVi9KXKZ+FQqSbTWuidt20AHOukwOeO1zOuuHZi2um3O7EZ/Aa+H
	pergPvS78cycJOfTKNrcFwSNt+vcfkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXc3-0007Ug-6N; Fri, 01 Feb 2019 12:08:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXby-0007TX-PL
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id f188so5926413wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=XTiGJ1VEZnu97vXLW+QBmet+F5vZfNJMdDLx5SwWiGE=;
 b=FTb54Ft0nuS5pbx0Dtg8eIDFB9LUSOpLAgoC/fHIs0aIs4ENwINXSnR9U2Mh6f2Nal
 9QAgdMPZ0DuCb5Dr2U1abv0SVE7RnKAo8c2bd9lSWRgMxJZMnpKalbtcSdWXdZGMr5kH
 0TF/znVypu7G1cHVzOYaVE1dhqAuBpfJARjJ73SwgBKPEQWxzC25gGL63eQCucwJWeE6
 +7hwpYRRdD3tjBIJ3jKzXKkrF9LvmYQM8GnDxbvVBoZwiewlM02fIc8FqOkvmbcN15oz
 04SbNenbojWeNx6VRScRyEHSb4QCnHPoOV8Y0bK/iKhoB5Mli4oh3AgRNjnQvW7F4fNi
 HPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=XTiGJ1VEZnu97vXLW+QBmet+F5vZfNJMdDLx5SwWiGE=;
 b=M/cYPQki3PzhIJRhxVY7U5Z5ra9WdrLQwHB32MPXcMUCRxANZqJuCRg8v70naBIkmL
 CmAAjcaRO76zrODz3sSlKSfZyd5vnwZvN2V3bTBbp7Zcti9LhwU9B+fl0HxGLGpCK+Ml
 G+e/+anLsdO3+aXzP6FU1N03czzlbDKiSohVS+EjgGsElHQRg6/dPWZryTOXeIUAOxNv
 Qx+ABpHtk9r0rUYmvBJaCZFcSebd+qyF8418bNSxWieZj7jQKqigKEW5/Zqz6pmNqngj
 9x6T8o1TYxdmi0wJWf3CB4XRHIwljNSett4+uQwOc3yreYAtE3OuaurD6D0N+ILFrP9R
 Z7zg==
X-Gm-Message-State: AHQUAub5UZNp67kueyAaugDOvxGx6m94PTzq6tyEOqNfnn9uxf1ifybV
 bgj+jinsCxTKeRTr9s0W1bBEFw==
X-Google-Smtp-Source: AHgI3Iaq0wLTke+ryTSUqn0bwKpycw8u6ZdqSEBWZ8f0kaSp6nKz0UvGly3iImjzcEtbA/1IVgMkCg==
X-Received: by 2002:a1c:494:: with SMTP id 142mr2169892wme.111.1549022876509; 
 Fri, 01 Feb 2019 04:07:56 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.07.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:07:55 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 0/8] drm/meson: Add support for HDMI2.0 4k60
Date: Fri,  1 Feb 2019 12:07:45 +0000
Message-Id: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040758_820839_35FE1C85 
X-CRM114-Status: GOOD (  16.46  )
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
MIME-Version: 1.0
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

Changes since v1 at [2]:
- Rebased on drm-misc-next and fixed drm_hdmi_avi_infoframe_from_display_mode
 API change

Changes since RFC v1 at [2]:
- Fix all comments from Laurent :
- Add define for HDMI 1.4 max tmds clock and SCDC supported version
- Call dw_hdmi_set_high_tmds_clock_ratio() in dw_hdmi_phy_enable_powerdown()
to unbreak Allwinner H6
- Pass in_t(u8, bytes, SCDC_MIN_SOURCE_VERSION) as SCDC version
- Finally add comments for SCDC and Scrambling process

[1] https://patchwork.freedesktop.org/patch/263616/
[2] https://patchwork.freedesktop.org/series/52950/

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

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 176 ++++++++++++++++++++++++++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 128 +++++++++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++++++++----
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   8 +-
 drivers/gpu/drm/meson/meson_venc.h        |  11 ++
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   7 ++
 9 files changed, 369 insertions(+), 65 deletions(-)

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
