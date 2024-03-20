Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7930AC54E67
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2024 09:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IetopaPKRq7FqLZOYTV7KdBX6/kBAQCtoANq/Hv2LXY=; b=THnl2sWHwkyLdi
	Bj6SGFLnewNCsFq5mlxecvBqdk9Yigo67p5LiLD+n2jwclQPd9uZ+o5Rg5+1S+uCpyVZdEyt/SNkt
	+kv6ufttsC2u35FxFyXNuyj8zg4OzOu6AyKQxEM9BePRYESKcMfywB1Ff8FKzgwPDJyzt7PXuuDhY
	it96MCD8lLpPuMO92CpQPcklEVWjSdn/+iOLHLZ4xHmuuSnclhh10+s5yTr924lrgd41d9FG7aT70
	6MS8Z/n8W7qdEATXH/LLMskha3gGM748EDxVU/znJmDsrUbTS4vwioB/JhFS4HYg0wqKFZajkhYGG
	5DRSe4Wfa5TNQCHRBV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsVL-0000000GYJI-2pwb;
	Wed, 20 Mar 2024 09:45:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUp-0000000GXwl-33GJ;
	Wed, 20 Mar 2024 09:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B0691CE10DD;
	Wed, 20 Mar 2024 09:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98545C43394;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710927868;
	bh=Uf0CCksxzPh94RRVnornSAILdhxqXP3ccZAL4skjSzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i+R/Mv6EMFDPiERKE2XT94eFmGajTCo07nPgECSQHYF08j3VQzrLoLm1h9vnMsPj2
	 hwxYehm5rNYGT5+JnnTHaFfvduTUZnZxiINOuvS/Apgh3jvNqSlCA4u2GrGJYabX9d
	 3NxUtLW/41N3CwmGAQJq+PrQg4S30dFApfH+PBxNRZ+4vXjb/ve7060KdXJc2VU8+h
	 /bXcVKr3O2HoLYru6w/viq7I6v+tKBQJxdYxDi553gicQqTKuZPwvT3WOKFbM/wnwN
	 TRL5ksGryYJypUav/MlJKp0n5h6H50TdN70UQrkIFTDX+TqM1QAnSN7kObNh5TyI/e
	 W/ZaducsFm0Sg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C30CD11DB;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 20 Mar 2024 17:44:14 +0800
Subject: [PATCH v2 2/5] dt-bindings: arm: amlogic: add A5 support
MIME-Version: 1.0
Message-Id: <20240320-basic_dt-v2-2-681ecfb23baf@amlogic.com>
References: <20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com>
In-Reply-To: <20240320-basic_dt-v2-0-681ecfb23baf@amlogic.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-serial@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710927866; l=1029;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=r0xuqU4Ugjg7+rGvC23MyKK1+DvdlUD+RiCVMa++e2I=;
 b=uUUPeJHApSTFAbpk9atAj5lylvkx6geVJ0wgftmHDcIXC3+zOlKydo3Z9XGmH+wK15238Lica
 XrEMVzrTLoRDpOTZNXpzMrzByUyx5lPlxrmqa2kNnHuSEcHB++wU7S3
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_024432_187700_C01CD99B 
X-CRM114-Status: UNSURE (   7.87  )
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 520975e7cac0..e64ced44ece8 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -207,6 +207,12 @@ properties:
               - amlogic,ba400
           - const: amlogic,a4
 
+      - description: Boards with the Amlogic A5 A113X2 SoC
+        items:
+          - enum:
+              - amlogic,av400
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
