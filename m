Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E002C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 18:21:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 457F061DE2
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 18:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 457F061DE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KQ2TVwbfk+8xQml5WBJzMevjL3KAwriXUQqFp0Ytfk=; b=YIkDzHgrLai940
	/s0tOjCegQ4MoKOj4a2gKvW+/3PSssBct6HYC+cH864hKNz4JV8QpZafuSUw7Hg0TYMo7KYeBf+nL
	OBt1qh0yb0Yo7sG/hBiwupRhSOpxrRSVpN5pipQFKwpRfNC7v0gyAj6umf/yP7jsxfIBRpWAxv8pv
	uFwsxrVHv1uKjuyVt0W9LZfdVnneRw2KQSEXev7leWGEDDjneS2rXlS8GeXMlqn31od8GZ2e1TJUX
	r3wlXKouvv82fHYIDJcEtxk3t9vYOC/llNVqCjTR3DkCO8S/6B7kcX+MPY5mDfWi3VJVi/NHXOom+
	KJ3G2yDsKSAatV/BiJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyIM9-00BoeM-I8; Tue, 29 Jun 2021 18:21:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyILw-00BoZw-7I; Tue, 29 Jun 2021 18:20:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id w13so26579709edc.0;
 Tue, 29 Jun 2021 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5VtxKCWi+Hl3p1oi1ZS03GEzAowfOsvM+40k9oMniI=;
 b=Y+G+uJdDNBYT4Q7Fj6e6fjAmVB1gIWmyRMm+xo+ujEmW0znVHuyP+6t95WOGUYgBIk
 X369iiJEJ5fmEF8HGQqsOlZyaGxavaS+5vKhxNWkiqh7Tz0KqHzPDdCqjAqLTJIAha5o
 ZOg4XoNSTv0si8f0ugR6hUkmtwPOsXkVj2qxcocqL5pNI6sNUKiVkMwOAHBmaBy1IaZ6
 Nwb16gzTTM7qB9Vh+MiBodmW6bdPsbTxbjqIhth6Is4hFFYChSpGQbsTHXtH4CyXGUxl
 bV7exAFEK+5HAXiwD/BJpopmBWDDwmrE6UsIPa2EJ6GwwhvFxQsP6NlHC4JtVhP/cbti
 stjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5VtxKCWi+Hl3p1oi1ZS03GEzAowfOsvM+40k9oMniI=;
 b=VBA9JadG964vBvxKprNxvpKUTgFErfYMPED7p35WN4DWBSOL6iBWCpvbdvN4GZWWJ9
 2EQGFFjzM2v9OvBFFdAthkjt5Q4GnZBhSgH5Fcz/ZjoPsZwBo9AKoebEs/OLd7uL3VKg
 82ArFbHUL0EQcxVLKAIdRENVlrMr+vpzHIVBhvHc0KO71cjqvXxwwtOQBNOQ59EUHRzg
 GjewH703ydNAULnsN8uS4zFAGvsxcdfeOIW+43sLGrcmrx0gQFTnE4kj2z7YwOvbRAnT
 TpsAmddlT77ZxwuWFHIVxNWRE6Y0oOdw43elzHePKcFjTyC5wYkyWiLe/dtqtOIY0PXw
 Lrqw==
X-Gm-Message-State: AOAM53392xkrcBkave7MnoGuB1AlCbULLOM5g/QD4RbSuthsZSeCguOH
 8lEWxqZZ8UUaubxdq2AxP40=
X-Google-Smtp-Source: ABdhPJw437VvGfQ3x2+Cd4AjT+O/pCBDfkNNa4zBzDYR/GEYH9iALH4t4kUQoRb70KT+gDAzNojXjA==
X-Received: by 2002:a05:6402:458:: with SMTP id
 p24mr16269104edw.142.1624990854422; 
 Tue, 29 Jun 2021 11:20:54 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0d8-f500-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0d8:f500:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id v5sm11565678edt.55.2021.06.29.11.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:20:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: kishon@ti.com, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY
 bindings
Date: Tue, 29 Jun 2021 20:20:46 +0200
Message-Id: <20210629182047.893415-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_112056_305274_77F90E60 
X-CRM114-Status: GOOD (  14.22  )
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

Amlogic Meson8, Meson8b and Meson8m2 all include an identical (or at
least very similar) HDMI TX PHY. The PHY registers are part of the HHI
register area.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../phy/amlogic,meson8-hdmi-tx-phy.yaml       | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
new file mode 100644
index 000000000000..7faf35c260f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/amlogic,meson8-hdmi-tx-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson8, Meson8b and Meson8m2 HDMI TX PHY
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |+
+  The HDMI TX PHY node should be the child of a syscon node with the
+  required property:
+
+  compatible = "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  $nodename:
+    pattern: "^hdmi-phy@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - amlogic,meson8-hdmi-tx-phy
+      - amlogic,meson8b-hdmi-tx-phy
+      - amlogic,meson8m2-hdmi-tx-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    description:
+      HDMI TMDS clock
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    hdmi_tx_phy: hdmi-phy@3a0 {
+      compatible = "amlogic,meson8-hdmi-tx-phy";
+      reg = <0x3a0 0xc>;
+      clocks = <&tmds_clock>;
+      #phy-cells = <0>;
+    };
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
