Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFC9C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:05:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2B3B214AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GPmjLtQh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K83QhhoM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2B3B214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XtHaWaJb4e9G28pHUDTrPWq36o2KlxDr89o/73sRyds=; b=GPmjLtQh9Q8xkQ
	LbMkh5tVXbYCuWITXCkg2kvwimO0LgB5UGADVBs9GpIDuCNJ0TtEcpCzGCgXTTrFoJHj5iDWgVN5h
	GbprxmgVsz4rfR2VJbCj94UefOnJVHpT9rzRYuyns9NLpdpg7ZsZYhf87IQ1AXuw6TN264OcWJO0y
	+FjYIgDCGCEvM0cmI9ICUlo5ryV9b1bNCsymrF7xPV+2BaM4s9u3h0jK7rB5plgIsYucRTfObpChX
	W+9m4o9pgKzW9/IN9iNpGgzyqsMHwbPT1wgFr0zeMGM1FeqnJNCaYS2fz8pf/XVhCan6jybPhSOXp
	wZInMW66hFR56oPn8vUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZge5-0007Cz-Ha; Sat, 08 Jun 2019 19:04:53 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZgdZ-0006fP-52; Sat, 08 Jun 2019 19:04:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id p11so5286465wre.7;
 Sat, 08 Jun 2019 12:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0uN4hjdcek7T4CnTm0X7zhsU8Gz9i5WRbo0q2IpM0eE=;
 b=K83QhhoMl7XG/s5R65AgUYKNczLOaFu5RhzAYBEZt9OrF+5boUd9Ty2rFKyTzucopf
 iRgMlgPae3qmUXUMC3Ek5RrgGBRUWEIkEedcaFywYhr9Mcat8Tu8T1eSN7QYWjyJlXiw
 rZQqvFM9QKSpPqal/OOA8a55JaTVZBxQoXNkp08OZ4KXZl9f1ci6wSztoY3LD39/gBw0
 RP1cIVMf/jZPx8Mo23JPuw999aQgWEjjGCDghte/spyFR0kkkN0UqU0ZL0YD9zMMZI3N
 5cOY7M5FIpFBxo/hfynwjLHZ1quTlYSGMITJdawIv6LDMRzPeqq7Qg7px7lzwDiCjG+O
 oZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0uN4hjdcek7T4CnTm0X7zhsU8Gz9i5WRbo0q2IpM0eE=;
 b=UpNmRXr7WFMMS2eXJB/ze45emW0wQexRrG22xA1NLQZlh7BBfZHkmZ5YKYol/m2alQ
 pBOUZe0J+HGaJGnrjC26soIevb75vDZvZ+iVp5LhcPHtUMyf7S5NwwGRjQ3dibf0bY4U
 1eOm/TcWfQ+H6d4zPvcUkpjzJxGcW7V63N5EKDAgnLsTSZHc8oClwuwNrauSqA6UqboZ
 zsAvypDj+plfIpQsvtMGRXvjxCAu7oW8f5YXlA6R4udzJvZuK/Jh+qafJ6OH6B0lniTu
 kptPg4GbZ1JAcTb71X/53vmFt8h396O4iZRwC98CNRaNKyPUtG9gT/hNtHS0VJpZs/cA
 CVfw==
X-Gm-Message-State: APjAAAVxcdRRMNw52xjRnQR5mz/KAuzRJxOWf1RKcvpzbui8lrYTZGQE
 XqPGwKMAy0oxyVMb9LdR6/U=
X-Google-Smtp-Source: APXvYqxOMS9p0YK5H2hrquYQ7S5h/mFRESHFO+TjeSaqtatzIc19t054BVKriOz2LhSzH4Mg/Zfq5Q==
X-Received: by 2002:a5d:4a82:: with SMTP id o2mr21766445wrq.154.1560020659418; 
 Sat, 08 Jun 2019 12:04:19 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id t6sm5655062wmb.29.2019.06.08.12.04.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 12:04:18 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Subject: [PATCH v3 2/3] irqchip/meson-gpio: Add support for Meson-G12A SoC
Date: Sat,  8 Jun 2019 21:04:10 +0200
Message-Id: <20190608190411.14018-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
References: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_120421_194113_9B08E716 
X-CRM114-Status: GOOD (  11.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

The Meson-G12A SoC uses the same GPIO interrupt controller IP block as the
other Meson SoCs, A totle of 100 pins can be spied on, which is the sum of:

- 223:100 undefined (no interrupt)
- 99:97   3 pins on bank GPIOE
- 96:77   20 pins on bank GPIOX
- 76:61   16 pins on bank GPIOA
- 60:53   8 pins on bank GPIOC
- 52:37   16 pins on bank BOOT
- 36:28   9 pins on bank GPIOH
- 27:12   16 pins on bank GPIOZ
- 11:0    12 pins in the AO domain

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/irqchip/irq-meson-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 7b531fd075b8..7599b10ecf09 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -73,6 +73,7 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
 	{ .compatible = "amlogic,meson-gxbb-gpio-intc", .data = &gxbb_params },
 	{ .compatible = "amlogic,meson-gxl-gpio-intc", .data = &gxl_params },
 	{ .compatible = "amlogic,meson-axg-gpio-intc", .data = &axg_params },
+	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
 	{ }
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
