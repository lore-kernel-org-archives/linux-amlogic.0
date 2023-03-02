Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3465AC6FA8E
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZkUAChuM+cuv+bwMWYdNPl25g78YCMe8TBrifQ5aho=; b=E65pZGBcV0QmL0
	GW0k1N3FS3zJPKabGy4Hh2dfLMFpdbNIo55ZdhF9TLxmWXZbcNcIfws4l5GMVfICegGSrpyQGOEKu
	9CmeAEzeOwYTdbEhjLL1qmUU5GWW1KKALtUuyoFyXjmz1rDL0RP1rCmhOQ4Bp0JAFXe7BT6+rg1kQ
	SX86ZEq6uPyQ6i9wrsBPeoVnO7RrGwVhROy+XO8Ik9bFfU7TQUbvFGtPTLSunzK21aEyfTqmJn+is
	IXdETzC4NxWghD8F4bxeflnv1gxSqJsM72eceV3D/oRUu2Lwwy+bOuSDmxCf020h7t2lxjPWlFvFV
	OBzMeyo0nT506j50h6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWk-0011kr-Q0; Thu, 02 Mar 2023 06:34:54 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWj-0011iz-4r
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 06:34:54 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:51 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR Controller
Date: Thu, 2 Mar 2023 14:34:01 +0800
Message-ID: <20230302063402.42708-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230302063402.42708-1-zelong.dong@amlogic.com>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_223453_204903_E9C28A38 
X-CRM114-Status: UNSURE (   8.44  )
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

Add new compatible for Amlogic's Meson-S4 IR Controller

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
index efd9d29a8f10..2a6662edd04d 100644
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ b/Documentation/devicetree/bindings/media/meson-ir.txt
@@ -5,11 +5,14 @@ Required properties:
 		  - "amlogic,meson6-ir"
 		  - "amlogic,meson8b-ir"
 		  - "amlogic,meson-gxbb-ir"
+		  - "amlogic,meson-s4-ir"
  - reg		: physical base address and length of the device registers
  - interrupts	: a single specifier for the interrupt from the device
 
 Optional properties:
  - linux,rc-map-name:	see rc.txt file in the same directory.
+ - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
+				 rc driver as type RC_DRIVER_SCANCODE
 
 Example:
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
