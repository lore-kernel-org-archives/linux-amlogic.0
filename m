Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722ACC4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:44:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F7EB20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:44:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cDf2BQkl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kaYBd8rH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F7EB20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mNcmnfnqxCpPgDg+SEzl7HJhEpnj8HFCEPyr1cISFB8=; b=cDf2BQklkk90Hb9EDUoemIDR/U
	PcjDLBFD9y2CKy/n1Tf3HtWPdVSYyg1FKxH/xomC48dY9OUiu3JCSNqk4rxKuiVfkvCiwQnY1H4G8
	xiKd+aWHtlSH9WK1z1ZBy17leq5LlNGO5R8o9N/7nrs6ehSedOmOsdWQWkFv96G0sOcLM5Xh0xVZQ
	Lyu+vtxiLwd0KE0Hm2HKkgz9Q8cusvZWGrD24TqEaAdA9N+86cJ81a086Lr7oLS95LTSfNo1oLnAM
	dT0O3oNqKLli2arVVOslO48riwetm1VdlhZSfVdC3EHujG4JLqc+oezbn42o5y4W5GoQc9LU/J6az
	zD3BkpTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDvEK-0001LQ-Od; Fri, 27 Sep 2019 18:44:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDvDh-0000BC-IP
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 18:44:00 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5so7060809wmg.0
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=aeDGNakdvDCwTy0gCOMkwdHE4LANquitP3dscaSQqkM=;
 b=kaYBd8rH9bcXTFA4OPZMOwh+968cPJqFoj1MvvNeruj0/cWDGcsTCB+MHNAGiPdQHs
 6btlJ/k3MnKZr6f1FfeJA6aIdjjQz0kxPN1DljwbJmW1iXUUG9Tj2FhnbxuwcxvfZJch
 sKRCca2nV4FS3xxPw9gQ1v79iB0vUujfaodA0H0JbitwjodhDuxPteWzuheciFlZZHp+
 bq9PFerB2M4+7MsLNtfZuacAeaMNGZS1HN98HBErZA+y1Pc2IyqQoZ6JfR9t3nK5H+02
 c4fA+1j0rcQPvGNCOxxlxs0j2P+7PEiM1Bu83PooDzArubKpXFTubl+lE5Na9f2nBKgN
 HbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=aeDGNakdvDCwTy0gCOMkwdHE4LANquitP3dscaSQqkM=;
 b=RetwIFSDmAZc5GkFj8qX9b8us260f1tA0iHJnRXcfM9chfgJNTV1a+CTm42E8sGKnz
 k3yEnoKRv8a8bE6E4NNPl87TrDFf+CohpMq4QjBqX8yAUOfyRUbLfsOjrKpYJ8DeH7NC
 /Vkq6eLUE02WJWjeuaua4fuN7uGTluyDTlk1vMcZW6GOnibbzEgcXIyuBe9UbeAv8cS7
 gsXxM1gqJE+57FmntKR2Z8xyqhWVoX3X4+cKU1OJ1SCrnPW0iiA2Mbikxa3fPjnJEHr9
 dNxTECoZ4FPWErGs3R1saoALhsp3ynKK5myLePProQ8bvxji2cjp+9O5oFKFNuF4Jrqn
 N0fA==
X-Gm-Message-State: APjAAAWW9TnXXExacu12i93theWbB+vUPR7Ih+afC+f3wsJ1anCzn6JZ
 AX/uXGNZ0QFY4GflWr+bUF4aiA==
X-Google-Smtp-Source: APXvYqzipwsRnU6H56hrDhOIw0POLTGn5VRaLhCOHcCogfJsqaBk9g35PRYJtCTeEgddUX5Eu5Z1KA==
X-Received: by 2002:a05:600c:230d:: with SMTP id
 13mr8714597wmo.114.1569609836134; 
 Fri, 27 Sep 2019 11:43:56 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id r13sm6246272wrn.0.2019.09.27.11.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:43:55 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v6 1/7] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Fri, 27 Sep 2019 20:43:46 +0200
Message-Id: <20190927184352.28759-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184352.28759-1-glaroque@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_114357_616219_A388DAD6 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adding the devicetree binding documentation for the Amlogic temperature
sensor found in the Amlogic Meson G12A and G12B SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..f761681e4c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Binding for Amlogic Thermal
+
+properties:
+  compatible:
+      items:
+        - enum:
+            - amlogic,g12a-cpu-thermal
+            - amlogic,g12a-ddr-thermal
+        - const: amlogic,g12a-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amlogic,ao-secure:
+    description: phandle to the ao-secure syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - amlogic,ao-secure
+
+examples:
+  - |
+        cpu_temp: temperature-sensor@ff634800 {
+                compatible = "amlogic,g12a-cpu-thermal",
+                             "amlogic,g12a-thermal";
+                reg = <0xff634800 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                #thermal-sensor-cells = <0>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
