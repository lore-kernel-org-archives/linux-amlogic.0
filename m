Return-Path: <SRS0=KMNI=XP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3274DC49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:21:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C915B20B7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3rgApEu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Byi0omnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C915B20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=L3jWQZbj+UEL3kSnceKJ0h8YdoVnR1tVsDNXMMTVA5Y=; b=b3rgApEuIPxMzooLE0HcW+8pv7
	tWNW94RE0Ywtcn+brU37eqS66SBWF4lNofDriqp9GPHcFI9Mz0MRKUHoRuNdODD2BcG2ei7ZODx7S
	8Y2iUhQpHR+J6X6yKifzsdr3Xm+EoNSL3rSbr4pAnveN95w3S6eSaLfB1rm0qYwera8rOWtaaVIjp
	5o7x3wh9RoZ281EDM+7aqpbXIBHygNGj3yV6tDWohBBpezvICA11SMtYKxfwpz3+BM0NmVjfHHY4T
	xnXYOlWqpJEmVQsPC65F6guvidBBZe1t5IulRvo+L22KaKsjTQYoQymY8vByYuwoayDuNF24SVMO1
	i6c2JPKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBLfH-0005n9-HE; Fri, 20 Sep 2019 16:21:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBLf9-0005dd-Py; Fri, 20 Sep 2019 16:21:41 +0000
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD0C921835;
 Fri, 20 Sep 2019 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568996499;
 bh=v/zuTY1CTu5pjJWBeLdx5nTGCDOWK5lV4Zyj61Aiqc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Byi0omnX5o2Qp0B6SzzhVdu6PlbwMX3v0dgJ1MqC72BVGsehtYXYjZXHdYcRGg/JK
 99OOpaD+dGT4BIlJSZHTJ+52+mZAyntx2bl0nbD/hLKuZgTywL5kGZNSJR4dB94iPP
 FQzjfxQyaMZ2TXKtmRnpQT185uFjy62anyBL4uzM=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: watchdog: Add missing clocks requirement
 in Samsung SoC watchdog
Date: Fri, 20 Sep 2019 18:21:23 +0200
Message-Id: <20190920162124.7036-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
References: <20190920162124.7036-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_092139_861766_DB382B6F 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Samsung SoC watchdog driver always required providing a clock
(either through platform data or from DT).  However when bindings were
added in commit 9487a9cc7140 ("watchdog: s3c2410: Add support for device
tree based probe"), they missed the requirement of clock.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Indent example with four spaces (more readable),
2. Add also missing required entries for clocks.
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 5a3a3cec8e20..2fa40d8864b2 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -26,6 +26,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: watchdog
+
   interrupts:
     maxItems: 1
 
@@ -37,6 +44,8 @@ properties:
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - interrupts
   - reg
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
