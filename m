Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0D1C54E58
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2024 09:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xncra4hHkAL18UuXyXQu3+/WzZkU6P8+SyG4eJPm7sA=; b=Tu6/QWlntTFnOj
	uD+mvKas1Fe/VmWkHPUzmh0MqJxLiw+RiFQ7V+fv7LOs29usXV3+7y4x+iPPdjiqDWALcKrjxcaH8
	ijfFVhSt1KQXYgnjVpgrEfxVxLTJD9lKIUyLEfwPZbHfkysM5+KZQIH0g6xD0Zhul4mH0ka4jcApx
	zUjbOapnBzgisxiKkwtwGL0X3cSOD1YZocuzdsLrHYC4RRwBHMMLLpfo2qOczTTOM4pbSfEr1DW+b
	hqKU64i27EZK45UUtbQfUiANb9q9KUWppQsCSo/T48luF696XSMTbxrEgDln10AXoLbHSGVE0TXV+
	d06f7MZ5ICwJhe3IIqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUy-0000000GY3L-3pIB;
	Wed, 20 Mar 2024 09:44:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsUp-0000000GXwT-1FCW;
	Wed, 20 Mar 2024 09:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 63C3ECE10D6;
	Wed, 20 Mar 2024 09:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8708FC43390;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710927868;
	bh=87vxEiXK4Bw7uWercX7BECQUi8vL2f8Pu9x/4eHktak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mycg3aWPkh2stNlENyue3WOvNrc4PmxRfCsKY14oX6ZlTeMgMOrY9rvhDnpu5SRgG
	 M2y2YCnU9tvkoejc3DISagH+mBMfdllKIDhrcZzI3itIORBNhlfcgzFmDtyPpv4emH
	 Gas4aW1hjJToWM6CGYItWZyDTCJXTclI1siBDM0WiNbhswQSw9vGr8C76XtT7WneJP
	 SWkgBvb0ncrJuK8HtTRoyxjGk8+PHVYNPW8JvFE/NRSBnqhaFQlUrog7ve86dhTqzi
	 y7wQMBEIb2IN7ZMgt+ckgSP8V7zB3HjmWH2QPv4d6AbwXcQFCFvhg/wECPwN7Ff4k8
	 0dCF5jFNe+K3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77921C54E67;
	Wed, 20 Mar 2024 09:44:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 20 Mar 2024 17:44:13 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: amlogic: add A4 support
MIME-Version: 1.0
Message-Id: <20240320-basic_dt-v2-1-681ecfb23baf@amlogic.com>
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
 bh=qwPgdDWTmKejFsU6gaw/3XWYRmAsFuyvj2aPVFS4Wuo=;
 b=1Y+87cYoqA7qCw8jl4n3ryhZaV5jTb5mf2nD51Z+wc9wxdzZRhSQyHF2Yo2IsLnlyU2k/ChML
 BzwGUPXnvwNDwQ2poKUz+o1mrRf5KhR0mKdxDRGsd6mXD+W1K2OTmdd
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_024431_638152_82F74501 
X-CRM114-Status: UNSURE (   8.07  )
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

Document the new A4 SoC/board device tree bindings.

Amlogic A4 is an application processor designed for smart audio
and IoT applications.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..520975e7cac0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -201,6 +201,12 @@ properties:
               - amlogic,ad402
           - const: amlogic,a1
 
+      - description: Boards with the Amlogic A4 A113L2 SoC
+        items:
+          - enum:
+              - amlogic,ba400
+          - const: amlogic,a4
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
