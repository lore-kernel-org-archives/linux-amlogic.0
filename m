Return-Path: <SRS0=aM1E=EK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F43C388F7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CA7C21734
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2020 13:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MqkvJw4e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HjTSuvVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CA7C21734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EZmH7LDclBAFsKcIYTCqntaeB8l/ydXPG0roI29FVio=; b=MqkvJw4eCXo+t/KhBAscNuFNN
	FBBZhuLz44R5OW7RoVFJVsJ4shvlq7s8o5wkiGZttJ5Ka0gqZDu8Cdq+upuIkht76IL4lJg/V3Ucs
	g5yGY48MUXLW1lf0ZYbEXo/w9+Zz+IX7YKj9SkyZ6GrBoUMaUbUPq72l2Gth6oJHy59eLM4G6Zy3s
	EKRYowPHo3tODI4CL5V7SlFlB+JDjHniTdGINs7AhfiFj6UUB4dQfkH0BELRq65WHzpzpSbPSnY3Q
	Fdw3P0HNApLWLJPnMoNJMy8ed627wp15Wx+SLMn/aIZyCPxWo1p8u3GTOAGSPW+1PQLrImP5tM0If
	f5eCiTkOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaJHR-0007eU-NX; Wed, 04 Nov 2020 13:56:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaJHD-0007YL-KP
 for linux-amlogic@lists.infradead.org; Wed, 04 Nov 2020 13:56:42 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so22183450wrm.4
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Nov 2020 05:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dYJtPTYT6zqSviFEoyuJVLQepwx0AVqn3LnihaWjaQ=;
 b=HjTSuvVXCLyN5Xb17UWY0BzXH/9TcQ/mu6B3kXBVUzk50Edp862ZGilGal3UUbM3Q9
 8JJW1+SlCJKT2m4vlOdrFXFm4q5S4l5PkuRGU5hGMkb486tly5uLQTFAG43bG5JwFFv8
 Ohgc4hoWNFlERixWLWFRcf9L2Z7euaklDLS/iMZ9aIwcmC1YAvv/RGQRzFUDcVRc/dG1
 8Jyi3MQ2MbYHIL524rrwhdHRXA+H8iI0zirrBy4o5v9b9JjL86TkK6uDQmmhIEsfkINs
 XMpKlwZsj2RrDhkkdXPFRK35thB9Zo3ZY13RWIA+NgbuT4G+wlMt9aUfFfj/aRwzScfS
 MOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dYJtPTYT6zqSviFEoyuJVLQepwx0AVqn3LnihaWjaQ=;
 b=MW8SS25SkYm9m4zQilM7eFezA1UAGiDgAhLH1YkQXs9Jqo8oPEKAFSWifderVCzT4x
 8Qh6KWOx+crkQXuwTj6JjVQp4Daw3KHpAboOwUwXdBB2f7saK+ExqDTMqopMbdLxZ3Tn
 OnABoGGVcpeKrdMOUqtfEL6whMvmx45/XaMFZzhSX1mtstcSx8yA8KcbfxBNlPBHlkzP
 kScD4+H41c9Oo90/JecLvc/V89+wXjgMQUR6xB0Sx9fRoBolE9HI92vP3J5VTn41hWyq
 1wu/TMe0KT/YUtWUbsnupvO8W+Hex0wMkorbe17XIs6c46dozf0CNdj5s2kW7TnIxkot
 CwVg==
X-Gm-Message-State: AOAM532GCxqiPWFxTGSbgzo98005Oqg/ktFlB4/i5negrZ0BhR8QQNtt
 ZAm66fGdlue8CIJXlVKoY1Zuow==
X-Google-Smtp-Source: ABdhPJzbZfYlPISkG4WkSzxh4Sv5r+tnOypjZAiYnby/8qahqW1xegCvNbYUsxN+HvEEWUi4XVUlMQ==
X-Received: by 2002:a5d:624e:: with SMTP id m14mr7986418wrv.413.1604498197937; 
 Wed, 04 Nov 2020 05:56:37 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:61b2:b9fb:eeb7:b9f7])
 by smtp.gmail.com with ESMTPSA id n9sm2285234wmd.4.2020.11.04.05.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:56:37 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove phy cell parameter
Date: Wed,  4 Nov 2020 14:56:30 +0100
Message-Id: <20201104135631.1550125-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104135631.1550125-1-narmstrong@baylibre.com>
References: <20201104135631.1550125-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_085639_723258_43DC4D74 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG MIPI + PCIe Analog PHY provides function for both PCIe and
MIPI DSI at the same time, and is not exclusive.

Thus remove the invalid phy cell parameter.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 702763a84dac..4d01f3124e1c 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -24,7 +24,7 @@ properties:
     const: amlogic,axg-mipi-pcie-analog-phy
 
   "#phy-cells":
-    const: 1
+    const: 0
 
 required:
   - compatible
@@ -36,5 +36,5 @@ examples:
   - |
     mpphy: phy {
           compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <1>;
+          #phy-cells = <0>;
     };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
