Return-Path: <SRS0=kcVe=53=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE456C2BBFD
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 17:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A374F20757
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 17:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FtBRqV8T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="vIHIAPgN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A374F20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfYuIbTXJvUdFVDLk7f/3VwNyuCdqwCoIc58WVxQyXs=; b=FtBRqV8T0Hx+yB
	/XLb3cwyW/8adAltjckeRcXffSnL6R4azRYrxjJMk3IPayiZmjvHWvkhg/cMrW+Ay+N17xt5iZ6pb
	XFNPxTJmHy/oxZBnZf053rBZBnjL9GGV/jDu0MMOWEhZ0cNy05dJii8o6RdrlLbdDYxfryxPwUw5B
	I6uzNFqyY9sT+uqUYgPfHJuNfOtwFxVUm5eq20rFnple/lZVBXap96uZ4cgGUf6dIc9aCHhKIfLIA
	xzuWAN3TFmxDYOdJQkpuAXX6L11rHml/V1CWyTnx7685FlbYNQujxoXyAJYvtpGuv4wJlCnZmcz+P
	MYJNrLDr5JLoKTNdMZTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNJY8-0004f7-Dh; Sat, 11 Apr 2020 17:04:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNJY5-0004dE-7V; Sat, 11 Apr 2020 17:04:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id a25so5647597wrd.0;
 Sat, 11 Apr 2020 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hn0sT3llx8dpfWYLFXBaKS2N7KsXP2uNkFQw7JnlQ78=;
 b=vIHIAPgNSZBSqUHtWgWpknpwGthPyNqOLnQPEJLgduq5OPJYbigDsQ4DoqO81Vl2Iq
 6aZNwQTeAtQSg3PlhToI4e84NvRqpYD9RcQeqrBZ6yvUC4RMqMj2GuGBz4iJb8hMpJqV
 QrbRxjIHEOHmeCSgIggWktC/1vFbScQ8v1T4oiQmq95hqESTBLmeY88xebeMGwp6pNOL
 8z6i77rhvklK/AMHgPQgUD8JFLfJzA2znsoC594BZpVmAeHZwMZby6pccq4EMFM5Tmh1
 k9/60OxKUe5Lr2/PYi/65fj8jkpFCH6OAMDDD73QspPPqWMGYq7PdJNl9EIhts+lQd10
 d1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hn0sT3llx8dpfWYLFXBaKS2N7KsXP2uNkFQw7JnlQ78=;
 b=PpYAG49YKZ7zyIbb7aMk+C8x5SeN4SjMrjqvbsR9qHK3SMT6fq0k46iIEX8omv79AB
 AEjL6Z4bmvQPceuZiDhaQHSbzgCiKXES6R9uEFHh9q/kt6iGIgGSvv74LjyRlMyMF6YW
 3U6tqGKJpepzxBkjmAV8I5YD8eQenAIMhIb4Ln3meUaAgiib7AU3OsXMQfsorwrH1VsF
 ljgzJzcNrHmLzfx0/G2TtODN/cjAW0b4kGlxrZHuqGQkJLQSGselWsTL0XCbz6fy6ART
 p0Y3izQdJ31ml8/7BEsoOC08JYCA8fAuY9Ur3ObJJkMbwGA1CCqXUoPgscTU/TXgLIgX
 3+8A==
X-Gm-Message-State: AGi0PuaWEdqHyL5gB0YtyKriuecuNRAuYjEplOroErV+MoxtsiRygbfi
 5XnC+Rp+8PGNXy6WPfXG3K8=
X-Google-Smtp-Source: APiQypKffhed79h64CgKowH7kOFGYoOVBE6NWJV8QjVqZV2b6YDMGzsVwnNQqJKbQtiDP1fe/aLApQ==
X-Received: by 2002:adf:a28e:: with SMTP id s14mr10524687wra.208.1586624643968; 
 Sat, 11 Apr 2020 10:04:03 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x18sm7105067wmi.29.2020.04.11.10.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 10:04:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 1/2] pinctrl: meson: implement the gpio_chip
 get_direction callback
Date: Sat, 11 Apr 2020 19:03:55 +0200
Message-Id: <20200411170356.1578031-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
References: <20200411170356.1578031-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_100405_267862_67AEF9A6 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Implement the get_direction callback so we read the direction from the
actual GPIO controller register. This is recommended by the gpio_chip
kernel doc.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index bbc919bef2bf..291f3078e7c7 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -549,6 +549,18 @@ static const struct pinconf_ops meson_pinconf_ops = {
 	.is_generic		= true,
 };
 
+static int meson_gpio_get_direction(struct gpio_chip *chip, unsigned gpio)
+{
+	struct meson_pinctrl *pc = gpiochip_get_data(chip);
+	int ret;
+
+	ret = meson_pinconf_get_output(pc, gpio);
+	if (ret < 0)
+		return ret;
+
+	return ret ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
 static int meson_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
 	return meson_pinconf_set_output(gpiochip_get_data(chip), gpio, false);
@@ -591,6 +603,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.parent = pc->dev;
 	pc->chip.request = gpiochip_generic_request;
 	pc->chip.free = gpiochip_generic_free;
+	pc->chip.get_direction = meson_gpio_get_direction;
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
