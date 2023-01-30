Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEA4C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8dnF5qA7t+HSUAjvY7CfvCN+14J+j0RPBfbiN2CRaw=; b=uYDSUzb2s9NZf/
	6L5tdEQIt6q8e7UjDGJFfTlyRiQSOFtJsFGXg0pQOiUGHR1FNbpHy1c0ss3VbuZedb88jXt/vxaB4
	WqpOCX54oYqqF6rXxyVFdPxWSGR1m5YX4HdhdMoME8PO2DMZkYroT6biiQ8irogBml37qZSgbhecE
	8eYKwdJHlrt+AEsdTUt8rN29r596426gfzEq9S/Q0t1xAgtqKnvjwyVYdjnNpVHhDlAzMuDEk/Qy7
	Q1+wjoq4GzR7xVMAtmPdRO0y3t/AYyBxCI2gZ3VtjOY5mUif+sWl95ubmfYRHVg62bxkGTAjHRNr2
	EX15Evsn8Q+Tz6ZA4mXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVtZ-003zF4-EE; Mon, 30 Jan 2023 15:16:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVtU-003zDX-Mr
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 15:16:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8398234wms.3
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 07:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDzJ19fQHA7Hg3Als9sXt3Vy8GMWCA2KfiCkhNdhAL4=;
        b=gUen5KknnuPWhKVYWbV4vfwt2CtnNkFVI+qeBfQiDKEejjtdyfOpERRG3Ybw2r2wnM
         FVWsXWFFw9cxo/BROT9to3PiVanT67Mn9KKOZQSIeFPQhgu9cJzhFdjavzgYCz41IIM7
         KIzefD0J9918TqX1a/cZr0cMHo0B6pb3FzVR9LtAwQ8ppWaKAOziPZcHvDzzS9v05nmx
         r+OjDSjGY4ENGOYhAsh5FEifrzNTHN/AyG2zEvdXPQ8KDqTGoicZLQLw7XUZQp9QjI7j
         Ux2ZFbAoDL1teqeb4Qw1OP7PunCeoy6Z+n28AW7wyP8LWIBfeXtOoqRp4DEA3sEwyTrA
         oosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDzJ19fQHA7Hg3Als9sXt3Vy8GMWCA2KfiCkhNdhAL4=;
        b=EV5CmXpApffQGIbhiQqzuI5UJrbTyTPZmMgcs8oRQgJ/7jrK1Azpog6OuFXlyuePD2
         Qe8LYTOVFVuoCRN9Eh/3LmS/qjJtgBIsHg2M7LBFLWbj+RSyMIXVzeMhE0NKAEe1OvgF
         vt9HD8WBoXxu8COuYhTLwGDOMadAA2KeZBB2jANru5zLrLZcfVSv6kRlr/vaPbrOpBQN
         r8GubmtTwEVYtMM7i2ohqhByrqjDeXEflbRetRc6J3hc14SVS5gfoS/u1GrusbUZ1JxV
         j4GOVzllnD8I8omrL4q5LzTwwVFd+IRahCDKYvYMFn/FASMJNPC5CohTpknsHnehj/yq
         h4vA==
X-Gm-Message-State: AO0yUKVo3ymiKeWyzAyLUmv4ZXdQc3ElHWBvm19TdN/yv0FOViOpFnZ/
	+RcMn8IoQmzJgV1tVkdwf8Bulg==
X-Google-Smtp-Source: AK7set+TvDU+aj1jWdIKoUfMg03Z+ncqNlEuLJL+MGJ4I5NMt9G18KZSDNdnepUBIaWEtMN0AjG6Lw==
X-Received: by 2002:a1c:7205:0:b0:3dc:523c:229a with SMTP id n5-20020a1c7205000000b003dc523c229amr6086744wmc.7.1675091785552;
        Mon, 30 Jan 2023 07:16:25 -0800 (PST)
Received: from jackdaw.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id u12-20020a05600c19cc00b003db0ee277b2sm18735802wmq.5.2023.01.30.07.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:16:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 net-next 1/2] dt-bindings: net: add amlogic gxl mdio multiplexer
Date: Mon, 30 Jan 2023 16:16:15 +0100
Message-Id: <20230130151616.375168-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230130151616.375168-1-jbrunet@baylibre.com>
References: <20230130151616.375168-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_071628_991355_484F9386 
X-CRM114-Status: GOOD (  13.14  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/amlogic,gxl-mdio-mux.yaml    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml b/Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
new file mode 100644
index 000000000000..27ae004dbea0
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
+      compatible = "amlogic,gxl-mdio-mux";
+      reg = <0x558 0xc>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&refclk>;
+      clock-names = "ref";
+      mdio-parent-bus = <&mdio0>;
+
+      external_mdio: mdio@0 {
+        reg = <0x0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+
+      internal_mdio: mdio@1 {
+        reg = <0x1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+      };
+    };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
