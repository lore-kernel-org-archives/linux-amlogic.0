Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63FEC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:21:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AD122078A
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 14:21:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OjIOnT50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ujq4taOC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AD122078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYH+4Wf+HTZWIDbxoaOHVe7oveRW3S0BWnk9ayjWleI=; b=OjIOnT50U/vE80
	VRFxvKseMlqWZh4lgQQ36A7HnJwXRqLL4gP1GJi0NDN1nkq2/JX9Rg4OTj0B1s05m/I+k9kSjP0g7
	zpjHw9eDOQtPdxoY874wTZoH5DKyWjGBAlD1WLJKVaok0RE2iWbDPIhTyviULBlC/prgaHXyTgXSn
	nzQ7t40cIFKBHimhiUjKaNKi62/kOmxqf4PaehpKH6T1gjB/fIojR3k9YuzqnYfd88gH7AjgJSaoe
	53mHnpeoAhQub54gkzArCTT4kmDf4neeGmA79Z/W/AgoMP54Dbzi/blUZTUOZ8S8uVqoCO5tMkR0U
	JUd9B5AZwOa9pj/gqjGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGkQo-0007sD-EJ; Tue, 24 Mar 2020 14:21:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGkPr-00071d-48
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 14:20:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id d1so3683155wmb.2
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=Ujq4taOC53EX1VPxJIgX0apsuybWLHZBAKegJRrf/6iNtbxxaFxidGswTmXhcSbMeS
 5Xw3ZVu/LmLaXCJcuW8EMPuv9z7UYqeNNGxgLAQ6VinOKxZvBF/JnMPnZMfv87Rd4h5x
 QI1vyPTYzCjWy/FZgINt6zQKZQd/3dhqTrXo6uDt5z1xtyg5B7IY9IoQ53kXeZwpBs4L
 qcEzw7jIKeAWHn1oyzhZHE1t2mkKVCEZSRS+Lm9l6zcwA1TCayaFEaU7efzyfrGQKe/h
 srTZdxNIRvztfg6C9z37mIq4oy5+ODSMBiID77DGBu3wnQ9RmzjIbGgcHiF/ptrkmn+J
 h/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBEY6IZdpR56nXsPUK2cFqYc8DeNfrXDbwpY0flDUNU=;
 b=XQYn90FUkOq3/zMeX11g4MUzFABb92tSkxm+vbnLsNStDoeJ6uLgL6+IJbWtauxFLh
 iQWM6GEmIgFUiLWyR19wyTSLBVtO7Al/ygrPwg+zgswOQW/7Y71hJLAymU3QMk/2b4nz
 Ktpk4h8g/U+y9cFDZotykXh77EM/h6Ws9r2xbT8C1/qKMPWZKXdd6QNivqlaJeZTrmCw
 2W01CZrDS0Guhv+9ywakELJ0vy5JSFmkmsXFJ0afptnBC1JN2Gdc4w3HSfD7Kw9mjmlV
 0z2DNVRo8JxQ1Y70uiCt+yX5/3USf2UaJKpkI72lxmCOaKZMsJKUnOgx5TD4hZkyGuM1
 SZJw==
X-Gm-Message-State: ANhLgQ2xnWsH2k1KJkdWsMa9/Lwz3s3nWpeTV5tkRuTbFCI7+J9GMmaL
 n4nMTBFi8dAOR9pp13DROIKTirWOWt1kiw==
X-Google-Smtp-Source: ADFU+vvOnCjmbsfdy/PDaPF1ocXefI+ISW1golVVq0SNsJU1J64MUUy13XNRUmg4TPFrYbXH1WjhsQ==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr4817627wmi.1.1585059625706;
 Tue, 24 Mar 2020 07:20:25 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o4sm28688472wrp.84.2020.03.24.07.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 07:20:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/meson: add Amlogic Video FBC registers
Date: Tue, 24 Mar 2020 15:20:11 +0100
Message-Id: <20200324142016.31824-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324142016.31824-1-narmstrong@baylibre.com>
References: <20200324142016.31824-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_072027_184007_B3191C4B 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
 linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
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
