Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B2606A337
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 02:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNjGxCyq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LvhSP70r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tW2VwTB0T2PB40/sP/bUoJuLbnnnpOE1vSjtB7JTXhY=; b=lNjGxCyqMlzqJ9G2LCDwtFxWul
	UDxTvUIUHskun4VNx9CrLaTEq5yzTQJibMstv8oTxlSTheJ6LI50tp5F16gnkpTfvfUFznMk6yaKq
	b3DU0IDiHq/+7cLFqIjSIX8hqN7xgX/aN+CZjWE5pazh1BWVKIZOkqrivewhFPGflz9Da8jPRAKMh
	INmPru8GUncRaTfxuNSLhyEQq9RYB8oWb2SCET+TpRQmV2oyMZn6sViJO1T/mRIjtvdeF4f3w67ye
	JOkwYzsC7t2ViuITC9E5+BZQSIxnxghxd4abG+pzInENy6mMRkCIr7m/t/c8aukYD880ltkILUvGD
	KRRNPsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4dh-00000000tz4-3KDv;
	Tue, 03 Nov 2026 02:52:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO4dg-00000000tyd-3Clx
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 02:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49FA7435DC;
	Tue,  3 Nov 2026 02:52:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793674363;
	b=qSrePLptl6QhAVf+eqA/sz/7wye+Y8yoAbFrW6fks22TWktD73Kmqu8agAjWNvxcwnEl
	 LyOJiqOCPAh64aUuwSOchFIpl8t7tG6W4t8Mb3JiNt52UQ9bNI59TKfcNLNT6d8JIh3MT
	 w9zJlqJzQ3p1RwYsMRZKzWKTRbQVP5n4Doj+uuG3W99+4wAhLyCaoGbFA+Kb+GSrMEOXa
	 BRc29thSy6EZbw6Gpt1IFSmTQHsOTMpLzlABVxFcD11XwgYxhrsZuyGyX5g2GY5dPbrt/
	 vn0BGsfdH2j/M/wBQr3tWcleeTiysW7vRmYwyoKqFrbJsu0t3Yz7NqSWUAJOBFQ889A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793674363;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=7lZGGFM47Y+vesCqWyVDCjfCNRXmTtOZ6DpDFv9Q2ho=;
	b=gBetH/W5427WGpiDDiJprhuSDllcf/tJuiT7LHDPbPQ0XaJUbvHYz6ipTDp6ItVvj7qM
	 sBoF15Kajmn8lqd+eXvXnhvPFiJWQYILtVW7oDwXyimh5cJayJrFVKzfDfK/qioJ1VvAE
	 eD0AgCJlum1QLVgsElQhJgKiK5sr93E6PFtstRMe0O1RigvOruWb8AbUZJ0Q2mtv/NaGr
	 CyM4t3NrS8pef6U1rclQwWAHSVcoVZlMCWeglVmkrAUU+aHJRHK1ailMCGG+Noz6mm2JN
	 t3PpY9RuAR/02nHKNEH17e6GsVc7sXhwc5kqgz+3ZSYHmER6W7BpGuu/+bZUmptMfkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8F1E1F000C1;
	Tue,  3 Nov 2026 02:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793674363;
	bh=7lZGGFM47Y+vesCqWyVDCjfCNRXmTtOZ6DpDFv9Q2ho=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LvhSP70rtb+nmlPhywjZdyZfgyVEprXdhilWqpvHV1bViyJgLK2D3PnRM/f/GSyQ8
	 G+HNacYDlpUCoaiLL66H0IRb8UUmikr7y+aoI4SzDLFJ8SVsuBX+OZJw9szn4vn2lw
	 bIEFgcq/YN9UU9HQAlsG5GWwjK5Dmshjs8kzqm0bIcrAi5/eLBDafdcb8FYzdEikGZ
	 fk3ped3BQavbsVjELpzkPFlFhx8PDHPsXlu+8L7l3P+uWz9NAq9Xk1X+Qn5lL+aw1J
	 yVkaQX4NinV48jP3vq3IprxBtVxxTDLvSbK+GNv273EcHAC91pJhgCavZuU2FK4YlL
	 n9x6dm8OMt90w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0B5044672E;
	Tue,  3 Nov 2026 02:52:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Tue, 03 Nov 2026 02:52:36 +0000
Message-Id: <20261103-a9-i2c-v5-0-86f2dcd179d8@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHRM6WoC/2XNQW7DIBAF0KtErEsLA9jQVe9RZQGTcYzU2BVEV
 qLId+8QtW6rLP/wH/8mKpVMVbzubqLQkmueJw7uaSdwjNORZD5wFqCgU0FrGYPMgBKs7T0BUOe
 N4HKKlWQqccKx1bny0moTXc7t+bPQkC/3nfc95zHX81yu99lFt+v3AtifhUVLJZOPh5BsN9jo3
 +LpYz5mfMb5JNonC2xQK4ANAkPryCANundpeITmLwwbNAz7ZBQiKuWMeYT2F7LcoGXoou4CaJc
 8hf9wXdcvYY7cfmgBAAA=
X-Change-ID: 20260911-a9-i2c-24478e22e683
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793674360; l=2121;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=7+M64M86zXRcRp+mwvX7/HRiZidre0O5p+ZpTs5Dazo=;
 b=evoz4ROMlBv7BzBePEzTMgLz6aLHhAzwRqQXGqgAFaenx2tn5l1NLmjYiP1hcCK1tIA0RvDPo
 BrKfkqihec7ClBmyafbmm3JTfxsN6lkfa3ba6hSg/m/yD6tVmEIXXik
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a Device Tree binding and driver for the I2C controller found on the
Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- Mask out I2C_FUNC_SMBUS_QUICK and return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK).
- Link to v4: https://lore.kernel.org/r/20261102-a9-i2c-v4-0-5a169215b8e9@amlogic.com

Changes in v4:
- Repocess xfer len equal 0 use I2C_AQ_NO_ZERO_LEN, and Optimized the function.
- Disable A9_RX_THRESH_READ/A9_TX_THRESH_WRITE enables of irq when xfer timeout.
- Use guard(spinlock_irqsave) instead for direct call spinlock in xfer timeout process.
- Link to v3: https://lore.kernel.org/r/20261029-a9-i2c-v3-0-7b30ccc00533@amlogic.com

Changes in v3:
- Based on the questions raised by the robot, the data flow was reorganized.
- Some processing was optimized according to Andi's and Markus's suggestions.
- Link to v2: https://lore.kernel.org/r/20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com

Changes in v2:
- dtbinding: make some minor modifications, suggestted by Conor and robot.
- driver: Make some adjustments, including macro definitions, format adjustments,
          adding quirks, process optimization, and so on. According to Andi and robot's suggestion
- Give up MAINTAINERS file the separate submission, make it together with the driver.
- Link to v1: https://lore.kernel.org/r/20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com

---
Junyi Zhao (1):
      i2c: amlogic: Add Amlogic A9 I2C controller driver

Xianwei Zhao (1):
      dt-bindings: i2c: add Amlogic A9 I2C controller

 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    |  56 +++
 MAINTAINERS                                        |   9 +
 drivers/i2c/busses/Kconfig                         |   8 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-amlogic-a9.c                | 431 +++++++++++++++++++++
 5 files changed, 505 insertions(+)
---
base-commit: 4ec2365c08de306f52650d8736aef5862baedb8d
change-id: 20260911-a9-i2c-24478e22e683

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
