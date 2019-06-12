Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72967C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45636206E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 20:02:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aat36jtm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jNFq/pmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45636206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+of4uCkoK9TjQ0Le4+tBhW/70FSAYz0ZLjhBzYZcajQ=; b=aat36jtmsleUDR
	+I8+Qag/+nzlguFjOVl0+OIEZ/9D4l1BQry24nFoxt4+tJZ+OC2DUv4XXyc4SJqK8E1QhlsMzIzcF
	wzk9jPfnOTFPgoQ0xlZztd6xFisAvqDGVXPGwnxzZ1jnJkLeVpri2dmq7ieEacxTyAzzMmm5RU5mW
	J/fh7mb+Ugj3R8Z27n7WO8q9xXcmyLL0J/AXWgpmOY8z/BQ2EEJZsWBZeoWmoqJaJoB/imwTe9hFL
	ZLzOxaRPNjNKm/cEFwHdEnBxhWBVn5ZxAFnvTaZan1AwQ+s256KvXEO7BL7bmmkTexCfEIf2P5crw
	0pnlejKMip1loOE7kZPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb9Rq-0000EK-CS; Wed, 12 Jun 2019 20:02:18 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb9PJ-0005KL-5E; Wed, 12 Jun 2019 19:59:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id v14so18221406wrr.4;
 Wed, 12 Jun 2019 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WmhESMoCKmN2VCpBR/glTbqaZkwERllWdls/jyzy234=;
 b=jNFq/pmc6UuxWNKYRJ7YOy5xTK+3X8f6NqVVDAOh3JhfyFafpTVtQisSxKgRqw+FDh
 HUHiV0Yg8j9DGkYIP3HHFx25O4XUX+MWyWZ5BFpSsyggGoOSy9ET8zoC7YXJ64gm3cyb
 z5VUssL/wxiakK19YOTTjzH5iAfnvXjqchLOF+/ISwN/rLCminwFiXjTp+5iLSyXtYCb
 xarh94bOtg/vyMf/Wt5pqokvURx0lpk4/bepN//f5+SpctvI21TELlEt6DZs2/3YglR+
 PVhEX3jcXY1YVvSmZV/kCFLhwWgttHifogdLirkJtmTfcpepK1V1FdNSJQckej6DeE6L
 e4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WmhESMoCKmN2VCpBR/glTbqaZkwERllWdls/jyzy234=;
 b=dbFb6pBd5kNahvZ6hQow0WYMMPvcA9J6JjXAvuUUvJzuOW6ZhGytQsMvuQwJQcwnf8
 zI2zY1s/PwWke5k7CjoV8Scmi0yhdgQBA5MA396QDPL2C7K3yNmBp21gV1sfVMRceEPl
 iDv6ktAT3zf0XmRgXhjbzPnmfooZewC6x30tzSRfJEC9PnsCM8LWjZ64WQQxSc5+43b5
 p19yQUp+v57hK3MrX7AUPxubfQgY86CPjmDiP+aemiIP8cWZm2hZGDvslpiLb+ZhDuas
 2ghxXkqAd703BqiNTyZ+Qi4VbSbaYy0Cya/B3vpDEacIn54L6a2UvSJ1XgtZhEWtPbxf
 Ob4Q==
X-Gm-Message-State: APjAAAX5iJydseDttdgtHjtU5l5qpGT1CmIEfhCGqGgzesekJ2pBY8SZ
 b2xERCM9t3TQDws+pvsDQMoRE46z
X-Google-Smtp-Source: APXvYqwDXYbrbZWWXJOe2OHVubgbp/JwKfnL5TDreu8P250Jqh3Wt3KiG/hzROJyJV02fC0qFTSV0Q==
X-Received: by 2002:adf:db46:: with SMTP id f6mr40877316wrj.330.1560369579500; 
 Wed, 12 Jun 2019 12:59:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f10sm1026745wrg.24.2019.06.12.12.59.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 12:59:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com
Subject: [PATCH v3 08/14] pwm: meson: add the per-channel register offsets and
 bits in a struct
Date: Wed, 12 Jun 2019 21:59:05 +0200
Message-Id: <20190612195911.4442-9-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
References: <20190612195911.4442-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_125941_296776_296A48FB 
X-CRM114-Status: GOOD (  13.41  )
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
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Introduce struct meson_pwm_channel_data which contains the per-channel
offsets for the PWM register and REG_MISC_AB bits. Replace the existing
switch (pwm->hwpwm) statements with an access to the new struct.

This simplifies the code and will make it easier to implement
pwm_ops.get_state() because the switch-case which all per-channel
registers and offsets (as previously implemented in meson_pwm_enable())
doesn't have to be duplicated.

