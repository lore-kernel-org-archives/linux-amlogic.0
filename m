Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6ABC71153
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKGhD3gDo/zAhE3W9OhRIoTNK6St7FkH8fC/TQm9AW0=; b=O0amMECuDjoAR7
	bLPhzZ+p6uayhjhirr0qwzMaza7MBBjHB9LXML8p+ktQArwGhkEqcCmKJnOV1pD3D7FLlMHTiJF3K
	JDr0aeNUEhiUsDn1SPgbSrTqa9f1Zw56g8CMBBXHHQXZKI4a75mvnSl2GkiooT6SkaBN5KR4qCdUU
	6aDIWjvX8zYQCVXuJ8K5OZ3qTmvVYvijF87SfV0UMu1KKr58/8uJbp0FkPZ9/uL2lTgA4lUOCQ027
	0kmDG38Nx/4Ze1ppvR/UbZ5js02mSL2tZSH+7h6Sj7GgvFrwbau1ETC8s2FLmcpLcsp3GqVf0G3Ck
	GybUPeSOyaLgji29lVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qab5C-009XNS-0L;
	Mon, 28 Aug 2023 12:11:02 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qab58-009XMU-2u;
	Mon, 28 Aug 2023 12:11:00 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99357737980so399762566b.2;
        Mon, 28 Aug 2023 05:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693224656; x=1693829456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRKpAHPZEPVk+Fg369igBwYVlHrrvSUCvtuNi+MYNXo=;
        b=U2T83WVg7H02GtyXRmlZ77MSqnjJzIPn5kbe2MwSF0EE0h9zrSHReTzGkpKJM46V2n
         hF2m/PrQdmkxkP3mKv86tF2sm8i5jQLcL3e4oBYuj76EjiUnJlfLQD779N51LXcv3pMe
         mB4xdXj6vYmAcVein/7onkdEgwKBsVq7fgWiylI4c3O+uIrs35sPTl+04Mwi3fzq8RkK
         fYJttrO4uWv4rTi9WI5/vlHxPrcSKUHhItdyDInCvjQ3eV2YVNHsGBRdu+/wigyibrnT
         e+ya5/6YodizYCJSFs6xNWJHaZpg9Fsvmr67VkhgRxcyd9d4ODIH3c868bMPd+GrzqPv
         dfHA==
X-Gm-Message-State: AOJu0YypxHQf2Rr+X7YsABXvoIyG+UeKvHZKeEWb+GKYKRKDRdCn2Xlc
	8LMYQNUC9KC3txX97ZNhNp1x4uOQ271jW+vV
X-Google-Smtp-Source: AGHT+IHh+jPAccLUybH0bG/hIhhcuZ570OrmJ9A7mqLj9tE8GeUWkUzWVRIvU1zeaQzCA2PXS+/2oA==
X-Received: by 2002:a17:907:6087:b0:9a2:96d2:b1e8 with SMTP id ht7-20020a170907608700b009a296d2b1e8mr7132102ejc.54.1693224655865;
        Mon, 28 Aug 2023 05:10:55 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906081900b00992ea405a79sm4567898ejd.166.2023.08.28.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 05:10:55 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH] tty: serial: meson: Add a earlycon for the S4 SoC
Date: Mon, 28 Aug 2023 13:10:53 +0100
Message-ID: <20230828121053.60838-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_051058_942062_504EF2DE 
X-CRM114-Status: GOOD (  10.34  )
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

The new Amlogic S4 SoC does not have a always-on uart, so add
OF_EARLYCON_DECLARE for it.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 790d910dafa5..8dfaa260e545 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -646,8 +646,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 	return 0;
 }
 
-OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
-		    meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart", meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,meson-s4-uart", meson_serial_early_console_setup);
 
 #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
 #else
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
