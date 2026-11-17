Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C56606A8A1
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2026 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cTecVcP1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f3M0QVwi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dY8iPEC1aDPRbG82zljeSUzC+om+ZunndX6+pAdnUek=; b=cTecVcP10MYsUJFJUCp3TDRjno
	waf+cmFdGKiqhbUIb6MaGt19ONoSR2Y4IEI+Mb2t7grJQY0Eau92QdH9ituvdwfA92KTMouf2eSpW
	KlkTM/KXp0mfwb6myegVpQLAeifGGw1ECkmSLCvn6s3u1DDoB1zcgycadLSVCteSdD3qGw4du/YV2
	E0pDcu59anYihfiZaYey4+n3qg0IlBDDDF7HDlT6HaGqnMWFbucfkl5Ye8XXLSWF9otNaM8hnrK8D
	5giJilM7lQGSAqmDfPfjaxXYtCdR+mDggIzmXP9vQuCXmrEbihq6Y4BeRAXwPL81W/RCXjt0LREN9
	v0bXqANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBzx-00000004cfM-1dTd;
	Tue, 17 Nov 2026 05:44:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBzv-00000004cer-0Jq5
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Nov 2026 05:44:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D47B625A7;
	Tue, 17 Nov 2026 05:44:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794894289;
	b=GYX5rUsfIZm2eSBrYVtHJKkXTlkj62fUVLYIGRTbiSov/1ehb11ZmD6ObVPk6jhpIrg2
	 SoWDqyDa60ncTg5UVnkt8WqyEA787jxQdwEKLre9lzu1XVpZoUhfKKMxuk//AWMK80Uj1
	 MSCOA0XpfDjH4UpV8KBpa3bnaL0GKMjEBLpES5VD5BijjCZuycfAgK8LWw+v0cjB4Vp3q
	 IDGpXaok9cUDT2xogbeyKPbGSvf8N2WIiaimlWh9ojbGfhTvUZtfdoHVLawTecFK0uiMl
	 S6W68JbZ7VkoR79o/WcLL80QzLnyTa2GhZn88rQrOqb+4HYiRmNleVcomiP7t8QTK0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794894289;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WnJxue8EGHSJoOXR71h438cN5FpREPyR7p6Z/X0PWZg=;
	b=m+3u7fBlyUsh09m+t3Z+yYfhf6pJH5Vo1QQdxNkfFvQoliV/ih8Si3pnu4FsDaKyOltx
	 gXBlczhWenjKLy6p3Mp4CgX68WK3g95t+aBU0UiPpwcHW2Bsx82F1uNu2PNyG0FzkThEJ
	 +IugBCCwQ/ke4NTyRDGxkNqGNr+EbsDOLUMBmBIbrhQ45jtHo8pQ776n/N0GfGxxSj/HF
	 cJMJp7RMI1VhSpfSROHNaosFMMxv86qkPunprDTI1F5JoGn44/TLPuuKXGNuv+Q7ULLzL
	 6d0KtfpPbQeuYhqEVm3CO32wSvV21xlxfplyQX6Q5uAnD8saICL3uigoFBlSfLI/5vw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B52A21F000C5;
	Tue, 17 Nov 2026 05:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794894289;
	bh=WnJxue8EGHSJoOXR71h438cN5FpREPyR7p6Z/X0PWZg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f3M0QVwiKSHFX/MD8zSYUHfGHkOgYzVUHFfdkXZMJbd/+Um6XlSmAikfBgcpP35J1
	 yCVnsri3h+UDgYPy4bgIqjEAZAMXwN9NkWlIp1SVKoiJg9sWYMg2vL1A1WWAdjtucO
	 sy3SCpEAMiu4wgO28KkAbzkvsAJIwS00dkGjR9GH6hBBvijLdkthZjwpEiR8AIVLfH
	 AcGFmKdakoW72dg+b4II/t3y9Pmzth3qNjJIkfLMlqShwN5hkwI7S2tAL16o0etiJh
	 eb0X2Sg41dT59Qmb1aazekZqbN14qeBiSs4f1qrrb7gW81MSSDpVv9i2P3BKFwdYhK
	 Gouyvg26pAIMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 17B894A6D3;
	Tue, 17 Nov 2026 05:44:48 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v9 0/2] i2c: Add driver support Amlogic A9 I2C
Date: Tue, 17 Nov 2026 05:44:02 +0000
Message-Id: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKLp+2oC/23QTW7DIBAF4KtErEvLDP9d9R5VF4CHBKmxKzuyU
 kW5eyFqHVfOcuB9PDEXNtFYaGKvuwsbaS5TGfo6+KcdS4fQ74mXrs4MBRrhAXjwvGDiqJR1hEj
 GSVbDMUzE4xj6dGjxGnlpsZ7Op3b9NVIu51vP+0edD2U6DeP3rXaGdvrbgOqvYQYueHSh81GZr
 IJ7C8fPYV/ScxqOrD0y4wJBIC4QK1SaZKIMVse8hXIN/QJlhTZKkVISQku5heoOq1ygqlAHMB5
 BR0d+C/UaygXqCp3J2KUOrO8e/NGs4X05pi0nBAMWMpr8ANrH0DYoK4pa5pDVFroVBLFAVyGQ7
 9A4zM7E//B6vf4A2cJK7kwCAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794894285; l=2906;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=sKg+ezEKpqfPxRfUc62ziON7SyaA8QSFTl1n/ygHs3M=;
 b=D15RfZwfZt+xczMQ+XV4t2xV4wyB8+IYyFZmII8TF6No9XA9ud9hMEv2dKvzPHg/GZRtqBUxY
 MP/XR2b2TXNC71vkIjkLubwNBjzcaxACRrxVWumP0t8zrPYvN8yixrr
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
 drivers/i2c/busses/i2c-amlogic-a9.c                | 429 +++++++++++++++++++++
 5 files changed, 503 insertions(+)
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
