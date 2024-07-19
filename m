Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33B3C3DA70
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXn/rkB6x4Ix9iZ9sa6xbbdxE8HKEH4+faRImleMXtQ=; b=oQJPuFoa/NmxmA
	lVR7RsR6bS9bXsMtJMaSgAiBMl4TiElxarZ+n+CyocuVwym+ldP+qE9L4HxmL4lqxjbNUS9COKXjs
	SWb2QAS4N437gCUdqNYDy7jYJnbL9ZMEt2PlGMnjibKvuHGMsVQngn0xri8DENw4LzbYeAzHFXyS3
	zn5sOffQz7XW7qyLBQVP8SVHjdMFn2qtNPo4h6s0Q7m7dtvomxXJ2TUMvEZlFvBx36oi2fnesxEFi
	j4ajEXVBijD+x8tyoMmp+WnzxU51FT6Tbxw9Qwx72x+cPu+X/NvUq2HbadhLw5ssn71pQVWFOkbwU
	ZtqMS8sd1mx8BYuo9aVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUifo-000000020ZG-09Vc;
	Fri, 19 Jul 2024 08:09:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUif0-0000000209Y-3W6O;
	Fri, 19 Jul 2024 08:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E400FCE1AFA;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25849C4AF0C;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721376492;
	bh=3EB5WTUXtz5lawXW+qBeefLxm0XKsLLlzdFFG6e3pxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NEUC92XtdyzqohamVyUy882BpUbuViaYTpo/FSOqox3H02FmPQwtMiqxlQ7r1BPkr
	 m9IfGbZf4Cxv+BWdFvddxH8TaRqU51oGTYRzjmvVUs7VVM2ulDb+RsqZCALHJYb++g
	 j6jln92wDyKc3pHL86n9LHIr5KLzOtwfffV/gnGrer7ikPR6qdpKYia2BHmBb7eQQ2
	 3ivmBf6YCyQxBcHBpKk8Tv0DbOB3BdoZb057jcbMql2/XiwB8OQVhlTALqlf5nsmb1
	 D1ObHQqLG+SLI0gcLccTttBiL95k7WuDl8OgMKNkrw0M0K6nkmfd3kG5qLcxm6bzGI
	 SvuaOBcTYedBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB3FC3DA70;
	Fri, 19 Jul 2024 08:08:12 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 19 Jul 2024 16:08:09 +0800
Subject: [PATCH v3 1/6] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs
MIME-Version: 1.0
Message-Id: <20240719-soc_info-v3-1-020a3b687c0c@amlogic.com>
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
In-Reply-To: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721376490; l=1263;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=rEHcK7kDOz/ftRyqwGr3Rr5qy1WJIemzIVxERnlZdoA=;
 b=FfZmWKw4yC6wnxyxKyI818xy2bVTST+7yQ4+xM98MMp60iKFVe7ocInoteyPkz6tiqGZpJv8N
 4uIPQykCxl7AbrZ7NJX8VHJHVBnnv7dO2y6B+xaGkSpXODT6mu47faX
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_010815_094478_9C2317EC 
X-CRM114-Status: UNSURE (   7.05  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new compatible for ao-secure of Amlogic SoCs(S4,C3,T7,A4).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index 7dff32f373cb..b4f6695a6015 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -25,10 +25,18 @@ select:
 
 properties:
   compatible:
-    items:
-      - const: amlogic,meson-gx-ao-secure
-      - const: syscon
-
+    oneOf:
+      - items:
+          - const: amlogic,meson-gx-ao-secure
+          - const: syscon
+      - items:
+          - enum:
+              - amlogic,a4-ao-secure
+              - amlogic,c3-ao-secure
+              - amlogic,s4-ao-secure
+              - amlogic,t7-ao-secure
+          - const: amlogic,meson-gx-ao-secure
+          - const: syscon
   reg:
     maxItems: 1
 

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
