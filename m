Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C53C54E66
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gA8MrSM94yGWsS2NH8TanWdvkxR2UJ6Hv8AeN4joUgo=; b=c0BU1yKF+MALkI
	kKS4GKLP4J0jLVGL4hmw6D6qYu94dh0orLvE8CBzZv+jtV9SBhyBbyv8f0P9gRz6xUVD8uBTgqYRc
	5ne6lj0cq3n9A3VlTaa0lJ5+9Lsthbvbl1zjToiXL4X73HPA3/wre7MG/lvcdo9TWXEHU6cGW/FwE
	IbhWGF3ZKshkLmmq6ou8E5OzhASNwOPwWJ/S6hSZNTostfeOm0N+RxwUR/Fxslki9kJKpx64vRFyQ
	c2VHGxKgAfFK9fyNUfw1IvXa4a1MbbnfsbbGInIcdX+hUV4kL8kH9kJk3LsBvtKw0nf7q7YKsEAry
	0SlFGFyXIsqA/+SeEZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHq-000000054sI-1i0a;
	Tue, 12 Mar 2024 09:19:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHm-000000054p8-0dFB;
	Tue, 12 Mar 2024 09:19:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 451186116E;
	Tue, 12 Mar 2024 09:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0BC1C43390;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710235140;
	bh=K505GhKHcy56JME2WlR5Eyql4DOJ1aVM0Jyv/sRU6Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KyekibctYHT9HzLt2zQc3SmuyEoeh/FRA4OVtGUaBotXGJ7mNOFdHDtFVpcgtXQ8B
	 Dq9ZQ4EBF9cQynni61hklaDMK4iEdjbHgyflZ2K3of57c0wzn23cLHS843hiA3bJuR
	 unaX6jskRMazud9ck/wXuEurn9TBBzeSXSVMwd/BUfJ8Cu/zJA+nCIpdat5ET93m5T
	 C/MV4Mvwu9GcQ9VWkJ11mTm3C0pyrwlRkEKWkyA4xBK14s7L93SDG3OS4GWsyZrQb1
	 Q94n7rySvCpQRHgkmwOeaPWOQFuNibAUAtPSsXAVywcn/TECIDOmgghSSz8X3OkXDT
	 cvQF67HTXM4vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88AAC54E58;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Mar 2024 17:18:58 +0800
Subject: [PATCH 2/4] dt-bindings: arm: amlogic: add A5 support
MIME-Version: 1.0
Message-Id: <20240312-basic_dt-v1-2-7f11df3a0896@amlogic.com>
References: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
In-Reply-To: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710235139; l=998;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=OjYemETinzmeJ9Q4YrGV5qbHibSqK0gJRNB1l5DOrLo=;
 b=tFHNPr2tadjZI0f7yRXUHfGbas/LCBRkjU+cD60xc4dwRmucwJfD80aGFsMz+cb+Z2SBUuaOU
 74GeQ1M93BzDp4bVIzFNNlPxL0TvuH7avkGhY8wfhLiRFYGh5XVTY0l
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_021902_295985_571AC377 
X-CRM114-Status: UNSURE (   8.25  )
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

Document the new A5 SoC/board device tree bindings.

Amlogic A5 is an application processor designed for smart audio
and IoT applications.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9a135fe1c862..6090cb674b65 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -209,6 +209,13 @@ properties:
               - amlogic,ba409
           - const: amlogic,a4
 
+      - description: Boards with the Amlogic A5 A113X2 SoC
+        items:
+          - enum:
+              - amlogic,av400
+              - amlogic,av409
+          - const: amlogic,a5
+
       - description: Boards with the Amlogic C3 C302X/C308L SoC
         items:
           - enum:

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
