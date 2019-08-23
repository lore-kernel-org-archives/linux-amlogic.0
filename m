Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E565CC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 08:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71D922CEC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 08:15:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sy17vD9h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C2llLjqz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71D922CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P512GYuScElYDwE+SO4xWFR2AP3BNUGSS+ymHv95jlw=; b=sy17vD9hqCQTej
	PbVNTHO+jwEBqd4Qqk4/aYWYNMPr+quLCutBj9m1bOBIId3DxjJV4c/UnclpzeAp06aoa7UhI0rIC
	PLR36qNc3nS9Ea3dfujh9UvKa0AeTkynq5NF4thDzpLs2xlp3pGIoaf/iE8/nlLSa1AVQTbSNpz8b
	9JIbJmSVmLloNRlaYwfOqQvBLmc06XgytxgBW5ZJc87OBwk/oOGkS1OLlCNVTaRVod6F5U24FdnZS
	Lv77eQNI2ag0VsMM0TDBCLHxd5MynScW/SoqwFYPg0g5KD5cWgYdYt11lGG3bg8gZXy1H1G0OFCB8
	7giFW0w3hyvTm38DIPmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i14jP-0001wa-90; Fri, 23 Aug 2019 08:15:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i14iP-0008Pr-7J
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 08:14:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id c3so7781303wrd.7
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 01:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=an7EFK4JvkBoKoM3Yeo8YPBrJ2AtkRzJC4yL9T9DOFQ=;
 b=C2llLjqzUduLdL9VZmxRQLNAh79gNPvOHxRc6lEKIqSOnsdMwk9J/IuO0IKipl51LV
 ExpFAffmyTqbQbSu6k2d5JgfNOs9nStxyJMcW1WfPkYvMA+8RDoMaoi/ygi6ySq3m/Pj
 pONoERsHmpyXMtpyhd807rWxNI6OdtVU3OlM5PR7rpnA7WDQJYeyt8nOBjKcPFg3NIWQ
 uUv+L6aN9WgbbiDmYKLqveuXxDxnoaqph79iwXrxx4lzgTLCwxaLDTPOkuwHUYWz1+3Q
 6ZfZOtzqwDnQcbXFt/ajvuL/K59ukUFusOgXWhri4IH9mlgFQNUEGqBxcG0hVgpgXkCF
 4WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=an7EFK4JvkBoKoM3Yeo8YPBrJ2AtkRzJC4yL9T9DOFQ=;
 b=Q3Xj5X6S661QEaWLYMxsgoZ3atk8aArvVjD3MkLWQL/Tmpef7qmXIX6WIFaVcHkJlE
 g7D7WKvJaDvbzuC96dEtY0P0V02+gvbmq9sjjHJFvhVHjXYVfU5UKmIz6KZGqiuUf489
 IRP/mtumv1saFmnbq4c1AnzO14oBvOuF7Jmy3HkOWFZGcmW+8RrFOhyQ9QYg7KyhZoF1
 4fZfNyCHA20ZTqynJleOlFAIAr3/5faTlS11QRz+LLUoBuLWvgwSpFm0pFhNruu97Cz5
 5Xg9DBsJqTbaHA0xjCImuuQBFGAcOk59l2BhAp5Z8NdZuTB6V0OVoIXHY1jUn0gNup3i
 XFPg==
X-Gm-Message-State: APjAAAV6NELker4dRa5PeQyV/RN/9DDmxOojDO25HFYkIZpb3yo2+FFS
 CYdxPw0Gz9LeNJ/dNGIJVRchsg==
X-Google-Smtp-Source: APXvYqzGW6+sUuZMXFxTaQiVCRz6B52nyNUkpqM6pyYGjlS9BL/UG5O9FVm9nklwKZfHr9awWgIN/g==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr3487147wrv.156.1566548071564; 
 Fri, 23 Aug 2019 01:14:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 74sm3632535wma.15.2019.08.23.01.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 01:14:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] amlogic: arm: add Amlogic SM1 based Khadas VIM3 variant
 bindings
Date: Fri, 23 Aug 2019 10:14:26 +0200
Message-Id: <20190823081427.17228-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823081427.17228-1-narmstrong@baylibre.com>
References: <20190823081427.17228-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_011433_258590_2702DBD6 
X-CRM114-Status: UNSURE (   9.22  )
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

The Khadas VIM3 is also available with the Pin-to-pin compatible
Amlogic SM1 SoC in the S905D3 variant package.

Change the description to match the S905X3/D3/Y3 variants like the G12A
description, and add the vim3 compatible.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b48ea1e4913a..2751dd778ce0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -150,9 +150,10 @@ properties:
           - const: amlogic,s922x
           - const: amlogic,g12b
 
-      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
+      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
               - seirobotics,sei610
+              - khadas,vim3
           - const: amlogic,sm1
 ...
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
