Return-Path: <SRS0=HjQf=GF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FF0C43381
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86B7207A4
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86B7207A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iNy0902pvIPQsKLvdneTGDexYmj7cMcK+JMhe3dAjQ=; b=RlIiHerC6NfOyEH+R3bnldUV4
	Ana7w7ivJhOzB+tsWcUqdEsJGO+krkWM69vobNeBkbfX9LS6gCcH6XpFeh8FxsVmzXe8itzn/nK4d
	rm7oQ50jjM5JkrwmIuHjxiuz9jSsDAlX2T/DkkosGCiWXB94u3R/zD3fy9GBqt0uDBZ4Z23sJoUfU
	vVqUNMJh1gKiES22Fg9otjkwKnp7RviWP/JjMnBhp3ChkiwAnrRDOzFvDPMZ7EO18NDosCOi/so/d
	Kzrk1l3YfuKHkx2cdu0CdGPkN8JaRbk6PBV0tEPWx2V9tQS8Uci4rgLJK7LZnhCaqeS6NPe/ejx4F
	83fBPHWmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvnzk-0002yJ-6X; Sat, 02 Jan 2021 20:59:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvnza-0002uX-V0; Sat, 02 Jan 2021 20:59:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id g24so22956483edw.9;
 Sat, 02 Jan 2021 12:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGzJTaWs2ZS8AEwsirv2BgYJFSuAwUWvelZNyl7tzMs=;
 b=Tg/pmAPZCNd3zQAFNQCWeZ5zvyCApeVeQKiW+gWJyvwl9mgWktozIyDe1luQ9VXlnL
 99ncXwaQjzzrgzKsbjygYbDj0fZQN6AL1SiXAcYk6RtV87WOeOfOAFVZ1Yjd4JjdbpN9
 NvoTX5iz4x2Crsb5hy3D2m7Xx421xHpdTicXCnK0Mgf+BRfuoUYk/WftQAZbdHofOVHa
 LzbNa+TveWRq2E1ENMOIJMx/QEeUlpaRVhaAYojj4xCLnrcX08zG4JNaDCKAPsRCT56+
 wPzJJBEPJrvMhgRYPVjjrkR2Zs/eJweqpd/kTq4Pjsl6ISpK1w71bfgoYccTtFc5UkxI
 s8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGzJTaWs2ZS8AEwsirv2BgYJFSuAwUWvelZNyl7tzMs=;
 b=EHInnomQclGY/3j7d4nmK0iKg8AaYQfNx7sdChrzDQuAwx2Y9Zo+wqQ486NwDzke9k
 GrCh4mSUdznYtcGNP7TaWb3zJkZO6xycao7AGaZxJjcTcjnYSXL7CwXaOBoLcxUjqekW
 N/QvJn+m7Cm8lyqm0+c7t1DoTaqni0OuBWlbCzJm9NYVbt8s4fHd0niB0CpIaN/y4CEB
 qceNGbOyvThFb15y7AqZ8aVQpqBl3ObHOjjUAfa5UGFxyfuFAvURewERvBfRLi+dTUf0
 4/tw0UbKRVeujX0RZTCptM907E0jtVHh0Wwpo9BD1Jbv7RcHX3l/CWYUw+vkvZaH9TIY
 XvCA==
X-Gm-Message-State: AOAM532tlkRt3agIe5KdIV3qP9Tlxl9Ba1x46Z8NBUSVMb3V/m3AzZuW
 MosduShU/GEy3HApAMeDDHk=
X-Google-Smtp-Source: ABdhPJxNjL3jVdnY7FvrXUle/pGeYWEwsyGUIY0+q1xwGunJf2gHd111vYmjSNdwOjN/a8SLQ3JjnQ==
X-Received: by 2002:aa7:d915:: with SMTP id a21mr12883539edr.251.1609621157745; 
 Sat, 02 Jan 2021 12:59:17 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:59:17 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 3/5] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Date: Sat,  2 Jan 2021 21:59:02 +0100
Message-Id: <20210102205904.2691120-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_155919_026930_F9728940 
X-CRM114-Status: GOOD (  15.79  )
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
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
