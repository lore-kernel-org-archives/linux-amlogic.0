Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D46C282C6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Mar 2025 07:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2qBL652nwcnuEU2E/XhvVMmRG32ehtWxWl4dH/+b0i4=; b=RQQOkN0lhJpHba
	hoPqkrSfVP9tAPVHMvDyUZb0wS9X5aqoJBtB4aanQxf25je7ov+hZy/CofPu7z376qEs5B+mEfXSV
	g1FmYbeXQmOnpiWA4dD63LcOF6aZKohqRvkduNtVpja6tZcbCL5HxW042wFDkShdC+b6fXMOlRmgP
	8yioEJ4jyZsf+DhxJCwgQbNB6NvquAMoBbEoaGVmxSDVJ3sbeO/kyFD9lwJ6BCXUYnS0M3uakgblw
	4UKes8HmXTABD68whR3i4ZOBtVqOTOqNVmpBA54TY1rZFR7i/Mrs/Tj5wWaJxaemwHJiif09h/4Fe
	FIn6+KqHK+PGGFW5KNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0c8-0000000HSrC-3dRM;
	Mon, 03 Mar 2025 07:53:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0c7-0000000HSr3-0RNp;
	Mon, 03 Mar 2025 07:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4ADD611CB;
	Mon,  3 Mar 2025 07:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05138C4CEE4;
	Mon,  3 Mar 2025 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740988402;
	bh=5Fy1JHZwgirUMzgviaoNnoeqtcdMUPjkKfMSR5S3E1U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gz50eZ79yZpQQ4AlK7w5ZxlkSinjqxwbRqqnh+Ktb9l76fhDJU841cYkRnJvHgluW
	 AK8NP3k+0DUAn8zZsjJhu3+19L3JLAYNE4qcSuFU4iMnRAsEnd5JljG503MrS5cylW
	 iJRN7/Yt/vlGkj1TQNSy1+F75kXw4IdBzd2mjmWk9rbgVKQTiQ6gPSB0W6/0741hHo
	 J2zzjYc7UWJCxpYXzFCj+3H8u27sizt95iE0wGym8mNqiF1FbRQZQvf3+rBY32Pz3E
	 4Du6Ylb3icoap3+GzS173u7Nn8UXvGQac2QrRyK2+WITeIpBWY3IxQ58/p6SsU6XIC
	 hMbI/8ku0iMXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8269C282C5;
	Mon,  3 Mar 2025 07:53:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 03 Mar 2025 15:53:20 +0800
Subject: [PATCH] pinctrl: meson: fix pin input property for a4
MIME-Version: 1.0
Message-Id: <20250303-fix-a4-pinctl-v1-1-6579888b4272@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAO9fxWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNj3bTMCt1EE92CzLzkkhxdkyQjQ9M04zRLEwsLJaCegqJUoAKwedG
 xtbUAl0BJTl8AAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740988400; l=1905;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=8KAlxGwDBrTjecjGM2UBSMoeZW/HVDXc337RfYbdpLs=;
 b=lSCzkCPO4V0PMaYz3RHyLMVvoDIJFa+ttEleYaHx84tqa5hPPEuIuhBgqPVQxEuCkdXP9TslC
 bIGD/OzMizrAHgH73PTjU+OBpqW5wF23nSa2kAG3qyHAmbGpcSMfPcW
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

The register of pin input attribute means the opposite.
value of reigster meaning is 1 for input and 0 for output.
So fix it.

Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index a5218e8f1e03..35d5540b8eaa 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -775,7 +775,7 @@ static int aml_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	if (ret)
 		return ret;
 
-	return BIT(bit) & val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+	return BIT(bit) & val ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
 
 static int aml_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
@@ -785,7 +785,7 @@ static int aml_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
 
-	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
 }
 
 static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
@@ -796,7 +796,7 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 	int ret;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_DIR, gpio, &reg, &bit);
-	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), BIT(bit));
+	ret = regmap_update_bits(bank->reg_gpio, reg, BIT(bit), 0);
 	if (ret < 0)
 		return ret;
 

---
base-commit: 73e4ffb27bb8a093d557bb2dac1a271474cca99c
change-id: 20250303-fix-a4-pinctl-4b215f3f9488

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
