Return-Path: <SRS0=vIah=UZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB9DC48BD3
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D5D20645
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2019 09:07:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TdFI7ig7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IZqNG4Ef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D5D20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZtWiav3ZiCt+BXP3kM3a0U9/XAfVowm0Cy3/rmqAoE=; b=TdFI7ig7QdmnuT
	C8gj0cBgU65T6vA+JwsJ+3HF56iuy3rBJRI/pRiiRs599o8zpYq9YolyZrqLScPtBzfZ/ysm/eHt5
	Duhfdu06k2r0j2f1ZTwdrizSyPZb8nV+oIt+vTTfwnGlBuI1ew0I3dzMlFtJCcBOKe2rirorIS+sF
	qKje+UiK8ArLRxTwMooLii/WQZWP2h7nAR8dWROvaqHE3875rozdUi15Ub1wce9aivf6Y9k+mNA26
	FrKLTkDjVrkoB9w3MVpwPPO0BqiTnj5PScjMvgzhaLj9yTfiugXaZEOE6YrzZwzJ/KFw7JlfPzwlr
	no/ORDt7dhs/6CA3simw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg3u8-0003Gk-Sx; Wed, 26 Jun 2019 09:07:49 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg3t1-0002Wx-1O
 for linux-amlogic@lists.infradead.org; Wed, 26 Jun 2019 09:06:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id p13so1752675wru.10
 for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2019 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYe7DDXQIL9cgrU/J6+VemHeiSBNByBQZKqrYUm/eeo=;
 b=IZqNG4EfbttnhxMV2QVAFvrf6vu4GQ9PI6Nso+6ApbR26KHmMJbjaKClJPn6E8EwzJ
 M4fiqHw1Kc8wiwFms+DATHH4T1c7EAfmdHOUTPBhj2rHWElIVkFxfquftNP5Nyms1LT0
 EWDBVhaDfz0DV/O6jLwx8U0GE+3sDgHtyor0/ME4mLv8QB1t2ky7GYK+aqkrJLqFF4pW
 RO+vFGcHywf+f/8/D20FUSQVt/4koC5zevXCTdGVlvsj/AGDz3q/VCY6OfcibA0kbKEA
 zm59NkZUXbwHy3ni+n8VHieAyW4eC40UXpewg7qRbE710/pLNgOsVHZn8yZx8SyfNCjd
 boJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYe7DDXQIL9cgrU/J6+VemHeiSBNByBQZKqrYUm/eeo=;
 b=F9yaJWP7F6UMzJcGeSHKiWSz3/dIu/Ti/dHyQTfWl6tMxua2gcmuhiggbZSPdLzLbp
 QhZfbS/KlGohCiSfzH19PgEms8/UP0T9AwvrKm6Gtx0Mc0/Plpei+p4qe9NgloUw+WVO
 Pnp3UWovuzJ2CjKgitoIJAJe4KV5Mp6Z8v/9tnV3gve1PBgLrtwgYm9oVx1Lv7dFQzZ4
 /PAyVKqNe1J7hwAIoUlgqWroqxJUcdXVwF9jqhjpZKraXxcNy1YyMk9wu0xEYc5k3X32
 0aMA1o+/6Y9GKqcRAffs8RveN1XPDNCqNdR/ZdEau/YxDOLDLP9LnQ9Bs+ULj6ZlnKFS
 4dQQ==
X-Gm-Message-State: APjAAAU/PkZN0/RAkqfqFKV1Q1b8el8zPZwN+DJdiA9Vqf7fpcxAAPIc
 KWnEdlrZan21Rf5SuzQvhzULAQ==
X-Google-Smtp-Source: APXvYqyxjpfHTQzVG2c8KK9cmuSDK8HOXSqc8Faf7OuNvUlQtReJFxvDWffzUoHhiuLi3+ZLFL0ilg==
X-Received: by 2002:adf:f04d:: with SMTP id t13mr2744391wro.36.1561539997693; 
 Wed, 26 Jun 2019 02:06:37 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o6sm1925797wmc.46.2019.06.26.02.06.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Jun 2019 02:06:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT v2 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
Date: Wed, 26 Jun 2019 11:06:19 +0200
Message-Id: <20190626090632.7540-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626090632.7540-1-narmstrong@baylibre.com>
References: <20190626090632.7540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_020639_089507_2D80EE57 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
index 3475cd7bd2af..582665fd362a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
@@ -801,6 +801,9 @@ static const unsigned int remote_ao_input_pins[]	= { GPIOAO_5 };
 /* ir_out */
 static const unsigned int remote_ao_out_pins[]		= { GPIOAO_4 };
 
+/* pwm_a_e */
+static const unsigned int pwm_a_e_pins[]		= { GPIOE_2 };
+
 /* pwm_ao_a */
 static const unsigned int pwm_ao_a_pins[]		= { GPIOAO_11 };
 static const unsigned int pwm_ao_a_hiz_pins[]		= { GPIOAO_11 };
@@ -888,6 +891,7 @@ static struct meson_pmx_group meson_g12a_aobus_groups[] = {
 	GROUP(i2c_ao_slave_sda,		3),
 	GROUP(remote_ao_input,		1),
 	GROUP(remote_ao_out,		1),
+	GROUP(pwm_a_e,			3),
 	GROUP(pwm_ao_a,			3),
 	GROUP(pwm_ao_a_hiz,		2),
 	GROUP(pwm_ao_b,			3),
@@ -1192,6 +1196,10 @@ static const char * const remote_ao_out_groups[] = {
 	"remote_ao_out",
 };
 
+static const char * const pwm_a_e_groups[] = {
+	"pwm_a_e",
+};
+
 static const char * const pwm_ao_a_groups[] = {
 	"pwm_ao_a", "pwm_ao_a_hiz",
 };
@@ -1290,6 +1298,7 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
 	FUNCTION(i2c_ao_slave),
 	FUNCTION(remote_ao_input),
 	FUNCTION(remote_ao_out),
+	FUNCTION(pwm_a_e),
 	FUNCTION(pwm_ao_a),
 	FUNCTION(pwm_ao_b),
 	FUNCTION(pwm_ao_c),
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
