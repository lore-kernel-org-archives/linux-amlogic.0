Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD01EC44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 02:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJib3W+AG8Uy1qdDwZ2zLa2ZUJbDtrVvrUjF7DegMRg=; b=Hx7h1vvUZQWjK2
	6Fqz2QFJSGoG/5J+HcaaSCoHCe2qB1tprs8LhF818ayvoh7jdh4TrGGB44sdxT6RyEEiGcEKXBuj/
	1EHVeSySRKHcplxDHfd9X8s0FS8CInTZbAO01Li0VS4km5R0Zay+VGsAYS0BQvbAsXRtAedf7yYPf
	CUpGYfoIbMCf4O8D8x8GHC/i7XssEZIlKL6IN5YTkiw1zVPlf3LMV8uH+P+IrQmBdbuDILljmG7dY
	Z13EOLVSuizlnK8EV+QyjOoo5aljoEOv9UVK7ElCjONQwuBA8OM3WA1ihd23pL/gUnjM44YST3YNx
	/n2jVuKKKtktJOwcmS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSy1-0000000AkYe-1zwh;
	Tue, 14 Jul 2026 02:33:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSy0-0000000AkY3-2fCz;
	Tue, 14 Jul 2026 02:33:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F004054B;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD879C2BCC7;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783996429;
	bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OBlj2Ss4s1EEfrCDQ7YMfQdgcJUHk1pdQYeYa4XZg8V5xpBaitnR2pFSdKz6cVcNJ
	 jOfGSYvtyHbZDZnCOMC6jTLW1u1gQgfyNE7pmCyok5STdrZkpEF/L0Uapp4/me6zmP
	 QTqu0eBERkSbLFQMT9OsvpPLNSJtlGJGXUyiFjzqyb6Psx/zvlQIu6QIq1/JkGWeyP
	 pxKEMZaxgQ2sRXXN8mwjdv6dUaOtZ3AnZle9hQvra+q8yKZ08CiamEkky0145JWEow
	 i32/XwbpuXC1srDXtQWz0f3j7qoLCvJ4IA5l47L5dFXdFTq+nGmrIonnHH2DrTLAzv
	 8yeJm8E7j7ThQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923F0C43458;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] reset: support reset for Amlogic A9 SoC
Date: Tue, 14 Jul 2026 02:33:36 +0000
Message-Id: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAACgVWoC/0XMQQrDIBCF4auEWddilJrYVe9RsjA6JgNNLBqkJ
 Xj32kDp8n88vh0SRsIE12aHiJkShbWGODVgZ7NOyMjVBsGF4h1XzGgWMeHGtJUae+9GrhzU+zO
 ip9dB3YfaM6UtxPch5/a7/hD9R3LLOPOus55LPfYXeTPLI0xkzzYsMJRSPji0kEeiAAAA
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783996426; l=1089;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=W2d5QqQKBqxvLWMEJ0hRfu/NSeHdDzwS5lPAkyQg7Fo=;
 b=vmB7Ld+u4rGK8fGznR+ORfIF7/ETmJgoEKJcC42b6lZpNEmrcerdce4ToUseFpWx35+nXD8kF
 FKlm8kGfiIHAtxvzQq+ZEIcd7vrMWrC+ojyyDkzc/wDkwMRsE5Rtos8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Use standard node name reset-controller.
- Link to v1: https://lore.kernel.org/r/20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
