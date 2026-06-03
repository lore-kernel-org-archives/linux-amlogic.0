Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C799CD6E7B
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jun 2026 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jjN/8KwzrivsLlccsrdeaHtGAQCEM96+RJ7wodLfpTY=; b=n5357JvlU/MOHY
	nDqYMriWWysHI+sRcxy0p/XKneJ4vAR1gh8XpRNkwt6IuedWcjiepcoVL8StyMLd0vFRktERzNm8Y
	dQ4V/sDJ5jOAQy6HxhsiIKQDFXwoPmWTM0gyHib9zpYiJ1ink1lRfbZ1/kmP4H9ZkAziPgj7KiOVv
	x1Rf474Qio8EoeJzOLAwvhyaWCa/oNmv7yirS8LdC1mu/eLhcd5HpRZSbd7/ZRyjjwjRnRy3+84qU
	3Ay90eLKwuh0S3xFHTs0nB1ewUp3ZVFuDVkNDu7GX31v4bKeX2tJQzqkafdtaVbCedjRcd83jCLKY
	6NQcQGH7UTgcdXzdNnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpyk-0000000FdIG-0WPI;
	Wed, 03 Jun 2026 18:06:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpyi-0000000FdGh-1mAh;
	Wed, 03 Jun 2026 18:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73CCF60142;
	Wed,  3 Jun 2026 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 089EEC2BCC4;
	Wed,  3 Jun 2026 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780509967;
	bh=KQ2jlEW1eOaS76algkR9vPolQCqOkVsbm0MXBmfkdXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AtZbAeoHF0/ykwDr2yF10d3Q2/SE4M494oG2YHT8Jd6fMfRkIoEPvpVQQg8tTuQsq
	 lk6XbhAitGBLifTxpbP05xLSvSSqTiyrrM1k6W5TddEMKfKlnPaWL2hPB1gbv5sEIp
	 4CImul4o5jWM6bPkYleJe18A9awj3pOj/7WzAhg9RCy4qWuirKeDhSU6r3ETWxTxmw
	 rhnwKIrVuf/GavXx5iXUBLdbph/e+sX+OPgi9/2Bi+hwROzLZnb+kAWL2BZNur1cES
	 xsO6jetosoJJd06eB58tbKF/r2ALoEJMozKQ1L3DRKjq0VdbV7yFIH00WXjhckSReV
	 blPjRiP95LMTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7947CD6E6D;
	Wed,  3 Jun 2026 18:06:06 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 03 Jun 2026 20:05:23 +0200
Subject: [PATCH v7 1/8] dt-bindings: mfd: khadas: Add new compatible for
 Khadas VIM4 MCU
MIME-Version: 1.0
Message-Id: <20260603-add-mcu-fan-khadas-vim4-v7-1-594ba8a965d8@aliel.fr>
References: <20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr>
In-Reply-To: <20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=eCKy2chdqFWw8sHr2BRKBa6cnfiYWQdTnn103pMuJ+4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ5ZCLpNFVNbF+nux6bsPHFl0h1dCs0MjammbktRppwCbs
 9vmfo7tKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACZyS5jhn+mx4gPTwnVrtG/1
 bIjJviuXNMd8kf+R29mvfNw4n9TzNjP8U4o1b/6Su1LyrXJbacLR+vcMPCoV+3f6qAd8dIpfzWP
 MCwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The Khadas VIM4 MCU register is slightly different
from previous boards' MCU.
This board also features a switchable power source for its fan.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
index 084960fd5a1fd..1f135618e3b6f 100644
--- a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - khadas,mcu # MCU revision is discoverable
+      - khadas,vim4-mcu # Different MCU variant, not discoverable
 
   "#cooling-cells": # Only needed for boards having FAN control feature
     const: 2
@@ -25,10 +26,27 @@ properties:
   reg:
     maxItems: 1
 
+  fan-supply:
+    description: Phandle to the regulator that powers the fan.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: khadas,vim4-mcu
+    then:
+      required:
+        - fan-supply
+    else:
+      properties:
+        fan-supply: false
+
 additionalProperties: false
 
 examples:

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
