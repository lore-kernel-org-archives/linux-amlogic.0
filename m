Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FE2C27C43
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M1QuZAKD5OLimKPPEt4+cUB5hDf4ioIx0s5S3JqIvIk=; b=vAw3XlyDA2likZ
	JW36bVwIaLt+7tf13Aqy4WrLXaEtY75eF/kLZAfpDOg8S9lqvgKkrD/UuS24Nt8/or7e6SQsGkYnW
	77mnGrMNG7pkWovwKxCu/CnJclgRvFhQbe3wJaQ/c4Od0jSh6edH5LKvscR2I3B+warkmRu/qxEpQ
	YSNNyJ1qJtsCVKnQEfjIvqOHTcp5tEO9OWOStGyXMZa9LmWyVTW3lAxuWivr1U2lQ1RdhZlBArYaI
	jJ0CwAloANKK+yMxgm0MJbmmCnv4RozcEIS40DMtHDFZ8mawKv5HlQjFGOEgMGAkfvk0CZ4o3nQ31
	/ONsQZmPfQD7mVWOar3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCG7m-00000003ixP-1n0V;
	Wed, 29 May 2024 10:01:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCG7Z-00000003ipb-2OND;
	Wed, 29 May 2024 10:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72798CE12B9;
	Wed, 29 May 2024 10:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2272C2BD10;
	Wed, 29 May 2024 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716976877;
	bh=a91FxspxlRCfgSu57AGk4ebkLMPvGl9K4zWKW9UVBnU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d+lMm492mXxD569WnYSsqnv7M7bM1QaWTk+8xuzoHl40aQi29EKTiI27LKYczrqQ4
	 89dp7KxTmEgpmPaV6m5FqL3mQm2j6RbUYcwne3EMQFghoCFAnP+wvhzRVpENeofd9x
	 wNs5Cu8fs8BxzF+T8fpn3kYUyEYHigyL0eMleborjI0K3h6TPavimgxDyJuzpdZRB+
	 gnoorDSQyL5ABYGTTduKSO2qQlNiS6Tgh3j4nrnFZ4AbPD65MNEd0JmAs2a+ox2W4l
	 brFX2gvc+4sZH/n2cBIIsHVBLwpW0vQXat0USkHz90jxRs4rJ/v7hJzbXwuflZ+BcQ
	 HfX5HgrUdPKzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FCEC27C43;
	Wed, 29 May 2024 10:01:17 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v6 0/2] Add support for Amlogic S4 PWM
Date: Wed, 29 May 2024 18:00:55 +0800
Message-Id: <20240529-s4-pwm-v6-0-270f63049f20@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANf8VmYC/2WMQQrCMBBFr1JmbSQdk2pdeQ9xEZJJO2BNSSQqp
 Xc37UIRl+/z35sgUWRKcKwmiJQ5cbgVaDYV2N7cOhLsCgNKVFKhEkmJ8TEIdHvZtofGGiIo5zG
 S5+caOl8K95zuIb7WblbL+pfISkhBhEjeOyWdPJnhGjq2WxsGWCJZf0WN9UfURZS2rb32ZofW/
 YrzPL8BBSOvPdcAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716976876; l=1140;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=a91FxspxlRCfgSu57AGk4ebkLMPvGl9K4zWKW9UVBnU=;
 b=/SM+S10/vNZX/3yq/Vv/gVtGFkhrqyd951SBAMUefxD4hriwDQ+A5PQW7I5uW3k6gprCPivv7
 CWOHQUlXHkZC6nYGzPJpAW4cp/lPI3y3ZfKAHt+qBWl+g5u6TG/gmuG
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_030125_827718_8831A9C1 
X-CRM114-Status: UNSURE (   8.04  )
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

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 207 ++++++++++++++++++++++++++++++
 drivers/pwm/pwm-meson.c                   |  49 +++++++
 2 files changed, 256 insertions(+)
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
