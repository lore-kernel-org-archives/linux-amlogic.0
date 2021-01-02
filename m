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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7D4C433DB
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA9420799
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA9420799
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z+EsIH0JE0gpXguRnMHa63XRQlUFHXAEp3E9nQiUyIU=; b=mOTSymsrFqtbAO7rD99Zdg7vV
	TmkQ8LH5VgRfgYoS90YhjcDrlVgS41ACLO5JDSKLU20h3NWmlCKyQzHyxsEWL/JNDaHFYBafGDbcA
	uDFgC0ZV3g8lb1se7s0E/4kPgqhBwlW+e5nknFnoCq7A1VibYUlVQiSnTOI1aP+Ts4Nq9SHK89hdn
	SlJZNCnPHECRaAz6iHQ1MG9f6yVsRCuwLQ2hS/mWZJX+hqAGhzj54z97DDn1uCghZJvGi4dR9Stdg
	Txb7o8SRfdUu0NORQami/8LTSEZcW36YvA0f0QtRGDRRSdsMPqf571CUiFldHP8275Em/zRGyFUjr
	1HUzVxVhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvnzd-0002wN-KF; Sat, 02 Jan 2021 20:59:21 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvnza-0002uS-11; Sat, 02 Jan 2021 20:59:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id q22so31495666eja.2;
 Sat, 02 Jan 2021 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fNImdkdixBDMY8G5W7g30TmcOCbr3RJns6yyKJP4osQ=;
 b=ZKpwmouWmcKt7BrPdBAWBVInM7masm8IZD2Bec8BCa2QNoNmnlfgyQwVh9RRP1YGTO
 9Gax1OMGHpWbR12OvPFW9ZWRuVPaWFdIzuggId8lxoRjoB0lURHUVcsfz8dSFNhCsOCL
 PnVMBaxkf2x8zJ3L0rBzrPhPAdgVqg4kzA4z+girU+E2GqvJCFuKyPZcDJbCka9xiiHL
 Lbssgh1PTWvEWefzTV9PmIREv7xM+uPOnGAcJJ5VOtBWJn9wYVv9VlQawW+AJZugLC47
 BKpfMvqI2rztEsyhgVCp+97W9zNkiMMyKVtLQkw/ZrtlPzfdVbGPC/C2T36Qq2oaIrbk
 UpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fNImdkdixBDMY8G5W7g30TmcOCbr3RJns6yyKJP4osQ=;
 b=EZnHrM4b6Uk4EUvMYRF59rTw9uw5B4ZG9IpMX5VZdavD8nAUSYM49FVkX9QKBzVD8p
 Bi1n0GqFZbxIz4PrsHFb4/eShHrfv/ckmX6MsPiqrS4PRtJ1CpzKK3SFx2gaLEydAswK
 XVUtLuMd8LGXoMmMVWzay87T1eSdN4zL9/Wm8A5xQifDJITQt9aDhhEXm9C+TLLah8zT
 yWxYGV0FlM1Cr0G7NwlGedKBdWOKKoVl9kB+l64C9rbdBZ6PNoJJW1ghBhm7G1bkBdJq
 vu2MO0Sf8qUIy6TiOvZqS4uh5Lj/xkxD3ZClHnW0TMC63b2vxz+madcElmXZkCYRLI0G
 OKQg==
X-Gm-Message-State: AOAM533be+oHz4WTiCxWSjbmDyklype/wd6EThiaAVO+5mkzM5n4CGTu
 GBWLeBmczOHejOQWeSWuxP8=
X-Google-Smtp-Source: ABdhPJyqLNQ/0eSqUCEcVyKKi2vo/nrCvuuILrsWkYg4Ysxg3RpO7hipdr1kt1e/+v53Hyfk4iPXTg==
X-Received: by 2002:a17:907:429d:: with SMTP id
 ny21mr60656211ejb.290.1609621156823; 
 Sat, 02 Jan 2021 12:59:16 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:59:16 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/5] dt-bindings: Amlogic: add the documentation for the
 SECBUS2 registers
Date: Sat,  2 Jan 2021 21:59:01 +0100
Message-Id: <20210102205904.2691120-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_155918_148823_C9770533 
X-CRM114-Status: GOOD (  14.63  )
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
 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
new file mode 100644
index 000000000000..eee7cda9f91b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
@@ -0,0 +1,42 @@
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
+properties:
+  compatible:
+    items:
+      - enum:
+          - amlogic,meson8-secbus2
+          - amlogic,meson8b-secbus2
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
