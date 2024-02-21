Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925E5C48BC3
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTsu6kKrKa7fx1Vj+86CZY+GcKk1uUFjLw2hxHEIVBo=; b=p6lbtVwSbmXrpx
	6tYqh0P6k/p+sPhIBXjCkWBwm0PTAS66YybhAu/pdBdhi1dkUUWBRtXIBuLwoMHC5GAgBTGMi4Vxy
	0suir4Y7/yDjEEeaC8iYnhblqI1qQrM/ENnabcvM+4xB2Ucpxc7P9ptf6ooSDy/F2a414Yf5drU4a
	irLeSEcoy+qDTF73Ea3fGBxTqtPSZdsFtKqnO+alvC1b4KZvH421aaTxxN91jisXjuXQyAmvdCkye
	eRNYUsdjEhJzS40ZoFZzbvCD2DYJzF25D84gmBO/kOaQ/FtVaia2a7f09sQtE8mw4fwVWTS+vVARK
	CsjCLQ0LM/CwFhmQez/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGe-00000001QRm-0sjX;
	Wed, 21 Feb 2024 15:12:16 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcoGa-00000001QQ0-0k5Z
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Feb 2024 15:12:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41272d42207so9088995e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Feb 2024 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708528330; x=1709133130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phRSbqPQtjTITh3A7Rz+mg0BFNfzjESlEJDyy2/XwFI=;
        b=ehg7OiQUB39OZzoukgYV2IRJZiVhyGohObqcpbuVfpPVgLh7EFpaFHvZfu0YrWn2CZ
         NhHEJ/9FMDlr7Ensdr7qGnPcqkSWtUwAYlMRdK7lHnRO764Sq4S5XrNj350GRKmyosKa
         13DJz3Aaz3EtMpQP7p/RqhpiBov4i5wsDj36AvKkp3xPTI9n6GZ2OE66ER0eu5y+s34/
         RMrntgwajHATbMXQXmFbzyZZirZ8rWbQj3KPAl4xO5HBDru9yW0Vzf54cRlgrQwvwIuk
         Kfj5ZkVJYAQ4PDLABU/uMTDkm74fTzJJtT0WBksPuKhD++heeA/hEtTM8FI4tDe/yuy7
         j9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708528330; x=1709133130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phRSbqPQtjTITh3A7Rz+mg0BFNfzjESlEJDyy2/XwFI=;
        b=msCEDYc43N8w6jQwNEzDOTbI8nZxZGEbdHFPG5jLj6HyWNC3q19KnwxQgTJr0rPm8V
         UPvLllPxP7t1kj/G+DGjXK7YvLaSEIflBKl/U1USut+plMiuzd1dyq93KCP7fo/+hFPa
         YwQx1vV6Z1W4D252TPd6PoWyp64LxaF2m4VmfWwVkpJfx2iOz3oTf38JMYdZCKe1hZe5
         tGWmnyZaGzBjYymtmcp5oQKp6iLnZLx34mwbz9PlEyziA5YarnglWOhAEawk8LAUsrSU
         HMqtMUcep52MEKZdmxmZXNAcHOmnGEiY2ZHPqYQPeuYeGq6ao2quY14IiFjIftMM5COH
         ce5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5eqJ5jTDU9Bu8w6CxVQh7mH8I0frXMtsDE0xkt42JDvydwm2s9DrK8Hfc+jbI6ddowlBgyRh+R0kpaNRgYT8oDAP+goesQ4aecr3SFSktBWU=
X-Gm-Message-State: AOJu0Yxx6UqJsP24dBDJ2OFJzGc8rNDY5kUEIj+NxcTfRbecpwBUY6xL
	4y/TnKXGA392rkWKCeuyL/TprxwdJOHeW243bGJzc7EHLpSqwnFLG3CNLDIEMys=
X-Google-Smtp-Source: AGHT+IEeRU4MfkeafbqILY5kXFWxrlUsTufKp1YAOEcBHiEhDE6BI4BT3nlSA0stwDgg/5oJv/ywgw==
X-Received: by 2002:a05:600c:4747:b0:412:71af:8af5 with SMTP id w7-20020a05600c474700b0041271af8af5mr2971550wmo.16.1708528330296;
        Wed, 21 Feb 2024 07:12:10 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1b1a:d907:d735:9f9e])
        by smtp.googlemail.com with ESMTPSA id bg22-20020a05600c3c9600b0040fc56712e8sm18725342wmb.17.2024.02.21.07.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 07:12:09 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v5 3/5] pwm: meson: generalize 4 inputs clock on meson8 pwm type
