Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16462109E55C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YlfW3E1PN4vwYdZSrQ3vDwnLQVIw5yDy9tTaLl1StOs=; b=PKeLzdu5BS//OP
	owFP0UxY4uHyBRmCeGZeEo/Dkz3kbyvCEcotkg+BPdUcKIC5XbcMpNCawzYUekJWMKUtEgsgQYTzm
	87pKqyUpMBpuijOP6vbrmNIBk0qkWO5QQUkjAh22piFAySwCaA0ABNwg1F4lRawG8DtOoQZR1baLY
	BE7GjLrjZVEnmGcZHL51oSrKGt5L5FXbR2yINhd/UnEe8qXU5CESOza9Ga4K46962Yr1kwHXpOtE4
	oy7m4KKt7bBFreVl6W7dWUUv5SqkCB09zCjdPEcPiCv80C8/1UOEobI7MjY1RoxLy9OGZg1x+CTkk
	GYx0ktEwiL7GrekETjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJt-00000004qlh-1smp;
	Thu, 26 Mar 2026 06:35:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eJo-00000004qjm-387E;
	Thu, 26 Mar 2026 06:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61A5D43F5C;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 310E4C2BC87;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774506947;
	bh=XgK+c61EJ3POwwUA4dYICWS5n7txtDGgDK9lPOzEOoY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kgx5PVz7pfvEDHR6tWXx8Q8qJSFZ091irntbeytd6xr4kTLw1BztVuKrCcy9GbJ1D
	 ySO9EIdAklDv/hh1VBjjtXXRnn0fjuQ7Mq6xFUPXUq7IMLqkFTOrNmdIg8iigJ+NA5
	 ZGsQ/cpPCd0bfmW8oyPDA7P4IRwsDFxrBGdXhaSwUZ4162Ib00tNP3Htx7svdWUoTc
	 I6AkbXTsHiSitiYO8YfvPXIm3phld3SSnJbL7t3XGRz8uT/8h5yZMAe2x+irLN7nPj
	 UMrofdLRaQiAnkytd/P0thnbYlbFA8VQsZuHUzBvd1s45HeiaR8LwxurmD3z9q40/w
	 S0aWCsM9MVoCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D385109E558;
	Thu, 26 Mar 2026 06:35:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Mar 2026 06:35:38 +0000
Subject: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for S6 S7
 S7D
MIME-Version: 1.0
Message-Id: <20260326-s6-s7-pwm-v1-1-67e2f72b98bc@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
In-Reply-To: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774506945; l=1979;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=7pPP6FCX/JHlWDMsAPkXc7yrHLEf0gHhe1iZNl6X4a4=;
 b=0ilGapcjKBpO/yK6NfK5WTocVVTM8wUZtDKxrEbLtgMa9SrXPk5KYA3+Iw0XSPAux28L6n1uy
 B5TH4iJqCF4AqIjE3i1yrWcPRAknu8w7aMs+3i+x1uC9MaCgI3MTaOy
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_233548_831860_9765079D 
X-CRM114-Status: UNSURE (   9.25  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Junyi Zhao <junyi.zhao@amlogic.com>

Amlogic S7/S7D/S6 different from the previous SoCs, a controller
includes one pwm, at the same time, the controller has only one
input clock source.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
index c337d85da40f..f0c40dc359ad 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
@@ -37,6 +37,7 @@ properties:
       - enum:
           - amlogic,meson8-pwm-v2
           - amlogic,meson-s4-pwm
+          - amlogic,s7-pwm
       - items:
           - enum:
               - amlogic,a4-pwm
@@ -45,6 +46,11 @@ properties:
               - amlogic,t7-pwm
               - amlogic,meson-a1-pwm
           - const: amlogic,meson-s4-pwm
+      - items:
+          - enum:
+              - amlogic,s6-pwm
+              - amlogic,s7d-pwm
+          - const: amlogic,s7-pwm
       - items:
           - enum:
               - amlogic,meson8b-pwm-v2
@@ -146,6 +152,20 @@ allOf:
         clock-names: false
       required:
         - clocks
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,s7-pwm
+    then:
+      properties:
+        clocks:
+          items:
+            - description: input clock of PWM
+        clock-names: false
+      required:
+        - clocks
 
   - if:
       properties:
@@ -182,3 +202,10 @@ examples:
       clocks = <&pwm_src_a>, <&pwm_src_b>;
       #pwm-cells = <3>;
     };
+  - |
+    pwm@1000 {
+      compatible = "amlogic,s7-pwm";
+      reg = <0x1000 0x10>;
+      clocks = <&pwm_src>;
+      #pwm-cells = <3>;
+    };

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
