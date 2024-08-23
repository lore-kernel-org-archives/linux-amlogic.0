Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16929C5320E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0GEPzcSFjH7j2BbSQreqljwXneQ8GM1fveCBnMS2LQE=; b=zpKjH/jZGDIUV/
	drHhyo+3UQETDDajVJrDbeC7h4S8NFD/r0Ew/AJC4zuOE5HAsnInRzFU0QvMrXOtZDuEXdO6/f53f
	yLob0ZjaftxpYKNtoQpcJ/St69QSXsK2pY+1Lb6DuOJWaCRfgLsK1LEecpDQ+JvnqTe9mZYuFLiEG
	rsDpsrVSSf+/1LN/92RPBF/wt6VUj5Oz2OUkVKu8gZr2gF9IhTulYhxLbfkGneWLVMPJIBtMCUtUQ
	35Ypt8RK2kqI7Y01Q7cfOorlWTPWINhKn/bohj5CFRHbO0rizWqx8I/BLanJTy3glzNYSue3aJfEL
	9GyHCypYBl1OUF2UD1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shK44-0000000Evx2-1Nru;
	Fri, 23 Aug 2024 02:30:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shK3H-0000000Even-38V3;
	Fri, 23 Aug 2024 02:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D034FCE10CF;
	Fri, 23 Aug 2024 02:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0074AC4AF09;
	Fri, 23 Aug 2024 02:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724380160;
	bh=YS7E0HAr61srZxZYh8jsHirXK/krzpEqZNEfQ+EuQlw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VoLIvhjllRXlyVr3KxLyuKf+1QS14zzx3Dl03Zq1QPLpDlB81yNam5QbN8bMlkxlR
	 8DYnT5DxC4tKUWW0sodL4Yl8Tat+K9rZrEJzUhVcTWNQke4imJeQwarlEQY6WG0xHW
	 mfVDy5nvlSYGW3e0QRF8IyNKqeJy90rsJw6Qr5guVKCLak+2gukG/3eoO5z9GVSQBT
	 kuXnpP7hJSjyB2v0gwtu8q0hfyPCTvAvPpKAn8PL2SI4onJLVVMM7ppUdRupGVQe2P
	 t2BRDKjiJOSd/NvfIrt9Qerv7abW7KLi0VYd1NC/4kzivTBnaf3UQ0Oj7dNCVku4Cf
	 VsPhUSbpVMh1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD482C5321E;
	Fri, 23 Aug 2024 02:29:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] add some node for amlogic c3
Date: Fri, 23 Aug 2024 10:29:16 +0800
Message-Id: <20240823-c3_add_node-v3-0-3648376037f4@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP3zx2YC/23MSwqDMBSF4a1Ixk25eaBpR91HKRKTGw1UI0kJL
 eLeGx1V6PAc+P6FJIweE7lWC4mYffJhKkOcKmIGPfVIvS2bcOASFNTUiFZb207BIpUctGguTDm
 mSBFzROffe+3+KHvw6RXiZ49ntr3/O5lRoAYsSiYkqwW/6fEZem/OJoxkK2X+ozkcNS9aOSsc1
 F3TGTzqdV2/WH4rQOYAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724380157; l=1332;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=YS7E0HAr61srZxZYh8jsHirXK/krzpEqZNEfQ+EuQlw=;
 b=rJ1KyhYO+6cuH76Vvojb68o3/JNzMHApeeDi7nPitNh/mOklbsz0OpsV++GEcrvtTIs36A1jz
 J4dHiQjt7uXAiCCNUw56VBIMjgNSeCPwn4M9rsQFGpyiFkcaNUAzf6p
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_192924_190763_023CFDF9 
X-CRM114-Status: UNSURE (   9.67  )
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

Add some node for board AW409 and support board C308l AW419.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Change clkc_periphs node to the first.
- Link to v2: https://lore.kernel.org/r/20240820-c3_add_node-v2-0-8fd3f06b7bce@amlogic.com

Changes in v2:
- Delete unused sdio node in board level dts.
- Add the description of modifying the binding in commit msg.
- Add the reason why some node property fileds place at board level in commit msg.
- Link to v1: https://lore.kernel.org/r/20240806-c3_add_node-v1-0-c0de41341632@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: clock: fix C3 PLL input parameter
      arm64: dts: amlogic: add some device nodes for C3
      arm64: dts: amlogic: add C3 AW419 board

 .../bindings/clock/amlogic,c3-pll-clkc.yaml        |   7 +-
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-c3-c302x-aw409.dts    | 233 ++++++++++
 .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 262 +++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 488 ++++++++++++++++++++-
 5 files changed, 988 insertions(+), 3 deletions(-)
---
base-commit: 7a5d2ce79d1fc8535a6f10e51011ae9671bd86e8
change-id: 20240806-c3_add_node-420a37918f18

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
