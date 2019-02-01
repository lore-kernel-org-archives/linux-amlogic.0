Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A688FC282DE
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742AE218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VXfqbw7Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j1SwkFtS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742AE218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=imNQWLOSOem3RzaFVGL0/z0FgDhPloS/lNqc9sYogig=; b=VXfqbw7Q8f5sbcwGdpGC3Iobw8
	4r+oixyA5cOr49P4Q9BtPCxoHd+llOxitDpKb5IWwkUBkszqWA3XLtcbWW69bGa3lFGtQh8fnrsKP
	djfhqKS5d2ir/my4xS+fHCALpV0CgfV6gbn+wXLbZByD9Sy0oKVwTl3Z8B68kRQHvP9XEKiAQDvDZ
	sRXQqLrWjQmPJWgkDWnS7jskU94nYP7lh/mRSCcAUR+V0NdXzoAYEMPZt3K5rviwbgU8duIzPTtKQ
	9/MjZYUdILnNpRghvTGXMJhH6AHTzmee8lDmiYIgVfB/TFB/smYyMP9XByqz+tQL2d588CRAVMAGc
	p7h8pX+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXcA-0007eD-AH; Fri, 01 Feb 2019 12:08:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXc3-0007Uf-OU
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id m22so5976884wml.3
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VBMrKAKVDCcYyoO1zNr+tcBtFeROASvMyA7RWb6h7Lk=;
 b=j1SwkFtSRo7zQ/oCPgBS9O8DAQNtjdzKmnJQ6TCUdAT77FGEKg/H2+Cn26Hfbv2SoB
 tf+i4ZzsCce9CKkAdd+4oyT2e6mSzi7VtsjGgY9oRHZBUbNInaN7E54D46RZgRv/0i/7
 5FXZfW+upURut7dda4nQEIY/C1FO8fdkkcetZmpyHdOouxaF32Y6yRiP9gV3jJh/pse3
 XBGelMpNVjaX5Gvg8ck9rQpUHq1ZYA0xzTnUdWbmwI6WSJN1RM5o9wh6tp+dEutPB9va
 mXjaam/G8n8cxRseIRa19NyEnfbs1e2iV2iR1RKqDEJWGoGejbmgy54sZP2qQiMa/NO4
 I9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VBMrKAKVDCcYyoO1zNr+tcBtFeROASvMyA7RWb6h7Lk=;
 b=FHQE+vpADGdh9LUby6MmXZdOTF5A5U4nao3fdKhd4bZUjx8h2DJIJNOAP2D0RRaTz8
 FhzCpUR/VTuXjqKXgQjXVYIwIZb5T76kO5K0Z0eGm0QYKVsvm1cFeeQ73quiS5oxU2jB
 KhlEbTZsUUFKhlrPz0qNNwDOqKV0LgSNs0nbJsIhfVkY3jxuIsl8Geg7xN3dmAUjYSUH
 LCg4inYqAHtRV3KHFGyAPrYlC3cBiVTXnyiSWAF1xnPKs2/11d07qv8wtrI5ZmNly5UO
 ijLjN6C0JxXok/NtuOkHlCUW6XY1RJfAOq1EyoS0nEyGN/RFxBDTXWbgrMyQPTIBbBqW
 qaVw==
X-Gm-Message-State: AHQUAuYqg9Lrm3VctkOg8L1RKulGVBOtdF8yewStGnPSZvLhdG7uVYLc
 a5Xte2zqKgeIy0Dr6TTucQ+jXQ==
X-Google-Smtp-Source: AHgI3Ia29IEHIxxUXtm2jeHXZPnTINwHP/Y1rIZyykt4Y1HPNFKrORuAqug49+209P7PqDh4KQlsHA==
X-Received: by 2002:a1c:4108:: with SMTP id o8mr2092245wma.91.1549022882192;
 Fri, 01 Feb 2019 04:08:02 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.08.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:08:01 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 6/8] drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
Date: Fri,  1 Feb 2019 12:07:51 +0000
Message-Id: <1549022873-40549-7-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040804_141619_2D5A5E42 
X-CRM114-Status: GOOD (  11.70  )
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
MIME-Version: 1.0
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
index 3634bbd..f1b352d 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2609,6 +2609,12 @@ __dw_hdmi_probe(struct platform_device *pdev,
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
index d506df2..ede8bff 100644
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
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
