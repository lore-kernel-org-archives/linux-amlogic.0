Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6448C531DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nwoVviJ8OIlENzO53VhHNzNFmR+yzFKOiDKBeB+4QSk=; b=PvZHhI4IG57mVQ
	/zCURgbR/GzD7hJBJ+lAKOmgvE6Rztcmms6ALzeIkzDeMf4DdyMvmGObFDM73IKc6YJCwR+3uyikh
	DYIBDgHj+ZdnjHnKNpC4YiD7dNtR5l/e5llLzgJuJZGTEyC6A46/FiyH+n9m2PqXk2rygWW9Gvso/
	pZnIQB9IwKrpjgxCegYDMejzWJWRHeFhnsBO+saaoAlr56ZPnL2UBnec1B9C28SbGRFttTIhSKPzG
	UZ37N7TGOlCP1s4lJfwElnNKT5I1/2iMZQi0OkbjeXVbbWZHkVCdp7/nIUxDkjWbtwQFMtFrDqUBO
	r1Ewrv7KdlhYutZA2PLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLPo-00000004dw3-0ker;
	Tue, 20 Aug 2024 09:44:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLNI-00000004d4E-3gN4;
	Tue, 20 Aug 2024 09:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 19572CE0B73;
	Tue, 20 Aug 2024 09:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 224C8C4AF10;
	Tue, 20 Aug 2024 09:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724146918;
	bh=cS20O9LXg3AxB+iOazOUR7zUszo+e+eKg5CJ/BJIyYs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PrSnKTaCGokWJ+9ot5LjVydsVuSn/k07HAcQoLftiADwT4RVBwcvD9QGP5cksnf2p
	 ycIdCBCc5rSTOJC2nfIFPRWVhD0kVyT62zNzaeAKRRZBJosVynDtHe3SqVQxpMowZa
	 e9RxbBA5AkKKHHQh4E5Ergfp4jT7O4zJtDoHyEJToT8/sasJpv8qHkfuGk5QIuEwIy
	 LsyNiMGLJEK/r8NgggJe8MfH5g+3gpyjxhfNdxXUrWVCIv+lP8OqF3IAyOtl8jOVkY
	 IX90E/xUAgiEh6ke9/4MkxmkiShMLhRTLa2c/Vwv+80Wz59SqFLEJzjGgRi8ga/UY9
	 lLkWuNIM+oXPg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B843C3DA4A;
	Tue, 20 Aug 2024 09:41:58 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] add some node for amlogic c3
Date: Tue, 20 Aug 2024 17:41:55 +0800
Message-Id: <20240820-c3_add_node-v2-0-8fd3f06b7bce@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAONkxGYC/23MSwrCMBSF4a2UOzaSFzU6ch9SSkhu2ws2KYkEp
 WTvxo4d/gfOt0PGRJjh1u2QsFCmGFrIUwdusWFGRr41SC41N7xnTo3W+zFEj0xLbtXlKswkDLT
 HlnCi96E9htYL5VdMnwMv4rf+d4pgnDnuUQulRa/k3a7POJM7u7jCUGv9AiR7nACoAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724146916; l=1180;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=cS20O9LXg3AxB+iOazOUR7zUszo+e+eKg5CJ/BJIyYs=;
 b=dEY14KH7ypUWXvY00gpy9k1dyt91sftLPhTyXn/YCkHQkpRRd7iQ3NoQZlsiNGwHgCjzBMFMa
 qxe+0khm288APEdCK7iN2riSD4Go5XCsXZ6NiEtR5pJ0cMB6Pu2CfH+
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_024201_311653_7AA955A4 
X-CRM114-Status: UNSURE (   9.36  )
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
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        | 487 ++++++++++++++++++++-
 5 files changed, 987 insertions(+), 3 deletions(-)
---
base-commit: bfe05c592279e509a67c3ae305517859f3f5a58c
change-id: 20240806-c3_add_node-420a37918f18

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
