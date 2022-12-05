Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09619C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2yYWXB+UOGZN7UGVxh983QHGG7oVtuEcSOO1UZ2XOY=; b=m+bAXWpnRUKRKB
	E8vGtizRpdLON69f1qsf2cT5F+0KnQTYUkyP4kPoJo+3GluY304LEC9UE8YqeR6ulN0DPPd92Y/Wu
	VYmW7hljqf2PQ9imoSvie2jmhitgHlTidM1c3V0PC0JRZGoy8S3b9Kl9onhZwyp9xn24Lg8Hb6Ybu
	Wk3A06IOUJNauuQteRe4T+SwFcdYOH/L+6uvniFmsJ8R6+c/Hn8Uv1ROavEcxVL1oLjrusZNP3Tdt
	uycd8cks9i8GyilCfTSKbEJFjslXhAqRacxluIRZxqTvInF/N6zbIYyRUkACbLMcpemoDFDBLPfEc
	EwuvKFGkRDW6u7e57CLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DG2-004gqf-3r; Mon, 05 Dec 2022 15:19:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DFA-004fpt-HH
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:59 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bp15so19031007lfb.13
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR2BrJ7GlNzz1L7RbApb6lqQSBsCQtyE8vkfgp1+AEE=;
        b=bpk0qIW/bil+RnwI4y5r1x0yknZWOjMReR/ROabJRNfvVnaoEn9+IT4/FGHDeX3NWI
         9NRIxlum7z6N7EbBScDmROvabFVDZrDeaWlbzknOGItsv4cJpec5Tirgd0MD2c+aNvlN
         KVh7C18Hc2CvFVWwGY1rweHNRK52JTqX07XqSo+QEvs82wcKeC1rRr+5ZnyLXonD5y23
         ZHIvZyLcin1SOZXsQ2igFSSe96Ikh9aBuMMO2onXchKPLWrYTyyLLCEYeou1XUpST81f
         D/C5rG7cOEQLM1nUMz3wwV7nDchV2yYGVecPYLOK3QdP73YiaCESB+TwJEDaidXrPgA2
         hqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR2BrJ7GlNzz1L7RbApb6lqQSBsCQtyE8vkfgp1+AEE=;
        b=omG2YZfa0E8J0ycQSo0+i5CcvA6rlAGVQAO4ZydIHWzY+mkqwp90t+HGePYTU3Pq8F
         KPhl+MBN40xaux+omPz9GAJgNmpRC+vavpxcF/7D0wbCG0ExLAVGp7DrIZWvVn/TkDH/
         qCP2NgfpvPQD800TzqrAiwIZtlouy1dfgrtL8gZDXHcN5VpJ85Ayw9cONnMtS6/3JYGZ
         gezR5tXgIJjGulb1KIGENQ/Z7+pO8XLtEUuS2o5VRwGxGl9IMKkuzp6Y/DvleYDhghKS
         P9OqnkRw18HKO3l5O94kzxjXPe+7bY6F854RhTGlZq7uIgHluuaG0RDOm9vdm+FKAD/y
         SEpA==
X-Gm-Message-State: ANoB5pk6ye8nTjZarqbOm+tzxAMHj8RsvB7LDvK1qSBI+2U+xcXtP+Op
	Alp4U0KMm/+joPW2YUu8siI7TA==
X-Google-Smtp-Source: AA0mqf6jyyZRogeiRW4/e4nxxtucWoAmJrilZAi2g0Ug0dFDirM+NqZ01pBbCY7Cv4/B3PSt4Pym+g==
X-Received: by 2002:a05:6512:1698:b0:4a2:4b43:9aad with SMTP id bu24-20020a056512169800b004a24b439aadmr30144514lfb.213.1670253532624;
        Mon, 05 Dec 2022 07:18:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/9] media: dt-bindings: cec: convert common CEC properties to DT schema
Date: Mon,  5 Dec 2022 16:18:39 +0100
Message-Id: <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071856_612001_891BB10F 
X-CRM114-Status: GOOD (  17.43  )
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

Convert common HDMI CEC adapter bindings to DT schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../devicetree/bindings/media/cec.txt         |  8 ------
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml

diff --git a/Documentation/devicetree/bindings/media/cec.txt b/Documentation/devicetree/bindings/media/cec.txt
deleted file mode 100644
index 22d7aae3d3d7..000000000000
--- a/Documentation/devicetree/bindings/media/cec.txt
+++ /dev/null
@@ -1,8 +0,0 @@
-Common bindings for HDMI CEC adapters
-
-- hdmi-phandle: phandle to the HDMI controller.
-
-- needs-hpd: if present the CEC support is only available when the HPD
-  is high. Some boards only let the CEC pin through if the HPD is high,
-  for example if there is a level converter that uses the HPD to power
-  up or down.
diff --git a/Documentation/devicetree/bindings/media/cec/cec-common.yaml b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
new file mode 100644
index 000000000000..af6ee5f1c73f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/cec/cec-common.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/cec/cec-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HDMI CEC Adapters Common Properties
+
+maintainers:
+  - Hans Verkuil <hverkuil@xs4all.nl>
+
+properties:
+  $nodename:
+    pattern: "^cec(@[0-9a-f]+|-[0-9]+)?$"
+
+  hdmi-phandle:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the HDMI controller.
+
+  needs-hpd:
+    type: boolean
+    description:
+      The CEC support is only available when the HPD is high. Some boards only
+      let the CEC pin through if the HPD is high, for example if there is a
+      level converter that uses the HPD to power up or down.
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 07cb85cac4c3..45402e03cda5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4832,7 +4832,7 @@ S:	Supported
 W:	http://linuxtv.org
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/ABI/testing/debugfs-cec-error-inj
-F:	Documentation/devicetree/bindings/media/cec.txt
+F:	Documentation/devicetree/bindings/media/cec/cec-common.yaml
 F:	Documentation/driver-api/media/cec-core.rst
 F:	Documentation/userspace-api/media/cec
 F:	drivers/media/cec/
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
