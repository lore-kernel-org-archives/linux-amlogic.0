Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3D4D5E13B
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2024 05:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ojnkR71qRO6AtGB6mY7jhZclWzd9p2BT0UQyfgQ5wrA=; b=e+V3M7pRM1CTDq
	vsJsUz5PD6U7HpjC9VRbdWCUfkUxIT2I71fUQE1QUXTBYry3+eLNZ4z6n7D4pvtvMWJeGr+rmdt7U
	cYQCwPYI1Ux9kDG8nqCxRuvu12+6rAVTo0nHWMPmEeoGsfr8it9ntgPxrMNrqwfE1RiQpsTwo+ZLe
	u46ba44Lu+BiWBWw1j9+WfRk/9yCdPYqURXtgqwYV385/rCLcRzZlNrdp16eqhxyMwf01zWOrqNLZ
	prWjwgL9curLTTrAbsSpa+DBnnJSluAeMMTGG9aTCBOaHlVt75gW0/VXUIx+ID9vOpmfieZ+yYyAh
	YJnol7vrV7QsNN5AmfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HxP-00000009R6Y-1Ttt;
	Fri, 08 Nov 2024 05:54:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HxL-00000009R55-3AGP
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Nov 2024 05:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F26055C33A0;
	Fri,  8 Nov 2024 05:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08C2EC4CECE;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731045290;
	bh=Y4CwMwPQuIcU9wjKisRuEikA8yK46OIFjAflX16ws80=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=shxcgGRTmacMyTpjGSaJWRS6iK/Bx9lHAHgM1quxNTYHRpypU/9SsvTiIfPZbfm83
	 OnqfPKhua8smLOI4ZV6TNR7fxVNS8jrTfSkGE9Czc1zZe8rWQfyOnoxWEEMQlvHMY8
	 v5HV+guG7c99gzwdiz6c4GRHEHWu7gF6GXiU6XBtRqmMsQJ6kFYio1ks3naVh9A6nu
	 Tg0MLNgTCodgUuTuWXoNX2FEHXsogC0gXUqzn5sJphpEULZ1Rw5ilvztQ89Wq8vPBr
	 ktMbUx+sivy1QUZ9UmbE6+MudN0O/t46Eh/bQmsSfOI5BqkpGJ6ILleQ+Z9rxQR3U/
	 wGh4SyPHAzzCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A5CD5E136;
	Fri,  8 Nov 2024 05:54:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] support for amlogic rtc
Date: Fri, 08 Nov 2024 13:54:40 +0800
Message-Id: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKCnLWcC/2XMQQrCMBCF4atI1kZmJk2TuPIe4mKapBpQK6kUp
 fTuRi2ouHzDfP8o+phT7MV6MYoch9Sn7lyGXi6EP/B5H2UKZQsCqsCSkvnqJZLxwaIjRiXK5yX
 HNt1ele2u7EPqr12+v6IDPq+/fkAJsm4NKIuByaoNn47dPvmV707iWRjooxzMiooCHVgbrRsb3
 L9SXwrhrVRR2DIYw7Vjgn9VfSmaVVWUQ466baqogv5V0zQ9AHxC7B46AQAA
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731045288; l=1783;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Y4CwMwPQuIcU9wjKisRuEikA8yK46OIFjAflX16ws80=;
 b=jNGWNeJoco9mLfZbzE2NrkqAIYDH1CSdtYucDI0JEHejYpvcKvY4w66zcRCS9Mb/K3YCtBcUj
 hkfwvRfI3bkB02bbKqR3yXYI6kKWxsGkcNT9ClwgDaq+OXPLCFZvPrc
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_215451_922894_8C3F2972 
X-CRM114-Status: UNSURE (   9.64  )
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

Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- Some formatting adjustments and minor fixes were made based on Christophe's suggestions.
- Link to v4: https://lore.kernel.org/r/20240920-rtc-v4-0-91ae5fb4e3d5@amlogic.com

Changes in v4:
- Keep the same order as as in properties.
- Link to v3: https://lore.kernel.org/r/20240910-rtc-v3-0-1fa077a69a20@amlogic.com

Changes in v3:
- Perfect the binding description and rename binding.
- Using dev_err_probe function correctly, and modify commit message.
- Change placement about MAINTAINERS.
- Link to v2: https://lore.kernel.org/r/20240903-rtc-v2-0-05da5755b8d9@amlogic.com

Changes in v2:
- Modify bindings clock name and perfect the example.
- Fix some bug in driver, and use dev_err_probe instead of dev_err in probe process.
- Use RTC API to handle calibration.
- Remove unused func and rename driver file name.
- Link to v1: https://lore.kernel.org/r/20240823-rtc-v1-0-6f70381da283@amlogic.com

---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../devicetree/bindings/rtc/amlogic,a4-rtc.yaml    |  63 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic-a4.c                       | 476 +++++++++++++++++++++
 5 files changed, 560 insertions(+)
---
base-commit: 8a2c49e0fd92e6760636bcfbf11e11d9ddd61cf9
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
