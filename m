Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB68CD37B0
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 May 2026 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uAhZ2wjEXn8xoGT/q5gQ7cuvHu1UBiuy02ITqdKS/k=; b=y/erF6UpUelYBc
	WQO4XP6PMg+Sv8RwET/LUiBCkvUs30aaeWLQl+7o5SYsDf9HsRm5Ufu/6Lwpqjy00QnbmN7QCqvFK
	rEa+jvwJQ40zOjrZxscyU5tU4o2k+DhrqgZoSem/t+r06xGhhHFot8lb5Vnbperjq6gNzqaGkW3Aq
	hjiB6lS9xxwWjErsNILX/GT1l1sU3IB5LRu+6YGzB+YxnU9SsUQu7YSpWYIrs7Nkd2WmhVY4EBYAz
	gyJsiAa9cy82fufUcLUdKGAQIX6qvAQy1c3RvKLx3G0JHWsuZZ+b3wkOWX45ougSKQpy2/GMzQX+A
	kosDZ2JMnJ5QksRsWWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFle-00000005raZ-0kLJ;
	Fri, 08 May 2026 07:37:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFla-00000005rUg-3vyQ;
	Fri, 08 May 2026 07:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 229E460252;
	Fri,  8 May 2026 07:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3DE5C2BCB4;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=5P3oB3t/H+M/VWPcldvUPMKT0Ow+fk7RIqkl6O2cI+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XACC5UYVvyKFUulCycU3Xkxd9WIMzOW58lMm1E+C/YcMTgBi7IcvSQ3K45jL/6KuB
	 ihT9Nz8+sMLW0HxY9pC1bfSMu1YtSNh8iFCMAvrELKbN4jr8Ft+tHh2rF5FPXp5zQu
	 OeRH97st8/PLPZcd2nHO9JN8etQiVCcFKjZNsFKd/qPXvWgbQsuoUDT5qee2WPG7IR
	 HcXbKZhQTSYC37BBQ9buX22G8WRQUgiFKCFgPWSEL3BE+h5ox0VnGw1wunLpAJS0b3
	 t/90ZISWWr1y3Bjlp6QyG0hyc/wHaEyA8rXTRwhhbhp1t30S2W4F+JWAUQJpqNV90L
	 NyY4PG2h9Vxzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4515CD3436;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 May 2026 07:36:54 +0000
Subject: [PATCH 1/3] irqchip/meson-gpio: fix incorrect register address
MIME-Version: 1.0
Message-Id: <20260508-a9-gpio-irqchip-v1-1-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
In-Reply-To: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=1007;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=M9zM13CLYOdG+lkNB/tDdOWTKQ5cZ8tHYqZIsNYUo+4=;
 b=qZctPN2tSMJSPBgkkvRhlV2W+Ntn38soTuIOLXMPw7l1tQGc2KIYT5X8SsQjTaTjoAzgCj9i+
 3tfomMZgj8gASyXaPOMb3Rs1X/ws7vR2ku7AfIfYNw9mKkB/EB2f9SQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

When set gpio irq type(level and single-edge) for S4, register address is
REG_EDGE_POL, not both-edge trigger register. This patch fix it.

Fixes: bbd6fcc76b39 ("irqchip: Add support for Amlogic A4 and A5 SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index f722e9c57e2e..74a376ef452e 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -415,8 +415,7 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
 		val |= BIT(ctl->params->edge_single_offset + idx);
 
-	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
-				   BIT(idx) | BIT(12 + idx), val);
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL, BIT(idx) | BIT(12 + idx), val);
 	return 0;
 };
 

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
