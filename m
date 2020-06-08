Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BB2C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:18:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753E720760
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkdNOuE+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FcmK3W9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 753E720760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Blc+n/4ww+GuF/2OfZq9CQ8ql7LGbRbcbUONJg26Uko=; b=bkdNOuE+lrNqoo
	FqKFRv8BKHYTF0yNj5hfT9ucrfen+5eoH7zUQ34ecr8fQE4O0wUyRdKmp8gQga08qDe+070NJba/g
	BbzQ/niBCOy5XYJDG5+yKmG2MEZLBBGSfufYOvyFFy1+p7P4LccgLxMJ8iaRAGKXi82iR97siTRvQ
	WZCf39vglzrpfjrqjsWmxPMm5xnWP+D4mwGLi+iuxFXWzsfJ4f/FeMDa1NxvhgmkJ96Ho/neL9GH9
	4JDy0qt0krzDxVTZXObASD0FhYRQSFnImAc3NkwlV+tuso4MKNDYDxakA5QjgNwL87uZK7bqt26X1
	qQD2wgM/Z/L/koq0FWUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiDuv-0002am-Uz; Mon, 08 Jun 2020 09:18:05 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiDub-0002IT-Om
 for linux-amlogic@lists.infradead.org; Mon, 08 Jun 2020 09:17:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id x14so16559339wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2020 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lm/JhSU6WIUD9liaClHiq2/rbC+K/Ls1HtNWMD1Nn2A=;
 b=FcmK3W9ITgW61d17rdHrRaPjerQ/Zh5mw4c44iJ75UtbSzKwd9ySNyhyPDuGMRTLxq
 2H6QaFZW+s365p8SysfF3q8kg99qujIAIP4GhnqyzQnLjlHXspbg5JEahrzJ78nWEnGF
 aRcrfKcxTNzXNxRKNmmJpBF0AB/+tPCe22GtOBCWMYTUXilPvW8Lvxdki1cX49ScKgUK
 BRySgoCAhcZNHORHpL3uFQgs1EBb0AUcAEA6HciCJVGjMtZEHTCkbSjntdhWzJH7kes7
 Dd7a2aUhqxsr62MAVe8R4uHDvOXyCJ9+YQ+PtOW1FMOHbhRtoJzpV3wFSqG9ChnILtxd
 lRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lm/JhSU6WIUD9liaClHiq2/rbC+K/Ls1HtNWMD1Nn2A=;
 b=qgBjrr8uPwLg3cSb4LUJHwfL0tn8BBfHnmRHIQSAshbwa4U1GKoG2KQCpmHeARQYhg
 gUTL5P7L+h4NJ3ZXzpewE02M4WL8mrA7VbgKNtDmjFMltPH5jWeHIn+dMEx9TQ066TYk
 PA/rpeGSZg5y0Txljl0SNuXDq+7HMrjEAZjrVf/okOac6B9KYMil89TE2+9MgxXgCuHZ
 Gtis9wbye6lW4Np5vQLZuDFxGcU0u0atzChsbOulFMhpNAoFUzmxb4XVZio4VVXa6fhV
 uXDjVn5BPI6+zh2Eo79Tid+kS9pb47iJXRUOHS0bz89LieJO1UshRT+Irp/l82IZyLuT
 X2dg==
X-Gm-Message-State: AOAM533MYpJdF+FRGIF1TCUB1M0oVtHT6gGs4JFuXMxLUilOCn+qrHic
 p8VZKP60i5LCtC1ztf6sVTKt5A==
X-Google-Smtp-Source: ABdhPJy5nApKLg7sAnx1p1z/S0XJC5YRyMc2U//Q+srm6fnQM91nzIe3TXIUUym4iQ5GereEV0LpJg==
X-Received: by 2002:a5d:4cc4:: with SMTP id c4mr21990314wrt.159.1591607864362; 
 Mon, 08 Jun 2020 02:17:44 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 t7sm22732326wrq.41.2020.06.08.02.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:17:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: mfd: add Khadas Microcontroller bindings
Date: Mon,  8 Jun 2020 11:17:35 +0200
Message-Id: <20200608091739.2368-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200608091739.2368-1-narmstrong@baylibre.com>
References: <20200608091739.2368-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_021745_836303_C7DFF1F8 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
boards.

It has multiple boot control features like password check, power-on
options, power-off control and system FAN control on recent boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/khadas,mcu.yaml   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml

diff --git a/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
new file mode 100644
index 000000000000..a3b976f101e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/khadas,mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Khadas on-board Microcontroller Device Tree Bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  Khadas embeds a microcontroller on their VIM and Edge boards adding some
+  system feature as PWM Fan control (for VIM2 rev14 or VIM3), User memory
+  storage, IR/Key resume control, system power LED control and more.
+
+properties:
+  compatible:
+    enum:
+      - khadas,mcu # MCU revision is discoverable
+
+  "#cooling-cells": # Only needed for boards having FAN control feature
+    const: 2
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
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      khadas_mcu: system-controller@18 {
+        compatible = "khadas,mcu";
+        reg = <0x18>;
+        #cooling-cells = <2>;
+      };
+    };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
