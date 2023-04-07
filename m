Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9E2C76196
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 10:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVoqooAg1j/vYwiR70kJG5TSvU8Qwn9UXUvAW/uEzXc=; b=J5axDQSHpZmxk0
	3CS7OdNkTRopkjtbqDSAIr1VNDUeE4n64rzMLl58B0i1k+hrECzu32cICn1RT1/hVDapGoJA+HtTj
	7iDsXS0O8TfDSPQfiv+nPIuP69+xDeX1PYP0cs9extQLceGdqkURKZp91BWliW03apqfygJIDkXTN
	k/YXagNCK7Qa6L5qRGDs4tVGwea7UjIrhur54904qU5a5Nm7Mwp06Jl+5E/Lz54dnp1Zo6+hMEvJ6
	nCoBGtG4bfCpU3lu8rtKPy7fJt8nrPZFDx8z1auc7MbIbi8UbN/CbCQo5hFnCa6LUF1YHnsWrsYly
	jvAwBNCYUNgvsCrT+49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjJn-009nr4-1x;
	Fri, 07 Apr 2023 10:27:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjJk-009npf-1t;
	Fri, 07 Apr 2023 10:27:41 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 7 Apr 2023
 18:28:40 +0800
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
To: <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>
Subject: [PATCH] dt-bindings: arm: amlogic: add C3 bindings
Date: Fri, 7 Apr 2023 18:27:04 +0800
Message-ID: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_032740_645829_7E281744 
X-CRM114-Status: UNSURE (   7.81  )
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

Document the new C3 SoC/board device tree bindings.

C3 is an advanced edge AI processor designed for smart IP camera
applications, which does not belong to Meson series.

Therefore, modify the title field accordingly.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..08d59842655c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/arm/amlogic.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Amlogic MesonX
+title: Amlogic SoC based Platforms
 
 maintainers:
   - Kevin Hilman <khilman@baylibre.com>
@@ -205,6 +205,13 @@ properties:
               - amlogic,ad401
           - const: amlogic,a1
 
+      - description: Boards with the Amlogic C3 C302X/C308L SoC
+        items:
+          - enum:
+              - amlogic,aw409
+              - amlogic,aw419
+          - const: amlogic,c3
+
       - description: Boards with the Amlogic Meson S4 S805X2 SoC
         items:
           - enum:

base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
