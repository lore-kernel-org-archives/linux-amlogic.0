Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87407C11D05
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57CE924672
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b8fHRetL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="flSVXLW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57CE924672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPunVxYHc0pWrsE31K71CyEkSXdeAJZAzeM3GdgVAEE=; b=b8fHRetLvxLFCB
	KOZPLpBgXadXbc5XNCV+BNjt83JKniW0Q3vHwrR4OStX4sXPZO6yLFBG0pRsBz3Aa9ZE3REogvL+m
	lieGwzqprXyMi41nVR5KzeKKZ5QczNPBOF2tA9c+YlRkr3WtyGCzQOxx+Y79MTf1QnQrmj8FRaWz9
	5+QhT3pfoTdDLcgyl9e5QJKxK07FHcAWBNrmC4HfhhqhBdfQVGm6XSodbpFcDbawYRGKodWoiD1pw
	TP48csENuDZDpE9/SPubGbCS7V/prZBFg7FMAdMArN6wAR1KhDJ/PR7018pIkz1m9grXEqLdG1UIl
	F39FOO0ABB/RJDNWjD5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4ogZ-0004Wh-8D; Thu, 20 Feb 2020 16:28:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ogG-0004FR-Ao
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 16:28:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id z3so5357219wru.3
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4L5pErhEaYa7J2GkK43QrlafHtSEfJ6mEB5MQxQaGdU=;
 b=flSVXLW8+HCvS8lAoJdppN6qT5tWnzrNaEvEDnJmCgXcC2tk9cOjdv39eJrYBTrce6
 EE/1vV9CN8QbXXJsX0KSgeSB2gmE+JqHk9DjtSAUBjiL7T1KieNxc7BkDooT9hlfc32z
 Uoi7JJddr44DQ+YGv+YisVbx4co+nwyfkwRUHk+vsmmqGdilfxBKTuc6WKWpLbN6r6b0
 08mfBvTjdJmVCPuNVGCt3gzrs8JFmo2tI27Ped5uetie25Z8Bx+0kqR3Qp8WGFcfTdfl
 7derxVfCJGNu99SNb4n+lADjOUAjezljlLhQjh9H4Gm2LsMu9SILZx0lw+bn9TkZDCU9
 rstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4L5pErhEaYa7J2GkK43QrlafHtSEfJ6mEB5MQxQaGdU=;
 b=GDdbCQ3Z7Uoto0RwblkdUMVG9ZMY5YsGZ+py3uCZ2bd9vynLbxxych9frwfK2r0WW8
 MJHpDQf/koOQ5kCobCFPIRWmQpeGRuf4d98ikKR44QNwp00+7T/G71roqeiBtDAUW6rX
 aACVASpndd75a4tOExlJyXl4/0QkormalhY/NJPI/GX6XTniuC2wjnjvR8X7+ddAMZ8G
 SqezQKAQkFc19DW5j4K8Gfwmr73bEHVtst0b1eXo4LXHKLkFfQT12EhCrrs5pBb13Kh1
 iqsBIq0SuyOIHD215GMMamAOriaGE3etvP/H4RDN29oiDmDv+NR5QKPXQQ1eAkz0wvbC
 8FUA==
X-Gm-Message-State: APjAAAUaYnTGWn/qm9KtefrQx/QPLQk/y6yXMeHzK3Pd65JUSud2Yq7J
 7gbNmxPVRh8UX0LuZdH/ZbFWWQ==
X-Google-Smtp-Source: APXvYqz8btEuioC58lPL2CALueebDz5VNXjtrpbgzakzF4p5lCTfG1eLu+ErlTVF5foqpDnbiJSStA==
X-Received: by 2002:adf:f14b:: with SMTP id y11mr20564948wro.90.1582216082632; 
 Thu, 20 Feb 2020 08:28:02 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c15sm104164wrt.1.2020.02.20.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 08:28:02 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/meson: add Amlogic Video FBC registers
Date: Thu, 20 Feb 2020 17:27:56 +0100
Message-Id: <20200220162758.13524-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200220162758.13524-1-narmstrong@baylibre.com>
References: <20200220162758.13524-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_082804_388464_94130FE0 
X-CRM114-Status: UNSURE (   7.00  )
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
index 8ea00546cd4e..f784d7d1fe2e 100644
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
+#define		VD1_AXI_SEL_AFB			(1 << 12)
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
