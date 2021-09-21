Return-Path: <SRS0=phzD=OL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B941C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1090A60FDA
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1090A60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jjJs3t6N84mg8iXn0MpO7iV9h9uSNvYTbW/xdUk+aM=; b=y+Pnx/+koI8Fc6
	yVq/BHFIXSqfq7zD8iHiO3b74X3tCP3mZUtwtLwkPUUG9gcHhJRvjf19vHqyscxP0JpdB/A5bKiFU
	1qiJwJlc3c+TclsAf89Xf167sWu4XIV5SyX7n/B0QshrDTb2uVT+kw5BlVuUbQF136Ygm+PJ2UwNB
	FiibEHTDYTTxNqBSXvMLlvefhVmyxlszPp3yhCzq9/XvCPAS5KYBqWYH178+NCr8uubC+053rJn0a
	aIo3M2OincPjanXmrdWtCDe6gW7PYTkpqlFH/Bel1VkDhzA7HvJ22UIYfpHyITrj3IIklmXxn0Mxy
	QwEbK1kN5gUzwglFXsIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSlPa-005bz9-J4; Tue, 21 Sep 2021 19:26:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSlP9-005bsD-OP; Tue, 21 Sep 2021 19:26:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id t18so157147wrb.0;
 Tue, 21 Sep 2021 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SZBRZMgSz4LbQsAfbH/YjYm23oNfOhnsr0h0sD9TjzY=;
 b=apX3C080nmKllk/RGBMUY2ZGD6plFGqepivO4mqAX548/G/c6d+UgkpxlXPx7UFmeh
 3uWdvq5BIyyvvRGb8XpoOQOcf1fpN3lSqu0deqWLK/YIRsQQG7dhsBZ1xx6Y4JfghktV
 O05gXdijAI2jKbLa2hRVwsSxXT6TVhLSAVIHMV0quBWw5sOo/4AwyNWB5LKXhTIHr1Xl
 OgtYExmrL8eq1l3V3inFpKuflIENuXLqM4EENM/MmJfYt4Py6F4AuXsxIwwce47yNy4x
 NzX6gMl78zx5L1uJY1Yjf1/tSvn40ESu1Jk8mLdQ8gkwKh7kdTCJTZnciBwLfXzUS4+l
 QLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SZBRZMgSz4LbQsAfbH/YjYm23oNfOhnsr0h0sD9TjzY=;
 b=06unaS2+UZw3R2K4tsV9h5d3y/dW/Qdn3DHmyePyXPvw9QAnsjKNSLmq5MbclPEwmz
 /hExB+q0NT9lc8Psf93wseUsOs+uaJsoMSsOu3bCLtQm2zKF4GujewBe+CPLNXGh/qVm
 rjrQIbftvauiRm1uapMWSih/Ud7DC6p4cDE5R4ZWFSjUeo2BXvd0+INcp+ZPxVKTe05D
 whqOnLUNWac8vMNHD5miMLk8rl0iYQV4SKrtqe3JvkE4Ffjavl4/44e0J71ri9X4ZKne
 fvQBOYoAlQ91mAbOcnjJx0pZ/0C5/6HvB6yzILyrBggBJV8L9MwSeAFJnvSgKkYN2cnO
 gqIw==
X-Gm-Message-State: AOAM530SfkuToP97Mz/8nOLnbPsMp+9Uj/JIkDQWurDrtfxwi8FzDC5j
 LXi/x1Ao2x+Mf7yRK5X4xtI=
X-Google-Smtp-Source: ABdhPJwgpJFatcnTGrAJhOX5voXLw/TGpmm72+jzXbeeTjdNqvxTFxUpdgq71gNjQbO/N8g+6e9rDw==
X-Received: by 2002:adf:f98b:: with SMTP id f11mr37783857wrr.333.1632252369859; 
 Tue, 21 Sep 2021 12:26:09 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c4aa-d500-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c4aa:d500:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id h125sm3980771wmh.9.2021.09.21.12.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 12:26:09 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mathieu.poirier@linaro.org, bjorn.andersson@linaro.org, ohad@wizery.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Date: Tue, 21 Sep 2021 21:25:56 +0200
Message-Id: <20210921192557.1610709-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
References: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_122611_854091_E7D98A69 
X-CRM114-Status: GOOD (  16.37  )
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

Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
controller for always-on operations, typically used for managing system
suspend.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
new file mode 100644
index 000000000000..d892d29a656b
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson AO ARC Remote Processor bindings
+
+description:
+  Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC core
+  controller for always-on operations, typically used for managing
+  system suspend. Meson6 and older use a ARC core based on the ARCv1
+  ISA, while Meson8, Meson8b and Meson8m2 use an ARC EM4 (ARCv2 ISA)
+  core.
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-ao-arc
+          - amlogic,meson8b-ao-arc
+      - const: amlogic,meson-mx-ao-arc
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The name of the firmware which should be loaded for this remote
+      processor.
+
+  reg:
+    description:
+      Address ranges of the remap and CPU control addresses for the
+      remote processor.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: remap
+      - const: cpu
+
+  resets:
+    minItems: 1
+
+  clocks:
+    minItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandles to a reserved SRAM region which is used as the memory of
+      the ARC core. The region should be defined as child nodes of the
+      AHB SRAM node as per the generic bindings in
+      Documentation/devicetree/bindings/sram/sram.yaml
+
+  amlogic,secbus2:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      A phandle to the SECBUS2 region which contains some configuration
+      bits of this remote processor
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - clocks
+  - sram
+  - amlogic,secbus2
+
+additionalProperties: false
+
+examples:
+  - |
+    remoteproc@1c {
+      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+      reg = <0x1c 0x8>, <0x38 0x8>;
+      reg-names = "remap", "cpu";
+      resets = <&media_cpu_reset>;
+      clocks = <&media_cpu_clock>;
+      sram = <&ahb_sram_ao_arc>;
+      amlogic,secbus2 = <&secbus2>;
+    };
+
+...
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
