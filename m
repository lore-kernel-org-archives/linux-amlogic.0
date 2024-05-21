Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DAEC25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PmB+sw8dayVYrmaO2XAMzuVymWFd/+knaCqZVEqTPQ8=; b=IK5jtb9wghSL68
	ThjYzlbegrVXcdEY7jceoBB6XWn8JXdeJ5VeAKYvg16g+OkE5hM33CGvSB8gpINA/WuqYUNGDresP
	kv35o4+WeBUp7mNbgbsHHQ3svhW8eCmkWOYFsIcebP9pA9ZuMhAL/bYA/J50Ml5xi+XI7DaAAk4i9
	bENAXJESmwnxYGYdhff57J90NDC8ghuRuaNUQQnOJg/RkBtTm+yRI7cjiv+z4iiIExbRmTSln9jny
	Lh5biApriuJE4PRuhrIe1OCfpLAfmdraq9E3LFxNoMuGER2rGYaIZEN+j9qvKVfsH9mtUfP5yaAfF
	XuKx1+czYf7UwQukuxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kui-0000000Glhv-3PA7;
	Tue, 21 May 2024 08:32:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Kuf-0000000Glgi-1gZh;
	Tue, 21 May 2024 08:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB08762090;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 645DCC2BD11;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716280318;
	bh=8sDFlj1Gwr4M6++unKHbhg9lGquHLfbGNCat/SHDtO8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EVMAu9spISPmj5wcZir1ZwC8EOT2723ZPfJRyPHsI7UPgZBbnJBeqVihe8T8SW/e9
	 0VWMpGRIEiWQnxynFJLeJ0sLD67YmuLHcBzsS7IhIqXlJZiVA8W7k/5odJU7v8w82Y
	 YYl4RSLBxegny9KQT4CjK1ckHu+BfDPKqcO4kC9MGwEm/OIwgeLhVQIiEvU9Rvk/u4
	 Js+UgkngSCZRA/ZVuYsndMM1yJIvBc3CApIW+GROkW4C7XMy//bO8lcESoqruTDPUF
	 Ct+Y+9Z9tth8mC/FLYXEY7u4Qo69BhbI9504GYHeA/RtvrHupwckqnB1BiG3o/5Nih
	 8D+uMZ1Eb6hiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4892BC25B75;
	Tue, 21 May 2024 08:31:58 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] Add support for Amlogic S4 PWM
Date: Tue, 21 May 2024 16:31:33 +0800
Message-Id: <20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOVbTGYC/2XMywrCMBCF4VcpszYyhPFSV76HdBGSSTtgmpKUq
 JS8u7Fbl//h8G2QOQlnuHUbJC6SJc4tTocO7GTmkZW41qBRE5ImlUktr6C0u2DfX8/WMEM7L4m
 9vHfoMbSeJK8xfXa30G/9IwopVMxas/eO0OHdhGccxR5tDDDUWr8Le7g+ngAAAA==
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kelvin Zhang <kelvin.zhang@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716280316; l=802;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=8sDFlj1Gwr4M6++unKHbhg9lGquHLfbGNCat/SHDtO8=;
 b=KKSNn/ElfAgYrD7BO58I3c5C8vB5uGsP6pt7ktkMU4BuQE/FsH8XzspsgB5ryJpTkuh7AF31j
 RUpIylqtVOBDRnzK1f+s/NeZHkzNcF3E/mMKJ0suVlIDZCdvvFsrNEQ
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_013201_519141_86B24CEA 
X-CRM114-Status: UNSURE (   6.76  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for Amlogic S4 PWM and related device nodes.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Changes in v5:
- Add devm_add_action_or_reset for free clk when unloading.
- Replace the underscores of node name with dashes.
- Link to v4: https://lore.kernel.org/r/20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com

---
Junyi Zhao (2):
      pwm: meson: Add support for Amlogic S4 PWM
      arm64: dts: amlogic: Add Amlogic S4 PWM

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 207 ++++++++++++++++++++++++++++++
 drivers/pwm/pwm-meson.c                   |  53 ++++++++
 2 files changed, 260 insertions(+)
---
base-commit: 124cfbcd6d185d4f50be02d5f5afe61578916773
change-id: 20240424-s4-pwm-2d709986caee

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
