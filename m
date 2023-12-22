Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734FC46CD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Dec 2023 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50YoFudaDPJIHyZ38YZWKX2ekHrXtRNLHZNElshJpcE=; b=JeqJln+RsGRVD7
	hUC2rU9mrtLNMpEVR8LiZ3ry9Uez6wpIFnIssKwRw9Uyrn+1axcDPEf6r8K0YCck60HrQu/pMf3vE
	kytORpXycoh8hmm/IC5doHXBG+kyisC9yQBOo5KGZ4+zr9iPZehMCuPV6SvwoCNhS2uMqJ74mZbDv
	S718MIETsGSh33Y7By2f7uJs0Y5ZfAnIDuOopKce4KQ+zO/Z5PQf3DQcYeyKy2D4nAV9vkUUc7AsW
	EwOQxW+fVGSRreteAF2OlLdKpjYcfamKHiapGa6r5BI4F3UAGNkqC/HPSfimdZxvu5RkQcf5vsu5t
	3MrlfWI07N3FJM/XKDcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdX3-005eIf-0D;
	Fri, 22 Dec 2023 11:17:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdWw-005eFG-2x
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Dec 2023 11:17:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-33677fb38a3so1685543f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 22 Dec 2023 03:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1703243844; x=1703848644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZCJsoLyOmkKAX7ht3HFrFwteoJzV+g0RP8tYskDzk0=;
        b=Rp91YvZz9gRJY38umCWOv6gLGlKeny8lWeAbPw6aP2aW6xLn7gjNyDbGWzdn9+BAqL
         oz1nx8ToxYhkRKfcvPeT5qvAqx6PC7nqxBCLW8ZoPM/7Ak4vK5YP2tn/CqC9JHsJKv5S
         kiCdFQ8bWS6CNQ9jp8fWVMUjYpyFAnRL0LIJN+dEh5f8z299oMQYv24vF9Z2mz6nRdGt
         UAgjGYm6K9XRyUDD9zg+H5N3s8zZ902eFvxkN95hWqoYDvYdk6HXgB2G2b07CtYRVMkU
         dJ7/RncfGZ2vtmtn4H1k+kSL8hNrAzSjz5Ty1WGQLul1UYhMu2lzqRTj/++vWy8CekeW
         qJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243844; x=1703848644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZCJsoLyOmkKAX7ht3HFrFwteoJzV+g0RP8tYskDzk0=;
        b=itSWWqrsgbqSVw50D7OFlcGMDWZkiG5olV/5G86JCDhX2WTK37JWnxH021vk22ivF2
         hdU6U/nEQFNlMo/+vghg0sTf53vCt58o4CJEZKCtNiPjXo8DaohNX2pAlgHFkzJ1O8bl
         62LmyUdSyi1J1dRkrrc1+/emUdPb/6jX4dEJ0J1HaEfaBE8Nbsy1ABUk5UOzNfCGoSa2
         Vvt7R56NkbF1X8tPyNDkvZbJmt4Z9wQnhWaGYUDWIRkDRwbGYfpJ5KAsodu+sQk8af1T
         BY6TEk2oXGrwcyQN7SsiAuC9sedJU2x4OGQf0XflMvOhKlro8WqHcu0PqpUG5yrREJUE
         OkoA==
X-Gm-Message-State: AOJu0Yyi5evefZ6FqWHg+g9rWZkKwgKLuLFDE/nUVEH6txgcMY7UVQ8Y
	9/Ril+j+ut1DZ7uZEhzGOFX8diOKWvwFcQ==
X-Google-Smtp-Source: AGHT+IFBwoFjDZf5fns9Sf1GHZi6C2BjjIZEfE1cXFlQtPWX5Mn0XqjoNSMIEs9vr+cUQbzVBD/2/w==
X-Received: by 2002:a05:6000:1b07:b0:336:5d2f:3503 with SMTP id f7-20020a0560001b0700b003365d2f3503mr667803wrz.62.1703243844210;
        Fri, 22 Dec 2023 03:17:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c099:e596:3179:b0fa])
        by smtp.googlemail.com with ESMTPSA id f8-20020adffcc8000000b003366b500047sm4054069wrs.50.2023.12.22.03.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:17:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
