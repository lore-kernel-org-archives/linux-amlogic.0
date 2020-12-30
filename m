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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B71C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3655206F9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3655206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PeA5/p61TCfOkce/i2y7AUBXWWUkNNlG4EGNMkszdns=; b=OOgzItOkmv01W18m/oWdsXzn7
	/2CQ4Htdm53f548/72Kl1teYnbni3Id+dVSCjli0hDXUft1JUsCHc1t8A6vdHpzbxBcXf6pgg9Fjm
	esxcANjhCOYJN4dcwImxN3BdaOFe/AEXGt5oo9XN4/f+F7z5jueyxT99IoyjXrHJEGp6Q8zacNQzp
	+cahcunmXGVOomKDPHMVWgI5AVxPfNSPVV1XnzwvrcnEjGkYDh7nPQELRtuxCKwgPkNXZG8iCSOkv
	FQ8kmXaAppgnDiUyAu0dsatjjiDDsOz9r8wBanGy194d8gCpqGGLHs70Q2ocVE5FtSjK+IMn9lmTB
	DiOjwltFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuQHL-0000mu-M5; Wed, 30 Dec 2020 01:27:55 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuQHA-0000jH-0R; Wed, 30 Dec 2020 01:27:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id ce23so20234490ejb.8;
 Tue, 29 Dec 2020 17:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=imrJKcMY1s8JA1VMBRSaaZtkdQdYVBWQyZZ2ZjhBALM=;
 b=hAABnlye+GbQK4TdQGvjwPMR9PQbrndwo9E9Bx/ndweH2aXp26ibb/WBmmexHiaOiO
 9eh+2xWTTWcyEzeNd7JPDmI0W+k8ayK7lpyOfFafrX3rDO519y01b4Kq7IoFwlxF8hgX
 6jR8K4n2Gn5Sq3pQYOgYStaXNh0rJ3so2AzCz/KCiRGEKYu22fppijSY85Ha5bpEC49V
 sNx3cF/hcYorO/BxhzV6bzcDD4jwkrQkQuXOXDJzI26bsyGim9RCEbYM0uy1/BqJQMBP
 u4cJ3iLZRVtNr117ZHK9J5KUOnfF1pj975OC6+z/2YW2TvIErfihDjSF36cF7J77+SsM
 2Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imrJKcMY1s8JA1VMBRSaaZtkdQdYVBWQyZZ2ZjhBALM=;
 b=b5FXlCB3tQOqrJco2nQEcuk5F3aIxkGbK2pO3I8grs1bBqoPTr7ysCuJW8Kb6Ypvk7
 hcsHXx663m89gpI8m/YyAMDUh5zjL5BXp/i64nUnXEFum2ySM74FBTgpS8PaOLoeR4FV
 6ceatSh7m0T5WQhnArwKlV/S22DzKwlaIQfDFc9wv0F+CqUIUpwsmNBRmGsCc3HzVhat
 jsbIv7CeE4rqFX7Vu1e17vQFvYxrjuHwDVbumrnOXP7MfgnbUkIV0DdR7BUloBDlKreT
 JAmgwMuvbC21NwWIM7Mo1GDbyI/UUY8FMv6AS3Y2N1xRC340nYwW2cLGvIi2AUfkVTZw
 JoEg==
X-Gm-Message-State: AOAM530r+PgTyl5IGvz6O4a98PB1MzAynzxbcahSLlBSGp7PnichbpHf
 DcMVuFlLXpoKqksdFKRxWAI=
X-Google-Smtp-Source: ABdhPJwShPofrfvJIRzJpMlIT4O6xPnONzNS3zWXwCvFAQNcxMUg5Fe/b1aISTX+RbgFa+YfNFgWhA==
X-Received: by 2002:a17:906:154d:: with SMTP id
 c13mr35357439ejd.471.1609291662846; 
 Tue, 29 Dec 2020 17:27:42 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:372a:4000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 17:27:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: Amlogic: add the documentation for the
 SECBUS2 registers
Date: Wed, 30 Dec 2020 02:27:21 +0100
Message-Id: <20201230012724.1326156-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
References: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_202744_084965_CEA9244B 
X-CRM114-Status: GOOD (  14.25  )
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

The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
contains registers for various IP blocks such as pin-controller bits for
the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
The registers can be accessed directly when not running in "secure mode".
When "secure mode" is enabled then these registers have to be accessed
through secure monitor calls.

So far these SoCs are always known to boot in "non-secure mode".
Add a binding documentation using syscon (as these registers are shared
across different IPs) for the SECBUS2 registers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
new file mode 100644
index 000000000000..cfa8e9de6c28
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson8/Meson8b/Meson8m2 SECBUS2 register interface
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |
+  The Meson8/Meson8b/Meson8m2 SoCs have a register bank called SECBUS2 which
+  contains registers for various IP blocks such as pin-controller bits for
+  the BSD_EN and TEST_N GPIOs as well as some AO ARC core control bits.
+  The registers can be accessed directly when not running in "secure mode".
+  When "secure mode" is enabled then these registers have to be accessed
+  through secure monitor calls.
+
+# We need a select here so we don't match all nodes with 'syscon'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - amlogic,meson8-secbus2
+          - amlogic,meson8b-secbus2
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - amlogic,meson8-secbus2
+        - amlogic,meson8b-secbus2
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    secbus2: system-controller@4000 {
+      compatible = "amlogic,meson8-secbus2", "syscon";
+      reg = <0x4000 0x2000>;
+    };
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
