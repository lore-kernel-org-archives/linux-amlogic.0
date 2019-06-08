Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDF0C468BD
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE1E2168B
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 18:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBhV2IiP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="unpnaSlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE1E2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IPGVF5lmOZWwEsPff1m+DxvO+tv0ezhZE5RkxGDRmjM=; b=QBhV2IiPGg+d3R
	s7zbMhqShwR+efoYWWkbvBvuqkkX0iEmCL8LBwT9k0DaoABRHM7XQ6CMsFKpXo40S6oFzdBb71FCM
	2OSqZLXswqblZ5+9/dYD3v/NfgZML41z1E1UF5SDtVtbL1rUYS2Qpd5DjCKSE9plP8fGEdPhpjAbn
	1zlkKR1kX2UpyOMkhLKgrqZuXDNqO4uiQX+p/hj7CYHUVAhEuzePCqLf9/aBe6oSYprLL3pPydkzP
	8+83XyOd+GB64hQDqA9/nczrMw2C+Uo1TS8fWIJsNNeBf/uIPiNkR1J8YJIt64to30gcTsF8qIIXi
	e3Qe79c+OvvDVPkN8X2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZfk7-00015p-78; Sat, 08 Jun 2019 18:07:03 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZfjg-0000kB-Rh; Sat, 08 Jun 2019 18:06:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id m3so5235733wrv.2;
 Sat, 08 Jun 2019 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/ZdyCdUpCbl6sdGSUwuqAXTOUbbEuekR+mbdliL/JU=;
 b=unpnaSltvyV5UP5pYykDFAOirz9gbFNoCcnwJl1dgbD8WFjjc81hdFU/1ucbxivIKf
 cFySDh6u4EctBiHKLnFyIEei+ptTRT9L8oLdahFjBVUGZFG0JQBLiJonM6Uuoaq/HOsg
 37BeaBfVcS6VfzHTjqB8dtWzc+6b7TZFKDg0+r8USWQ+w5379puy4ELRPPZPeIp5aFoL
 gtlleazDZyRx+5U+rciCO/NekaHJDgjIom0WFMb4FPYyO10FNTBG2J2w2SrKzHtqkh8g
 AxQnsy/KeoS0Tt2yQ0UXgUPF0FhIROHPa1aWw0kQFLZN4x2DZ6XIXo7UMIuv/5Cl9BPB
 WEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/ZdyCdUpCbl6sdGSUwuqAXTOUbbEuekR+mbdliL/JU=;
 b=aaQbk4VdLa3ixUqj1xCqbZrPqnAYA3pEnob03IbamLnyN770JAr4VmniqSNE9PagE+
 rxwBlKDMNg4oxqVTT32Z/xUK5QfRJSYDYuEKbRJhM71jpOAajXw+0ZByCFlil5QH+I4Z
 /O4TIu/I2/F7Mgc+iJPXB3tMS1SDwba4Pqyd4KEIUEdwrN8wFj8X9JwVOcdD4CMaD0Ag
 SRU2C8QOgf4MH7grfxweXaNKJ6f7LQqENS5RSO8lkaKjz1M+pl38sYphpOY8lf6tlIiQ
 OZfv5pYOvBtgafErTKhoEv3rTScMkeHIDEBzYv9+2SV6o6pebyh2Xq4yRyXzuDLiuc0D
 XRCA==
X-Gm-Message-State: APjAAAWNsdtqe6/DT6vbA5N5jayMUqZG6ebkhB9LjsQTQhOQETq9hK0f
 AwFShyddep5NegfJr535reIpOIne
X-Google-Smtp-Source: APXvYqxgbZeUFxwnIFozRiNMOXGIrJumTj7Cyk+fnTBqPuOxK7ygTJiAEH64GkWJdbzN4lTdbj75Ow==
X-Received: by 2002:adf:eb42:: with SMTP id u2mr36583935wrn.80.1560017194899; 
 Sat, 08 Jun 2019 11:06:34 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id c7sm5143345wrp.57.2019.06.08.11.06.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 11:06:34 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v2 01/14] pwm: meson: unify the parameter list of
 meson_pwm_{enable, disable}
Date: Sat,  8 Jun 2019 20:06:13 +0200
Message-Id: <20190608180626.30589-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
References: <20190608180626.30589-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_110636_896917_D69686EC 
X-CRM114-Status: GOOD (  11.45  )
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

This is a preparation for a future cleanup. Pass struct pwm_device
instead of passing the individual values required by each function as
these can be obtained for each struct pwm_device instance.

As a nice side-effect the driver now uses "switch (pwm->hwpwm)"
everywhere. Before some functions used "switch (id)" while others used
"switch (pwm->hwpwm)".

No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 5fef7e925282..3fbbc4128ce8 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -183,15 +183,14 @@ static int meson_pwm_calc(struct meson_pwm *meson,
 	return 0;
 }
 
-static void meson_pwm_enable(struct meson_pwm *meson,
-			     struct meson_pwm_channel *channel,
-			     unsigned int id)
+static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
+	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
 	u32 value, clk_shift, clk_enable, enable;
 	unsigned int offset;
 	unsigned long flags;
 
-	switch (id) {
+	switch (pwm->hwpwm) {
 	case 0:
 		clk_shift = MISC_A_CLK_DIV_SHIFT;
 		clk_enable = MISC_A_CLK_EN;
@@ -228,12 +227,12 @@ static void meson_pwm_enable(struct meson_pwm *meson,
 	spin_unlock_irqrestore(&meson->lock, flags);
 }
 
-static void meson_pwm_disable(struct meson_pwm *meson, unsigned int id)
+static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
 	u32 value, enable;
 	unsigned long flags;
 
-	switch (id) {
+	switch (pwm->hwpwm) {
 	case 0:
 		enable = MISC_A_EN;
 		break;
@@ -266,7 +265,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return -EINVAL;
 
 	if (!state->enabled) {
-		meson_pwm_disable(meson, pwm->hwpwm);
+		meson_pwm_disable(meson, pwm);
 		channel->state.enabled = false;
 
 		return 0;
@@ -293,7 +292,7 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	if (state->enabled && !channel->state.enabled) {
-		meson_pwm_enable(meson, channel, pwm->hwpwm);
+		meson_pwm_enable(meson, pwm);
 		channel->state.enabled = true;
 	}
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