Date: Wed, 21 Feb 2024 16:11:49 +0100
Message-ID: <20240221151154.26452-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221151154.26452-1-jbrunet@baylibre.com>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_071212_270411_E328586D 
X-CRM114-Status: GOOD (  15.06  )
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

Meson8 pwm type always has 4 input clocks. Some inputs may be grounded,
like in the AO domain of some SoCs.

Drop the parent number parameter and make this is constant.
This is also done to make the addition of generic meson8 compatible easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 53 +++++++++--------------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 40a5b64c26f5..a02fdbc61256 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -60,7 +60,7 @@
 #define MISC_A_EN		BIT(0)
 
 #define MESON_NUM_PWMS		2
-#define MESON_MAX_MUX_PARENTS	4
+#define MESON_NUM_MUX_PARENTS	4
 
 static struct meson_pwm_channel_data {
 	u8		reg_offset;
@@ -97,8 +97,7 @@ struct meson_pwm_channel {
 };
 
 struct meson_pwm_data {
-	const char * const *parent_names;
-	unsigned int num_parents;
+	const char *const parent_names[MESON_NUM_MUX_PARENTS];
 };
 
 struct meson_pwm {
@@ -339,62 +338,32 @@ static const struct pwm_ops meson_pwm_ops = {
 	.get_state = meson_pwm_get_state,
 };
 
-static const char * const pwm_meson8b_parent_names[] = {
-	"xtal", NULL, "fclk_div4", "fclk_div3"
-};
-
 static const struct meson_pwm_data pwm_meson8b_data = {
-	.parent_names = pwm_meson8b_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_meson8b_parent_names),
+	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 };
 
 /*
  * Only the 2 first inputs of the GXBB AO PWMs are valid
  * The last 2 are grounded
  */
-static const char * const pwm_gxbb_ao_parent_names[] = {
-	"xtal", "clk81"
-};
-
 static const struct meson_pwm_data pwm_gxbb_ao_data = {
-	.parent_names = pwm_gxbb_ao_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_gxbb_ao_parent_names),
-};
-
-static const char * const pwm_axg_ee_parent_names[] = {
-	"xtal", "fclk_div5", "fclk_div4", "fclk_div3"
+	.parent_names = { "xtal", "clk81", NULL, NULL },
 };
 
 static const struct meson_pwm_data pwm_axg_ee_data = {
-	.parent_names = pwm_axg_ee_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_axg_ee_parent_names),
-};
-
-static const char * const pwm_axg_ao_parent_names[] = {
-	"xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5"
+	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
-	.parent_names = pwm_axg_ao_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
-};
-
-static const char * const pwm_g12a_ao_ab_parent_names[] = {
-	"xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5"
+	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
-	.parent_names = pwm_g12a_ao_ab_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ao_ab_parent_names),
-};
-
-static const char * const pwm_g12a_ao_cd_parent_names[] = {
-	"xtal", "g12a_ao_clk81",
+	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
-	.parent_names = pwm_g12a_ao_cd_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
+	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
@@ -437,13 +406,13 @@ MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 static int meson_pwm_init_channels(struct pwm_chip *chip)
 {
 	struct meson_pwm *meson = to_meson_pwm(chip);
-	struct clk_parent_data mux_parent_data[MESON_MAX_MUX_PARENTS] = {};
+	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
 	struct device *dev = pwmchip_parent(chip);
 	unsigned int i;
 	char name[255];
 	int err;
 
-	for (i = 0; i < meson->data->num_parents; i++) {
+	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
 		mux_parent_data[i].index = -1;
 		mux_parent_data[i].name = meson->data->parent_names[i];
 	}
@@ -459,7 +428,7 @@ static int meson_pwm_init_channels(struct pwm_chip *chip)
 		init.ops = &clk_mux_ops;
 		init.flags = 0;
 		init.parent_data = mux_parent_data;
-		init.num_parents = meson->data->num_parents;
+		init.num_parents = MESON_NUM_MUX_PARENTS;
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift =
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
