Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6360BC27C55
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 02:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sn4wPMMycydcjKVEc4Yg6lEkArw0oTktBZhvrdE27RU=; b=ZZcvcstgiECnmh
	VOUppZl0tM4mvE/u2zgwsXCN6BTXo0MQtxtd8nFvb+bOmu8NAIIl7tmhk1U4IoWZp2M3Z7XkT+5C/
	rOutbbKa2wIKhy/lB0R5161MGcR5rK9qxz0X9Q2XXc3QGVWDyUQDtDRnPFCgKcbIeGyb/HmXE+u9X
	9rfu5k4qv37IYm2vwoKi9p5GWuShcKnCEAfEFoaiGCSRGlnok6PjPf2zkf5Q654xdPj6wOxFJhVam
	kpsE4GPzFZbJXb8fmGsq7jsR21NVx9yFebr4nts9CNXZ50AWM8xagncEnizHHe0ZdBpNc/SDrcqmX
	aKkji0/4d2cg4Rc0heiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEgeC-00000004UPW-0EGZ;
	Wed, 05 Jun 2024 02:45:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEge8-00000004UNI-3bsW;
	Wed, 05 Jun 2024 02:45:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9191614D2;
	Wed,  5 Jun 2024 02:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E640C2BBFC;
	Wed,  5 Jun 2024 02:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717555500;
	bh=cLv+hU1PT81IObLXKDBLkjzJCQUWh86T/crgT79hhdQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MIy5GOnEK6nKk2Ux3Q047E5CQBY+tDMZZtlT0TfWfIONIAtgrgT2dtEj4B0A0gXth
	 ATnJJOmhR1L4P5k9B2zNPFqeW49DipSFPr5rQlt2AlDfmumwrB089HWregOGgnDo6N
	 aw2WF3bfDIFP6ZLyI+GLV4a4tQbu3eamtY5Rw5e2vO03856Dzlu9X0FW3Xe3ZubyqU
	 f7orPuu09sePvZgcG9M/nmlnQeTaCHTbdllWXDBwjCz4HpGxBltNw4gwRFyGTYbBZC
	 Zgmii/NFKO0yr6Wf8d8lN0jBjvlzUMG4lW5Hbj/OWuqBzdzD7quKknB39WFLpc6pqT
	 h/Z2t+gcntX8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54219C27C54;
	Wed,  5 Jun 2024 02:45:00 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v7 0/2] Add support for Amlogic S4 PWM
Date: Wed, 05 Jun 2024 10:44:54 +0800
Message-Id: <20240605-s4-pwm-v7-0-e822b271d7b0@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACfRX2YC/2XNTQ7CIBCG4as0rMVMp5SKK+9hXBAYWhL7EzBV0
 /Tu0i6qsctvwvMysUjBU2TnbGKBRh9936VRHTJmGt3VxL1NmyGgAIGCR8GHZ8vRVqDUSRpNxNL
 jIZDzrzV0vaXd+Pjow3vtjmK57hKj4MCJEMk5K8DCRbf3vvbmaPqWLZGx/MIS8w2WCYJRuSudL
 tDYPZS/UG1QJogVOFmAUA7/fpzn+QNi2SjkEAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717555496; l=1446;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=cLv+hU1PT81IObLXKDBLkjzJCQUWh86T/crgT79hhdQ=;
 b=wMU0AqOpojggxkgYVyGOUVH5wqws3gXc/InRdro0/5QWNYeapYskxyO7vDK8TdYFIDz8lxoLx
 /y4sXyNIrCXA+75/yXMzNRFBFodb0WC5XuzjZj7sbi+ABfEtmyLxcxL
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_194505_042909_4F5CD985 
X-CRM114-Status: UNSURE (   8.11  )
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

Add support for Amlogic S4 PWM, including the driver and DTS.

Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
Changes in v7:
- Put devm_add_action_or_reset() into the for loop.
- Remove the error handling of meson_pwm_init_channels_s4().
- Remove the repeated device node 'pwm-a-pins'.
- Some minor fixes and improvements.
- Link to v6: https://lore.kernel.org/r/20240529-s4-pwm-v6-0-270f63049f20@amlogic.com

Changes in v6:
- Rename 'pwm_meson_s4_data' to 'pwm_s4_data'.
- Rename 'meson_pwm_init_channels_meson_s4' to 'meson_pwm_init_channels_s4'.
- Adjust the order of the device nodes according to their unit addresses.
- Some minor improvements.
- Link to v5: https://lore.kernel.org/r/20240521-s4-pwm-v5-0-0c91f5fa32cd@amlogic.com

Changes in v5:
- Add devm_add_action_or_reset for free clk when unloading.
- Replace the underscores of node name with dashes.
- Link to v4: https://lore.kernel.org/r/20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com

---
Junyi Zhao (2):
      pwm: meson: Add support for Amlogic S4 PWM
      arm64: dts: amlogic: Add Amlogic S4 PWM

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 199 ++++++++++++++++++++++++++++++
 drivers/pwm/pwm-meson.c                   |  36 ++++++
 2 files changed, 235 insertions(+)
---
base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
change-id: 20240424-s4-pwm-2d709986caee

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
