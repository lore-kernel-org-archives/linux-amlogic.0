Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69362C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B9A32377F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:42:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O90LRMCk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GdPfWrKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B9A32377F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8RbDo9SUAwS76bIy9WymOjg5qCbrocM9UoGIfp/kKQ=; b=O90LRMCkCyUutx
	96JYIhgyFD3amsnoFVOR2ePCgGmnVSQD0eacg4poH6W+Jgo10c+hopybICIxKVMhD6zM8Eyd9fQiL
	aZzuWkhzrPNmev73+BerP9nMvd1tYYbuAWpbdPSf12neZk6E2nTRPwCXaoMs2ScFg11HqrRSMvsG8
	JI5yACsccueBhEnI05j/SVUm4Qe0ukrz75hJ7dBxrAVzqWUeM7dt5/Vr2A/WbOIu9296z1+2fqmjC
	BrNdk4fXS+10+hCcVIrgAcUdB2j8hHU7L/H0GVeE7W0aH2XLyKwi3jPNMwHVRS3PKYNA+PS8b+DeO
	YB0alDMaezDtbc89qwVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzziE-0005Kn-KG; Tue, 20 Aug 2019 08:41:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhj-0004vv-0M
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:24 +0000
Received: by mail-wm1-x329.google.com with SMTP id k1so1569640wmi.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lLrSRS8pvD415Y7pil0oxXPvn0IdPhB7KI2Ad+RFYU=;
 b=GdPfWrKshjNkikUSOYnn/MNowhVUPN//wLj9zC1QBalNX4iF1bDDWiGqlPTEFAjPFd
 6JdydSpSg78Ti3PB2/ndGZ8DzoNKJBprGfM+rRSOa5MlafV3yAcFw+zzVU72YvRFN9ZU
 AhwLMPGytbUritZbatAUwNNe1w/MfGVdWSEOq+1RPKIodRQKVwudCjOUNEQYPe0UuCpN
 xmY3+xUv52zUZ4WZo1Y71DCr22UbIIofmkKxlwYm+AizZIxl4+fvYeozM58PlPIUVT74
 M/uo58NK618BYuWSbelEvHQRS2wnGKQIaq9w71HbLuQUrejt37RXGrX2XnMob6rGo1Lb
 7QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lLrSRS8pvD415Y7pil0oxXPvn0IdPhB7KI2Ad+RFYU=;
 b=GLlK3Edg32+PwxTNXqVa9hM70UXX2wxk8rJd11gMaBAxZ7+62yFyPfxiPsngB1sZkJ
 F9G/KY7K1XCFUdYz7H3aYlwjDbiMKmkJtMVo9t2l1sMJIWTdfzHM7sT7l19ZYf8gxWRD
 86ZowU7zB7sinxqBjLJXtpS69YW5WDqMzkqG8QistL4Pf52vp/6LGjG+6bfHEnH7bPUd
 yR3N94r/A+zLzEmgp4JJ8e3wkxL6cmgDZSjOeeqylMD/HdmvoQ+ddckEY5MsMaOdWyJn
 HYMYE8LMUjwXmYPTqz7bGkcmpT+ilFNFB6PL2Je5TF+qQO4w9BJb1S/d0BH9vI0Niutk
 4ULQ==
X-Gm-Message-State: APjAAAVYD9plTkygnXYNFM1z042K19LxA6S0iw5Hsvx/XVKHu+yvHh/z
 bmXbTwGX+gD5t8RwMDIKyXvzog==
X-Google-Smtp-Source: APXvYqwiHM21/zJHepoK/A0Ag59YPDuYQqEc20EqsPCkhW8DLHYUGWxrHv5h2btYx8v7YOae1PMtsQ==
X-Received: by 2002:a1c:760b:: with SMTP id r11mr557337wmc.41.1566290481158;
 Tue, 20 Aug 2019 01:41:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 07/11] drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
Date: Tue, 20 Aug 2019 10:41:05 +0200
Message-Id: <20190820084109.24616-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014123_175687_E3F8D840 
X-CRM114-Status: UNSURE (   9.14  )
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

Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
for these modes in the connector if the platform supports them.
We limit these modes to DW-HDMI IP version >= 0x200a which
are designed to support HDMI2.0 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 316823abdd00..cb560b231d74 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2793,6 +2793,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
 
+	if (hdmi->version >= 0x200a)
+		hdmi->connector.ycbcr_420_allowed =
+			hdmi->plat_data->ycbcr_420_allowed;
+	else
+		hdmi->connector.ycbcr_420_allowed = false;
+
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 	pdevinfo.parent = dev;
 	pdevinfo.id = PLATFORM_DEVID_AUTO;
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index c402364aec0d..04e63ed29417 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -126,6 +126,7 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_mode *mode);
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
