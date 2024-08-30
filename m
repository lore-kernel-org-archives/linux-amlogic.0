Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EE6CA0EE5
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KXka1ShoIEu85Fq+yDKVgesgXdTtRNMFDpb+dItIVwY=; b=uX9fPik7idmhz9
	WGq5stQ36YDC95G8eySuuWddyCDtm1vT/iXCZ+HMy6wHCJ+7nl6Igx9lY5vRvFtZVvP+Wgbd94BJB
	0mttMfnjnxBy68KuhZn6Kev6Zs3gBlSrn8ZiEYWaS1kf7oqc4o0SCBemm28Qow++dYzMNpU9sEOVM
	rUATaqwnNxPmyJW+riSytgvmo8nvzaQYSjr3Ce3xOxAqc7+r5WPu98b1GRWJSHoy7VrvPf4UpbPEi
	gupWptBcmoSTI2Pjg7YBhI2WEofQHhGRxcmzIZX8l90WoZOUclEKKrTcezYWgDb7EEUjUg9Em33iV
	wiMNXxrNHdato9R+gRwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvA2-00000004xiK-0viM;
	Fri, 30 Aug 2024 06:31:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sju9E-00000004moo-3Zg8;
	Fri, 30 Aug 2024 05:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62998A40E64;
	Fri, 30 Aug 2024 05:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A22F9C4CEC4;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724995570;
	bh=IUuuhUvQU5dAs9RfLllL5/UhHvsk0Yi/7MPZkoNINGU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AOiQYwtU5ROHw/29+znc/nI5KWgAkGNODK0Kha4LZrRpbxJhRDNTaY63eTqK0YBjB
	 Ugc+5cPwCBoT5JUHJp3sPqdda7m1dVc7OWUoy8ShoXlh9qMbpuNGxE1qQe8UhV1r6X
	 hWtKgritlMjEPrqJfTWrZrRrrQ3ZqeVMqSjg8lRig2/3veTQr8ajxwrAQ9it2mh2v1
	 Jbic5sTOCqDbBDRg9xp65Mfab+6zs6Gb7cURtJufcQbeqjZ2Az3WyZq5DwTfldKEEJ
	 Zo90XhuAjAXRwtCgv1yOnhHSdiVVdJuK+vRFv/tlBAZLhCYLlGBXQc6sP9MIlGi4ZC
	 7dH1KcsLKtLfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92985C83F0B;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] add some node for amlogic c3
Date: Fri, 30 Aug 2024 13:26:07 +0800
Message-Id: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO9X0WYC/23MSwrCMBSF4a2UjI3c5IYkOnIfIiXNow1oI6kUp
 XTvph216PAc+P6JDD5HP5BzNZHsxzjE1JchDhWxnelbT6Mrm3DgAjRIarE2ztV9cp4KDgbVien
 ANCnimX2I77V2vZXdxeGV8meNj2x5/3dGRoFacF4wFEwiv5jHPbXRHm16kKU08o3msNe8aB0cB
 pCNaqz/1bjVuNdYNEqhUUlAFcRez/P8BfntYJokAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724995568; l=1482;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=IUuuhUvQU5dAs9RfLllL5/UhHvsk0Yi/7MPZkoNINGU=;
 b=sLy0R/VKRQWb9D1RVwxovgKBbzbGnPv1YWx1+E11zczo1cNy8ZD6jpFK6l5WzoTjbI5OQygfm
 QAX524CQKMWA0RIYMr9i5PP5x2Bu9LYWa4nq91OfJi6wqYKNtQDAxGA
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_222613_065467_8BFD2E63 
X-CRM114-Status: UNSURE (   9.69  )
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
Changes in v4:
- Adjust the format of commit message.
- Link to v3: https://lore.kernel.org/r/20240823-c3_add_node-v3-0-3648376037f4@amlogic.com

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
