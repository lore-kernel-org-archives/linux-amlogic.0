Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED03DC33CB3
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 11:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45672072B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 11:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h/0wKguA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45672072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnPHPsdtbrMN5ygMiAtSkXD3iSMwujrMDyJIXkxTA0c=; b=h/0wKguAqW1WRG
	1VyeDmW5Qq8VJUZB+Vk2PkgEl4IaZoalFbuzxLWTvc9wplZ2ULChoYaVDaCqW8XdhM6pEAfBgX99Y
	NkLalTusuQH6sfKuH6QjcSRgpwabosJHxvBrLuM4tthSAtSUNRpYA3lMQAttlzGjMWq9VuJKYZ+vr
	wbEDJPjO/rpLKU0GFkc+1PCEyEMMGqniX4YFLJBYAD9tHQV3+BM+TFVK8/bTvti3gx3bisrKOvSZ5
	4tq17vYMRd7mTueX2K8/1Ks68t45XMGcJrxEuPTpu5yqcjzYY3SfU+uTcP5LuDvFhIB7nzRleG17a
	WBdw4vh312Dr3ir0vJFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is33F-0006Ou-Qo; Thu, 16 Jan 2020 11:11:01 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is334-00069A-MS
 for linux-amlogic@lists.infradead.org; Thu, 16 Jan 2020 11:10:54 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 23C5CC0018;
 Thu, 16 Jan 2020 11:10:40 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 1/7] dt-bindings: Add AXG PCIE PHY bindings
Date: Thu, 16 Jan 2020 12:18:44 +0100
Message-Id: <20200116111850.23690-2-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116111850.23690-1-repk@triplefau.lt>
References: <20200116111850.23690-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_031050_883889_AFD321A3 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Remi Pommarel <repk@triplefau.lt>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for PCIE PHYs found in AXG SoCs.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 .../bindings/phy/amlogic,meson-axg-pcie.yaml  | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
new file mode 100644
index 000000000000..70683946f47f
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson-axg-pcie.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic AXG PCIE PHY
+
+maintainers:
+  - Remi Pommarel <repk@triplefau.lt>
+
+properties:
+  compatible:
+    const: amlogic,axg-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+
+  phy-names:
+    const: analog # If MIPI/PCIE analog PHY is used
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - resets
+  - "#phy-cells"
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+    #include <dt-bindings/phy/phy.h>
+    pcie_phy: pcie-phy@ff644000 {
+          compatible = "amlogic,axg-pcie-phy";
+          reg = <0x0 0xff644000 0x0 0x1c>;
+          resets = <&reset RESET_PCIE_PHY>;
+          phys = <&mipi_analog_phy PHY_TYPE_PCIE>;
+          phy-names = "analog";
+          #phy-cells = <0>;
+    };
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
