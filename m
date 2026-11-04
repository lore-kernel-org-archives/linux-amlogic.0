Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC5606A335
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Nov 2026 02:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWHRjJkM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8Epv6v7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2Zu+xLnVkiHYs5UHT0/n5PVGu6CBh6qA0sdP69M89o4=; b=VWHRjJkMlwYI8vcrhy/+jy/Mas
	OXmyNXjj0bJ4Wzw45R1r7Uhfx1XKiRS/51EQe2DQCHqbSDWBV6gciTLXw/w1imiQscV41mKuwtB+M
	UT4V3P/aPgAWJe8pEMN1vJLOyWAqXpZFZlNskV7hu+jUErV4z/iRBKQfTln65x92aCIhN4182fbtl
	Z9UqiFWJnuCvTwwPQuHzJ8GRkgESsFLRf+d3Bm/EpqBmj0x3pjtlKRf1sRYr/EX5YwLLwJ0r7f93F
	QZnsrK5fLV+WFZ+PcT23Vi8fjw8cDiH5rPk0FYabzpJ7ffaFBmmckmhDq0iDcK6RZIZ2vEPXCqU0i
	5slfPKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQzi-00000004CCz-12eA;
	Wed, 04 Nov 2026 02:44:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQzf-00000004CCU-46QV
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Nov 2026 02:44:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5484D602C3;
	Wed,  4 Nov 2026 02:44:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793760295;
	b=aZNNQP+3B2/H7f2J3LRIqrssvVzZN55y6NbukwSbASpe7Be5zcujM1Yup0NRg68kUr0d
	 3Y/+L00pF3oSCmeLbt0XJRoErFeFwBk0i68Oiv2D2fpTvxQiIY0HwFlZABdOfUfSP5gQA
	 qlob+fQg1gHEl9dfz9lG8xo6rf0In2oToMzW3hhZOprQdX8nGrsNzcXgZ91LminB0k2cR
	 XCiy73bsdrrm5rjUBXWpnV+gNLPy4HEb0PENDKIM56LIvUp+Xzs5gRwS3QnIn9h8bUCfQ
	 mJRX63LEEzL4gAnV7GaWnv0bTtP0fO/g5OlUGqL2mNl5XAyqi0vh4cBg7+Brm6kHBAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793760295;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=KNqyU1i/xpcC/Z4st/z26veCt1UHQ8yGSYEh9gSIV9I=;
	b=jyx13XnzXllXEPnUPOW4jLRZ/7cwsuC9MFSqnnN4CLq0ngeEBIeRx3sLJbjy3u992rTT
	 wk19/y1QKbpEaQNG65tTeR2r+WWTZ0AO036rv/eU4BmvuAGABf+HvzulGtOUtCEwhvZR3
	 UKHZ0mfM2J+UAIVFNTzkuchMwUXmSe9rdosOHUwvPu5aPF6DbMjPlp9KPYTiEuCxo3dKQ
	 CrwF2yDfvU/KFXjmmCkGt0lF3V2Z4o1jWAvw/Pti1ZUg0mLdjWDYPmpEVOAW7eXrU+bYF
	 Z8ennbY6G9rIQGIg6D2DpiYeSkKNXh5kibkmEcmNOEB0kckpRsZGQ+XydZZY5dJN5qg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0D9E21F000C1;
	Wed,  4 Nov 2026 02:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793760295;
	bh=KNqyU1i/xpcC/Z4st/z26veCt1UHQ8yGSYEh9gSIV9I=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f8Epv6v7EJ/bLMWJ34IVR2jPC9O6Ie7KiMb01t4kwPxC/uEifIIHonoeGgtipxBYY
	 Yj3QE2KH8ZU3qNGiX0c0vXpyT61bJ2/ojoHMPNGEZpMM0M+xr2NCmIdW4B7C1QBtA3
	 49uson+6KTSjyi3n+cGRcpSNHbdL6zcxg5vh5uC7YBho/w49kfjXpqrvOD11kN6Y/O
	 1YeZ2NmoUZ493EXqfCDQ5pV9O8XS+TOWlP2LqNoqQev1TmbxNOAFd/ezGRB9cYw1g3
	 lpNdw+xruL72yWH1nSTCmDSGD0+K4Iu84ZNNh6ilwA7gX1YllREQxlWIPJ3bLZ61pk
	 1SFBSLMaj+b7g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 624FC46BED;
	Wed,  4 Nov 2026 02:44:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v6 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Wed, 04 Nov 2026 02:44:48 +0000
Message-Id: <20261104-a9-i2c-v6-0-baa6171f26f8@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACCc6moC/2XPS27DIBQF0K1EjEsLj4+ho+6j6oDPc4zU2BFEV
 qrIey9ELY3q4YV7uOJGCuaEhbwebiTjmkpa5hr004GEyc1HpCnWTICBZpZz6ixNEChIORgEQG0
 EqWXvClKf3RymVq+Vl1ab8Xpp1+eMY7red94/ap5SuSz56z678nb6swDyd2HllFFvXLRe6lE68
 +ZOn8sxheewnEh7ZIUOOQPoECqUCkXAkQ/Kj3soHqHtUFQ4eMFCCIwpIfZQ/sEqO5QVKse1Ba6
 8QbuH6hGKDlWFRo8QQ+SDjf/+uG3bN1o0AKOhAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793760291; l=2328;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=Nm1JWbtaRuSABkoleUS6h/wQySv7sonsy5vVlEVZvCs=;
 b=XeTI+00jgRc76jWdI93jk8kT/tPHJfMO2BBWSKmN3+0z3ZjwvsR5Zh0K/M6/67IQnpdRIvUaC
 rhjvUdMjcy/AxnIeh3XBjezWE9uFPCKtM+as/2yn8p1LD2rtSrpmS58
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
