Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D40C25B47
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Oct 2023 11:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+X3bQO9Tv8X+RZfaMEkIi0bu129tDzddJF7i+e4JW0=; b=Kb6jCMkOYRyPYc
	e9w0Fs+rw6Bp+vGnZg2u6xCGPsaRwwH3/IYIH7p89UnkEpWRhlVngri1eObgJjIOUbwiBTunu43WB
	Zqo/iuKDxViiQX5nrw1y4c5yVuJSunBzJTLD9t86B0xOg1DI4hak63nMaCG37u2wGgQccH0sA92Y8
	wD8JIyixIzvCEwM/vR98+JgBLn0+ocX6aMSpnd7931Mrt+nCwlKwk0GNi8DVcWIktD0/AraywOQqp
	RjNtmfZGaME+JFhk/VwKKdIZ+yN07hh8l++ULgnVArfWHsSi2aVF+A5dnTK7l8Mc/r5C6Gd28RJtO
	Z4zirES2D2KDAXxVh7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZH-00GGSf-33;
	Fri, 27 Oct 2023 10:59:55 +0000
Received: from [58.32.228.44] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKZ8-00GGP1-0C;
	Fri, 27 Oct 2023 10:59:47 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 27 Oct 2023
 18:44:25 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V3 1/3] dt-bindings: watchdog: Add support for Amlogic C3 and S4 SoCs
Date: Fri, 27 Oct 2023 18:43:56 +0800
Message-ID: <20231027104358.342861-2-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027104358.342861-1-huqiang.qin@amlogic.com>
References: <20231027104358.342861-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_035946_095799_600E75E2 
X-CRM114-Status: UNSURE (   6.37  )
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

Update dt-binding document for watchdog of Amlogic C3 and S4 SoCs.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 .../bindings/watchdog/amlogic,meson-gxbb-wdt.yaml    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index 443e2e7ab467..69845ec32e81 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -15,9 +15,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson-gxbb-wdt
-      - amlogic,t7-wdt
+    oneOf:
+      - enum:
+          - amlogic,meson-gxbb-wdt
+          - amlogic,t7-wdt
+      - items:
+          - enum:
+              - amlogic,c3-wdt
+              - amlogic,s4-wdt
+          - const: amlogic,t7-wdt
 
   reg:
     maxItems: 1
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
