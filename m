Return-Path: <SRS0=ToB4=FP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B9BC4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 00:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E33323DB4
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Dec 2020 00:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E33323DB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rklh1pIoY2l4Jld0BbNIXsDVSecuhgXYyFRdyyz4Nm4=; b=10dLtqmy2+7ZqwU3cMQAA/INt1
	btcgFQtF1bbcGGXFjdnkT0yu24GTCKh1VBp/qYLqPQo2DCnNfe2VCfELrO16jgZ6M3zFgwAREm280
	WEXVl0clOEyf/nFp+UTjr/mTjz6QMkx4JeUAozt3RUDmFr6jxzK+Qt93pRfvY/DTGEuexkA5sKjTL
	LQ2n0oUb4H+96/fdDrfTCnJCbiU8Vay4NMk4MZSH1+E2GdtQB961VkQekeWoRyyxR8EsxdlNzsGNu
	g4bTeVsO2lNiDLZeTo773yKDlQgARQAZtKOsGbEfls42qiN2pdJUK9b/jhlD2jH99LAprHUQsqryr
	WSvVzmBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knWkq-0003aw-IA; Fri, 11 Dec 2020 00:57:52 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knWkn-0003aF-LK
 for linux-amlogic@lists.infradead.org; Fri, 11 Dec 2020 00:57:51 +0000
Received: by mail-pg1-x544.google.com with SMTP id x24so132613pgf.0
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Dec 2020 16:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTuxwf9KusT/ntlnVCF0gMBlWlskbWARxkaUDrHOkdo=;
 b=ra/WyZQoH+AGVlTrKDauhvPdiS00/pxJvs9pj4d37efoZQNZVc+YC1W+GtSV7wDQMv
 3Mvpwy7tvnA3/aqi6p8jyeGn0RiTWUQzE26nqhAEyR6TfToOa6tfqR/WnOi+SIx2rSjl
 /Ps0Va+qa275/zgoJ4ATYKXWrjKpbYdpMxcm7iLqoC+1WKuYLh4B3j95Cz1dvR3hEXEw
 AqPD+8q9+w7dwHS9riwHOjGYOsr05T3IFKZkynpELZtrlObf0jCMlMw/2M4ICCJQGYxr
 d5hGfjj7Q2LHqEf0FebkxA0WQ+JAXOeSrNEh8ZScYqFJn8LIUmGoyRRvZHSe6LWnB/dn
 EVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTuxwf9KusT/ntlnVCF0gMBlWlskbWARxkaUDrHOkdo=;
 b=HeAdK3embP8GgacpvipsE2aFFyepksnJoQn+RjpbNIcqnZby9iiymG4C7Gx6AZQwIA
 4bXvkJnlfhm/YxbYByeyWZgFJNWq7xaOdLVNYm29TdVZWAN1YpjKUq1syVrNM51Kxlkt
 ofSx3jTMQOjSxrhF+IigbcwB6deIhnwjy+fNtU/JFsSm6xaqZ2LqiozQNuSHFNyWO66O
 7mKgCyuXeb1LIETYsYV/7/ZzHlH17Cs02z2mZXEG5+kUs6vinykGtPIWO4W5pRtAMxQ/
 SPqO9KOBI9trgA5R28fMRN2af6HIzfioHURZYXX+p5gAAY+g9Nx+pFJ3WWY+gzR+9YwQ
 Sfmw==
X-Gm-Message-State: AOAM5319h53s0BXJiq/M4DcFe4LHJdsccW9PlTrMGxcfwUj2NfwiXiXs
 //fRfMTUzyePfrfgRJe8mHUAqg==
X-Google-Smtp-Source: ABdhPJzfz9YK0z5xQjgX+uIRBOh+PmftuTdjF5WTgFEIpGyktmdOqbLubqsI53pFf5YA0q7+42Rq2g==
X-Received: by 2002:a65:518a:: with SMTP id h10mr9153953pgq.340.1607648265788; 
 Thu, 10 Dec 2020 16:57:45 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x6sm6829532pgr.20.2020.12.10.16.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 16:57:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH] tty: serial: meson: enable console as module
Date: Thu, 10 Dec 2020 16:57:44 -0800
Message-Id: <20201211005744.12855-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_195749_883761_F58BD47C 
X-CRM114-Status: GOOD (  15.75  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable serial driver to be built as a module.  To do so, init the
console support on driver/module load instead of using
console_initcall().

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
Yes, I'm well aware that having the serial console as a module makes
devices hard to debug, so I'm not changing any default behavior.  The
goal is just to enable building as a module for environments where
serial debug is not available or needed.

 drivers/tty/serial/Kconfig      | 2 +-
 drivers/tty/serial/meson_uart.c | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 1044fc387691..c3fa78e63357 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -206,7 +206,7 @@ config SERIAL_MESON
 
 config SERIAL_MESON_CONSOLE
 	bool "Support for console on meson"
-	depends on SERIAL_MESON=y
+	depends on SERIAL_MESON
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index d2c08b760f83..69eeef9edfa5 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -604,7 +604,6 @@ static int __init meson_serial_console_init(void)
 	register_console(&meson_serial_console);
 	return 0;
 }
-console_initcall(meson_serial_console_init);
 
 static void meson_serial_early_console_write(struct console *co,
 					     const char *s,
@@ -634,6 +633,9 @@ OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 
 #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
 #else
+static int __init meson_serial_console_init(void) {
+	return 0;
+}
 #define MESON_SERIAL_CONSOLE	NULL
 #endif
 
@@ -824,6 +826,10 @@ static int __init meson_uart_init(void)
 {
 	int ret;
 
+	ret = meson_serial_console_init();
+	if (ret)
+		return ret;
+	
 	ret = uart_register_driver(&meson_uart_driver);
 	if (ret)
 		return ret;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
