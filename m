Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789EECCF9E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j82l5V7ARDO+TTWhmdwbRvKeYhqIz8XABCspgCiUmhs=; b=ou4rV7nuowQoox
	bYIfVXprPhrYhJGAUc83iumZZbiQdgbReJ40F8E7O2U5L3DnEqSOJ5xtWBSZFvZGsZ7us+3NG0Yty
	sMu/1cRwBs0cior8CA+HWsOPRryHY2RfmG+WOsZCAhLlyX8lps8vQLGkJkcKOFDcRFYpS8fbk05Kr
	NIuB6NoxlHRvgEuPxU9IoIJoPePg63Gm9FDdqcmNy8awk5AzMoSrTfip2yiSJH6D/LV5RjadWrfXz
	X71DjEJb/Zuvj+9GdAIWjlOF4UGmfKLS85qHRQtnnnwnYQrybGWLLRUnpMGT49BSvlImM2g0biBim
	WcCf2q9DIOvgAS+dCz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stUHr-00000005xFs-2BJR;
	Wed, 25 Sep 2024 15:50:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stUH7-00000005wtt-1RgB
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Sep 2024 15:49:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so60830005e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2024 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727279395; x=1727884195; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37Uo+LYHc9uDv5WXDoS/QUjwvEuwcoXI9DaReh1Q9jo=;
        b=X/QzpTsjWkMRGIitohWsJDn55SNu2r0gzsVZGAILYiVJyLZvplFGSgLVJ94/+HPBVL
         IZ4XyUINnhtETRpNIX3z2Abhq4iBYZL53XiY/m9O6ljFPyk5E4nW3fwBQmXieW5um3SP
         2bNi8I8hChmjwNn/R9kzTYiGqVxFNvLDg6Enb4SUPYumRFTUJ2QR5Bgca2UC/OUXtNat
         0DLGnFtYCEQU3ZgqfEvgDlyLIWPnhO2CEIGMo/vIAbme3FxGS6iJMyM9nHsZwCGgk12k
         DsgeJu+t7ihG7+d4uKjfFa3qCFRwTEFzyZEVMQ+xoq1hyiRfqHtyTxxHqbyvvazN5b9O
         2Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279395; x=1727884195;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=37Uo+LYHc9uDv5WXDoS/QUjwvEuwcoXI9DaReh1Q9jo=;
        b=vMEk7tdd8er0QIC2KatyArx3QhsGg6HbIRC31fgQh/p95ngRWBr2e0tADXQBFvnZJD
         S/d2SxFXZShScRU2kFuj9De9w0OKibJkK/2ioCczUjwMjS/sY7c8ZTcIG1Pk9ker7RkC
         z4TaTPXLAQX5lDA0LbIhVlgGmp7oHfYtp8nbeudrTJDZwNP5hPSLDKgpdp+dcJOzacy3
         BAbOj2qnEAK11f8oaCgQoSVxFf8RQXcQbz66IZ2gvxCqYRkPmswJLfOJZi5Uax7PaWXJ
         dI3biuUESnZ0QU1tcWrxZf+1D7zT643iOIwb9/Ri07/vDeAacCCyIeb3DgsGtqeBtsh5
         4WxA==
X-Gm-Message-State: AOJu0YwNXBVOFdtzoREJ+becsiYwcvncDO4oPOFq+Nqb5+8rVhMXPJFW
	pqs7jDMh3vr6EhK0w22KgYdmjC1kO+xgRvthQuGUlcfWfHXf62uApTvrGEhQVRLxX3F8QICfaR0
	U
X-Google-Smtp-Source: AGHT+IEAS0LwFCOdWh/KDz7RDglph2fRnUmoWH+9kNxDyY1e/NNyCJMDVGvV3rFMYpCS8UvnTzLt5Q==
X-Received: by 2002:adf:f010:0:b0:366:f8e7:d898 with SMTP id ffacd0b85a97d-37cc24cb3d4mr1738982f8f.50.1727279395568;
        Wed, 25 Sep 2024 08:49:55 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:857b:1996:7ede:6ce4])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37cc85a520esm1475699f8f.61.2024.09.25.08.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 08:49:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 25 Sep 2024 17:49:48 +0200
