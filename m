Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19775C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A620C206F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A620C206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iH1vDE87CkSHfsf+lej9A+EZAqWt5jEuznzctj2YxP8=; b=drl+tvbwczrm0rHA58FrfSUWS
	68P2+cY6eDSaRYqs8x88xubszR7V5yFEZOgCbga/hzGspHYi26d7NCAaKdtUiBT5t4NLk8IDzeRm7
	zobAxifEa5gDsCShNbk86VlCwYoR/z5OYY/2ow0qFkRM7Iz9jXsGauczeyr2Z7te9lrHl34NhJJF6
	w+GhIq0j0PItQHeK7xo4zPNREJOoSwP9gZRO+uNnx2rQna/xsXqgbnG7k4QMCRevbZzZhSaXg53eh
	FoulGL+PiiQG0TA/reCU64s7i6AQXmhDq6EdEyVcYPzsrCF/74pcxhvJl6B4VVy3eVbunZiqqA7Rf
	t+TR3kIjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuQHS-0000oi-AJ; Wed, 30 Dec 2020 01:28:02 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuQHC-0000jy-9F; Wed, 30 Dec 2020 01:27:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id h16so14119680edt.7;
 Tue, 29 Dec 2020 17:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MtPxMqkjwt6sHKWiGsuZVZg8bNgwsNd2+f6vgAqxoic=;
 b=geGfyg5Vu+VI3OwPgXC08gM9zGH8+v/NvBZUaAozHsn2Y3GrUSMnYN9HbUY5sMzNzN
 meg8W6AlAwe1IOpJ3r2fUdx0SR0s2aBB8vYn3ngpYylBgO4iSJwbok0bJ0298wD0/oWs
 SOXhXwpQkdjesylCihQ9Lz/l2be1hN3PMLN024SRQLbUIm64H3+y3KCnSFc0ubxd3xWN
 npLWI0+sKZo5j0713TDbZzpVj6P55tkmgv7edsLSwXDvMywgLov0pDxXNMVIaO9zSRUm
 OfIxF9t7bBjs8SCX8/xiChdJ93OctM7zQhsV2hJ8rQUJ942cg5SI7p7h9lFd+6ulqw/I
 JmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MtPxMqkjwt6sHKWiGsuZVZg8bNgwsNd2+f6vgAqxoic=;
 b=AvlLVWaNZv3lqzcv5xap8keMPQKMSvL8fpKv6q/KVSXzgsugc7vhytrjIvMi6ZPrtZ
 nz7Yh2viYp8eY0j4bLhnjMLEIMGY5Q1CJO/swvmmAUTSDNgPmWtViV7ZkmI9enlrG2yz
 xl4r2bmEEwK/kXZahcFjwTGcaEyGZ8ueqOdjZFXx4V22OHAggOYmWOyu836TqAEU4TFa
 435D3+JJzraykU6Js+94SSv0svR2j73qu9wYUT5jHbwMcZRRY8BionBFO9wKh7ZWNhid
 SQI+YHlklNp5iWDh43uUVreISrkcSijxFynjROp6bxkm1NYeQhlA7psxqL/r+cD6mdGr
 bwRA==
X-Gm-Message-State: AOAM533B3HLztE/aIraeuxFWBeF/7b9qsJdcQNtY1hT7LH0gi8WO14/H
 klaKkcRH2+TMOxI0PKF8HJmAvw+TSwE=
X-Google-Smtp-Source: ABdhPJznEZmybn/NgvvEAfXc3C3cLo8e2RNuEOZYYNX1XVxkerwE6Myr0sk29i+aG7EOSKKSil7Vrg==
X-Received: by 2002:a50:ce13:: with SMTP id y19mr48656745edi.241.1609291663889; 
 Tue, 29 Dec 2020 17:27:43 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:372a:4000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 17:27:43 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/5] dt-bindings: remoteproc: Add the documentation for Meson
 AO ARC rproc
Date: Wed, 30 Dec 2020 02:27:22 +0100
Message-Id: <20201230012724.1326156-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_202746_424863_37AF9815 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson6, Meson8, Meson8b and Meson8m2 SoCs embed an ARC EM4
controller for always-on operations, typically used for managing system
suspend.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
new file mode 100644
index 000000000000..ba5deebaf7dc
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
+        - amlogic,meson8-ao-arc
+        - amlogic,meson8b-ao-arc
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
+     minItems: 1
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
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
