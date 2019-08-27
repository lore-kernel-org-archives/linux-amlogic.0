Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92ADC3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99580206BF
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJjvTGgD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zvmHQrGr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99580206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zs+USwcN5TcxGkMG/FgoePej0/ctw0sPN6SGJWbDvZU=; b=WJjvTGgDs9WWxr
	A6tMz7NvvaT9XT6krg+bYf8BiJ3DNTdxE/1fdYfeGvHFNXyZ3BHo5tfMK7fEdYYUFRtxSd/E9zTZB
	Avs13/ArD6486YEBbpCB4cYLKvLpi9Vx3KR46j+ZjZmoQIehmZjInz7Mt/FwFx4acQ1RLwKSz5fVM
	gHN8fEbWJSbRrjVShj4V0VHrsDfLpkaCJp1XUe9Q0+hY6+iAEddxci0UjMv2K7wk/Stu57nAf0994
	nFXmxSiJypTA8RcjPOcohbeY4StMmr60ciSld+FoAVX/9WObF02hVtnMb9PiWuUih6J/0YxInnzXR
	M8oxZD7qOsIawQLdd1UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wcr-00041M-64; Tue, 27 Aug 2019 08:14:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wcd-0003mc-IV
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id o4so2066191wmh.2
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rf+Fb/D78w3i+4TzbVehqskNNypv9unv9HAaSJpdWso=;
 b=zvmHQrGrjBcBUwpMSCUNi+a3SsH9bq0JxEVQOK2M1WTophp7K27yBvua8SlTjR97dG
 H76O2lQXPtJ05fdxZE83rOAWcCAWejxNKSZl0WP58qnWYTNqZGqU7qCLz7lwzjJTzF/T
 y7ya6fU2g/k8KDTPviATtF06/s3SkeUjaHrMLNmvQUXj/cHId5awbMeUIQ99/auC23u5
 ppt77F0MrskDvGO5EC7yAD23nU49wSX7E/wF6EoTPvhpDncRjwnpmxisNUf0JoUpd4tB
 CdytHWJVU0KrnNo29sSCEwqd9VWFVQAEErfRyE3ApYfUQ9o1bLnMoKt2d0NEqkkU7S3v
 lLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rf+Fb/D78w3i+4TzbVehqskNNypv9unv9HAaSJpdWso=;
 b=feH2pSPrDewm5jUyolWI6AJ6NZHI/t7qLegS6Ox8Gc91b2A7MlP6byKYYYorC8GXhU
 dcRSoOUGkpPKVdEnnM6u4Q2IXX4srpDQcgygN2s9fLddXz+7e8n/hPUQ/NY+URmXMGEa
 AjSvGIeIIiGx0LeabjpII8l3zfE90hgSMDGBaxzQXmnWf3zzdSb7jk3AIW1DluZROoW1
 Pn6LfkTSl8lQEnhuVI0SxjN7+HJYt+26tWzRfkM1jdEdrvSouiJT29NrlJCNlNFN3wz9
 cMIGaD4LdXzz0Tc27ySmN3lLtNtL60kQEwHspQ1ojmE1M6Rt/+vm1dNOEni7ggBgayot
 Qs3Q==
X-Gm-Message-State: APjAAAWiNsBGodIgYBWVMcEXodlzxtw4x7CsBsB1kjS0eO30TdDBaNUv
 EhJMnx07FDSF02H7/NnvnUtX1GUEDSIk2A==
X-Google-Smtp-Source: APXvYqzcST9C+Gwl8FfR3pGgo1a/ClAEBtAiPLNyZuPithhFN+DiiyD1q11WoQix3UFPCREYue4UNw==
X-Received: by 2002:a7b:cf11:: with SMTP id l17mr26068073wmg.158.1566893672720; 
 Tue, 27 Aug 2019 01:14:32 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 5/8] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
Date: Tue, 27 Aug 2019 10:14:22 +0200
Message-Id: <20190827081425.15011-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011435_625288_A2716C37 
X-CRM114-Status: UNSURE (   9.15  )
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
index 00aacad51e29..048409af13d2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3031,6 +3031,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
index cf528c289857..25a884523b45 100644
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
