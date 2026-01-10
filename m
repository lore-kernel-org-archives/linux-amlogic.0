Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B43D25028
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jan 2026 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C4PYv0u2/KzH7jNMspGI0OccYzUP3SAoDB7CVoin1A4=; b=stqVHKhb17eLgA
	h3aeU0BtBEZ6z/fiKWzeEKe1+vPTCXoGYevWex8O8kDE2jF8HzICgUMrfYmrJN0/PMJ4z8uOaHKlx
	nnMPP2iRkUzviucXHcXj8IYBwBga7kqiVKzb/Mb/VPxgP83CJt0xv3FEUHqLwGUdDWKvU9hcZrLSn
	UBGOXDwQl0sYX9QirpW89N7rilsIbKYnwlSbnstXh40WZQtShC5FQxRLTOLldugznKFbQoySbrR2M
	W31Xyo55uU9yccD4MWFwCoJt4ivBymt6RLTZnQxWKJH8N/CJWr+tM9tBfWYgWmMa0tv07f27tY6uw
	OKwkBZaDpobwtr/9MVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veipi-00000003mPB-3Ror;
	Sat, 10 Jan 2026 23:57:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veipf-00000003mOV-2UbJ
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jan 2026 23:57:25 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso4312250a12.0
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Jan 2026 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768089441; x=1768694241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpJJOa9t1wBvlVJkNJ/5YNn0WHt1DhBf0e1N6PffLYI=;
        b=YRvqRbuyRODe6TnrDVSK09DmTgJgam2ABy0zn0y+8xAPvnfbhGUUm6k9UZmc+0TjfY
         XmMUThj/EQYDJ+Yxmg0eaJlH01ULxold7VYn2u5nXQuR12yWw5Fdn2j33SiwQ94cp1Gv
         eVwmztAdcunbdjkcUtEkFb+FKeooRoCiYg69jcEC2gqlE9J60t/zcv9zluOis8VNm0gq
         NWqUtZ+Lohvu3bMCZqR0ZW7Yxj2Hp4VeHRt6Px8YNObsZAsxqRXenYtcW+4j68i9xNha
         HTy4Peek+hPwvAFs2ZTtivUrKy5slSF/iJbQCxP4wUJYwY5LHdTyNOikJQPD77FUAVkX
         0T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768089441; x=1768694241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpJJOa9t1wBvlVJkNJ/5YNn0WHt1DhBf0e1N6PffLYI=;
        b=DgSyaVlJCx6Lj8xW7fLQ2u13rY+jdHMWZ5am5/OpoyITZwJgjI4JinnGohqzgXoFcY
         sD86kFlg7zjASYd8wJhLch7hcEGzFgwbZwW527NnErM401nLZ4QZtD2d5O9wDvBm5HZV
         bmjA5nker9rkYw+Xo8O2nXoLRAzM3ING6Zg4NAAiF62GaKj2UPR94JJ5lapN3Gq9CUiW
         ZWzgHjDBq+ck3Fc6PGf5YieFQ5MsP31HxjerzS1StI/sxyzM8HP11cmiVJ8OefCEQ/yc
         uH+vwwQO8pi5vL+FYol6jmbsq8Au0huo9c3cuzuZnEpjYmFsolBKEWZkd0yOVhu1yuk8
         D+/w==
X-Gm-Message-State: AOJu0Yyf2MBW6wYcxBNKeYWxTgIgd3MRQiNInzIZZldHhgNjt+B2DxRv
	a7z4/1D6kuigbgVuZeeLtYqBAHXRZk96p7SzgsRl0ANeWqM74nCbIa/q
X-Gm-Gg: AY/fxX6O7OuIJzFi6r6eH2pXbkkF8wDugcnAHaHxJyz+8dWDPsebImJk8deUMmBc4/O
	Q46SOkHmPDmYJEdzrJsgGtBfNsKA0ZzcGKko9OGoFxNotvG0wnMfHtgfhoAQKLzBK3gNpZI9f9r
	QFAq9aJBh8/Jy3wPu8jO8shhJrc46aMSkx5jTcrdRQUM8KUXWKrQQuFvMLOE9lKE8CYLkw30ncB
	6nuqW95G/moT7k1RuObbYCic27qQozpgoRUdHzL666T7VH5P3sDnIfwu1wdzY0jI+tInyQ/Ma8n
	AjEzKBXKzo3eR5a6PtEezi2QKSOCtil1scGhj+2L2u+WsfFHPNkH6d4bP2DJB8nCFF83GkoC9Ba
	gJVyrvvJc0cofMb9MBTsBfTU6jlkaUadyxOn819OSlYdweuXB7XUkmd/Fu1qiLE1/UaPat60JXj
	1a0CAX9V/bRTn3ZltVXrDlOobBMjd25H32R7iuTM9RNSHb4FISx7PcJQJ4ei0yIzO94zjpr3cCF
	5IgBmZv7zcr2+LssVMwPG7+rlLOLFHAQkOmB6z3Jg==
