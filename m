Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB1EC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1F120771
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fr3NTXyH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S+K/4POx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1F120771
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTlK0BVvMG98V97Pg0eswYN+pxsuFlUqLoT09xpte0g=; b=Fr3NTXyHpBs43f
	b2TgMkACk49IKzXecHXc/msIQ+W21Mrn/SYyykLWrV2zUaCSY2CSTiWVe2+8DBp4EhEVXfFUumHcj
	mpdmbOPG5VQu2Md6lQj0b4WWvslpORea/B4VEM+R9qJvWlKnYCjhVroRufqHrKsBgJo3RSycxitOi
	D2rSc0zoYf1fHn9BQhK9QGnNXBzfxfbSD+pfrCmTbXmXrh/IRGrarIJA13UBl7agz9oeQtL05W20x
	4XQXOElvzIP3Pt/S5b6MwYj9VJfQeFLsV1LToxuy8fif0ySbjwzJxmBdEFEpTSXcpfClIYTJQGLop
	9MDt+djPu63iH+LwsVzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORyV-0000my-Ti; Tue, 14 Apr 2020 20:16:03 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORxz-0008PX-4A; Tue, 14 Apr 2020 20:15:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id d17so9126260wrg.11;
 Tue, 14 Apr 2020 13:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hgI4BrhRzwo1MiGrMwLDXDTrl4Dmoe1307hvr9odN8Q=;
 b=S+K/4POxBnzMHicOhDPjATbCVv9zh8IupE/lRJLSrzjANxjo0OVF1P2t3JtDPB0UUc
 jLnB9CO20GCHpKD4YvU9bvKWpBT1AbakItdUXf/o1GGIDRO9KU+0mzw+4K7rHlG9qNbo
 hHtrzr3gJBFEvXCZG/YCiMr+MakvAH1kwSejcMrHobw6rdYr5gnPgcSz8aDg/pQzYTYM
 2YZDdu7hoUXk7aOC9v6EHihwnViZDcGfvms9R3MFV5Vx1x54Bksb3Vq0ftQqkp7y+iPN
 OoceKkiHZDNa+eX7p7L8ExfHyhX5stXHCxbn3d/BCw2AcaP8Zflxj1z6bMbPiz1MBcm9
 pV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hgI4BrhRzwo1MiGrMwLDXDTrl4Dmoe1307hvr9odN8Q=;
 b=IEicw1fYcpGgKao4Ywz75oE53cmoq/rM41Y3Mqf8r8d+g0yRoZnksfMAF1pCp3MOGp
 EQcVcvnis6mnR2H5KQZohagfgobU8K9YgazHPxcZ8OeUg9khLJkKRs5i/j4Eq4hoklgj
 l8/qf5wYU8UfAeEmy/hmZs07l2KREtlqDduMjGL3H7jNyqR643JBt9vzXQAKGZflD0lO
 juo0YEch1yaY2A3KiUsHWPyulIG/rMJ95ONTOtyESoZZK+Ums6NKIpkbxV4fdAxAwPtU
 3Dg4Lm+LbicsbgK1WWNEe2evFOzYy3DvWeBJaMysDnoL+wSBKsDeVzXTao8++/rSHTkW
 cNiQ==
X-Gm-Message-State: AGi0PuZ++Rn3ipLk7tH/dharzmU6j5eg1lGSGCykERLS+q98z2DmAc79
 6myigmh+tjYM3N+stiJauhw=
X-Google-Smtp-Source: APiQypJSn3teWPYCLKE3B3vLZOyI+srye9W6W5AID45Tz+dhtJPjxcLZfhHDVMJ26884KuX8bPuvjQ==
X-Received: by 2002:adf:fecd:: with SMTP id q13mr17184706wrs.12.1586895329459; 
 Tue, 14 Apr 2020 13:15:29 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u17sm22537467wra.63.2020.04.14.13.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:15:29 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 2/4] dt-bindings: power: meson-ee-pwrc: add support for
 the Meson GX SoCs
Date: Tue, 14 Apr 2020 22:14:55 +0200
Message-Id: <20200414201457.229131-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
References: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_131531_162095_CCF0A4C5 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The power domains on the GX SoCs are very similar to G12A. The only
known differences so far are:
- The GX SoCs do not have the HHI_VPU_MEM_PD_REG2 register (for the
  VPU power-domain)
- The GX SoCs have an additional reset line called "dvin"

Add a new compatible string and adjust the reset line expectations for
these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 27 +++++++++++++++++++
 include/dt-bindings/power/meson-gxbb-power.h  | 13 +++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/power/meson-gxbb-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
index a0e4cf143b9c..15a29ed19327 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -26,6 +26,7 @@ properties:
       - amlogic,meson8-pwrc
       - amlogic,meson8b-pwrc
       - amlogic,meson8m2-pwrc
+      - amlogic,meson-gxbb-pwrc
       - amlogic,meson-g12a-pwrc
       - amlogic,meson-sm1-pwrc
 
@@ -42,6 +43,7 @@ properties:
 
   resets:
     minItems: 11
+    maxItems: 12
 
   "#power-domain-cells":
     const: 1
@@ -77,6 +79,31 @@ allOf:
         - resets
         - reset-names
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-gxbb-pwrc
+    then:
+      properties:
+        reset-names:
+          items:
+            - const: viu
+            - const: venc
+            - const: vcbus
+            - const: bt656
+            - const: dvin
+            - const: rdma
+            - const: venci
+            - const: vencp
+            - const: vdac
+            - const: vdi6
+            - const: vencl
+            - const: vid_lock
+      required:
+        - resets
+        - reset-names
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/power/meson-gxbb-power.h b/include/dt-bindings/power/meson-gxbb-power.h
new file mode 100644
index 000000000000..57ab38dcb6bb
--- /dev/null
+++ b/include/dt-bindings/power/meson-gxbb-power.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_GXBB_POWER_H
+#define _DT_BINDINGS_MESON_GXBB_POWER_H
+
+#define PWRC_GXBB_VPU_ID		0
+#define PWRC_GXBB_ETH_ID		1
+
+#endif
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
