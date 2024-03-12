Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73840C54E67
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2024 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SSBjuN0Zu7k8DC5VxVYyGjnFNfTLD/O5J5BaTxPqPsY=; b=hNwRG4BNlGBANO
	8+Lg1N6N5llwHUBYWIscVa5+kNs7Co13DKMu1yK7NVfLXlRYUu3QGrgFP1yYHr/rsYjm3HFu+4tU1
	aySRo6dofKzJVewktWkQaIOScyOtFq7NeD6kCz4EV3jnN6xIafaEMbtTtOnncupIgscYTGvL0l0Oq
	hwhKKKkPVSelduwJU5VgKuINe1/r5/6OvNt3Abs5JfQp6TdZmlLh7FSaghdhPP7FPwE2X2tAPscK0
	NvjxM/T0wp6XzaeaHjVPvy0cAN9lQVHE+D2Tpyr57RMvDwdk6cspFuvxA8Lt2DuwY1wbnCB6msQlC
	t1TXCIk9sNdRMH6WnN6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHs-000000054tk-0LQv;
	Tue, 12 Mar 2024 09:19:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjyHn-000000054p5-2NoZ;
	Tue, 12 Mar 2024 09:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3F7261169;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2F44C433F1;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710235140;
	bh=ONSKZevXZXWm3KM1dZDImJLLhqOmgtyms2pTuZbvaa4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pcT3fxnekgvKqQr1S1HusTZOS/3i9nJcVXJMHIDXsAOjpaQs6K3PVAhZgh/d/UO1U
	 No7Tul3U/e/PSHEz/nUXQ+FLRkDRVZMepVfWs5jsdDPQrQN58cFeviTnXAAhN411Z8
	 tIoSaJYqSBp9c1xp3YGSwA+iLgjF2ZEWIQIlPNEXyH+jtE6lAMeuxILM4LHfZkPZV9
	 XXPNSerxTxcZE1zBVy6suq0lmHXw6AUWHma+tvPS2lMoJ6TwbyANfY7GLnrcjPFxsi
	 CUnYlCzolq6xvkyUW/JsOn1LS/GOx7zR/SB/Nimt+1RFOpSOvSIqg5Xt2IlwgDB2n3
	 U9C2Wm7k8Huvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F516C54E66;
	Tue, 12 Mar 2024 09:19:00 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/4] Baisc devicetree support for Amlogic A4 and A5
Date: Tue, 12 Mar 2024 17:18:56 +0800
Message-Id: <20240312-basic_dt-v1-0-7f11df3a0896@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAe8GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDY0Mj3aTE4szk+JQSXUPTVBNzUyPTRBNDYyWg8oKi1LTMCrBR0bG1tQD
 9l7CDWgAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710235139; l=1498;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=ONSKZevXZXWm3KM1dZDImJLLhqOmgtyms2pTuZbvaa4=;
 b=NtWxuy6gf1pgFYthLf35jwwWmhxqf3Rc0BnrsfAJOvKu/qcXl2lPXRnWSoHgfOP4hVqqZLIwJ
 orWfLOsqpzKC9niMb7l9jtB6dB6XMBEZMH1dA7m6nxhmeTZ78cpXxDF
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_021903_776294_B309738C 
X-CRM114-Status: UNSURE (   7.90  )
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

Amlogic A4 and A5 are application processors designed for smart audio
and IoT applications.

Add the new A4 SoC/board device tree bindings.

Add the new A5 SoC/board device tree bindings.

Add basic support for the A4 based Amlogic AV400 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Add basic support for the A5 based Amlogic AV400 board, which describes
the following components: CPU, GIC, IRQ, Timer and UART. These are capable of
booting up into the serial console.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (4):
      dt-bindings: arm: amlogic: add A4 support
      dt-bindings: arm: amlogic: add A5 support
      arm64: dts: add support for A4 based Amlogic BA400
      arm64: dts: add support for A5 based Amlogic AV400

 Documentation/devicetree/bindings/arm/amlogic.yaml | 15 ++++
 arch/arm64/boot/dts/amlogic/Makefile               |  2 +
 .../boot/dts/amlogic/amlogic-a4-a113l2-ba400.dts   | 43 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 99 ++++++++++++++++++++++
 .../boot/dts/amlogic/amlogic-a5-a113x2-av400.dts   | 43 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 94 ++++++++++++++++++++
 6 files changed, 296 insertions(+)
---
base-commit: 7092cfae086f0bc235baca413d0bd904f182670c
change-id: 20240312-basic_dt-15e47525a413

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
