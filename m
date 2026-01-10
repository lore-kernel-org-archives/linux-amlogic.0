Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AE3D25021
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jan 2026 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7u6t/jFbyXeNjgAfNjeOroavplxNu0ISfY6Qx25LYA4=; b=R/A3SaeWbf0JTZ
	wbHC0Nx25NDyWBeOjJYkllylKCwh67ViGbQZyhkq4+84l8qw16f/yifugyAcXgprwJUSH6uioGduL
	7RifDu1J52VAcDY/9YdvZ+ZCxzqmULVq9o0VbmAWBDQnB1Pi/jOqufJVQ0LIxGOQc90PJ20CDCY1P
	4KgwiWjrJJ5bfboMraQAYRX+H8gVHe+7RM96r9d5LP72/4Aa1vzT0IqWpBdB+nf7VqxHVmk8toC5+
	7Wdpdd2uFQG13iyyRuktM26uZVr6MHWIr0cJEhrS72LFdEwB9QdjBawmCvpOxdm0omQjvMwfLnTr5
	FFdGLEXh2yYcIo7H+7Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCe-00000003ee2-3mcb;
	Sat, 10 Jan 2026 20:04:52 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCb-00000003ebI-30jP
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b73161849e1so1053512166b.2
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jan 2026 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075487; x=1768680287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAMBTRf7QytTB2jenrGs2RAk4m+Cjs0eBt15JACy/6w=;
        b=fV4U2jMFxoWevWoKW6XqicVB1dBi+M6eJcHpisiXpW9jllst8cK1qoEHwLLvrWjhfp
         W8hOB8J1nLHTMlDefq054b0CVUewvVwYyHZRE3hS1xcPlrUU51Hnj6EZDC3jrCmHZUk8
         Z1vYKCM51WTGaSx5wDx554IVgj8y3t7ka/rA5owCxXVrzYxXbaG2UBRcJT+E7Ana9xoR
         Q+F6OFF7lGCxtzsFuEEZLZwdnEHSjB+jBqFx9tAYh9LmrH9ZMFYCGRtKcdxcs8bUYTH9
         QG1gKXKlFtdRWd00ea3Di5qpX9v0HF2rthzb6lcT/f4kzI0tHDOSCPMS8KGbunX8hxkv
         361A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075487; x=1768680287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cAMBTRf7QytTB2jenrGs2RAk4m+Cjs0eBt15JACy/6w=;
        b=TGoVS/wlMwKbDyjUBD6PrzRpV/xKMoVVDw6X049RBXNLkq2YechWdtQMO2KOer37eq
         Zhz5rVBurjzX8clBqCIqRknqFO9KJwvOMWFDzkjt5ZwVvXRhw+8uyaF8l3+Rpr2qWsHp
         wOFDqusiIP0ObnsTEO26FyNhQXhgOt+GzrwAM7zQNUgwNbQsyfMdhdOs9ZreH0FrU56G
         MQ11x5vezPyUBTEXlnhuHJmoAZmnxoXuHWUuqiiOeuXIJGcG5yb12uF4AIvPUWZvhsT/
         STgx3Xevppm711dely2QkZJZiKzZBxxCIrSoGzQOakx92uC7MUrYKsQXe37DYMC+U40H
         78oA==
X-Gm-Message-State: AOJu0YwZVLWR5SYyhxvyz2I6K8jd6cgI0vSNIbtAg0XJPtkqSJZRjI/1
	HC3dwfRzAVMr0svUpHhovQLVX3vexMJb5YgyxHbtaTgE6tYhZFkStPu64nDVnA==
X-Gm-Gg: AY/fxX4jCREpuGLRPZRb0/5qas7Jd4/LrTWTv7w2ZGQgTVSDyNo1ChxLKHWVi32dXHM
	e1Hq1e+l7+5xJa01VYFtTxmGABdsswkGNW71NcnwsPDCcsrC0lFaQR4EUlKxsO4qDSHKVj6Kx0z
	71frDXhm0wZWTGIQkj/c5qZnbE+htScboz39vNK5yxfemHXIIN5r5qpQ8o02Zv7oAcBNSybQoHc
	ihkMZxxUO6pZFOvJzFj87W5DhIuw933EbP6tn4/iB860IkEeeN2YrULPBaiUsc6b25EG2BXgOxw
	D0A/U1lSCkMr84R0jemKejz4Rgfu6YfbZB7mxk9pcevsNBZ3n8sg/FSRLRKL394iq5g5n7HwThO
	T4Z0+NVOKwny8SnUpW7H98QT/UIU0Wn4iGUu+SDvFFWji5Tsih3BgqaGcK2LNyoTmzWg/usUErg
	KFuJIHYCvaZlW8haKkzaGXyp9R6KIcjuJ7FOkY8W9nYJsgt2weap04m74j7MQ5lziw6Bg72EAY2
	MTfAa8OWvcQjXdla5ZcLV2Hv3p3sRGmC5pFUyYJkrI=
X-Google-Smtp-Source: AGHT+IH8QgiCvKfoUTFqnQp4Bc8Dq9wI8Gv6dNGoTv+bs2r+emH/fKSyTd0Pag3ERo6pzcyuWxwXRg==
X-Received: by 2002:a17:907:94cd:b0:b84:27bf:c37 with SMTP id a640c23a62f3a-b844535ece1mr1447189266b.40.1768075487049;
        Sat, 10 Jan 2026 12:04:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for Amlogic Meson S4
Date: Sat, 10 Jan 2026 21:04:24 +0100
Message-ID: <20260110200426.1461575-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120449_765798_6A14B7CF 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Add a compatible string for the Mali-G31 GPU in the Amlogic Meson S4
SoC. It has two clock inputs (GPU clock and a bus clock) as well as two
resets (main GPU reset line and a GPU ABP reset line).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index db49b8ff8c74..85fae7753004 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - allwinner,sun50i-h616-mali
               - amlogic,meson-g12a-mali
+              - amlogic,meson-s4-mali
               - mediatek,mt8183-mali
               - mediatek,mt8183b-mali
               - mediatek,mt8186-mali
@@ -143,6 +144,25 @@ allOf:
         power-domain-names: false
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,meson-s4-mali
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+        power-domain-names: false
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+      required:
+        - resets
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
