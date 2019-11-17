Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DA0C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5C22075C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbV78u8a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EVVkWJcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A5C22075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=519juPII0FJb5bYLDWNbS+pkwd3UP2juyaxyqdpPTog=; b=GbV78u8aVVcDpZ
	BSLnoEWWgvXXkg7poRTY6AAEZB9dk7Rl4wMIEzYnZz9fRI5jA9vMswLRibeyJyLecaqVJ9tEJr8q9
	ak9N/jRvMYxIzkhLmdv0lQbprdNYNT4894NMx5/pYvz8r4Km+MZcp3SId9f1PonYajlnYzoM22rEd
	2Oa4+aJNdZSW2LfMOzTbFKqxEaNfDo/Mq828vZYxwWJ23ER1Lq4vnNsuH692ox7qe5Ed5y1MyssCa
	MrX9DA6eRZxgY1Z2O1Tq7MqpW//DGv1hwHwHcVpN0SKrzlkGofQf+HBXULGV0s6pDwENe05ZKVB2s
	LNz9mJ7UCnEXmF0CkHKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWLDm-0005l3-ID; Sun, 17 Nov 2019 14:08:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWLDK-0005Dt-RM; Sun, 17 Nov 2019 14:07:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id e6so16407932wrw.1;
 Sun, 17 Nov 2019 06:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tiyYxTb8Rk/mH72C96BXIjZ0994JQE265VRKbdZ6Y4s=;
 b=EVVkWJcFjAUrdne3BkCeB4MZ1JQmeLwk168bJwNqsL7WjU+GOUeD6/qGmmqltNv+pb
 +gB2wG9KbzlzWwFQb6WRV5ac1d950G8wG6UGLncopSi6JOof9v6RfpFc0wxZH4iTi3pG
 1Y32KlJ11z3OQLFduc78NnjwMiekx/m50BD56AMK3tNx+wbX2jtzBk8TTBjjTWJF9W4P
 3WqUeWOeQIT+YSDKFtwsofghZyWxQoILvQZFMJBXG2WEx73NVvCClFJCZsn0pGz0IYCy
 k1SY9jXB/xKS75alrQvK7A1SB52LgIwKMwMbF3Us0axjaE9ZLGjR83DS8AmZhZGK6Kea
 Y6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tiyYxTb8Rk/mH72C96BXIjZ0994JQE265VRKbdZ6Y4s=;
 b=COBW43N68v/RncSJTXNqJuflM/Y72GFvK/QsjVDJmSU8wqoK4WLC/Ugkyv9o3UsG+j
 6HT2FYDDPkqjLvGyUq63/bvBh1FJbdp4DqR1aOGPvWS7cHCBeXD1qxXUflI57JRY3EmK
 4q63+UFw+RVd0nVRy6nlPezRQL9gwluAxISuGC9sr7CjeWde7ttgWFoPt442aGDyAXgo
 rsw593JKUJxmAjOICuQZqEv2bLge4L4DBGzUXpEHQ77/irHwhMtdToH7Nf8uFke4QIkB
 DhFxsGOyxjL6ddb0DzA4DU2WyV0QGtIs0soGQzZtf0gA1vfOgFPtaF2DjLSodmV8G3xM
 BcFQ==
X-Gm-Message-State: APjAAAWWLGxJOSR05PtvTE+P2ls25VYyrDW6exC/hFmUWlAS05fUCscR
 Cq+qINu/gUCRJKtVI+K3aURegU3r
X-Google-Smtp-Source: APXvYqzMq+83TkjxUSM11kZkx3mF/4DvBV0+2sGks49oMiHitp16MlZiefH8kui2kfgFepTTKQYiCA==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr25727213wrv.247.1573999661231; 
 Sun, 17 Nov 2019 06:07:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n23sm16632977wmc.18.2019.11.17.06.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:07:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: clock: add the Amlogic Meson8 DDR clock
 controller binding
Date: Sun, 17 Nov 2019 15:07:30 +0100
Message-Id: <20191117140731.137378-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
References: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_060742_910704_BF4C367A 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, sboyd@kernel.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson8, Meson8b and Meson8m2 SoCs have a DDR clock controller in
the MMCBUS registers. There is no public documentation on this, but the
GPL u-boot sources from the Amlogic BSP show that:
- it uses the same XTAL input as the main clock controller
- it contains a PLL which seems to be implemented just like the other
  PLLs in this SoC
- there is a power-of-two PLL post-divider

Add the documentation and header file for this DDR clock controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../clock/amlogic,meson8-ddr-clkc.yaml        | 50 +++++++++++++++++++
 include/dt-bindings/clock/meson8-ddr-clkc.h   |  4 ++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
new file mode 100644
index 000000000000..4b8669f870ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,meson8-ddr-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic DDR Clock Controller Device Tree Bindings
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson8-ddr-clkc
+      - amlogic,meson8b-ddr-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: xtal
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    ddr_clkc: clock-controller@400 {
+      compatible = "amlogic,meson8-ddr-clkc";
+      reg = <0x400 0x20>;
+      clocks = <&xtal>;
+      clock-names = "xtal";
+      #clock-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/meson8-ddr-clkc.h b/include/dt-bindings/clock/meson8-ddr-clkc.h
new file mode 100644
index 000000000000..a8e0fa2987ab
--- /dev/null
+++ b/include/dt-bindings/clock/meson8-ddr-clkc.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#define DDR_CLKID_DDR_PLL_DCO			0
+#define DDR_CLKID_DDR_PLL			1
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
