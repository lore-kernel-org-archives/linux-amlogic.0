Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0B8CD1292
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IetopaPKRq7FqLZOYTV7KdBX6/kBAQCtoANq/Hv2LXY=; b=FbpGEHD0mybBbD
	hgxVxT3NUm4q8vDlulRrKO6fIpIVXfP2GnOKfgtDffGFgtwLyCcDy5sdSHgn8D3qhBEFDDALLeVTk
	+aJNDNr6p1fOh8I6WWyDw3saOLj8XYTxDkJxLQBnP/+mbHKM/gSH4TgTaf1Wb2psHE0aAOhOF0oxa
	KOogI8lJhL6XGoVio4Twsp11Vf/8EiQn/4Alwz8yEwi5TR4p29obJiXak5WAin6rFExS3LbcEZp1e
	G2xZed8c2JNRe8yPvRNUYnRdKJlZaCdpR3UftaXlMSBao4lHlYKk3Y31RprkkYINq2woX1vwXdSDU
	fTsYNPD6sI3YZqArsIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEd4-00000007QkR-0Xwf;
	Mon, 01 Apr 2024 10:11:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrEcy-00000007QhW-1uS4;
	Mon, 01 Apr 2024 10:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 766BF60BB8;
	Mon,  1 Apr 2024 10:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC397C43390;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711966254;
	bh=Uf0CCksxzPh94RRVnornSAILdhxqXP3ccZAL4skjSzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fj0vx3l55hEoN0L0IuLIPThi+nEdBV66UQAuhpJAyc5hitil8zfOmgiLEheoy06xD
	 /WCMi1Fz6v6DogktqAcbITcmwa0DEC+KGeiRTxgu+EDRhiH9mHGvjXY3dzGAE/+7Vk
	 D2pnq4y3fM0fmT4upKK3qqhWdT3tmgstuFHHs8K+yWnnYS9vxBuUId3M05WRP8ClaZ
	 Bx5ykOwnc6IKCAkpiIgTpV9AgUBzdZS6dHfIcafuX0tVig8E9RnRgOMjtU5Bh1BfIJ
	 PxGAs6LYBmaErjyDPS7iyj3GpoyooO3n6C3UV6+Pu4sHs2R4rPx7X7sF8X1cM5kavf
	 JWJdx+ibLUI+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5BDCD1293;
	Mon,  1 Apr 2024 10:10:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 01 Apr 2024 18:10:50 +0800
Subject: [PATCH v3 2/5] dt-bindings: arm: amlogic: add A5 support
MIME-Version: 1.0
Message-Id: <20240401-basic_dt-v3-2-cb29ae1c16da@amlogic.com>
References: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
In-Reply-To: <20240401-basic_dt-v3-0-cb29ae1c16da@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711966253; l=1029;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=r0xuqU4Ugjg7+rGvC23MyKK1+DvdlUD+RiCVMa++e2I=;
 b=7CcfDk6SyPhN7yKoit06AClCEA1AdIZ1Mg4Dx6H2q6MBebQbh5EvLxkgyXYkY5SdZgrLnyI1N
 +DVVa8nxlFbBKbVSctEP73cwf8sHtwbsQWb4MI7juozuWOkrR+sR/gJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_031056_615574_9680000F 
X-CRM114-Status: UNSURE (   8.08  )
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
