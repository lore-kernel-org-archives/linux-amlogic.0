Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF3BC25B78
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obQZMNvYV5g+l23JY0xQUc2Q+5Q5QwoV03cvl2jeB8A=; b=d3rnR7bO1ARlmL
	NHasBRj8QWbiWWJjrrmd6jle2HmwOZkDT5mk6GtFxYGs7owky+dL4i7w+YyMuotf1c3dfqNDyaL18
	51l9JjnsfMgFuxAtvnKdUBUnzf4inQy5Q5SUWojAnTppFhHGEsFfwzI+K3Tz8Q5o0oSc211v2n3NH
	+qPui/y+RNxQKUBNFAQkYGP4ytlZQ3akiDm/2n68hpf7CqYyX97CSAKZ0+OP8e8sk9huugApJM78t
	tLRS8rgF6yQYi3XeYuCSVSRByrVDLlYS4kxlvse4K0i4PNLJYoIV1TT2OIAN2qNiueCrXh3JDYR/5
	uaX459jg7YpS2oAwFdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjG-00000005Fwu-3K0m;
	Thu, 16 May 2024 15:09:10 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj1-00000005FnZ-2gUB
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:06 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51f57713684so1343857e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872133; x=1716476933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=JLJmkEmSSQf1h5RJdEPLLYGWgsZh3ZLO6jFP2TMj+L/o0A55nYLn6TcuZDpdMTzGvt
         unhX09isttYay3M9pCsq+GLHWvvyi78s2fUIwrOgoX0o20DTVmaBkPVbKpCEPDz8P8NG
         EtxzoyFqY2p9eO4KHSSNhlP2NwF9tgjiGdpIR1JeMn4GMkDaGgDJcaYMPp/3xkVDXjsX
         o/hhcgbJZ/+1p05+bHrdvVZwYfN/9mRxd0NneJp/sUdtza2qP73280bMFZsatFkFCrgo
         g5zqVfkRIiPUt96BrjFXL1qUDiKsDaqxFJM1BXH73g2VEufj4kkhhPg4NzEX0Wm4g1ab
         WkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872133; x=1716476933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRHJOwdVIwklQU4oj6tmH8SkcGKM9hDuvtKA2hq20zY=;
        b=LQagbvfLdJny7CkHSJt96LL95NRiPAfb34ZrbgKK6UxzjELF5P33yWOiOzUTBPXGGL
         A9YOfk/IHKc0PMDaDAuRymUNaN4H34Uj3wpJqnfXZKw0v3XYRBXS0f/4lVNrTFpoUO1t
         6CRwexM0Q1QJwY+F6i4X3SPDGa/u53gl3zyRnPQs4DrXMrZvc47FbbiZ2EJ7BPUND6L2
         Gd5xeE1iRKYZt+hsH3ADtc0KobF0QuRnOUjD6iURpbJh3rJBBA5TDvd8C5s2uRW3/JzK
         mU/VMwGetTMNiUBrc5IQugGejIQXmfA6Y/gi9IE6sQ5Ed8IKP3qMhS5bhzQO06TGW7JW
         ybYg==
X-Forwarded-Encrypted: i=1; AJvYcCXo7vlcip/GxD1eb6jekWtqf4b8gMREq49wF6CHAZS/NKPLYxB5kaQyfL1tDVB00eiKoKrLR2f2mTINzjweOu6sHkEV8u7PIbm/Je++X6NaBoY=
X-Gm-Message-State: AOJu0YyaSuZ+S8Ihl5rjd32jeEiuR4YiA7eiHu6+vzR/JTW28DY3OCSB
	JmckSQ3yNQGr9bKS2Y5VSwXMfFqRD/sbV+miDuUYh/287Wx+9V9cD4QgxS2+IV8=
X-Google-Smtp-Source: AGHT+IHu52Tyfwl/3CPcNq8casphAsBV/Ti3JZcRRlwYTeXDmESt1XeztpWut4mxoqayT/xcvdJZXw==
X-Received: by 2002:a2e:97c3:0:b0:2e1:f253:152a with SMTP id 38308e7fff4ca-2e5204aef69mr132927271fa.51.1715872133305;
        Thu, 16 May 2024 08:08:53 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 6/9] reset: amlogic: add toggle reset support
Date: Thu, 16 May 2024 17:08:36 +0200
Message-ID: <20240516150842.705844-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080855_773738_4ADF8E5B 
X-CRM114-Status: GOOD (  13.24  )
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