Subject: [PATCH v4 3/6] pwm: meson: generalize 4 inputs clock on meson8 pwm type
Date: Fri, 22 Dec 2023 12:16:51 +0100
Message-ID: <20231222111658.832167-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222111658.832167-1-jbrunet@baylibre.com>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_031726_953673_BD5DF4ED 
X-CRM114-Status: GOOD (  14.21  )
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
This is also done to make addition of generic meson8 compatible easier.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/pwm/pwm-meson.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 2971bbf3b5e7..ef50c337f444 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -60,7 +60,7 @@
 #define MISC_A_EN		BIT(0)
 
 #define MESON_NUM_PWMS		2
-#define MESON_MAX_MUX_PARENTS	4
+#define MESON_NUM_MUX_PARENTS	4
 
 static struct meson_pwm_channel_data {
 	u8		reg_offset;
@@ -98,7 +98,6 @@ struct meson_pwm_channel {
 
 struct meson_pwm_data {
 	const char * const *parent_names;
-	unsigned int num_parents;
 };
 
 struct meson_pwm {
@@ -343,7 +342,6 @@ static const char * const pwm_meson8b_parent_names[] = {
 
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = pwm_meson8b_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_meson8b_parent_names),
 };
 
 /*
@@ -351,12 +349,11 @@ static const struct meson_pwm_data pwm_meson8b_data = {
  * The last 2 are grounded
  */
 static const char * const pwm_gxbb_ao_parent_names[] = {
-	"xtal", "clk81"
+	"xtal", "clk81", NULL, NULL,
 };
 
 static const struct meson_pwm_data pwm_gxbb_ao_data = {
 	.parent_names = pwm_gxbb_ao_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_gxbb_ao_parent_names),
 };
 
 static const char * const pwm_axg_ee_parent_names[] = {
@@ -365,7 +362,6 @@ static const char * const pwm_axg_ee_parent_names[] = {
 
 static const struct meson_pwm_data pwm_axg_ee_data = {
 	.parent_names = pwm_axg_ee_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_axg_ee_parent_names),
 };
 
 static const char * const pwm_axg_ao_parent_names[] = {
@@ -374,7 +370,6 @@ static const char * const pwm_axg_ao_parent_names[] = {
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
 	.parent_names = pwm_axg_ao_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_axg_ao_parent_names),
 };
 
 static const char * const pwm_g12a_ao_ab_parent_names[] = {
@@ -383,16 +378,14 @@ static const char * const pwm_g12a_ao_ab_parent_names[] = {
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.parent_names = pwm_g12a_ao_ab_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ao_ab_parent_names),
 };
 
 static const char * const pwm_g12a_ao_cd_parent_names[] = {
-	"xtal", "g12a_ao_clk81",
+	"xtal", "g12a_ao_clk81", NULL, NULL,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.parent_names = pwm_g12a_ao_cd_parent_names,
-	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
@@ -434,13 +427,13 @@ MODULE_DEVICE_TABLE(of, meson_pwm_matches);
 
 static int meson_pwm_init_channels(struct meson_pwm *meson)
 {
-	struct clk_parent_data mux_parent_data[MESON_MAX_MUX_PARENTS] = {};
+	struct clk_parent_data mux_parent_data[MESON_NUM_MUX_PARENTS] = {};
 	struct device *dev = meson->chip.dev;
 	unsigned int i;
 	char name[255];
 	int err;
 
-	for (i = 0; i < meson->data->num_parents; i++) {
+	for (i = 0; i < MESON_NUM_MUX_PARENTS; i++) {
 		mux_parent_data[i].index = -1;
 		mux_parent_data[i].name = meson->data->parent_names[i];
 	}
@@ -456,7 +449,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		init.ops = &clk_mux_ops;
 		init.flags = 0;
 		init.parent_data = mux_parent_data;
-		init.num_parents = meson->data->num_parents;
+		init.num_parents = MESON_NUM_MUX_PARENTS;
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift =
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
