Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE391C4332F
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2J2E5ls9BA5ZaJaXtEiI5ES4rMlDQeMm0giKULTFFpo=; b=Y16XQg9qP0hVqt
	jcLGw7Sn3/whaKskBsu6lTn7O4PVazOpvd95S/+yfB78UidAl21W5g1tiXDLYfqmX9aYL2vq/P82L
	qgvJUYICUvZTqMDWO5jmQ17Tdc5SjCg4Y8TD8xwufWiSoU9tE9CMYq7afQGbIh8NqTCTLQey5abkC
	2n6OFUoFmg9xPtJrh1G4s7qupD2Lsm+VGD+zTVTgw3JndfW+Ok/VWsNgU6IggOD8vV7nHMEzL9seO
	pL6W9c44r0Ca+t5Vu3w6c6/EKY2Gq8FPl3OQLPlpIy05q+k25OrT4FB8FLqsBGfsbp5Cf4AUOMjUd
	CZz0CU319eYK1PXxKVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6s8u-00ArcV-9V; Mon, 10 Jan 2022 10:43:12 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6s8W-00ArSR-PW; Mon, 10 Jan 2022 10:42:49 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 18:42:44 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V5 1/5] dt-bindings: serial: meson: Drop legacy compatible.
Date: Mon, 10 Jan 2022 18:42:10 +0800
Message-ID: <20220110104214.25321-2-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110104214.25321-1-yu.tu@amlogic.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_024248_851257_7F123B1A 
X-CRM114-Status: UNSURE (   7.50  )
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

Deprecated, don't use anymore because legacy amlogic,meson-gx-uart
compatible. Don't differentiate between GXBB, GXL and G12A which
have different revisions of the UART IP. So it's split into
GXBB,GXL and G12A.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 72e8868db3e0..ad9f1f4537a0 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -28,7 +28,10 @@ properties:
               - amlogic,meson6-uart
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
-              - amlogic,meson-gx-uart
+              - amlogic,meson-gx-uart # deprecated, use revision specific property below
+              - amlogic,meson-gxbb-uart
+              - amlogic,meson-gxl-uart
+              - amlogic,meson-g12a-uart
               - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
@@ -36,7 +39,10 @@ properties:
           - amlogic,meson6-uart
           - amlogic,meson8-uart
           - amlogic,meson8b-uart
-          - amlogic,meson-gx-uart
+          - amlogic,meson-gx-uart # deprecated, use revision specific property below
+          - amlogic,meson-gxbb-uart
+          - amlogic,meson-gxl-uart
+          - amlogic,meson-g12a-uart
           - amlogic,meson-s4-uart
 
   reg:
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
