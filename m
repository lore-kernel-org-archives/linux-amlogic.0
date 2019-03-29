Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0FDC10F05
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 703C121773
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoB28izL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JPrf9zlv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 703C121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZcEIw56LojeHi0NFGYszx9xKukWOMkhbDg0qC9uz2c=; b=CoB28izLFXKjHy
	P3BIzzznxW0sVHrygr5bxnR28+bskZzjR1OvqEOfoEaoQ2CldWSdlh0/5rkF7I1mErYuSwGNwhg5B
	KqVA35HIdzrITM7GFlhZeYaiBZup880hXfiJv1B7rjRC9+JXwMBsn5bjFAgXBfj9R4WeL71mFAI47
	LnTi+dls9RAS66Eh4Taaqqtb/DTEf5ygvBWJ3xspcQ36d5xn5Cnt0GYvXfMvS7htqaWFO8Ijd/eWc
	iniBOtaAU3XylUJTIEOdE1qWDT8HzAeHVkQ3Tyn76HbH2ANYB1I/TMGFfyXEDUw1U+uRIB9PkD42n
	J1Xrgpvq+ALw9wcvkA1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9oyM-00046n-KQ; Fri, 29 Mar 2019 10:42:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9oyD-0003vQ-RW
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 10:42:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id o10so9349504wmc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbTqFTiH87EK1fVSxWqIYud8Aw5H13N60gUguYkEsk0=;
 b=JPrf9zlvQhyp189u10Vc5MOBLaMx8QgaDQakZorTeZo9OKJV3LcY/lhj7KxmBg962h
 /YqkRzf97dgrZVvLMLEQc2V7Fgk0TYSXil/mFu3XH1WsZTkk3XBitwhdF5lUrZxAQYC9
 0BdEnERr2DC7a83r6zFYdN1QTgSyb+JNIIlB96rHW/fD+cdDZOjdmaxHOKdcd7dZqXSC
 v2swrWUj5A44rT+OoSq0NdxrKWD2jN6ZnZDvDARIFQDFTAb/qbGsqauiMHhu6g/ZLb2C
 P1TW+gM56pkpU8vJtPlYnYXAyESUvVqGO2ewQUwukqZ+BEsTiCBakQzzfML1U0veOjOz
 GIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbTqFTiH87EK1fVSxWqIYud8Aw5H13N60gUguYkEsk0=;
 b=U5OE5EpKSNot2qLc8eRqgrEzzEv0EVzc5r6v8zD+AlvkrEIrp/rwkfQTaaI60YrtQR
 vxMSk4lPsiuQkryVLD6YboZJ0ZOnVHBvH3rnOyt7f0CpJUKPGhCyZ+bIQJT6NBhu+fAO
 EpQ2HMfTy+cMDSKQ2Cg0OeUcfi633SjX3s/kdFvVRu4cU4BJtRif9pmaxLs6ts5KlqZr
 oDlTkWNRz+VydpharvHf9NSHu8b1FMcZ3detqkvAeCD3z14ipD83izOi2rfLIEG3JQAI
 VQQRKcZpdNoBnhDeaAQP+Feh0w/iS9vksyqhZtU4Hl2f7jaBFIm+FcFdr5KW3reXSboi
 KrKA==
X-Gm-Message-State: APjAAAX7HCNRvBA2YWOets4MN9zb2xHIF3AV05pH7ELQlfvua/6hHlig
 RSxn1sNIiu605wBx/FSD5jeNDA==
X-Google-Smtp-Source: APXvYqwrTe6pOJSGSIiBL2UrxW2af3HwetzllSOiVAGKLiCPwAdx/rNUEApZ5fP9Rc7rMc/QEtTPVA==
X-Received: by 2002:a1c:6341:: with SMTP id x62mr3115737wmb.11.1553856164077; 
 Fri, 29 Mar 2019 03:42:44 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o15sm1632826wrj.59.2019.03.29.03.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 29 Mar 2019 03:42:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH RFC 1/5] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
Date: Fri, 29 Mar 2019 11:42:36 +0100
Message-Id: <20190329104240.29585-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190329104240.29585-1-narmstrong@baylibre.com>
References: <20190329104240.29585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_034245_883676_F41C31CA 
X-CRM114-Status: GOOD (  10.79  )
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
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
for these modes in the connector if the platform supports them.
We limit these modes to DW-HDMI IP version >= 0x200a which
are designed to support HDMI2.0 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
 include/drm/bridge/dw_hdmi.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index db761329a1e3..325a87a82048 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2621,6 +2621,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
 	if (hdmi->phy.ops->setup_hpd)
 		hdmi->phy.ops->setup_hpd(hdmi, hdmi->phy.data);
 
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
index 66e70770cce5..0f0e82638fbe 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -130,6 +130,7 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_mode *mode);
 	unsigned long input_bus_format;
 	unsigned long input_bus_encoding;
+	bool ycbcr_420_allowed;
 
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
