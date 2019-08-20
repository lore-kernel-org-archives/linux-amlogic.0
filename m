Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7B3C3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C333C22CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WA1S3cG4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bfTxW2jv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C333C22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsGAnXH8fWvLMDCsJAoLN3gBGIgeUm4zxZHijEWNxY8=; b=WA1S3cG4EThcoq
	72TkfB9/dyyQkweuJwsw+eVVTVFihnmlN+CZFzY8YF8mcK3tW/8b3quYKjuqz2ANwEfRxxrBFJRyp
	S37eZe8DEpJXeIkd3XZ+q6QrrLiAtpUeRXP9xakGIdBlAsMYEPUPN1Ct6DjciGfnnxlRTv1ITW2Vb
	oz7Nwk5whYzQS1sVOlh+yf4a/JcANpgvDJxNavUYDTjRPLOA6PMWUFHoXNSPSMkvPvodju7OT7sSx
	I94EScTPrVYQIwuJ9DY3UrXRtkFafaxW5C3cQx0CxX3PUJAzjWarv1iuoC17TXcKpBghzQvjaMAKH
	yw3CxkmFC/h1ljKbuJbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzhf-0004rv-P4; Tue, 20 Aug 2019 08:41:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzha-0004oC-VV
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id s18so11486226wrn.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYkJZ7ygqpGVyziIAkPglTpFbYkqx1ZCclLUpHigUPc=;
 b=bfTxW2jv1ZNeSc5mHCdK2zcQw/vzn63re+UOQJv+x3SzSIXCNj48qza9cBPl33mDur
 fkd7FSvNI6j0nQOMXHlNy2RKNW/OAblqxe7e3Y9a9CD+6+mnxhINF4+inEG08sYdYli7
 yGUF1VmcEwSQh/uY/uOXHL9L0NQfcBmNFYSlnCmY8/bo+nDUXnnXlOpg40jRsU/FCGLY
 syOe1ZtHCv9HilqtHXRrilzK079KfD+/+7J1KnrufjX3RmwISfiIlMZ370rda3isfo//
 A5jasBfjs354i7zIkKR6IdINsDYQsn2ufZj5K52QXgETl25iF1t25rlKXgj7KdQ+QcwA
 TNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYkJZ7ygqpGVyziIAkPglTpFbYkqx1ZCclLUpHigUPc=;
 b=bN24KKs+/DZsXgEbygfdpPSLE/YcT6Ug64XlRwU6W9knruALD9338ve1Py3touFGdT
 zW2PmAhG2YKmUp/lndywxTVOBoP0z4MJgMIyM5OLYBfJk7+3t0WZmFRP74wAzAZYacf+
 wAOrY465f2nlInuZJ/jHWoBwlWL+aFpWf/L78u9DIR7na84NbimQsuUCY+UjF16ihu8x
 Z5JpJ67XdtmcMOg+dG+92WEIRJrurnx7lELfuI8Ba9LyQ4Q2p/5IpQsr7xDFufZI3X24
 zqgX5PZovXsMTt32YI0JZ0wITqyI6mETrVmo4oHxVslYqqcQ9Lh3wfkj90Y2hNrPcmvT
 43aQ==
X-Gm-Message-State: APjAAAXc8BlWL8UzPeQ9xdJVr15RsvYcwyrrNztmPxMeKkXzi01JEAdC
 YIG4mY7Q30Osdcf+iHcuvuO4oA==
X-Google-Smtp-Source: APXvYqx2KIAs3etJ5JAW81f4A9TpNQ2I/pe1woSnHDb8DN4a16tSMefBVnJ06dg+YaHBCRBfu4g3Uw==
X-Received: by 2002:adf:fdcc:: with SMTP id i12mr33798582wrs.88.1566290472758; 
 Tue, 20 Aug 2019 01:41:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 00/11] drm/bridge: dw-hdmi: implement bus-format negotiation and
 YUV420 support
Date: Tue, 20 Aug 2019 10:40:58 +0200
Message-Id: <20190820084109.24616-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014115_019205_6BBB4352 
X-CRM114-Status: UNSURE (   8.52  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is based on Boris's "drm: Add support for bus-format negotiation" RFC at [1]
patchset to implement :
- basic bus-format negotiation for DW-HDMI
- advanced HDMI2.0 YUV420 bus-format negotiation for DW-HDMI

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

[1] https://patchwork.freedesktop.org/patch/msgid/20190808151150.16336-1-boris.brezillon@collabora.com
[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com

Neil Armstrong (11):
  fixup! drm/bridge: Add the necessary bits to support bus format
    negotiation
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: switch to drm_bridge_funcs
  drm/bridge: synopsys: dw-hdmi: add basic bridge_atomic_check
  drm/bridge: synopsys: dw-hdmi: use negociated bus formats
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/bridge: synopsys: dw-hdmi: add 420 mode format negociation
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  97 +++++++++++++++-
 drivers/gpu/drm/drm_bridge.c              |   6 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 135 +++++++++++++++++-----
 drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++++++++----
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   8 +-
 drivers/gpu/drm/meson/meson_venc.h        |  13 ++-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 9 files changed, 295 insertions(+), 68 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
