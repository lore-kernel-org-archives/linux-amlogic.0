Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60088606A31C
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AgPhRL74;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2OVeSKI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yDWZt57D5cNyyF852Ko49hBeydDOLTq3HPEkEUjDZ44=; b=AgPhRL74zDZeMRq6N5xFSZGp2D
	5xFptGy+GprBj7bzElHVg1Qau/kZn+/yuHMS5jcYR5RUj6UzN649uun7qSKtkUrJUL5nyo60yfjJx
	sLMmffCTchFf/wyNXZ4E9I3Ukt1wOfp+N3uKLFnaf/uCSvTCkvRGUhZQzt5AGrNqzwCDtH91if9QY
	z6V35HRRSscO1Y+4BJIAgik9jwBFcEwFYSr3bkfU37yh8dsxGKcu5M0LI7reuiMC/hbv0XKGf6H0x
	SBTy3e8kX3mtS9Q3hFG/4YA06LKQP1ITxwyL4m0D1PN7WFintRPPhxPuBemlySWB9wRRyN6j+6Hfv
	y8Jyi/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHqY-00000005WBX-3fZ4;
	Tue, 17 Nov 2026 11:59:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHq4-00000005W9t-2Wh3
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 11:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CFFC43B6C;
	Tue, 17 Nov 2026 11:59:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794916743;
	b=ky/JB+Xm08vR9pIHBF5U9OpkqSG/pEM5t06Wd2yhYA1WURmo7qHSchhR8nAnODm5nLVG
	 O22X0TQq+6/cvudo4cQCDPHDmOH686JQ8+zNzLz3aXmrk1aim5s6XW4bRgHXTKLuod2Fm
	 i1YbhYCqdreab0k5RzyWrdrLaXM5dARw4Fn3p0kvHVdrmQ7Ng38inBRXu1u25q/mcPtYI
	 pioxYfE6dMFKDOw7h8Z17LOL5i/R+ur8/HihT4rszq5IO1hMYbs1dkFTx5LPPCTQlR/AC
	 nkxuPNFwrBO+yEiENY6WGcimijbi6cKRGq71lOSEt0/OSlglouHnW1iQSJRgNilYOjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794916743;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Zo+p/MUo5NSeHN6m+APY1ECpjqUQAyFEWeMPmWJJiYs=;
	b=LEgXz5KTp4LUdY4aQp1Z0vCVuHJUwtdh8bjIK+fBSSEiIIRO/rN9y+/tPZprxXOdJ5Dn
	 0YQwA1DLxyxPU1UTbwEaxFLXFQL6BV0z72Gt7uiMwRYLMCcr2WTCL/l+mcS4LCCOH1Cb4
	 N2WyZMP1WT7X8oMO/41t6OfGR+NFfFya/4ilgF4B5idbmCsQ04NYHM7enwYmoo12i6Zhc
	 NkM9bK23hY8QbJ7pUMD6IBc7C51eJH1k+HilAc2+l+LiPwIGD3kCp8SLMAOsMR2Q1zBxp
	 lG9leold9nuJ8KC2dhJi08XqZQ3LlZOul0CF5glI0d/dySWpt1bMJxNLtwIdBfnOOvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CACD01F000C4;
	Tue, 17 Nov 2026 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916743;
	bh=Zo+p/MUo5NSeHN6m+APY1ECpjqUQAyFEWeMPmWJJiYs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=U2OVeSKIX79GzpUPfnlka1LAR+VYdHp2YXKu16BU8DRnu5c6ikbGxFK+6IsoxVBvj
	 6u+dNkNAGXTdUcAWk6hu5yLkyXyLKyl0w19eJIxhI2EmoSbCZD3Fvg8pvUWDlYta0E
	 TF0C53LR2N7SHehfoS4yneVWWAa7IsRPGJZ0/qjnMFa8Il5hMnbpGybLCbNH0FpDxF
	 pk5K2AqhrehXOcgGaT9T/0PVxx9g9mTGbQO4L7FruySu+DENKqulb/CTIG39CmuY/1
	 PlwbUGZzJxoEDdSuO8oTmlYFNgkeK9rlC3MWxc/UB/Cqtdb0X+Zhx/JVYl1hyYY7ds
	 ZS2MZZIjZ4fvA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2E22B4A949;
	Tue, 17 Nov 2026 11:59:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v10 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Tue, 17 Nov 2026 11:58:55 +0000
Message-Id: <20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIBB/GoC/23QTW7DIBAF4KtUrOuWGf676j2qLgAPCVJjV3Zkp
 Ypy90KUElfOkuF9PDFnNtOUaWZvT2c20ZLnPA7lAPz5icW9H3bU5b4MGHLU3AF03nUZY4dSGku
 IpK1gJRz8TF2Y/BD3NV4irzU20OlYr78nSvl0Lfr4LOd9no/j9HPtXaBObw0o/xoW6HgXrO9dk
 DpJb9/94Wvc5fgSxwOrjyzYIHDEBrFAqUhESmBUSFso1tA1KAo0QfAYI+dKiC2Ud1hkg7JA5UE
 7BBUsuS1UaygaVAVanbCPPRjXP/ijXsP7cnRdjvcaDCTU6QE0j6GpUBQUlEg+yS20Kwi8QVsgk
 OtRW0xWhy10a2gadLetimidTOT/w8vl8gvZx5nnhgIAAA==
X-Change-ID: 20260911-a9-i2c-24478e22e683
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, 
 Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794916741; l=3217;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=pKrAL+T0Zub2OESC9RtL1tJC+rFDKjL1TpuiSeE9tzY=;
 b=WWrwJsfDZQakxXbLVi5ffb2e3TaxTll09uL7DBWz8huvgNv8C20D+GutAEDc8TmhKkHNIeyjd
 +ReY97cpu/PBYfexaaTZvGyLspf7PNQrgmC/5MRppJv+VWgKvxVDcBN
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

Add a device tree binding and driver for the I2C controller found on the
Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v10:
- Use guardinlock, drop extra curly braces, and add another auther, according to Markus's suggestions.
- s/Device Tree/device tree in binding msg and cover-letter msg, according to Markus's suggestions.
- Link to v9: https://lore.kernel.org/r/20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com

Changes in v9:
- Use guard(spinlock) instead of spinlock according to Markus's suggestions, no logic change.
- Link to v8: https://lore.kernel.org/r/20261110-a9-i2c-v8-0-1e9d2682f86b@amlogic.com

Changes in v8:
- Reserve complete(done) into lock, and adjust the code process in irq func.
- Link to v7: https://lore.kernel.org/r/20261104-a9-i2c-v7-0-b31f2b53faf4@amlogic.com

Changes in v7:
- Move complete(done) out of lock, and when state = idle not complete(done) in irq func.
- Link to v6: https://lore.kernel.org/r/20261104-a9-i2c-v6-0-baa6171f26f8@amlogic.com

Changes in v6:
- use xfer instead of master_xfer interface, and when div=8 remain valid.
- Optimized the function.
- Link to v5: https://lore.kernel.org/r/20261103-a9-i2c-v5-0-86f2dcd179d8@amlogic.com

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
 drivers/i2c/busses/i2c-amlogic-a9.c                | 428 +++++++++++++++++++++
 5 files changed, 502 insertions(+)
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
