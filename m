Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD335C46470
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:10:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B87327E35
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZBKS4jq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SwuDnWbt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B87327E35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vo8PNMQzFt8jPuvk/Bhl5+WS9P0SZG8vlXo7pxRQP/I=; b=gZBKS4jq+hkSml
	YTKK0j33s4yAQ+R3M5YzqzuYfbjmFA9MZUo7qONHdPy/zWpLFCFUjATwnznjtQTiY/0CRO4jtGDes
	Tlm0Irn7Tcp2HwS4eQ3xDD5oeo65BzPJ6Cb5YoFNbvsXaJUmHgLo77VYRYN3fY8XQlAu9qdlINKV3
	OSgeNZ67Oq7OI1C0M5vSjHo3RUJatLgLGHhANXysHtSWQZ+wMEBZjN3OXQcSECvWbG809vMTJQkva
	VjLuZB76Ak1jzvOP3bU7Bfeuk5/B+YsEMlRFpVEUpkgDCS5h+2frv2S0D/uZ4/m43Zp5a2GwttWFL
	gsMGZjDNd5YcbhwJIO/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXizM-0000MX-2B; Mon, 03 Jun 2019 09:10:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXiz1-0008L9-CL
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 09:10:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id d17so2588502wmb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=flCBkYYx+PdHsv3XsjTv06FvsWqxIYgVPOMABFKuON0=;
 b=SwuDnWbt+BrQnQbtSVGVqHEKRwhgpuaH9QN4iH7n58msM+doavax1lbAs5vFSK7Q0F
 oknUZcm8NJUzRm1eBmLB0P4JsyeqJiqifAZlHLp8KlL7dV0hZ3fP4aHWQ2UHc7yxpJHk
 deycQtVX+Cjn4UHcZBdcCfjg1AF8Bt7IOlGBHLgBa75Bm28PolHcvHtIfWefwgP8G7FX
 yYsu+rdKLV1bOVeRGXLWsPPnjAnn50Gy33bJHN3JBZt/ZANjDUXKFKg02g2jvjlv0OD0
 r9X3Lo/cYrfu5t26qEKi+uV/fbVb8HEcDMBHp6BoPGDjopy22Rhz1xtKLQVGPAf4nKIK
 f1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flCBkYYx+PdHsv3XsjTv06FvsWqxIYgVPOMABFKuON0=;
 b=GY6KFPNbrGPAbVrHV4K/pNvkhzhNjxsTwGbLJcapg7kQfUvmaYNp3qu/DvxOIgnGCU
 e8DYkcuTIMBzKvM5ERwgRrDl5ssPpSO8SuaweAeE0a2SUH32bVhY1dNhgU8ha/62tfkm
 VQZy8esy4qvy6S7oKxu59Jda+SsOm+6yhc68OOVN7/Wt/Bexk0aPz9K+UweqlleLpGAI
 XLBq38SB2cVdKf7ap7iTIflmnu8xdM5gaVaAPzsmf1BOYwNReilmRx8niWx/fXKNuDse
 8QGeXJ7EyRp/qQwai6khq1SPUc9MTh2Mpkpl26LeeMf/nsDRt2r5eFEGExUoJ4o5nKa+
 PomQ==
X-Gm-Message-State: APjAAAWMxZ6a/HOYBuD1QjnvBdN0eMuyom+qAjdSX2CIzMDnv+66q6Jz
 fl6wCAXBKIclEcYW7FAZyvNO3Q==
X-Google-Smtp-Source: APXvYqzcNF1uAs9S8hg0XUv2b9wOOsxIrr/vf886v2rk2wi9jg/PFMdqP6QfBdMc3j/0O8fBWS+JhA==
X-Received: by 2002:a1c:9a16:: with SMTP id c22mr1449423wme.39.1559553021966; 
 Mon, 03 Jun 2019 02:10:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e15sm10676809wme.0.2019.06.03.02.10.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 02:10:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: arm: amlogic: add G12B bindings
Date: Mon,  3 Jun 2019 11:10:06 +0200
Message-Id: <20190603091008.2382-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603091008.2382-1-narmstrong@baylibre.com>
References: <20190603091008.2382-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_021023_417123_4EA7D27C 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6d5bb493db03..28115dd49f96 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -137,4 +137,8 @@ properties:
               - amlogic,u200
           - const: amlogic,g12a
 
+      - description: Boards with the Amlogic Meson G12B S922X SoC
+        items:
+          - const: amlogic,g12b
+
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