X-Google-Smtp-Source: AGHT+IHgGIkPHOw9/av7xXAs6nVP8o+aqKdZVjmSF3d9NRRkl/SPH1wJAmtrOHvxDrSGi5Wp7GJd3A==
X-Received: by 2002:a05:6402:3551:b0:647:94e1:800f with SMTP id 4fb4d7f45d1cf-65097b99f05mr14840498a12.8.1768089440875;
        Sat, 10 Jan 2026 15:57:20 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5absm13701228a12.33.2026.01.10.15.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 15:57:20 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	pabeni@redhat.com,
	kuba@kernel.org,
	edumazet@google.com,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH net-next v1] dt-bindings: net: Convert icplus-ip101ag to yaml format
Date: Sun, 11 Jan 2026 00:55:44 +0100
Message-ID: <20260110235544.1593197-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_155723_714006_03C2B359 
X-CRM114-Status: GOOD (  14.77  )
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

This allows for better validation of .dts.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/icplus,ip101ag.yaml          | 75 +++++++++++++++++++
 .../bindings/net/icplus-ip101ag.txt           | 19 -----
 2 files changed, 75 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/icplus-ip101ag.txt

diff --git a/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml b/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
new file mode 100644
index 000000000000..f245516103b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/icplus,ip101ag.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/icplus,ip101ag.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IC Plus Corp. IP101A / IP101G Ethernet PHYs
+
+maintainers:
+  - Andrew Lunn <andrew@lunn.ch>
+  - Florian Fainelli <f.fainelli@gmail.com>
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+description: |
+  Bindings for IC Plus Corp. IP101A / IP101G Ethernet MII/RMII PHYs
+
+  There are different models of the IP101G Ethernet PHY:
+  - IP101GR (32-pin QFN package)
+  - IP101G (die only, no package)
+  - IP101GA (48-pin LQFP package)
+
+  There are different models of the IP101A Ethernet PHY (which is the
+  predecessor of the IP101G):
+  - IP101A (48-pin LQFP package)
+  - IP101AH (48-pin LQFP package)
+
+  All of them share the same PHY ID.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - ethernet-phy-id0243.0c54
+
+  icplus,select-rx-error:
+    type: boolean
+    description: |
+      Pin 21 ("RXER/INTR_32") will output the receive error status.
+      Interrupts are not routed outside the PHY in this mode.
+
+      This is only supported for IP101GR (32-pin QFN package).
+
+  icplus,select-interrupt:
+    type: boolean
+    description: |
+      Pin 21 ("RXER/INTR_32") will output the interrupt signal.
+
+      This is only supported for IP101GR (32-pin QFN package).
+
+# RXER and INTR_32 functions are mutually exclusive
+dependentSchemas:
+  icplus,select-rx-error:
+    properties:
+      icplus,select-interrupt: false
+  icplus,select-interrupt:
+    properties:
+      icplus,select-rx-error: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethphy1: ethernet-phy@1 {
+                compatible = "ethernet-phy-id0243.0c54";
+                reg = <1>;
+                icplus,select-interrupt;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/net/icplus-ip101ag.txt b/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
deleted file mode 100644
index a784592bbb15..000000000000
--- a/Documentation/devicetree/bindings/net/icplus-ip101ag.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-IC Plus Corp. IP101A / IP101G Ethernet PHYs
-
-There are different models of the IP101G Ethernet PHY:
-- IP101GR (32-pin QFN package)
-- IP101G (die only, no package)
-- IP101GA (48-pin LQFP package)
-
-There are different models of the IP101A Ethernet PHY (which is the
-predecessor of the IP101G):
-- IP101A (48-pin LQFP package)
-- IP101AH (48-pin LQFP package)
-
-Optional properties for the IP101GR (32-pin QFN package):
-
-- icplus,select-rx-error:
-  pin 21 ("RXER/INTR_32") will output the receive error status.
-  interrupts are not routed outside the PHY in this mode.
-- icplus,select-interrupt:
-  pin 21 ("RXER/INTR_32") will output the interrupt signal.
-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
