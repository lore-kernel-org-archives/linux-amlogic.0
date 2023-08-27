Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E580C83F01
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bY6O5HSvCL6dxSzzACtr1FR7rDbj8/0NnFPr1sTuH0Y=; b=Jm3CWJ/fMhw8ey
	xEtQ7wcA1aVz5k1JhUFXS40IqQTvJyevpTJCD2P8/4zDzXiXa4bPrmLwSjh/Mu6EFCtRj057j/gtc
	ebPTtCORn4awWUCEvj0Clvbah2k0FK76cgwArzr9Q2Ql14CLvxhKtA6zbExLr7z3iFGasJ1B//SLB
	xW3Zjo4O4R7+3Xlxb1VLamyvEyhiGz9ITFpOLbXygB0hvaMga6JprAKyc12EA9WdK+A8kR5n+rKhS
	Ku/hF0pl/J8BxpthpmamYlAmWo5hmExwidVevZhzZaHtR+Ng+9/HTptQJYdsxUvJE5nPXX/cCescC
	WU/vTsAlg4vyrjEBcLGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaAi9-007dTp-30;
	Sun, 27 Aug 2023 08:01:29 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaAi7-007dTD-1V;
	Sun, 27 Aug 2023 08:01:28 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9a19bf6ab66so286881066b.3;
        Sun, 27 Aug 2023 01:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693123284; x=1693728084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJQrxQq8+wggDdpWlS/QjLNuLOjuY19XSVAy4OQf8wA=;
        b=V9XNdvvTgqiSjm+E4hDQNQwTsooVookbDuzOBSidX6+akV6jtgso2TNDP4PHGvVNQd
         V6C57uiW/uz9rRZGiAsCyGqpokM2hU9+CubExGXxUyzaw1qXONmqyAuNsu+bR1YBNTxH
         YkqVJA7NYrCgoafHox9YrQt5L3gf3sKlpJ4nAPUwuOlzq4FIgA4a80C0EjxmPzFOhtH6
         ignbcdhyDlgk9HcnN/SOTD1fhrrqZIlW8tMOussoYMhNl4N/X/OSxOxOooyEEoVt7OBH
         lYFyK+Kp4uk3pMKC1pHcj9LwjZe2sFqyiyFTfZBuzwxY/xbiA3beEDTjFSUf9NIxbsqr
         r27A==
X-Gm-Message-State: AOJu0Yzpv1akknX91rYxim0jK1FMDCLk3EC/1aE3mOGQmSjTDM1YHCmQ
	/5mx5PtzpwMWxBE0IC8EIeI=
X-Google-Smtp-Source: AGHT+IG+ttSdqT5Jha3JUwxZYiJJlJJCtQzdNAhIwuopeTVdVpuvYmkXZgtqvBH+M3EiZ6GbdP+yXg==
X-Received: by 2002:a17:907:7714:b0:99d:fd27:b38d with SMTP id kw20-20020a170907771400b0099dfd27b38dmr16989810ejc.70.1693123283542;
        Sun, 27 Aug 2023 01:01:23 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id pg23-20020a170907205700b0098e34446464sm3181883ejb.25.2023.08.27.01.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 01:01:23 -0700 (PDT)
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
Subject: [PATCH] Revert "tty: serial: meson: Add a earlycon for the T7 SoC"
Date: Sun, 27 Aug 2023 09:01:13 +0100
Message-ID: <20230827080113.2790-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_010127_508303_8AD45615 
X-CRM114-Status: UNSURE (   7.68  )
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

---
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
