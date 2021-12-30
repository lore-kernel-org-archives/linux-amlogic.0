Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsiX8UxvmyUdMycsO+LTd6afAhZiIvlsM5Xx2SL6gFI=; b=CD2NyHwZOfgvmd
	RA2rl8dEEJGXa3+F/ac1KbVoFTP01Z3PZGD+kK6XCqd5nyhgYQF3pb4IBP3nPfpM1I9YqUK5viQX7
	0Nc06FgTNGiKZAdDyNUFSHGbkglp7wPRSzOb9l0LrISYFk61Ac9QiqJgFED+BT+bYiPpB6+0Iw7iJ
	dkeEt6jjTCvSJz61JAGvS3/3Q9O9z/3i1Ls2nqHwcfG3XFo6Gt7Ti0aWCSl0xtlBg55LRenIlnoWz
	oBk3FLipsVls4R0RhhclcF7mCfYCjXYq5trp3a0vfLyho14p0nFsxBrfw//ri5Xvehg5UOLjYtEMv
	igKUjZ/O1qN8c7ycoRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2sZs-004Bs9-0p; Thu, 30 Dec 2021 10:22:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2sZ8-004BXP-Rt; Thu, 30 Dec 2021 10:21:48 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 30 Dec 2021
 18:21:44 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 3/6] dt-bindings: serial: meson: Support S4 SoC uart. Also
 Drop compatible = amlogic, meson-gx-uart.
Date: Thu, 30 Dec 2021 18:21:07 +0800
Message-ID: <20211230102110.3861-4-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211230102110.3861-1-yu.tu@amlogic.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_022146_914087_4A1D93D4 
X-CRM114-Status: UNSURE (   6.56  )
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

Deprecated, don't use anymore because compatible = amlogic,meson-gx-uart
don't differentiate between GXBB and GXL which have different
revisions of the UART IP. So it's split into GXBB and GXL.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 75ebc9952a99..b03040a83a9f 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -28,14 +28,20 @@ properties:
               - amlogic,meson6-uart
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
-              - amlogic,meson-gx-uart
+              - amlogic,meson-gxbb-uart
+              - amlogic,meson-gxl-uart
+              - amlogic,meson-g12a-uart
+              - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
         enum:
           - amlogic,meson6-uart
           - amlogic,meson8-uart
           - amlogic,meson8b-uart
-          - amlogic,meson-gx-uart
+          - amlogic,meson-gxbb-uart
+          - amlogic,meson-gxl-uart
+          - amlogic,meson-g12a-uart
+          - amlogic,meson-s4-uart
 
   reg:
     maxItems: 1
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
