Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFA4C83F01
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 08:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qr3/JBF8VWd3bbUx48LMHKnKWoKJo5XUS59eWRBgpao=; b=nYfQ2LBk3t+fNH
	KQZUMtI2J1OZBe4kHWEzzGmB2tBAGoj84Z6G7Qn3TZQ0HpWGwsAgQaD06x4JJxUEsd0M0/zLgPWNi
	cyOwHvTg3JhFY3EtClB/X6MvGxVQSFuMpSl+XAGKjkWSLb/kHXA6nhgd8xL97oy/v3rmpQLDSyiTg
	dt5BkKd48dusvJpp8Hf/Ln3x1rqwd6lr+VYwlNa6cdpLQZ45slfCgO9pXC6agcknxUZ/mENEhPtld
	c44NXf6xtxqXu9Y0l9xqZ7ZwZgllyCaMsiXZK4texW2H8SBbyivBWZSywesApJb3HbRD1z1//Eg+G
	J8I03zeXMOn9Aw0McPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaB9c-007f2X-1f;
	Sun, 27 Aug 2023 08:29:52 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaB9Z-007f25-0M;
	Sun, 27 Aug 2023 08:29:50 +0000
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c1d03e124so288304266b.2;
        Sun, 27 Aug 2023 01:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693124987; x=1693729787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGz6g/mmAoLvV1y0UfNZXG+WHctT9zF9GzJjlAsRgRQ=;
        b=iI+gXAK7j0uhBUvYyN7UyPiC67zNO6zLVI5H4zA5pmsTSX+5KdHB7xD42sUrGrBpj9
         dkxu8zBwq7TH87olEKCvmutqjba0ei7sViY6CxqbeiEIRNlczJk9ffvDERi9pP4LJgle
         +YAVVk0XwZ3IPXAKawS0Gr4PIN0wX4AM5Vbg4Ptu6a7j5yukPfoN8WA6rBRCstUM1vuf
         tfTGsnPFOyTJ18K2o5dqau9GVJM0IxDCGabtoW96c1aJlHeZVFl2qCNSMnPLYtBHKz7I
         IBuwSKOyU4016UApn6/nPOqxSOLzxnJfd06nwwWwXMm0HqU3SC6MZYhggIdpRueqQkEf
         aV5w==
X-Gm-Message-State: AOJu0YzahcmFYSdThcW94lrhTkZtM7F5R5fmJZfmgZ3o960tP7CE/j1v
	6hO1K9gEUHKhjT2ga1cXOlSZe5HHomPE+A==
X-Google-Smtp-Source: AGHT+IEzVaNmHJYY+TLWlWVjbbdc4h/PHWeeLFvgs71G0UHGzhtRlne2tpflEwrzklczAK9k5I5rlg==
X-Received: by 2002:a17:906:73c7:b0:9a1:e758:fc70 with SMTP id n7-20020a17090673c700b009a1e758fc70mr7956512ejl.77.1693124986949;
        Sun, 27 Aug 2023 01:29:46 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906840d00b00992665694f7sm3144793ejx.107.2023.08.27.01.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:29:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2] Revert "tty: serial: meson: Add a earlycon for the T7 SoC"
Date: Sun, 27 Aug 2023 09:29:44 +0100
Message-ID: <20230827082944.5100-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_012949_171158_640C021B 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

This reverts commit 6a4197f9763325043abf7690a21124a9facbf52e.
New SoC will use ttyS0 instead of ttyAML, so T7 SoC doesn't need a OF_EARLYCON_DECLARE.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
Since V1:
- add Signed-off-by:

 drivers/tty/serial/meson_uart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index c4f61d82fb727..790d910dafa5d 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -648,8 +648,6 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
-OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
-		    meson_serial_early_console_setup);
 
 #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
 #else
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
