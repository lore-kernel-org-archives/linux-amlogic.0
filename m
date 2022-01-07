Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57986C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZTgMl/lq7FPR5ipruDyPbhHcGpN+Z0yn9n79U8w56E=; b=aXNngEm/Q8yiwO
	EXfAi8gP+yx5OoJ4OxgLEhffZChXZNVHbbRx0bUeIdpKFj17tL7zAi5kyAjeb+q+1VYqFHBpgyM3S
	b70WaYOEwz6oxKaCrgFluhb0abH0+IYoU7vC7Vez/6CJR3XY2HPcpuspQGIae0HT8daDLlxIqH38O
	P1NBx4GeaG7iYH+oCaCm91rx45hLloZGMcrj8s/ZHtAAHMI47cAwxf2++nMlyUuCVLtLA7OeOXl+K
	Q+XrBXPqKBYVLEh0Fl/R/sLWZn1APK+ItsETh8IE7bnIdbcaRSY925eLgD2aWSn37hHnP5a0ma3Bg
	0RmF9919T2IopAPiuGJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qf6-004KCX-JZ; Fri, 07 Jan 2022 14:56:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qeP-004Jms-OS
 for linux-amlogic@lists.infradead.org; Fri, 07 Jan 2022 14:55:32 +0000
Received: by mail-wm1-x332.google.com with SMTP id l4so4080736wmq.3
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jan 2022 06:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47wpJBWQnnL/Yb6rNHbZNchIMuG97gnS58weYyw8g1s=;
 b=oDkoluSypttLPb8Umty2MkLN39zoNn+9O+8uwJHEHGGV530ukbfqnm4b05aPIAWwse
 /2V6s2vxjhUrjAZGU41ncmfN+ghD273nb2lCOlD6KX1CR5RGjjVkypoCBmQOYxnhbxGr
 j29xczS30M6R8PDuiilNYwCKA08PJYH1+/ufSiO6+xC+NrtfjlXlDevRjgguGzpQxey6
 x7b39MeJgsG8uKRUkQpPFg70pMUPxHe5oYg46UIHAhZbu3ZeDHbC3DXYRxIx7b3+Q/fZ
 fdOcqfqaB3CqPoclqeAW7ANd6Cz/7dUyXUxE25RwNSkOFMFulUUBKDXSglnWbiP/suCB
 fhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47wpJBWQnnL/Yb6rNHbZNchIMuG97gnS58weYyw8g1s=;
 b=09RY7tR5gQ/aUxoMhwJTSuy25cd5hXeEeVfRInxcW0Sy3WUieBMBwp1p3u+YDGzPak
 o/iBWWqNRuU9uYAuOFS5KjdcPMTolT4QCTTGoSXA4zmqGN5XFpwwwKeJpqDVoNAjKN0b
 WLlZlvIJqkXKybs4J3JtJFBSyw3B+cL3PXONuQw8DTUUNI+10/l9CDfjpPbuttlLE6ty
 tmYptElJwEZlXX81UznTfit/MJ6FgGZmU6yz/GjIXNdOHIFtROw+2XgUTq9WLFimiL9s
 c3efFdaWIc2neRMsWoIDZ023LUOZfkjXazWKiIYWHz+Vqwd4AcXUC7cK194q+QMB16aU
 uo0g==
X-Gm-Message-State: AOAM531uxeP1jFIkR/34DJKBEqyefqOhg0+42p7n/lXgX3JxDYSI/ajx
 QsI9ZxYW2U3kKvD1SWJF86tUWw==
X-Google-Smtp-Source: ABdhPJyBKmX/qE3POuKtDj/Gi6P0EsDyoBMPeSdgpd9TbRF+5r9CaPnxZmF+nL27uoClnSD7luMOTQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr11484032wmc.118.1641567326252; 
 Fri, 07 Jan 2022 06:55:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:fc89:e826:8938:cbde])
 by smtp.gmail.com with ESMTPSA id n8sm5594492wri.47.2022.01.07.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 06:55:25 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/6] dt-bindings: display: meson-vpu: add third DPI output port
Date: Fri,  7 Jan 2022 15:55:11 +0100
Message-Id: <20220107145515.613009-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107145515.613009-1-narmstrong@baylibre.com>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_065529_851349_8C972CFD 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..525a01a38568 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -92,6 +92,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
