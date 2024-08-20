Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7B1C531DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MmyWxFDCC6XWFVcVoRAXzHR5+Vw/S88by/oXSghxLw=; b=fJvHhNg8ohhrem
	rKXvKZAIvDo4th2uVrniW67MN34LetaQv4fru6/g9ErpeGkMLwwa8oXkwgb2c+6mJP2yMnYyuDQUI
	RNkkt9JKNzpLg/oIMms5s+GinFwQvM63yWYfDZywwZDtT0+FOLMWitsQafGaOJalSos/PbQPzGuwy
	tCgiAi3pU6kn7XVV+dDyCw8MJpHRLM1GxlhKRQng6/5MSrZJyzKzTU3lWNYKwdTHo5WART1Ir0kLa
	Hx2N7ZWBa0dAspmDKd4mWvrmhYfLuW0+Y3pl8/tjqhF86fZQgKmfJWMs5y9pxpDtn7YPFBliSYxYf
	Q4rLVbF7Oe9zlnBB4FXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLPz-00000004e33-2Q8j;
	Tue, 20 Aug 2024 09:44:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLNJ-00000004d4I-21Y5;
	Tue, 20 Aug 2024 09:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C1E8CE0B97;
	Tue, 20 Aug 2024 09:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39925C4AF0F;
	Tue, 20 Aug 2024 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724146918;
	bh=4NWRl9yzCT32YrtzW/XVPpe8n5zmQJV6pKArhZCXMLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nvsc9HOuSgbkNbCUOr+u3+ZIOkCxkyysjHqVKb3O6KDlFtZWeABBrjS7bnGbCfxlN
	 zRg3VBEIWY5mO0zFqCp3op4KMRt/yagT3oLhV1yYC8f7oAERdyi6WcTajGuPvl3Ctm
	 zawW4hrVQHdEXGk0EWXewklvlGcpi5WcjVa0M8SNfsXohw5n4+ZoTEXt4hdWTZ/CAc
	 RDikDwI1lrtfFintmsOGNETn6wzMcBE/U9mZ3RKr9Tl9V59bwR82JuuBs5JpJR4LVs
	 QUeHtBtb43q8kjLXelVV1JooRcbQKKR7Wo+lgYdGFcpVMXja8rvn7Pg4DC6O7ZRY8Q
	 0rzJcqu0eUgwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCB9C5320E;
	Tue, 20 Aug 2024 09:41:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 20 Aug 2024 17:41:56 +0800
Subject: [PATCH v2 1/3] dt-bindings: clock: fix C3 PLL input parameter
MIME-Version: 1.0
Message-Id: <20240820-c3_add_node-v2-1-8fd3f06b7bce@amlogic.com>
References: <20240820-c3_add_node-v2-0-8fd3f06b7bce@amlogic.com>
In-Reply-To: <20240820-c3_add_node-v2-0-8fd3f06b7bce@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724146916; l=1954;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=tWCo8zkaON84A1jHHQrG7jHh+aa9S/NWJLB5MLMSFlc=;
 b=Yr1Xj3sKxwOql+uzY7pywqnt+m1oI8iI2hyFY1lkP5acgDWkoX4ox68BE5nEXQkIgx6DmvkUW
 0DLj1dPMSrXD/G+H5pEiq5UE8EvgAViajuEAGehmeC0cUskEdwEXqay
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_024201_914066_16A8AD54 
X-CRM114-Status: GOOD (  11.84  )
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

Add C3 PLL controller input clock parameters "fix".

The clock named "fix" was initially implemented in PLL clock controller driver.
However, some registers required secure zone access, so we moved it to
the secure zone (BL31) and accessed it through SCMI. Since the PLL clock
driver needs to use this clock, the "fix" clock is used as an input source.
We updated the driver but forgot to modify the binding accordingly,
so we are adding it here.

It is an ABI break but on a new and immature platform.
Noboby could really use that platform at this stage, so nothing is going
to break on anyone really.

Fixes: 0e6be855a96d ("dt-bindings: clock: add Amlogic C3 PLL clock controller")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
index 43de3c6fc1cf..700865cc9792 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
@@ -24,11 +24,13 @@ properties:
     items:
       - description: input top pll
       - description: input mclk pll
+      - description: input fix pll
 
   clock-names:
     items:
       - const: top
       - const: mclk
+      - const: fix
 
   "#clock-cells":
     const: 1
@@ -52,8 +54,9 @@ examples:
             compatible = "amlogic,c3-pll-clkc";
             reg = <0x0 0x8000 0x0 0x1a4>;
             clocks = <&scmi_clk 2>,
-                     <&scmi_clk 5>;
-            clock-names = "top", "mclk";
+                     <&scmi_clk 5>,
+                     <&scmi_clk 12>;
+            clock-names = "top", "mclk", "fix";
             #clock-cells = <1>;
         };
     };

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
