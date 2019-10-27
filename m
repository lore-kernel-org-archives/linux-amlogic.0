Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C8A3CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2335821D7F
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CuILfusy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pCgUOiR/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2335821D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8x9MS5dWsS1brLn9Tv6+rcF7NS8DzQzxsh5EGmMfFFw=; b=CuILfusyb542fo
	5I4RiTEdLJ+V/eTHDBONPYQ+pcfUN1nV1FIoMwkvVGosGGARML9w96ZwAwVQTA379s/Z/OSJgbKTW
	6tsk6cahdvAVK7JiebXKF321rzVL8a6VUu5xXeRnTl9P2Zwnh3CgEvzjsKx8InQAyZ3C4WyyDoA0C
	1U5YMg6T0Z5Wej56p5oT1H4RC7BecgmQoM/8Y0ZVJLCdweKheVhAanCivRrs7+C9sj/X2OqkgafOb
	ccDcwTQmVBWP02g8WFRBtjmSO0BPVriolRm+88DJG5pzU6VwHtq7ZafGo5+s7/v6PX+eBUTUDA3BV
	dbaIg3gTkfFCFsi4G13w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlKl-0001UV-3i; Sun, 27 Oct 2019 16:24:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlKQ-0001Cd-Su; Sun, 27 Oct 2019 16:23:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id o28so7375434wro.7;
 Sun, 27 Oct 2019 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GWbTlN2rWt2ied7AfeNCro8kNhdCw9BqWl6E/dShDHM=;
 b=pCgUOiR/1l5Uat1i9ODdivZgGrUR8Pa1WmVT+96e3Io7y6zNE8LiPpSLbneTIFPDpS
 RhL1RIlEFtXXqBNKZlHkkUOgflEhYPq2hMiZp+ko8yo5lADiImaWyuWsECR3uT6UDOhi
 tmPjdhrI3bX+bNcTc+oRxSCqEb45PFWrXjBu7TpDXbBarGEudlmDdfx2eLIlOUOcTNaA
 5NyA49hZ35RznaDd7fBTq2Y5Hmu2+oM8iIrc2NUO7VOzXrpq1bRx9b3aY60rW7mDSg+f
 ltmja1byUvCyRGdFdiBdixcM070kcvyClAfl/BkQyLcOWpm0voT5BOXIXtXLPvwzODmz
 Ed5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GWbTlN2rWt2ied7AfeNCro8kNhdCw9BqWl6E/dShDHM=;
 b=uUPi4zcqbbdF3njG6tOqAwBVj7SMW3bHVuB7xpUGuTXQiTfyJ4ZuvgpmvourjvjKyp
 SwKnmlydqFGFU4LxlvVwa7H4w58NGtAIvl+y4Z7QpT+3YD68mAJF7h/d5sSinV++7geD
 pEX7jUO30CqlaKJ7BUL7mfOCQ8D3QhvKn1eAI9NW0j+ps7MiLQPQoZmAiCn+i/Qf4Z6Z
 TBO9Aa865e3XLkK08+Fke2zLhe1CGVVJ3e8IMFogjrQ7duO9BipdvBCHI1Kxx5sfDZ34
 XgPhfogu5BI49hxPZM/UmZJg2V8gxTXdc7NASVNOtMWBLGWtYlqwK+63345pi8j495cl
 627w==
X-Gm-Message-State: APjAAAVCwikxtIepZhLbyVTunCVEM+MRRKFPMpk7LJjdbTHOLJtHX9qn
 pwvhPL9hlOGAPEPsQs3XEk8=
X-Google-Smtp-Source: APXvYqwiHWUOdqyOryfoxyoMSXW3biIYINgbbr5FI/oRW27dSCoa7yemhpwRw0z73LhgcDRjGmNbMg==
X-Received: by 2002:adf:e403:: with SMTP id g3mr11120841wrm.128.1572193421194; 
 Sun, 27 Oct 2019 09:23:41 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 1sm8243299wrr.16.2019.10.27.09.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:23:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 1/5] dt-bindings: clock: add the Amlogic Meson8 DDR clock
 controller binding
Date: Sun, 27 Oct 2019 17:23:24 +0100
Message-Id: <20191027162328.1177402-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
References: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_092342_937459_63D5CF77 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
