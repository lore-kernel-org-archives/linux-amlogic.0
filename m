Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B7C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Dec 2021 06:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qsjj6XQlhwBcsMqJ4Lm7n0fUeYQSoUl2H4s3gvQOvBk=; b=HkwINon0G8uscS
	SIuyWKKlzd63OX8DDBTMZxyPJ+ldc4U/toYLTKnG0bV7CJV4Aqw4MG7X1d0yO8t2Q3hLbKlLDxHGR
	w1K9RXC3Nekvh2IW5R7ALHe4QrDuxulob5ql2LD1AE5JRp22Ltk4pXa6JJ8l0xhtoSVhen+OgX/HV
	7tas0bZVJXk8fXHKlB0pOCM1vKpjr3TRaTFPXAwIn0J3V5EGCyVZJTf/1uV6Ymty9ESXs18OCJI8+
	4ad6JsqZMV4h6e1vFMzhrodbPhd5yIwjIUrlDZIFDchXDDS9LOKRZUI+A5kdHWwRZVJO1xqpgBMey
	ikiedXDYFoKGpJh1NjZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvZm3-000uWp-Sk; Fri, 10 Dec 2021 06:52:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvZlr-000uSk-KH; Fri, 10 Dec 2021 06:52:44 +0000
Received: from droid04.amlogic.com (10.18.11.246) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 10 Dec 2021
 14:52:41 +0800
From: xianwei.zhao <xianwei.zhao@amlogic.com>
To: <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, xianwei.zhao
 <xianwei.zhao@amlogic.com>
Subject: [PATCH] dt-bindings: serial: amlogic, meson-uart: support S4
Date: Fri, 10 Dec 2021 14:52:39 +0800
Message-ID: <20211210065239.21687-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.18.11.246]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_225243_693780_490A94B5 
X-CRM114-Status: UNSURE (   5.00  )
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

Add serial bindings support menson S4 SoC family.

Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 7487aa6ef849..72e8868db3e0 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -29,6 +29,7 @@ properties:
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
+              - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
         enum:
@@ -36,6 +37,7 @@ properties:
           - amlogic,meson8-uart
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
+          - amlogic,meson-s4-uart
 
   reg:
     maxItems: 1

base-commit: 84184107c39ae65d08f6d449a57ec58734ff535a
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
