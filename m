Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07125C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 07:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khkPB0UZr3N3R8zozOIRZ0wt6aLlEQSrs+fGT1NX/+g=; b=oTH2TiWvwtP2xa
	SF+S7VDWBgJpGE3ULDZen4UgG7XoEJtDM7kkegrZxfs9Z/bBRqsCJlBNnMFQk3TOw//lvqI7ymST6
	w2RefvbukRlqzc7IIcqplVfCvJC0YIhWmMKoqmbf39a16O3uC6X5h6yNPrR3tL+D4itWpgBIyn+RO
	vm5NG2BtxMhEEiWZL5NdDiF/xsrHr75aklCxbkWo5CGeHJcTrX7wMkkbQzPQv2zp7PTjox9okuxYh
	pTb36SkVytIiDj1RrbS88EnjnIYfPwngu0GVIikCOO0MHi7c2xLVNP5U3gbL8agcFFzRR+XZh1cdJ
	/IhHcmQsWRHe7VKNR9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8dR6-00FsFl-4A; Tue, 05 Jul 2022 07:57:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8dQd-00Frb1-5S
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 07:57:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so6797567wmb.1
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6b5YvPP6Cm40ZHiN9lWJqY1BKAIBQa8OhFlxO39IAZI=;
        b=gP5wyRaik5C0Bjp8IpFbJIrMLOKs8yPVyFoIC42ZhaAjw9hbxpQaNPA6lwZH/hBMMR
         Az65dtQPZvxgKhuFZAewgXi4f3rJH6dyxYi6BBEgm7qh2Cz9WwuwBdLMDl1wrG9CP16B
         De60OBUbiyPKd9GnYvzAMQ+gAFmXVFzUbLKGx+kL5oy931YQsYHcsgf1uL+qse8VdlyC
         9vb30Wz3+t94By/y3yfcb3Wd/LWhq71v4N8NJBhKlHEkFExBz0anPACZMLfl/7139uTl
         rrZc+Huh/mbAFyhHO8OB5ogxAzNEoIX3RDYTnHQDd/uoCIP7Yev8tgOL8uu1dqz3cooA
         wQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6b5YvPP6Cm40ZHiN9lWJqY1BKAIBQa8OhFlxO39IAZI=;
        b=GfqainxQ613iNbrPTYFtzhVuVPKfX9HPgc8Y1FA4n1BHkA9KUGIhg/7jkEdqkd5EJw
         5fBHTou5JpT9SiHib2uISaR5KwptaX8/WtPCFWsaSFxJRHgdvo0ewbsXkj0+WOqUEWRt
         l/DtT7jhvJkVlXrM0FcievpEURSIdc+GN5rkXwSSeU87uflwclusKNDF3pQXjG/I7d38
         iVySyjCr7KUM+PV4+eh9bOoCQ9odCiw1T/IQ/Pt4ufhLNeMUj/+QLku5qUFAvR0dmPW6
         iePbwV3xCut0U72fwTZes37Z1VFAru0ey0K4Eib3DQDNZdr2csZN/X9w3qfROpEmn1mr
         Yuxg==
X-Gm-Message-State: AJIora/n53AyCKMxD/PR3Ru4xZe6918HsFvi2MAmnz1958pC8P5PaM3j
	uKEN8EGJB8I5/HfdTZ9YOp54cA==
X-Google-Smtp-Source: AGRyM1uMxsAd5+tDhIMxilNng66yioFL7S4YFsUh8CVh5sqh2ZnJ1n8jfi26E8hTZse1QgEQddWSEQ==
X-Received: by 2002:a05:600c:3ac3:b0:3a0:45b6:7efb with SMTP id d3-20020a05600c3ac300b003a045b67efbmr36527404wms.183.1657007817253;
        Tue, 05 Jul 2022 00:56:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id v17-20020a5d5911000000b0021bbdc3375fsm8323473wrd.68.2022.07.05.00.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:56:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY bindings
Date: Tue,  5 Jul 2022 09:56:49 +0200
Message-Id: <20220705075650.3165348-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705075650.3165348-1-narmstrong@baylibre.com>
References: <20220705075650.3165348-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543; h=from:subject; bh=iOBx9fr8HbPBX94EGJGOKU8CqvBCi3FrRoD0vFQxImA=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBiw+6hxEXENvi29/8PBCp5BxvMDA7bv97mLUSzbfas Q+zBXg+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYsPuoQAKCRB33NvayMhJ0ZxbD/ 9ABJc/gmqqibXPvDP7CwOXJs8Lwvf9rKLthCjcc6dMMYJ5jtc56LQggDPLxJwdGFXud+5OHshvoz9c uIm3aXTBe4BA+/C0FO+yKgtqV9BXUecjOQIbWCpfsJc8sC/qvo/oiKDnbzQKYTnOR2gKZO1dntpg8k PXjYR0wnPyCW9baVjL/8BJw0LLOpteulqtPK4ji36GoTIGKqhoLHLbDi+wDfxDFRnB294cdlv5KDxn z3EG5QKI7cWJBCfKVSmb3H0A39yzcWr+04v8+vxhraEtePgfWteL5AINR+CW0kzYZzTxJ1348TekIT 7YlmyuaRwpq69CArNMwHv65oIWV1cyV8ttNO7SKWJL0cL79Ck9NHnEdDJ98DvmQkNhVEJhRfYXE7ak O64wonKAv86sM77DSkXmT8m6Req/mvqQREyKbrg5tmbJ2Ju8Z/YWb4UvA4N+5mcTB8+HTWKFQvZZwW Ahm+3m55tagtDZRslRtOVG6Z/kGIT5l43OdYL4mX1qHkiUMixOwJLZxyMX263tPpEfSwguMJYDoZuk U1BJa/Dz9jwHSSZhQTr8YCfqj+kTkIlfsoEaateRbo7gj7mluDJftuWlOb1zp79ZOspLLX+vZrb5BC V0P+LpUwBeb3iHbui/gfMcw7y9JDbkDoTygn+LcYXLgUfHux4BoJMu1OYTIw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_005703_219914_33B822E6 
X-CRM114-Status: GOOD (  11.53  )
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

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
panels, this adds the bindings.

This Analog D-PHY works with a separate Digital MIPI D-PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
new file mode 100644
index 000000000000..7aa0c05d6ce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic G12A MIPI analog PHY
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    const: amlogic,g12a-mipi-dphy-analog
+
+  "#phy-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
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
+    phy@0 {
+          compatible = "amlogic,g12a-mipi-dphy-analog";
+          reg = <0x0 0xc>;
+          #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
