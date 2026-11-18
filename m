Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEABB606A88B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3fXYttuH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RVhEi8TQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=59pk08lyX8cxl+u62UIHyi12Ai4Sx7A9bYAjgRj0oqw=; b=3fXYttuHmt6negTQtojcrRfa1A
	0JpbLMCYkHn8dTZSM2ajz+GknmknMiZtRHzqlGGXWuzxktGW0wc5l7vurGiY0s9QWdBzsJibNSuO4
	HuUftWpbY0AT4J+/odD9IK0YsfY6TzFDd/GaLWQQ7hxM8TssItH9Zv60H4998HMvhZ2w4hP21YVLQ
	JWx5/m2h4Sk6zrVGzKWhMZ1wh8iXXQliZud1ytwJ4FVU+yRRdPRsBzKlTPTfeJDYaDKgHY6T0KzLz
	XDyzl49faBCYgWjn5UIDISZULgCJU1Osr7F+I1SUzhl0cEFYTi1QcMyT+XJbknGEpxLSVXv8iJbvx
	jjE1XcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZvO-00000007zJ2-1oF6;
	Wed, 18 Nov 2026 07:17:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZvN-00000007zIk-3M1U
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 07:17:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2786445C21;
	Wed, 18 Nov 2026 07:17:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794986265;
	b=pUaujIt92nl4ZzatSJQ4iMoTxZAVV7XaqsNUd01toqovZsero3DpRjaRnc2mE+XigZV/
	 cY7sNCu7xKa9jZi0rVpJbiqp0aKMcyheiVy6vZtBa8zfBqi7pWZw48/8wtmGUVIfOVUq7
	 2SlZ6nHFtKteJoml/cIDFaEA3IZzmQWknF1og1xOLSM9J+neKtxs9zvgOlJx0ToRyO8qH
	 x4Ce/EUnmVUfYC/Nc0z/gsBrqz5gPwsGDs7IeTMJtEm1JcorwkwKqB2uKgR4mzu7Vx9uB
	 IvRBi3LE0EJpLRLmCyMsSrxwLnnj4kpmtb9YwoKQgMP0igCLCu6Dh3nKsD8U9TvkgFg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794986265;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=k79ZPepWcH9mFZtUFKUdTzDz8phdWxgHhfYsnoDQCno=;
	b=LlDj5z+vKFLNwgGNWShjT5UHSYNdsv3ce1t172j1+PapDgfSz27eZXbS+dVAA+THAMnN
	 jILgUkaXajSLcua2bzPHxafU7tXKwZ7qMWfB5NUp6FnMhIuhesvlXTjh1lNmj+nBV3msK
	 AxWmev96IIBQMc2T+hxtM7jtaCIPoJyuK0xX2F8dRGdwN96BaEyohD9wmUQp40auBCjG3
	 GFOZ5ALd4CM5487G9+otaJL1A3Vmy5iu/+ChRcXQGS21IIezhhaSrTYqczo1vhNYCySX+
	 t8uPvrOm0ffss5KitnUz+V2k40ErEjnNxdM/HnHW69GSUANRZss5ocKqSI2WXKGuuZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62BCE1F000C4;
	Wed, 18 Nov 2026 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794986265;
	bh=k79ZPepWcH9mFZtUFKUdTzDz8phdWxgHhfYsnoDQCno=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RVhEi8TQmfxYelyleNTPpTozbliZDyQJ1Yy2/r+41puGt1WxI/M1m8CSGj5lC5M9N
	 l+Y8fLzUmLZQgNnMCpsNkFFCAJF6T7iZiiIJm7Ey1uKksBLaGYa8N0NHrUkC3Sq+zy
	 mNf7HCpPAtR3+2qkA58OD7kOvvoyNVIXAG6iVxPiEnOWjgrULOhIT4U2OeChQJBfEJ
	 bw8SNS7kjxYg47wvT+88dNPgmle6PBBfZBaWGTxLPq9/i/zimRQhdrwvFt4RqBd6a1
	 3XlWkj58zWhH0+E+Ku204YnNO4jMeMCEbFXbz+yjf0PS494TsxJkcFPoXC/2tJCPty
	 +l0z99YAh9Ccg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BA5054AC3B;
	Wed, 18 Nov 2026 07:17:43 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v11 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Wed, 18 Nov 2026 07:17:34 +0000
Message-Id: <20261118-a9-i2c-v11-0-68a3e79ff43a@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA5R/WoC/23QTW7DIBAF4KtEXpeWGf676j2qLgAPCVJjR3Zkp
 Ypy9+IoJa7sJcP7eGKuzUhDprF5312bgaY85r4rB4CXXRMPvtsTy20ZNMhRcwfAvGMZI0MpjSV
 E0lY0JRz8SCwMvouHOV4ib3Oso8t5vj4NlPLlXvT5Vc6HPJ774efeO8E8fTSg/GuYgHEWrG9dk
 DpJbz/88bvf5/ga+2MzPzJhhcARK8QCpSIRKYFRIa2hWEJXoSjQBMFjjJwrIdZQPmGRFcoClQf
 tEFSw5NZQLaGoUBVodcI2tmBcu/FHvYTP5eh5Od5rMJBQpw1otqGZoSgoKJF8kmtoFxB4hbZAI
 NeitpisDmvoltBU6B5bFdE6mcivIfBtWdo5E4K885QiIf9Pb7fbL2+69ivBAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794986262; l=3580;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=YEBzqbDLmv//8l3Wi9X/W6MkreumJiymrOIXzsBvqeY=;
 b=3yFocliqT5CqdebMIujriXvq3tjoJirYtj8eRqdrcMo1JMQw05xbufjMMQ/emCAP/wl2r37yf
 bjhPPRodnxyAJP9ew1LWESgV/VtQMGCS/k/ZzZZMfDI7q4QRBUnOzC/
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
Changes in v11:
- Convert hand-rolled spin_lock_irqsave()/spin_unlock_irqrestore() pairs
  to scoped_guard(), and drop the now unused  "flags" variable.
- Link to v10: https://lore.kernel.org/r/20261117-a9-i2c-v10-0-33ea9aefce20@amlogic.com

Changes in v10:
- Convert hand-rolled spin_lock_irqsave()/spin_unlock_irqrestore() pairs
  to guard().
- Drop unneeded braces around the single-statement early return in the
  IRQ handler.
- Add MODULE_AUTHOR entry for Xianwei Zhao.
- Fix commit message capitalization in the dt-bindings patch
  ("Device Tree" -> "device tree").
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
