Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B8EC46470
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDEF8216C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:38:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SyFMJVK/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Wu/evQfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDEF8216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RUExgW6Ko/95SBOOBLH/opced+3hTd+tCSXlS4Oks10=; b=SyFMJVK/hSkevA
	LXVxthPugfD4UVyLVDQlKrxoqmU92fG4MrAOhfulkDuSheDDwQJCJUFjJmeiW+cGzxEu+yoIckktE
	JNrnz/3JGKybgNe+yBjV1ORtHRwyjAnS+ZtGWdhOFbxhvmhor9UjnWJ9FqqPIwSJtjRaDkEq/kZ9P
	5Z4y/DRwXCXA2iIxfyGrMMvyAVZWbP0IAnGc14xeLeDilhyP3wEFk/zLwdhAuJvqf6cjMQpPAm0WH
	Nwtf9P+pSMQC0xpx3xuAGXNQb4urM8WE5SmtxCt7gZw+2kzlQTMRC9N0gur0MAMCgml8LKrfZFkM4
	/kEbXRtr9Mn6gk3MB//w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSiUM-0004x0-Hi; Mon, 20 May 2019 13:38:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSiUJ-0004vd-7D
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:38:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id r4so14625748wro.10
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6G0MyMU3h5OB0O4nHOQOZaH9nZxvNQnPCN8hItt310=;
 b=Wu/evQfLtHMDRV7nVLyUt9S+NgZOjI0Xpdpf7vk+eLfcfhsI4H8ZD8fg/9is2Heb83
 1iECSj30NX8xy9OQXoOApX7n+lsgz70UoK4txOLhlg2cWvAabO88f0mo/itWsp5Oo1Fo
 k25caGap24naJPEvMoSo1VfTPA6broJ53cy3iY0rnatOlDLOjH5554AZ3HLVlmiN+v+T
 ZEb4p9IPO/9/a+EPo9C7EAAvscMQnIeLCYseDB+rJWbqOf0kbvHXrSKDwbJt2YDDcv5p
 +JPVRDikhVtu9pGNIN/Zill4tpS+6swH5OKWVdyV3M1SGFo0V6NELkfibFcjUaJveo0b
 W+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6G0MyMU3h5OB0O4nHOQOZaH9nZxvNQnPCN8hItt310=;
 b=lsnDlVrzYVs+jeqDePaXKAUlpyn30RCoDXMbFFGQqjtRwAoLxlvcYI8onZ68NGxHQK
 Xro5e1pueaBdHmnOZCYSxj9qb4nFS7GL7+OZbBwY5uoDe9VlxEZkCcbLz6rNtWntyrxa
 QgRaupAC/1pTd3aATliLI+fSRDKMEH6YrLuqN5fjc5zJokPL/WKs1irbtobDweBmT7oJ
 nV+d0fmBeYgY7d83gqsQWuC7jtmzbo5yV4/u8TOGTuezOu+WuQ2QSMy/AsXo1hF4QHhC
 AdzFfEnG7lJwZ5Rp3pFm5oyQbspWklOdisvD2ssFmltKhbNQ0v1upN59rTR2023iNXxZ
 GpUA==
X-Gm-Message-State: APjAAAWRo6sC6qy3LgIrdt9JxnBauJVVY3BsxDzEXAFCfEyqOI8w2uO5
 2R1q+vPnJ9lXZ1wKUScezjaHhg==
X-Google-Smtp-Source: APXvYqyUsx6BWDMbs6M/qDpPzB1MW+xaQ5meKg2UcdD2zHeFLRipUXrqqBZ2pzKqNcgOvybYHGCFKA==
X-Received: by 2002:adf:e845:: with SMTP id d5mr18649788wrn.154.1558359476773; 
 Mon, 20 May 2019 06:37:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t19sm12167059wmi.42.2019.05.20.06.37.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 06:37:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/5] drm/meson: Add support for HDMI2.0 YUV420 4k60
Date: Mon, 20 May 2019 15:37:48 +0200
Message-Id: <20190520133753.23871-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_063759_320933_6A44A70B 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 jonas@kwiboo.se, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Synopsys DW-HDMI CSC does not support downsampling to YUV420, so
the encoder must downsamle before, feeding the controller with a YUV420
pixel stream.

The encoder must declare the new bus format enc encoding the bridge, in
order to take it in account.

To solve this, a new format_set() bridge op is added, permitting setting
a new input bus format and encoding to the bridge chain.

This solves YUV420 setup, but also solved setting 10bit, 12bit or 16bit
input bus format in order to support HDMI >8bit depths.

The DW-HDMI controller is updated to dynamically select a coherent output
bus format depending on the input bus format and on the internal CSC
supported modes.

The DW-HDMI is also updated to support the connector display_info bus_formats
entry to permit forcing a specific output bus format to force, for example,
an YUV444 output format instead of the default RGB output bus format.

Only the meson DRM dw_hdmi glue allows ycbcr420 modes, so no breakage
is expected here.

The remaining patches adds support for 4:2:0 output and clock setup for
the meson DW-HDMI glue, and how YUV444 output can be forced.

Changes since rfc:
* Fixed small logic error in drm_bridge_format_set()
* rebased on v5.2-rc1

Neil Armstrong (5):
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/bridge: add encoder support to specify bridge input format
  drm/bridge: dw-hdmi: Add support for dynamic output format setup
  drm/meson: Add YUV420 output support
  drm/meson: Output in YUV444 if sink supports it

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 127 ++++++++++++++++++++--
 drivers/gpu/drm/drm_bridge.c              |  35 ++++++
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 111 ++++++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++++++++----
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   6 +-
 drivers/gpu/drm/meson/meson_venc.h        |  11 ++
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 include/drm/drm_bridge.h                  |  19 ++++
 10 files changed, 358 insertions(+), 55 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