No functional changes intended.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 90 ++++++++++++++++-------------------------
 1 file changed, 34 insertions(+), 56 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index a4ae3587a3ce..ac7e188155fd 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -39,9 +39,27 @@
 
 #define MESON_NUM_PWMS		2
 
-static const unsigned int mux_reg_shifts[] = {
-	MISC_A_CLK_SEL_SHIFT,
-	MISC_B_CLK_SEL_SHIFT
+static struct meson_pwm_channel_data {
+	u8		reg_offset;
+	u8		clk_sel_shift;
+	u8		clk_div_shift;
+	u32		clk_en_mask;
+	u32		pwm_en_mask;
+} meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
+	{
+		.reg_offset	= REG_PWM_A,
+		.clk_sel_shift	= MISC_A_CLK_SEL_SHIFT,
+		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
+		.clk_en_mask	= MISC_A_CLK_EN,
+		.pwm_en_mask	= MISC_A_EN,
+	},
+	{
+		.reg_offset	= REG_PWM_B,
+		.clk_sel_shift	= MISC_B_CLK_SEL_SHIFT,
+		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
+		.clk_en_mask	= MISC_B_CLK_EN,
+		.pwm_en_mask	= MISC_B_EN,
+	}
 };
 
 struct meson_pwm_channel {
@@ -194,43 +212,26 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
 static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
 	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
-	u32 value, clk_shift, clk_enable, enable;
-	unsigned int offset;
+	struct meson_pwm_channel_data *channel_data;
 	unsigned long flags;
+	u32 value;
 
-	switch (pwm->hwpwm) {
-	case 0:
-		clk_shift = MISC_A_CLK_DIV_SHIFT;
-		clk_enable = MISC_A_CLK_EN;
-		enable = MISC_A_EN;
-		offset = REG_PWM_A;
-		break;
-
-	case 1:
-		clk_shift = MISC_B_CLK_DIV_SHIFT;
-		clk_enable = MISC_B_CLK_EN;
-		enable = MISC_B_EN;
-		offset = REG_PWM_B;
-		break;
-
-	default:
-		return;
-	}
+	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
 
 	spin_lock_irqsave(&meson->lock, flags);
 
 	value = readl(meson->base + REG_MISC_AB);
-	value &= ~(MISC_CLK_DIV_MASK << clk_shift);
-	value |= channel->pre_div << clk_shift;
-	value |= clk_enable;
+	value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
+	value |= channel->pre_div << channel_data->clk_div_shift;
+	value |= channel_data->clk_en_mask;
 	writel(value, meson->base + REG_MISC_AB);
 
 	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
 		FIELD_PREP(PWM_LOW_MASK, channel->lo);
-	writel(value, meson->base + offset);
+	writel(value, meson->base + channel_data->reg_offset);
 
 	value = readl(meson->base + REG_MISC_AB);
-	value |= enable;
+	value |= channel_data->pwm_en_mask;
 	writel(value, meson->base + REG_MISC_AB);
 
 	spin_unlock_irqrestore(&meson->lock, flags);
@@ -238,26 +239,13 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
 
 static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
 {
-	u32 value, enable;
 	unsigned long flags;
-
-	switch (pwm->hwpwm) {
-	case 0:
-		enable = MISC_A_EN;
-		break;
-
-	case 1:
-		enable = MISC_B_EN;
-		break;
-
-	default:
-		return;
-	}
+	u32 value;
 
 	spin_lock_irqsave(&meson->lock, flags);
 
 	value = readl(meson->base + REG_MISC_AB);
-	value &= ~enable;
+	value &= ~meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
 	writel(value, meson->base + REG_MISC_AB);
 
 	spin_unlock_irqrestore(&meson->lock, flags);
@@ -309,18 +297,7 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (!state)
 		return;
 
-	switch (pwm->hwpwm) {
-	case 0:
-		mask = MISC_A_EN;
-		break;
-
-	case 1:
-		mask = MISC_B_EN;
-		break;
-
-	default:
-		return;
-	}
+	mask = meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
 
 	value = readl(meson->base + REG_MISC_AB);
 	state->enabled = (value & mask) != 0;
@@ -458,7 +435,8 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		init.num_parents = meson->data->num_parents;
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
-		channel->mux.shift = mux_reg_shifts[i];
+		channel->mux.shift =
+				meson_pwm_per_channel_data[i].clk_sel_shift;
 		channel->mux.mask = MISC_CLK_SEL_MASK;
 		channel->mux.flags = 0;
 		channel->mux.lock = &meson->lock;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
