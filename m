Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA5DC2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/haCp3qZoxGNeftOlrL8PnLCHyL1txpv1/nk7m3CVqU=; b=xAKdosODspqEVK
	YrepuXyB520gfbw0JOs0eO4bhL+KhcP6aVxplw5G4SYo5+5ZH/0tDB8g542QIwCj8DPHXcO6e16ev
	oEEoWez3sZoxB2/VAJSLFPa0uLbo3GKLrlQRSSeCbnBgyG93jN0Z5yAYYvKtUtw7qi+6gDeTbsbvd
	KFqIEKlXlt4XEnlqvYljH9kGXAsM1MKd4CO2ivl+xHOZ3VrcROWeQZRb19NO5XcEQuG8jlDWkrX+j
	+mVqauLIYyXhNole8exarmhnQsAlBizVvZZxQa5/5jop/s4HmuIWgJfWOEvmzD0sRbCahshNr7c/M
	UfF5HsMdDuh59ipIPyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtIV-00000009Bt0-02Ec;
	Wed, 03 Jul 2024 06:16:55 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOtIE-00000009BmC-3gmE;
	Wed, 03 Jul 2024 06:16:40 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 3 Jul 2024
 14:16:15 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings for Amlogic A4/A5 Reset Controller
Date: Wed, 3 Jul 2024 14:16:08 +0800
Message-ID: <20240703061610.37217-2-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240703061610.37217-1-zelong.dong@amlogic.com>
References: <20240703061610.37217-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_231638_944572_C84BD30C 
X-CRM114-Status: UNSURE (   6.47  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add new compatible and DT bindings for Amlogic A4/A5 Reset Controller

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../bindings/reset/amlogic,meson-reset.yaml   | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index f0c6c0df0ce3..80345af81d5a 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -12,13 +12,21 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
-      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
-      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
-      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
-      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
-      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
+              - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
+              - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
+              - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
+              - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+              - amlogic,t7-reset
+      - items:
+          - enum:
+              - amlogic,a4-reset
+              - amlogic,a5-reset
+              - amlogic,c3-reset
+          - const: amlogic,meson-s4-reset
 
   reg:
     maxItems: 1
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
