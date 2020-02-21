Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9F9C35641
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBA8120679
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 09:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lmi5QJEj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VllRnzbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBA8120679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYH+4Wf+HTZWIDbxoaOHVe7oveRW3S0BWnk9ayjWleI=; b=Lmi5QJEjYRiENh
	BnEMvkmvEAOC1TpTg/LstdQ8A+iWtMCo52yHfX4Oo9s4Owdtpj944Q1MVl6k6w7eNeAGdYxfx0GRG
	oDbOpof/6yRVGz5EfJOY6TGhICmHk95XxjlRC08y2IzN4x+kEyy2EYLLsiI/fNeNXlJSd+fyEJCwE
	5LfrgivtfhzRzYnhlpWUD+dvDoZS4Ta/TTqytMNsE9958WKfvhOdXN6yvuPMQfo6PiifY7Yj1Vwgp
	HI2Jpn74OB/dXorHDJdYouiFJ02mGMnSoLm2+EsdjKRnG121MeLEuivhztq3oIzO9YIdKoxGZEJK+
	ljQ1JVcLmNC+KYruFquQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j54J8-0006oo-D9; Fri, 21 Feb 2020 09:09:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j54Im-0006WN-GD
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 09:08:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id w15so1090367wru.4
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 01:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=VllRnzbBY6hzEcF2hDDNEkEEdYvCxAauRWNfmMJ2jr5QM+kqIiikup1MAhGL9zBWyd
 oUrboYCfNKZ4a0skJ6d7MgewVYHeestIVqUH2cy6fY9JY5Dp1e1L36ssdzJyMbUD5yHw
 1CxyhZVKgDm7TzzTjLpeFiJZHRmDCyGqwZNUa7BP7UXCKEM4eRiEJNOPd9TCyc+DhR7T
 P/m11SbBi7RnlEU9hGAED2brqYRm9OeMYaYVLjRvREON2AI04lMe+5L1W+qWdHiOafHY
 G8FzRy3/4Bagi6LkMZ8zrki3MjALcwD60jngmtaK3e4xoYe2zvTnMfs1uHPgD4wLxuIW
 1KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=SYb7fiidJcdeyouf4tD9GmDSe9iKiy3eOXkBTWSWFZIBajbH3yRkruhEk/xzsGZHhy
 eDPWnsZVeNirH/wFN0zMmEVC6MQyir+52tRne0z6ca/zAd5c59dExl1efyBGO3BpIhDp
 acMQwwW9qLvJulACimRVWoas4gRnDFBqLcCe8gYl9l+NivvXjPS2+BkejrVo2Sh+QMiz
 ZkFLf3rhTWyCPG59uRAL0/3NRL1z+J0YJa8mS12v6DAiXnHw45Ic8Nsrs92KXgHpkP1A
 eKgVCC8McEHBf7/edGp6NDERgByM1SFZJ7Ko4+ouQg3d7Vijbvsl3rk4EW0wnAsxZb+S
 IJHQ==
X-Gm-Message-State: APjAAAVzGx1sB/o/e6cXOxE15A+ZWOa7G4BILygOXvPCKrCNZeUFuUWQ
 LImOXXSSi2J079aPBpGWvzkGDw==
X-Google-Smtp-Source: APXvYqzkjc9uO1jlQ9asSGYblHXAZ61o5tYA+NmLBT/SG0XjoMfflPRxU5alISIHTeI3dAaRbSoJkg==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr45917500wru.382.1582276131114; 
 Fri, 21 Feb 2020 01:08:51 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
 by smtp.gmail.com with ESMTPSA id
 h5sm3173288wmf.8.2020.02.21.01.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 01:08:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/meson: add Amlogic Video FBC registers
Date: Fri, 21 Feb 2020 10:08:43 +0100
Message-Id: <20200221090845.7397-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200221090845.7397-1-narmstrong@baylibre.com>
References: <20200221090845.7397-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_010852_555949_44DB5CEC 
X-CRM114-Status: UNSURE (   6.99  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the registers of the VPU VD1 Amlogic FBC decoder module, and routing
register.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 8ea00546cd4e..08631fdfe4b9 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -144,10 +144,15 @@
 #define		VIU_SW_RESET_OSD1               BIT(0)
 #define VIU_MISC_CTRL0 0x1a06
 #define		VIU_CTRL0_VD1_AFBC_MASK         0x170000
+#define		VIU_CTRL0_AFBC_TO_VD1		BIT(20)
 #define VIU_MISC_CTRL1 0x1a07
 #define		MALI_AFBC_MISC			GENMASK(15, 8)
 #define D2D3_INTF_LENGTH 0x1a08
 #define D2D3_INTF_CTRL0 0x1a09
+#define VD1_AFBCD0_MISC_CTRL 0x1a0a
+#define		VD1_AXI_SEL_AFBC		(1 << 12)
+#define		AFBC_VD1_SEL			(1 << 10)
+#define VD2_AFBCD1_MISC_CTRL 0x1a0b
 #define VIU_OSD1_CTRL_STAT 0x1a10
 #define		VIU_OSD1_OSD_BLK_ENABLE         BIT(0)
 #define		VIU_OSD1_OSD_MEM_MODE_LINEAR	BIT(2)
@@ -365,6 +370,23 @@
 #define VIU_OSD1_OETF_LUT_ADDR_PORT 0x1add
 #define VIU_OSD1_OETF_LUT_DATA_PORT 0x1ade
 #define AFBC_ENABLE 0x1ae0
+#define AFBC_MODE 0x1ae1
+#define AFBC_SIZE_IN 0x1ae2
+#define AFBC_DEC_DEF_COLOR 0x1ae3
+#define AFBC_CONV_CTRL 0x1ae4
+#define AFBC_LBUF_DEPTH 0x1ae5
+#define AFBC_HEAD_BADDR 0x1ae6
+#define AFBC_BODY_BADDR 0x1ae7
+#define AFBC_SIZE_OUT 0x1ae8
+#define AFBC_OUT_YSCOPE 0x1ae9
+#define AFBC_STAT 0x1aea
+#define AFBC_VD_CFMT_CTRL 0x1aeb
+#define AFBC_VD_CFMT_W 0x1aec
+#define AFBC_MIF_HOR_SCOPE 0x1aed
+#define AFBC_MIF_VER_SCOPE 0x1aee
+#define AFBC_PIXEL_HOR_SCOPE 0x1aef
+#define AFBC_PIXEL_VER_SCOPE 0x1af0
+#define AFBC_VD_CFMT_H 0x1af1
 
 /* vpp */
 #define VPP_DUMMY_DATA 0x1d00
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
