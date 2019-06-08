Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3485EC28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F332146E
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cab84VZr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Ai7/QxvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F332146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVN36LJgQaWeFCgywdg9HE2+6SjPJJwu6x//BF4yO+4=; b=cab84VZrvM7ryu
	DCWfOCuvYKTVxkVJw5CPxpppVJPm+te/CGRpeA8PgYmKm88+VyUTmZcHi3ymd4p9bSOeOLdcsTn60
	kVxGX/tx5ceU7FFxg2K2x53G7bDp9cB85JwuOgXD0vl1eSkNYBtJFGfznCx4VV25JVYJUIFhQU1uo
	q6m4ZrJ5FCYriCV7ZjgXDTteIF4HbDga88PeteopPVmBfyKcyFMUxVfOiXd+NvEqAe+lxZIH3Oqyj
	lmDw/LL12sJ/ReNr9ft/utFkOgCVW8YgdRcBcVm3+/DR+k0WVxWwSk3bXXu8lPDxiNHisERwDScZQ
	8c/lFjUpsOyV2UmwDmKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfkq-0001mW-Ac; Sat, 08 Jun 2019 18:07:48 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfji-0000l1-EG; Sat, 08 Jun 2019 18:06:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id f9so5193966wre.12;
 Sat, 08 Jun 2019 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwMt4DN+k+wf0lkZogt5PADN1rzK1u4y6aP41xI0QnE=;
 b=Ai7/QxvXeXJfCjaGIQtUgT0iNOxXJwKg0n0kBlr3qjXO5upyFeXiPfrcnxSDErQlqt
 z3CcgSiDYliWk8qfwFQfdIGenTNvz7W3LmWvsgjivpjVimSrOT9/iTq29lttJxYWO3in
 TpBorSmDyJ58Ey4jcxg/5EGToYDZRxFctSUgdmjxLPkNHZohT/Pi5zEuz7KJ07xmnqqq
 FyPbfsiE7l0h+XwUplRemSXg57k3ZTNpsVu9wiurZXxg7FvIqpiYpJKePoCK5iZmPX2/
 sVVunTRAz/+8AtGYFz60gaSG1xWcbhYBZL0/VbTP7KjG5E84GG3PsY1iXemJjHV76kef
 hl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwMt4DN+k+wf0lkZogt5PADN1rzK1u4y6aP41xI0QnE=;
 b=sXs2wQlpWp9gbeDc4xZyeivOomkP+hwQAWs9y8eafwhL2rzfjpw3v2+Up5k9Klg05m
 +39bXYuSGLDUMEdZdfUtEl6W0czffZ/3RXoauTzmwvWDvyTisrMTd3c95HEXlZru3r0r
 nafEcIfpZps02qfNZnL9+hbddyyAm+pq58ElfHjTwYSH/9uc36szf6HMoBxMcEtGQpb1
 tab9jQ7wqAZI55ucQgMVJi6plqNZx620036/XjIy7m2CEZXRHl5rvXyo75Of3XKuUTG5
 ER0zBChV17MMYWKCQQx247eEZIQwchQN+X828ekgenGpH3DeF+JkbYETDNq2otrbjEH6
 BW4Q==
X-Gm-Message-State: APjAAAWyV2GChlllA4gwhKcGERuKHTo0w9yGjjiETLncJjtPssBXxvHC
 zrHamfsiFYpCq7GbyVm8eK/x5Des
X-Google-Smtp-Source: APXvYqw7+qy9TgcaIMEP5Xeg6k3+WyCNQC4Ctm4DlNXGe2zSe+3cQwnCPGb4yd8IR61g60M4nm9H7Q==
X-Received: by 2002:a5d:4cc3:: with SMTP id c3mr11748878wrt.259.1560017196918; 
 Sat, 08 Jun 2019 11:06:36 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:36 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 03/14] pwm: meson: use GENMASK and FIELD_PREP for the lo
 and hi values
Date: Sat,  8 Jun 2019 20:06:15 +0200
Message-Id: <20190608180626.30589-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110638_478321_CEB44A0D 
X-CRM114-Status: GOOD (  11.35  )
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

meson_pwm_calc() ensures that "lo" is always less than 16 bits wide
(otherwise it would overflow into the "hi" part of the REG_PWM_{A,B}
register).
Use GENMASK and FIELD_PREP for the lo and hi values to make it easier to
spot how wide these are internally. Additionally this is a preparation
step for the .get_state() implementation where the GENMASK() for lo and
hi becomes handy because it can be used with FIELD_GET() to extract the
values from the register REG_PWM_{A,B} register.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 35b38c7201c3..c62a3ac924d0 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2014 Amlogic, Inc.
  */
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
@@ -20,7 +22,8 @@
 
 #define REG_PWM_A		0x0
 #define REG_PWM_B		0x4
-#define PWM_HIGH_SHIFT		16
+#define PWM_LOW_MASK		GENMASK(15, 0)
+#define PWM_HIGH_MASK		GENMASK(31, 16)
 
 #define REG_MISC_AB		0x8
 #define MISC_B_CLK_EN		BIT(23)
@@ -217,7 +220,8 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 	value |= clk_enable;
 	writel(value, meson->base + REG_MISC_AB);
 
-	value = (channel->hi << PWM_HIGH_SHIFT) | channel->lo;
+	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
+		FIELD_PREP(PWM_LOW_MASK, channel->lo);
 	writel(value, meson->base + offset);
 
 	value = readl(meson->base + REG_MISC_AB);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
