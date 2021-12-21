Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704FDC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 03:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsyGX9iBZzVCBlLCXTf1FmSx74E1+DMtrZJeTrp1V2w=; b=QFOM0rCkVvG0GC
	A2g0R7tqlRXNju+0J5SbEGxOtnVl6AP70EphjBA5EE+Q3qkZSwGPYeRN60yiHkzc8z7S1IiOCGO48
	Z4dxiqJPED/9o9DjRB0L1DC3VJvcEcykhtUcXfR8uLeRDcajtVCcVB4FXs3+4zFKKFARMC7NBq9zi
	Qz4zvFGtLjeCrkM8VMCI/xD9sxUopWlxfPWeSb/09GO9SZM+qnxcR8ELBtIaPShHdKpEUZ7S8cIsU
	sXKdit5JzEPiBhe9VtThJtCGpoG/tu1zdsxBHGxalqIVdHES+PXuOZnVzn3Rkm6b89SwcFSvhe4Kj
	IEOMNHGURVAXQGNOeEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzVRl-005LYp-1v; Tue, 21 Dec 2021 03:04:13 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzVO9-005Klr-JQ; Tue, 21 Dec 2021 03:00:30 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 21 Dec 2021
 11:00:16 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Christian Hewitt
 <christianshewitt@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Vyacheslav Bocharov <adeep@lexina.in>,
 <kelvin.zhang@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3] dt-bindings: arm: amlogic: add S4 based AQ222 bindings
Date: Tue, 21 Dec 2021 11:00:14 +0800
Message-ID: <20211221030014.434-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_190029_720967_31256DF1 
X-CRM114-Status: UNSURE (   6.36  )
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

Add bindings for the new Amlogic S4 SoC family,
and add binds the compatible for the Amlogic S4 Based AQ222 board.

S4 is an application processor designed for hybrid OTT/IP Set To
Box(STB) and high-end media box applications, with quad core Cortex-A35.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
V2 -> V3 : upate author name
V1 -> V2 : modfiy soc name S805X2
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 36081734f720..31df120d73b0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -183,6 +183,12 @@ properties:
               - amlogic,ad401
           - const: amlogic,a1
 
+      - description: Boards with the Amlogic Meson S4 S805X2 SoC
+        items:
+          - enum:
+              - amlogic,aq222
+          - const: amlogic,s4
+
 additionalProperties: true
 
 ...

base-commit: a3ebdcc8fb3d94de390e58ad3da6161826a58a87
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
