Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E88C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3996420673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lg10joSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SZ6V1yjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3996420673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZtWiav3ZiCt+BXP3kM3a0U9/XAfVowm0Cy3/rmqAoE=; b=lg10joSYoyUpVC
	v/2QoY92xIsqikvenJpNuIC4CbVY3nXcZu+xPPf8BoKlZFbJ9dkuLFyDZEa03txvW962ONdc+jAjs
	Yzgj0TqrN6ikyb6el1dHd0Dme+7Z4RuGf4NZHxLhzbjcwUsrdrGNRFmk5waKIk8Zguvprcjzzca1v
	NpT5J9qs4sBMtVxnmkg11onS28L/3LaAhwdvdbzPbmwhk03eIWnKadMQGCAUudTHsGS6rI8MSIPJ4
	GwLuoTZaKcobEBJfyVlXzybdN7QVsnOt29u3DFp3foo6SRulUH0jLSbgAQWO3y5JPGwFSsFpstwQB
	uJzK5QvuZvGxTk3YIP3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdyZS-0003nJ-VA; Thu, 20 Jun 2019 15:01:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyY3-0003BM-26
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id s3so3409016wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LYe7DDXQIL9cgrU/J6+VemHeiSBNByBQZKqrYUm/eeo=;
 b=SZ6V1yjLoHGVxYhYdXZ8SkshTMpt0KSi4NFSU2/xx/+B0QFCZ/xBQx3++HsNUvz09q
 f8371/tpFqWte+O1B0mJZDY/m+oXsJXHnkEbSDAAnhNkUO8PnzGSlg4II9sJ3hdcTjOd
 J9WFwVcXw1Db8/Z5WDM1EbNM6t7arljsdr1fNxbt9cblHpMLQs1tfjOgBG2COUK6/X/6
 7OSdVHmMLNv3VZoB/VKHC6lVJjxUgqUX9LPBujDSjUYkKdwn8GW7yX10YVjW2J9tabmQ
 cir+m7HPer+bOdYUNrInyBmC6SndMtZN6uaPzr+/1Qtquu9r+rrXslmH7bFbqZz3QtqX
 JdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYe7DDXQIL9cgrU/J6+VemHeiSBNByBQZKqrYUm/eeo=;
 b=Z68oM7G3tZVJgKUnZMlK88Z8zNE5ijj5T4v7GF9b+RSJbILa00HiDJykkwTsuTT6EH
 JsDm2YvEdiWv3HmC+DXz9r/9qTJYJJyQcb3qSxYv0NjaaCJhWwVfSTIYr1tZ6LWx8Or5
 Wh5UHRfux2O6ea9NRMDvLSTKfW6TIdCTFpht6GGv60bCC6aVsvgiXRaae+3LOO5aUamg
 3eAcETbl73QgKLI6HyEY2l1ecoxU0Outo+2O/3ziimAlRt6ZJIV03kklJxFjJsrL3k9E
 XhIfd0hJtq/0u4kzKI4YYeoYDs5kGW6mD8MtgU/r3lF3ftSlKYrHYzz5/BvsiJ0vZKdw
 S8EQ==
X-Gm-Message-State: APjAAAW/4/VExjMWzWDOyW0/3ffAIg7egdVAHfw7x5tzd/FR4qPqKbZ8
 ow/52xxQYrI1Hh1BrkP4smHp4Q==
X-Google-Smtp-Source: APXvYqyNNg0N3Vh+whUhU6uiroJxzDG3nOrILtRfiPwOSwkxjLjsRkVzUds9/M79qG+gl3Xaq9YOhg==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr69933wma.90.1561042821614;
 Thu, 20 Jun 2019 08:00:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 01/14] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
Date: Thu, 20 Jun 2019 17:00:00 +0200
Message-Id: <20190620150013.13462-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080023_097535_E10BDED5 
X-CRM114-Status: UNSURE (   9.82  )
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
