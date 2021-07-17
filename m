Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4374AC636C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBBF61108
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBBF61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmnfvhPsNtZxhcI95XMevRcYYCm3IFIQZpiKxEffs34=; b=XEA1ebcF5k1bOH
	YHQ+tQd2Xkyby93SDnKuw+7C8Q3Sfm2oWc1X8ciJB/18+KEGIyeXgNui+P59YQHmwo7gVHg3U2d6O
	ak/L2HA00FtgWO385fq9zGP4Y8CVExzUQ3LPcAAAtzv8GrIccpycll6WT+LzXwI3E0UrEoWrH07Ck
	YuANm0Kv2TYn09x0BgvMXtYLvsOFftaA7Kn6le6IyV+Kw6Yu0hUXQa2bI4gO92FtjjC1tVb8iLxZ6
	I8kJKjjLAX5dQw7oPuholTjK4i0uoATTLn+mbUUQUynUitEYs2hFWX4oATZ0gQp2DYpxDIn4bmHQ6
	zJmrXde4AUBXlWsaFZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4u3h-007BZV-Fk; Sat, 17 Jul 2021 23:49:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4u3T-007BW9-7d; Sat, 17 Jul 2021 23:49:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id d12so16493094wre.13;
 Sat, 17 Jul 2021 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bT1+fPwFJ9flWJpalc9w5DJNPuQ3S3336QWUFAF7Nzg=;
 b=MX4ao7FsMDbMFDHM0HBg1o5Vka3eWBtFWTATqUoGK7Tv01xDX8zaRsuG9sr3csWNQo
 r3GjNQWjHEO1M7/GR+vU8rBy9gCAH/4ae9BJLARD8QqSh4wQXry7JJBsthQ7hazbFhrt
 moUU/AvbYyYg9cig+IAIUwKsALiQ5chduykZ4r0bO2u3JED9utY95Uimj2Qll2Li6rPs
 bv+3MoRQkFnRUCYErJguo5lA6AjhcLL7AV1nPdG0Xi0JzeJDflFn01x34Ih3ILjsMWz/
 xEBMDU6H6gjC52h2ujbqPtR1vaMJwOmtIpyrkGcFdofeA5fHdSTjYPoHKbT8FRXn3nqb
 KVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bT1+fPwFJ9flWJpalc9w5DJNPuQ3S3336QWUFAF7Nzg=;
 b=HzTxx+78q0kldZ78twlc/bqx/J871dJBH7TWwYmXID4EwuHQBQ7WNxuDWHDv0az/x3
 0kkPHAvME2wfcegii8A1BC26D/xn+pXTxASSkJGj4KxX0HMMdrzCNKDgG7x0q4MQaC18
 /5dgTeKtxNBhMODgYrT6GFkH2oZjJVFqV14XxR8u4gU6nPLw9b59E/C1NbFjY2JAWOtB
 CXSpqPkbTJ3ZClCzHvVDjm5WVOk7QU7FhxceGt5Ib4tGyfS78k0P7WpOFVTYkszufDY3
 ZUCpYZOKB0vBqS6geYxkjJXcL/vxu6798wCARqdRTBRuretwj5E07EiGAqMOdKIarWXA
 2afQ==
X-Gm-Message-State: AOAM531ORUDWFBTIguz4+b0bnih3nL7h4+ZJp2c/nrLkjbYKDDHDJHFO
 7gQvN4CNmTd2SOgrZy6pu2g=
X-Google-Smtp-Source: ABdhPJx7hpMPMGYC00iF95XI7OMBCypMiepPby1ZWDAXHuBTefApnReU1/cPQgrg0n0cffiS4Nq14w==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr21395971wrp.351.1626565749759; 
 Sat, 17 Jul 2021 16:49:09 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p11sm14505044wro.78.2021.07.17.16.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:49:09 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mathieu.poirier@linaro.org, bjorn.andersson@linaro.org, ohad@wizery.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: Add the documentation for
 Meson AO ARC rproc
Date: Sun, 18 Jul 2021 01:48:58 +0200
Message-Id: <20210717234859.351911-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
References: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_164911_318384_D77B0097 
X-CRM114-Status: GOOD (  15.78  )
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
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
