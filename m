Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FEACD6E75
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jun 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmB69FCb85goBE8mc39b4OecAifx1k0/Bouwv9dh1S8=; b=GWFQNV04T3a8QZ
	C7R7fr+ijQv3J1+snxyqjYTba5L1XDlo/45QGIgGG8hs9g6/U05AghfwY4jaLs8Q0t5Dwwjs9MZ7h
	IUACwVkwwAMkoJ8Oam7WCVFdZVgRDwNbrYtfNM2nOiVIlSWUee/E/NsXpiWO742tV9cujTKzt0kdS
	KIIXVYMR4OOQmlhiNzIAs6HB8bfKIY4bl53Wrj5tjWGlOQedA4JnCMpHEjqcT6kwDJVswN0X9BDAr
	6s05rBTZ12jOhp95vwHf5HmzcRrSDDmPsjc4Z8JCsUEDJ0zeJ5aOWLWAGy8P3rr+IqLvGbfe1MfMP
	L83P8mrQ/2B6Fhm7V1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpym-0000000FdM1-3WKs;
	Wed, 03 Jun 2026 18:06:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpyi-0000000FdGg-1mhG;
	Wed, 03 Jun 2026 18:06:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61CD84467B;
	Wed,  3 Jun 2026 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2858EC2BD00;
	Wed,  3 Jun 2026 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780509967;
	bh=Jnv894IU9wblCqhm+wVe2Z5FBt6aG6TawzV3npnKdrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=omT9t5aV3FqpPk2vE2T1OO4o5VVxq90MDGSB+FbAB71h+gQV+YljZI09Wf/O9updd
	 qWDga0OGZ5AbfnEbTkEr4KNIZmmKvkPti6yEdLpv3AOmAyLny7CHKtzLRsKgoFXn0I
	 T17ovOt7j9TF9CH1YmcTVJG62qdlm0hBdOCGHQGHIxpC43komoDdtCcnNasBN6vTHq
	 mSN1t1WbidRxvL28/g8NTT3lBIunwGNjyXtFmS7nHMNqmklnMSci8xPRH5KZx9XjwZ
	 YoaUVaPrP3rqysJI1PBbkAGRMl4uMQ7+zr3hxseUp0QB6cpoIBQb4iISEWsUFkfVSm
	 PJvaQPbAHVfgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14643CD6E57;
	Wed,  3 Jun 2026 18:06:07 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 03 Jun 2026 20:05:24 +0200
Subject: [PATCH v7 2/8] dt-bindings: i2c: amlogic: Add compatible for T7
 SOC
MIME-Version: 1.0
Message-Id: <20260603-add-mcu-fan-khadas-vim4-v7-2-594ba8a965d8@aliel.fr>
References: <20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr>
In-Reply-To: <20260603-add-mcu-fan-khadas-vim4-v7-0-594ba8a965d8@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Beniamino Galvani <b.galvani@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=dSGVBP6Kwid380fHwj/yvIcbmVkBngDKwALA0QzKSyw=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ5ZCLkvEl4QN1eqKBstn2AWrbNUqn/t24aNXqnl7rPOEb
 nz0fvi9o5SFQYyLQVZMkaV/ruWJd5ePnvm6Rz0FZg4rE8gQBi5OAZiI5naGfzo7Hovd4zTm2nDV
 xWOZnGOfyfH4Nzv+KRk9+Zi/uPdrTjLD/7qrBwNtpbJiP1qLqip8yr11jvHXVeGGv8WLr0nfU9i
 ezgEA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_110608_510596_DAAFF629 
X-CRM114-Status: UNSURE (   8.10  )
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
Reply-To: linux-kernel-dev@aliel.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Add the T7 SOC compatible which fallback to AXG compatible.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../devicetree/bindings/i2c/amlogic,meson6-i2c.yaml         | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
index c4cc8af182807..7b59b60b62e5b 100644
--- a/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
@@ -16,10 +16,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
-      - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
-      - amlogic,meson-axg-i2c # AXG and compatible SoCs
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,t7-i2c
+          - const: amlogic,meson-axg-i2c
+      - enum:
+          - amlogic,meson6-i2c # Meson6, Meson8 and compatible SoCs
+          - amlogic,meson-gxbb-i2c # GXBB and compatible SoCs
+          - amlogic,meson-axg-i2c # AXG and compatible SoCs
 
   reg:
     maxItems: 1

-- 
2.49.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
