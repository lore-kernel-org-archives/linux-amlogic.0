Return-Path: <SRS0=faxg=3M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837EBC35242
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jan 2020 23:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558602253D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jan 2020 23:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BN6CUuYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558602253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RO8K9SkeRBkZ9Bjsq4928G2siFvB6/17wI+sEZa4Log=; b=BN6CUuYhx/8aAo
	wwwhlmY/LlaSanLh35dNJ+aAfR1rlNPrMOdSgoi8J1P1buzYLY4roXwt5f40KG3y2BkNwzXZ1YgX3
	32xSgh/YvherivgcYqvqaUgqmRH5TXhgad0cHQVV+9aLf913j2ZDjMH4tsYO7Y3v8+VC8VOm6/2w7
	Hcx3C/GKigGiS2/F1TGPujT3PL3nZHm/EJqUKrLhLOHyQs+TowGk/wDclQ0vg7Bpd1DMku9QcyswS
	repjMCr1kguApHclijrzTns99km0Lhty2VbrhL2ZFdrllWwSFfs2o1nX2L494BjFcu9TUm88QEQ7S
	8KSkagJSAIfnhw7W2AoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iulns-000281-OY; Thu, 23 Jan 2020 23:22:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iulnp-000273-M5
 for linux-amlogic@lists.infradead.org; Thu, 23 Jan 2020 23:22:23 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 77CAD240002;
 Thu, 23 Jan 2020 23:22:18 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 2/7] dt-bindings: Add AXG shared MIPI/PCIE analog PHY
 bindings
Date: Fri, 24 Jan 2020 00:29:38 +0100
Message-Id: <20200123232943.10229-3-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200123232943.10229-1-repk@triplefau.lt>
References: <20200123232943.10229-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_152221_856847_CB37E19B 
X-CRM114-Status: UNSURE (   8.32  )
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
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for the shared MIPI/PCIE analog PHY found in AXG
SoCs.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 .../amlogic,meson-axg-mipi-pcie-analog.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
new file mode 100644
index 000000000000..88683db6cf81
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson-axg-mipi-pcie-analog.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic AXG shared MIPI/PCIE analog PHY
+
+maintainers:
+  - Remi Pommarel <repk@triplefau.lt>
+
+properties:
+  compatible:
+    const: amlogic,axg-mipi-pcie-analog-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    mpphy: phy@0 {
+          compatible = "amlogic,axg-mipi-pcie-analog-phy";
+          reg = <0x0 0x0 0x0 0xc>;
+          #phy-cells = <1>;
+    };
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