Subject: [PATCH] clk: meson: meson8b: remove spinlock
MIME-Version: 1.0
Message-Id: <20240925-clk-meson8b-spinlock-v1-1-50b7f2d02d7d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABsx9GYC/x3MSwqFMAxA0a1Ixi+gwf9WxIGtqQa1lQZEEPdue
 cMzuPcB5Sis0GcPRL5EJfiE4peBXSe/MMqcDJRTmXdUod03PFiDbw3qKX4PdsPJuNI6Q9R0NaT
 0jOzk/m+H8X0/Z/yGhmYAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9TsPcuUYM+Ss6zqclxdoIjmneAaFI96S82iLraC7iZc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm9DEhF0lAj/EqoEAesyRPssexBVC1QtaRwk44F
 aNx1o9GuN2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZvQxIQAKCRDm/A8cN/La
 hZ5wD/9tJin5d1OCx/JB3/3AG+c8jcCTXnA8GtC+HZV3qQkwmHVe2OuLxH5qD7Ex6p2LQYRjevQ
 ejXwTMK13w2M8pwtuEZNyMgVC5vL9/XC/aNEbuDPVPF4UKCFOieBuL9TVY8ak8cFkjh6tDsvIgJ
 2ozud1HL0QLPPsZ2gSjOdxgPq56dVcVux/EF9TtkeUBF1Njr5IKU/PCWRK3/j7AqhYw4SutZhT3
 XQ3Of3SYPUPnyKdate0pj+y8u8tZJFivol4PzcPab1B9rOO3e7J82WXM4+qO1VBN16rG1FkYdj5
 JkP6cCXz+wxYVSuLAVXDds0H++4kPagnH2eyvU5LimtUf3lXSebQ1JggTuXF2WTTYwnISPt4GYg
 hPp1Qv0jxm6gFfOi4qwZ3qIHciYSR+tUyP/IxEBDsqcuAi3TXx/rn7K9seA/aSCXQ5z9CSCo8Jm
 yUN9G0AJ0kPE4EuvRzxfKWbx/7+nq9v9LM8C8nun8g+LdgFZgsA572bskptKEVpX7BakBoP//bG
 4TfQT1dGoloaX6FGFVTO6ITuvPa7J51E348wtIKLuzum4L9qscHAeqtNV5PiGVHpgUCZi8GYDU/
 QlUwAT47KIXu23155c042aCPWoAQ+6qZ0Bri2IgaU6y7fnOP2p3TLA5bJr86NGMBQyX7yoWczWl
 MV2jovBeM/j28Gg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_084957_432808_181ACD28 
X-CRM114-Status: UNSURE (   8.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The spinlock in meson8b clock controller is now only protecting a call to
regmap_update_bits().

The regmap API already has its own locking system so this spinlock
is redundant. Remove it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 5011768c0f4e..96358bc054b5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -25,8 +25,6 @@
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
 
-static DEFINE_SPINLOCK(meson_clk_lock);
-
 struct meson8b_clk_reset {
 	struct reset_controller_dev reset;
 	struct regmap *regmap;
@@ -3709,13 +3707,9 @@ static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
 	if (assert != reset->active_low)
 		value = BIT(reset->bit_idx);
 
-	spin_lock_irqsave(&meson_clk_lock, flags);
-
 	regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
 			   BIT(reset->bit_idx), value);
 
-	spin_unlock_irqrestore(&meson_clk_lock, flags);
-
 	return 0;
 }
 

---
base-commit: b7fadc62b8d700e14787d26345379e95c86e1684
change-id: 20240925-clk-meson8b-spinlock-abf4cfb22796

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
