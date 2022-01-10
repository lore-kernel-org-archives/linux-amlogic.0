Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D1CC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3B/YM4YFqHW2UoET0R7/5FX5ZV0r0sumtyr7CURQZg=; b=zHQwhPbNmVVtVF
	JMAC06il9IWMrHBLLDqGy4NlEr/S5ScaYcY5HUzNOs9aGVJgO9iVAhNclLUFWEIlSBkMvhs3u6+iq
	8CF9ogdbK5f6ewbu27UtB2vV9RURR76K100SX0hgbM27Bi3eFVnfnghbc5YeaMM2kAh5oZn44K6V8
	C+M/bRpnbRnXpYX3pHA5xJNbdDZzAxLSRzqTVELyZvTUylXWtynzLVOB0nUMmtxgRZnmHTZM0+qkv
	OWGLdklQQX91EMGgJ8crWxWGFMQJXuOHM+8uDbNs6pqehTFUmM8CkPQNPLXY5k5DmsHQsukIDlTAO
	iNecrNhJJOdbvXGz47xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6q1E-009qWt-57; Mon, 10 Jan 2022 08:27:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q12-009qSs-0n; Mon, 10 Jan 2022 08:26:57 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 16:26:44 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 1/2] dt-bindings: serial: meson: Drop compatible = amlogic,
 meson-gx-uart.
Date: Mon, 10 Jan 2022 16:26:09 +0800
Message-ID: <20220110082616.13474-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_002656_110695_4B773598 
X-CRM114-Status: UNSURE (   7.25  )
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

Deprecated, don't use anymore because compatible =
amlogic,meson-gx-uart. Don't differentiate between GXBB, GXL
and G12A which have different revisions of the UART IP.
So it's split into GXBB, GXL and G12A.

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

base-commit: 99a507a8ea28542ec196e2dd80096708e2482735
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
