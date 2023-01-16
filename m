Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC657C54EBE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 09:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zku5Seiv4Uy0G0HSNGAcKwMzu1tXtBF8Fvipbvzjn7E=; b=I5afhbwRBldB0d
	csGKAhganqsAuk1qecr+qKm4diep59UN6J5C5ebjUKs2EaLbDjcUeipWx8Ma3RJu9YQzvNEEZcqxs
	xAvIGu/CnvS3gshG6i91TQNII3qOBiNKja19uPC4y4h+JssubWaiUDEFFhLfs1c819vPYnq61+xY0
	rcHFTGp3evo1arz2tCjjbHBVx8YMlnqNb4g/K0EldxuxnevmdC+WlOLInTP+kl6ywo0z3tPcuz/Da
	AOmjFGN9pvysUNfVG2TpTDN0MqkU5eL8im9Y4Rg2AK2kizWNSM7vHjvtF7cpR3goOcM3E1sqSGGmp
	xgIBL2RxgJ4W0HY7E1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLbu-009J6E-ER; Mon, 16 Jan 2023 09:16:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLbs-009J4d-66
	for linux-amlogic@lists.infradead.org; Mon, 16 Jan 2023 09:16:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so18287547wma.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jan 2023 01:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZcDGdNDu8uBNNlcnVM3dW50Ek5FZ0cyrrNZsgY+fPo=;
        b=tiBdYNutIDqslGItdc45uVHMVAntLS/gLDRiamJFHULUDBgNQE9nPaVohFLqvigUy9
         7McONPL/1jEcUYDgNfe9l9Cm9vnaZeO+zYFtyIPp4uBBDy9kH+l9z6AYr8xgTFvfML4/
         Na2znx1Msywlu3lN1SSt4fF4xsXvB7MIy3Yp7h+kne7UybXBJOT8SZOLOLdnyV2g7mxg
         4epo6Qyvqg3a74U2PQYRj5cS+Ci4G5Eh8tkFxoS9epWjk4YrAGOgSyZPIyZ5MoJBy3XF
         491akUDHbx0qMEl1cfXTLp6HLPLWEXQNFzDp+RTU39f0Em6p5aOWIUqs0DsofEiH26cA
         zqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZcDGdNDu8uBNNlcnVM3dW50Ek5FZ0cyrrNZsgY+fPo=;
        b=ghIx1+Z4Sz0Hb/ucZhdCjVyVjVygiRpR60aop8CD2GlSZ+QxkRvwnhGOhh9LJHn9GB
         +TxLDirMde4UWpRmQXkLWd7x1DlhsbjJ1yABJQ9WrXoGJQpqXuVUUDZurEM0hUWpksHN
         szH71Fb3AIz6wJDyRaibDDFbjdCGd1Alamq0HEv7h79BvxEKON9Qdt/UJUeLgEl5wWeE
         4opMRrWbULuRdl6OVhPOTZz92aWd3xPlYPiFK8QhCQMZf8TDvGIAeq8uQEviwEbHuQ08
         T34jGD4eCcdNBZpEWINmd5Iqx1NXxLP/kK4OVv8f8bH+preyxnVHGoKN4Cj9p1wo1hKt
         FWUg==
X-Gm-Message-State: AFqh2kpKrA6TkeAAkG4tCKvwBREPD3JmLUtRySg0ozQVshw37CRgaWTU
	6gkJjqYixNTPcEeJgVLTp+ekZw==
X-Google-Smtp-Source: AMrXdXuCRbQg8NS8SJ1exUq8lAx/EQMg8yYbu3RqREsEePTCo6eu0cvE+Pv0cEA/0u11FEGbaltV6Q==
X-Received: by 2002:a05:600c:358f:b0:3d1:cdf7:debf with SMTP id p15-20020a05600c358f00b003d1cdf7debfmr68091704wmq.26.1673860615046;
        Mon, 16 Jan 2023 01:16:55 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id h19-20020a05600c351300b003d9a86a13bfsm35923491wmq.28.2023.01.16.01.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:16:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] dt-bindings: net: add amlogic gxl mdio multiplexer
Date: Mon, 16 Jan 2023 10:16:35 +0100
Message-Id: <20230116091637.272923-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116091637.272923-1-jbrunet@baylibre.com>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_011656_255787_8D766F2A 
X-CRM114-Status: GOOD (  12.81  )
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

Add documentation for the MDIO bus multiplexer found on the Amlogic GXL
SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/amlogic,gxl-mdio-mux.yaml    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
new file mode 100644
index 000000000000..d21bce695fa9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,gxl-mdio-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic GXL MDIO bus multiplexer
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+description:
+  This is a special case of a MDIO bus multiplexer. It allows to choose between
+  the internal mdio bus leading to the embedded 10/100 PHY or the external
+  MDIO bus on the Amlogic GXL SoC family.
+
+allOf:
+  - $ref: mdio-mux.yaml#
+
+properties:
+  compatible:
+    const: amlogic,gxl-mdio-mux
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    eth_phy_mux: mdio@558 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "amlogic,gxl-mdio-mux";
+      clocks = <&refclk>;
+      clock-names = "ref";
+      reg = <0x558 0xc>;
+      mdio-parent-bus = <&mdio0>;
+
+      external_mdio: mdio@0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x0>;
+      };
+
+      internal_mdio: mdio@1 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        reg = <0x1>;
+      };
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
