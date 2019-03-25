Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6858C10F06
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9275A2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lebRjeI4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bQv5u87d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9275A2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pi0Y4KRyHGWWsyiIVFp6N00kMoRxCPQyCCUXfTbJOK4=; b=lebRjeI45OLcfz
	1IdI+eOOPQmyz4QIOG8c8wf+I73gJXFgep1KRugW0nwdPmdZDPv20IpedPq5McvdOmu3YlWkpRQrg
	n0XdG/6mlYjbBtWEcGrWFMoSsvpt037xgJbhgKSVHklrzziawz56pU+O1Vafl9ovo7xZZdO4qjX1n
	Wt9S9//GSQeiI04QLOjoJzN5Y5kqB7GMiDDoUMQLlaFHCi+V3uIvOffV6RxMeClqY9w7icghZ3j5R
	XyiS3TvidSPapTI6Vi6rqafJf23CyF1OoMRqY02czlunF0iq3YDtWxbWnRTm5bKbswgUb8fUVuqHb
	Rp3ysiKO7oYolCQpO2tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QR0-0007ih-Ri; Mon, 25 Mar 2019 14:18:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQt-0007f5-2Q
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id k11so2960016wro.5
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6lXMgJkbNJYoX51nM2DSyC+pdFe3+x6sveMv4LgZRo=;
 b=bQv5u87d8xeq3pTrIKhQHu04gqYQqBUfe0F8spmdU8ydb0ojqoWvPmgxBedhE0EmHh
 0pNYDWwZLQKCwBwbdml+VyHBBrCT1kTgW71a7NrHuYsYbx8G52TmygavBXGZzYMNV8Kp
 YkdMjsQkjxtaCcJ68ajt9dH+CXiSpFprQ6o7jZlhjXxVFSxCKZny+u1WB45ugzIpmkNA
 9qSPuol6c8EokVDGp+SfrcfDHUixwT1R/FAXgrZacEBDjiXEzehqqYu+Tfw57yOfI7lH
 ITCz2nn22+3s/w77CvBdEtC2KNQcwPbzhmFSG5IKq3j8SgMZQSUY3AEVf2ZI+DMGr1hU
 nMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m6lXMgJkbNJYoX51nM2DSyC+pdFe3+x6sveMv4LgZRo=;
 b=RB/cSgpmd4ICxiSpTtWJOA+EJ2HtqQn7xgFNjkb2xktSSpYke41za8/T50zKbrwQ4j
 HHYlvhLshnmRIxaMJv1EorMsUdlTk1eAKe3HXx2pcawjLvFQ3KgpP9F8W83kmBLIc+b2
 sNrUA/yXYx3yIci7MwDUsSwbUEIncdtEt2b76+N3wMFL5K/S7kEWGI8MvP9eEPmFqsw/
 pBem4J3ooIxUxap2/Oaby8hTdrOg6cztrWumEuWxQGdzs/MInfe3VpGL8EwNDWpejFc9
 iCi1ybBl3N2xCO4RhQBJHpQIIDfD4+EhxTHXpJ2TgVrPuU5Id9SlKNPo+l7+Ca2OhkC7
 mEtA==
X-Gm-Message-State: APjAAAV1JGdaCAssTm1p1mrEVWaHYJpl6eZpjM8r4JFAwTAzNGgUD0rQ
 o9gzSN1/e3yknyrFsL1v4ZPCzFtt87seSQ==
X-Google-Smtp-Source: APXvYqxXjEUWykNzKlubJowVhJ9OqMpsTbP96CwZoWJF0qg7cwK8zXIgdtR6saIMDZlg6khXCh/1Eg==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr8619269wrn.89.1553523507309;
 Mon, 25 Mar 2019 07:18:27 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:26 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/11] drm/meson: Add G12A Support
Date: Mon, 25 Mar 2019 15:18:13 +0100
Message-Id: <20190325141824.21259-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071835_113006_45949CF2 
X-CRM114-Status: GOOD (  11.61  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A SoC offers very close Video Display
functionnalities with it's older GXBB, GXL & GXM predecessors.

The main differences are :
- G12A Support now 3 "real" OSD planes with a new Blender module
- Instead of having a single Scaler for OSD1, G12A has two scaler
  that can be applied to 2 out of the 3 OSD planes or on the outputs
  of the blender module.
- The HDMI PHY now support RX-SENSE, Dynamic HDR and it's registers are
  now memory mapped instead of using an internal bus.
- The VPU now support a DSI interface to connect a display, using
  the Synopsys DSI controller and a custom PHY

The complex Blender routing, HDMI RX-SENSE, Dynamic HDR and DSI support
are not handled in this patchset.

This patchset implements on-par support with the currently support
GXBB, GXL and GXM SoCs. There is no support delta with this patchset.

patch 10 & 11 implements the bindings found at [1].

[1] https://lkml.kernel.org/r/20190313141030.5958-1-narmstrong@baylibre.com

Neil Armstrong (11):
  drm/meson: Switch PLL to 5.94GHz base for 297Mhz pixel clock
  drm/meson: Add registers for G12A SoC
  drm/meson: Add G12A Support for VPP setup
  drm/meson: Add G12A Support for VIU setup
  drm/meson: Add G12A support for OSD1 Plane
  drm/meson: Add G12A Support for the Overlay video plane
  drm/meson: Add G12A support for plane handling in CRTC driver
  drm/meson: Add G12A support for CVBS Encoer
  drm/meson: Add G12A Video Clock setup
  drm/meson: Add G12A compatible
  drm/meson: Add G12A support for the DW-HDMI Glue

 drivers/gpu/drm/meson/meson_crtc.c      | 269 +++++++++++++++++++-----
 drivers/gpu/drm/meson/meson_drv.c       |   1 +
 drivers/gpu/drm/meson/meson_drv.h       |   4 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c   | 163 +++++++++++---
 drivers/gpu/drm/meson/meson_dw_hdmi.h   |  32 ++-
 drivers/gpu/drm/meson/meson_overlay.c   |  10 +-
 drivers/gpu/drm/meson/meson_plane.c     |  15 +-
 drivers/gpu/drm/meson/meson_registers.h | 247 ++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.c      | 123 +++++++++--
 drivers/gpu/drm/meson/meson_venc.c      |  11 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c |  25 ++-
 drivers/gpu/drm/meson/meson_viu.c       |  72 ++++++-
 drivers/gpu/drm/meson/meson_vpp.c       |  51 +++--
 13 files changed, 880 insertions(+), 143 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
