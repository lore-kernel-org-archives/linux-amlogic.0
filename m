Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB30C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCdNuC3gQnJUs+3lFwI4Je6VaaqsF9Js+MsmkgVp9mw=; b=R0VCylfsx4lNo4
	MD3XaLu8mxXRBBy1zPe97DWIMJKX+46iDdSra7akqud5BTFnHRVvZZeXdzCO119ZLDBkAIqtEDiCL
	S7YGSNgZJZpDoNxBky5sn9sKQJ7Eq/wXUTsEQbx7M/2YNIxRRHhlg9wDh0aToy+VHj4BbxpWoc07F
	p3kbhASYeFqRwCw4rsLvDeOHButgaC+wIDREei3MFO/NXGwVVqNLJh70nLsipPjEvWXAiNLdKXY3S
	71S/ZNOOhelYBuFcBhIiKJoka5wDWle/HZbLoHzEwqrVE3Mm3prSk1F7tL5I9tNXARn77wUf7EQjm
	HsnxAf3r19Fm4SXUWcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6WX-00000006Swv-0E6Q;
	Tue, 09 Jul 2024 08:48:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6WT-00000006SvR-3pmW;
	Tue, 09 Jul 2024 08:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EB3060DF8;
	Tue,  9 Jul 2024 08:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CEEC4AF0B;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=ypxnfVb7P7V/FsyomfgbJUvYWlUFeNq86VhHvHpwm+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ftdi3ct60Z2E00+8/BRUNyMKO/RV4dg4euUqGXrRzXuZU0i04NX3O7D5YotxotHeM
	 jn2y/ToFNIwUHxz0t8M5IbzMWuzh85bu9kRig4+CxMWT7lE3JLVzSax6zEStjbP2+t
	 w8pjux9TBOLhpfELuU+etls3RHzr+iPKiu3RNpJsWBxXkjYfhNil/yUPFt0XVTGo5O
	 JOmE1kE3nKSbGMkk/Go8LK+IeBLXek8t8FfL0AG4yrXEOdrC5MLgmTpD9fDHPJsW67
	 rbQHmJyfNeXzlvISrIDcb6dWbS/PCzUi7W4b8wu8LhD5SpP97us3EZcSbQhNbQvKZ9
	 x0Po254Ztf5oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEEAC3DA49;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 09 Jul 2024 16:48:26 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: add watchdog node for A4 SoCs
MIME-Version: 1.0
Message-Id: <20240709-a4-a5_watchdog-v1-2-2ae852e05ec2@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
In-Reply-To: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Huqiang Qin <huqiang.qin@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=898;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nyw71UzO4OzW4LTj0eCc11shu2eqR6ZaJjbu/OQDEDw=;
 b=aWsB85jIFB9Rl+qfZ2QeulNuT3GyzoAIAwWkmfKJSU6pREfcaqDIpxneE0SWsaIe5hqCLoI4c
 ghCrFuV6L19D3mI+ykUXubGTygUq6G/+UPj0x0Knm417uxSwB/7xUJx
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_014830_028022_41306F77 
X-CRM114-Status: UNSURE (   8.36  )
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

From: Huqiang Qin <huqiang.qin@amlogic.com>

Add watchdog device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
index b6106ad4a072..496c3a2bcf25 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
@@ -52,6 +52,12 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			watchdog@2100 {
+				compatible = "amlogic,a4-wdt", "amlogic,t7-wdt";
+				reg = <0x0 0x2100 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,a4-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
