Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE76C352A2
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57BE21741
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LO6kz+Ua";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ewZ0X+0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57BE21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPmbODWJeOpoRO0s+/taSwr4wJY9kBtuqDeon6hHjHo=; b=LO6kz+UaMAvM0T
	apVwuCeMzCOCjnCdbmGbQpKo37l15vvH6xby9rYKa+Fg5w2N+TJc/iEdx+4i7BtF6J71NiAyFwdXX
	54IGHu+ngNte+BJWrKh74x0tkGY4YfarL21Rqk+vEzDyqGNKssHS24AynQgNnsBcwK+JEAJ/hj9Cp
	JSMDwuDqFCUTGWS/RZbAVDr450SHMu5pcNjQi71SAlvSqf4kduz8TkvcYLMJN0V8mXCS0Lfp8F48b
	t/CgYv57eZToAg17Yd/6TxNVZfVi5CxX6RuWpdvRBiS5Cr9zxLgBpyU2c/AeoHJy//tFA09UX409R
	OBCIRL/OeImf83FWXI1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfs-0008R4-FM; Thu, 06 Feb 2020 19:18:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmfl-0008H0-OE
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id m16so8539313wrx.11
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3qTczoW82L1nczYwcOGhiZ1KM1HmNc7LgyXt8NRxHA=;
 b=ewZ0X+0oLLxN96enhnKX1bzkTGICZq+WMiKedc8D88EQ5Cg8fGH+rFRiPsbyciYrSi
 4L5lbf9D/AnFkiCqqms7LGApV0le6xaa5D9nc/FWyV4Nrscl+iIUNJLY6tvD/DRLlN5H
 /mhXhtuMBGpJVJQsALFqJKMvNqvOZwUP2C3OwUPtheMnLsM0ggfKz+t44ilu7Xv+DbbB
 IEnLyg5bT36ZqcJ04Nnd3L7wLM90k3rqndg3wIP9psa57RcVJaj9WzLXOPq/sCtK3FGc
 2agblq0bI8LHvcfnz0aHOGpjEqg8FleqC8scoDhHsKNbuOzo/VV4bH9syqSfSsaju+y+
 uvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3qTczoW82L1nczYwcOGhiZ1KM1HmNc7LgyXt8NRxHA=;
 b=J6Gg6hjXNXte9nED1SxseXsf+UddSlWEXkzVIPU1+SdfA0mdaSL4Qt4DwrvZKhvg0D
 NWV7+ckIMcy5ZAsJMucrb36YmcKw7Etv6B9CX85zEt6rWOXBx2/HpFZ6diuZQet8sQbo
 /vP4jht+MPKszfeSYCHtSPX9BF03ftH7oo8AzsBQROU8ZIqcLMJMnUWGyXvXljYviD9c
 m6HFsWP4gMWF2ArAnudn5K/cU0d9LL1Cb3TVTd0N/GcTH+G1g2QJV+AFrvSmz7KDFaYK
 l08dzBR4kequLsZm3OALzIWLDXRRTAeOVpB6hDFhGA5teD2M/11X2SaGLuGrpq9ssB1I
 TVxg==
X-Gm-Message-State: APjAAAUNzXEcWNPjKGvyGMKT3PlTb2uk1JBq6WZ5obytccrWa/AisiGB
 ne+WWjrKwkw/yVztCFojO/CdWg==
X-Google-Smtp-Source: APXvYqwIOTKJnzwY5IhgDVKhEwIYcVqUnwAuTSERF3IoD/aDj3BwVe9eZ9tmY2zQ2QKNOq15gkDtZQ==
X-Received: by 2002:adf:a453:: with SMTP id e19mr5132981wra.305.1581016724045; 
 Thu, 06 Feb 2020 11:18:44 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:43 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 05/11] drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes
 for >= 0x200a
Date: Thu,  6 Feb 2020 20:18:28 +0100
Message-Id: <20200206191834.6125-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200206191834.6125-1-narmstrong@baylibre.com>
References: <20200206191834.6125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111845_794166_6FC4886A 
X-CRM114-Status: UNSURE (   9.11  )
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
index 15048ad694bc..4b35ea1427df 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3231,6 +3231,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
index 9d4d5cc47969..0b34a12c4a1c 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -129,6 +129,7 @@ struct dw_hdmi_plat_data {
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
 	bool use_drm_infoframe;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
