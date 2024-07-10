Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6A8C3DA4D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obQZMNvYV5g+l23JY0xQUc2Q+5Q5QwoV03cvl2jeB8A=; b=BqcKjCV8S+rwWA
	Y9CWE8kSZHx7CXAe/wXNpN7rHF6Mzqvl30BcqLpNMuf5/HWqlZOeyi3s8rUDLxQLF2l6kwok1UCc6
	nf7FTeAM8/2Vyg3ffPKd5cJMmNf6akprSzemPdc3IFkD3NJwPu0IUqmiq6d6jFlLhRxQY9q/xO1BA
	KbA5Ofrie1Kh5yDndHAKpYh/H9XtSHBkgEY3xgC5eMmWugVrd8s3ZXytj14l/alexNQupcaN7h3gq
	rOoL5aelT85M5vT8ug5M94MLHypS7pcu5e/RRIwCIghCP271lqfNYAU1Q4XoabK8h6o1nikUKpQIP
	HRwaWEeykP3q+yxC6aFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8a-0000000B8l1-2nIQ;
	Wed, 10 Jul 2024 16:25:48 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8W-0000000B8gA-0AlA
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52eafec1e84so4455640e87.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628742; x=1721233542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=u3CoptmEjzg2GpFv52dargMXVwCiYUOgENHDjy3EcSIxh4wsmIOz3dra5ASklFyUUx
         deHQn5zAzmWumTU7cr/1rzfognG06QOipSWieVZi7lVUqdOO82Z7VbAsWpFTBzVN0lwN
         +mwlkE1SKu1foGHMOegbaQZYMeBtpOqOLSeHkV76mwwHaqV2reigJetxFL6+t8G7k3aY
         yKVBKxBEmw8/D+mEHDpalv3j8A7X70rwvT5XxQfIsQQShHHu8b6XTZ7Dq05S4vGGZmz2
         NBmpaD00DMRvBTg0HrZGSD2YqN8mGzJqG7XRUuWaRVPrP1bkpX61Qhy/HGRPhFvQqyhX
         wuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628742; x=1721233542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=Lng9F2IcYwcPWr3RbMgjKn1Xr1sObHyg7WpbWYcSN1H2AbbUm13NjmU2XH2rxl+xYE
         IuvsV720rapO7lmrK49eFTXJl/A8ivPjWJXC7jTFuNppPQZGyoi57lc1rUkhW4sL7r8o
         R5QZLeiZyga9jYiRgQbUV7BhOR4l2BMqF77URxCAQ/shDnKoHhZN+o4UoxzD0OZetlFC
         lflsfEB6I0Olu/mMK0u3xb0sCctYMzSMLy2/vuzNrdGmm06698A1ZUWhOzUlOIMcvUBx
         JXXZ/BbTYItvGUilFWMwHZAKNBpiiM5TpLUHwy7FiS60GqAHljN8Cwyn6dQ20JUy2VPn
         fGRg==
X-Forwarded-Encrypted: i=1; AJvYcCUurTdhZkuuwpHKGK3OuygNL9A7zS4rm/wMudZGPHg3y2VOQxYwzAJEx9ooxJwBqOeWn/alYAIUupk/MQJp1TPdAhBjYgDCLlHkLjM5vQ9oSKU=
X-Gm-Message-State: AOJu0YztsAjbTwBU58kooBS/bB0sQVFkQIfs+5XIqtq7XF6EItAYtIlq
	W3c746DwucU5FqQ1JVYth6Un41qKo5w5LN5s7XB4nhX4OzuaBlit0h2b1g1v9rg=
X-Google-Smtp-Source: AGHT+IGoeOCZklKr0/1tvlfZaKQ+3YXN1j9s6sBPZnGkb/G0RZztUbY1oN6KCwJUbQaOeD8WjqbHnw==
X-Received: by 2002:a05:6512:108c:b0:52e:9480:9e71 with SMTP id 2adb3069b0e04-52eb9996055mr3907030e87.28.1720628742241;
        Wed, 10 Jul 2024 09:25:42 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/8] reset: amlogic: add toggle reset support
Date: Wed, 10 Jul 2024 18:25:15 +0200
Message-ID: <20240710162526.2341399-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092544_101756_209493B0 
X-CRM114-Status: GOOD (  13.19  )
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

Add the emulation for the reset callback using level reset if reset is not
directly supported. This is done to keep the functionality of reset
driver of audio clock controller. This is expected to work by the related
reset consumers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 65ba9190cb53..e34a10b15593 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,6 +17,7 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
+	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
 	int reset_offset;
 	int level_offset;
@@ -98,6 +99,18 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
 	return meson_reset_level(rcdev, id, false);
 }
 
+static int meson_reset_level_toggle(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	int ret;
+
+	ret = meson_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return meson_reset_deassert(rcdev, id);
+}
+
 static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
@@ -105,6 +118,13 @@ static const struct reset_control_ops meson_reset_ops = {
 	.status		= meson_reset_status,
 };
 
+static const struct reset_control_ops meson_reset_toggle_ops = {
+	.reset		= meson_reset_level_toggle,
+	.assert		= meson_reset_assert,
+	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
+};
+
 static int meson_reset_probe(struct device *dev, struct regmap *map,
 			     const struct meson_reset_param *param)
 {
@@ -118,13 +138,14 @@ static int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
 	data->rcdev.nr_resets = param->reset_num;
-	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.ops = param->reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
 
 static const struct meson_reset_param meson8b_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
@@ -132,6 +153,7 @@ static const struct meson_reset_param meson8b_param = {
 };
 
 static const struct meson_reset_param meson_a1_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
@@ -139,6 +161,7 @@ static const struct meson_reset_param meson_a1_param = {
 };
 
 static const struct meson_reset_param meson_s4_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
