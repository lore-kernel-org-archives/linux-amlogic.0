Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC508C3ABDE
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 May 2025 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dQRe7A8WAVojHU77S83q2ZzaddSeBMZRQzxSjlpUVwY=; b=gEyOs6NoR/iqRY
	U4i73kF8sPFHNShtukGrmZDakwYFDpXIU5yZCGuvnD1+Tjv9fI0congV33wQQytP8xFWOqMSCh7zN
	392fEa+46vR7QWnnyOpwweNxAY8LAROJs5mVsBFiRltjjHKU9uaWS/CJQg2vQnyVwBWeMNtApX1lY
	w3v1ESN6FMf5Z9ptIn2w1QVxS3uLAFNhQYZZYw03rQWDWV/qpaMmEJJfUk1ZZVAxVr3sEinxb5PeH
	m1h08/K4s0wUjth+CSTxVLmVmfGy+H7jxOgAoIxl6LYt5K+vLZzM/4Oazfa3imFX9oRuUsMEg7dJQ
	Ef4BwFIblFkphQnDO6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF69d-0000000EEyL-1a76;
	Wed, 14 May 2025 07:03:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF67c-0000000EEbw-1AwD;
	Wed, 14 May 2025 07:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5931461F1B;
	Wed, 14 May 2025 07:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1B8C4CEF0;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747206103;
	bh=UCvwzxK/bPYbO8uWFcLJf6fdSxKUc+Dc5+81ionsKhM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P7mXiIXnzebaTaPNlhq/ZZGro/gSv7BlGzq3xvtbAJqbveA7erQ3vXgAfTCk1ezWk
	 uUDWA7co+hpz33FeQ1LfvEO26QhinP6Yg6fn4Nd2GhtR6gODmX8AiQGu7GvL5lNhTP
	 SZQyWCLVD6BxBEHj/6RKtHm+oICmBnn9/n6+1AT9A9a9f9PFwmRjh9Q/K/XjoKor16
	 8CZENGKEMJIggj86RIVgqfBw4AAyS9k5kGLsCw+BdLk1yEUeGvD4Us9UYbHu0Vtf+f
	 aslvduTCM5MNaTqeyjK37hjKgHk5uKTKSDEV4IxWrFGpMtgm/RRTZo2aEb4KvwWUi1
	 8LlafgVcMmoAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D566C3ABD9;
	Wed, 14 May 2025 07:01:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/8] Add support for Amlogic S7/S7D/S6 pinctrl
Date: Wed, 14 May 2025 15:01:27 +0800
Message-Id: <20250514-s6-s7-pinctrl-v1-0-39d368cad250@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMc/JGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0MT3WIz3WJz3YLMvOSSohzdxDTD1KSURAuLRJNUJaCegqLUtMwKsHn
 RsbW1ADAKQIJfAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747206100; l=1883;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=UCvwzxK/bPYbO8uWFcLJf6fdSxKUc+Dc5+81ionsKhM=;
 b=9zDdZ22pvS5vNX0fUz5ZoCaN6HYJO/cDbnhKPhZi+P2y4KnpF3VzjKvUGxtZryG6WooZyc0AW
 PV4rUrCHdZXBqRMOSsRbuUQorKcwea07dQkxMWVfTTRUIFci2gJQl/k
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
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

In some Amlogic SoCs, to save register space or due to some
abnormal arrangements, two sets of pins share one mux register.
A group starting from pin0 is the main pin group, which acquires
the register address through DTS and has management permissions,
but the register bit offset is undetermined.
Another GPIO group as a subordinate group. Some pins mux use share
register and bit offset from bit0 . But this group do not have
register management permissions.

In SoC S7 and S7D, GPIOX(16~19) mux share with GPIOCC mux register.

In SoC S6, GPIOX(16~19) mux share with GPIOCC mux register, and GPIOD(6)
mux share with GPIOF mux register.

Add S7/S7D/S6 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (8):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S7D
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for S6
      pinctrl: meson: a4: remove special data processing
      pinctrl: meson: support amlogic S6/S7/S7D SoC
      dts: arm64: amlogic: add S7 pinctrl node
      dts: arm64: amlogic: add S7D pinctrl node
      dts: arm64: amlogic: add S6 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |   9 +-
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |  97 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |  81 +++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |  90 +++++++++++++++++
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 111 ++++++++++++++++-----
 5 files changed, 363 insertions(+), 25 deletions(-)
---
base-commit: aa94665adc28f3fdc3de2979ac1e98bae961d6ca
change-id: 20250514-s6-s7-pinctrl-af1ebda88a4e

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
