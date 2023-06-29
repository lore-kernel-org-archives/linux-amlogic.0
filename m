Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A795CEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jun 2023 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRmcY2qsJQ5FBOA3niGVUViYbHXrP3GX68u63va4x/w=; b=YASTahKPeySmba
	uARnQZe89ChcPFi/dSFh7USAPDvgyFDdGVBjKPNfSmcHGsbwawJX9w+5KxL0UZAXJgz7OCGK46sTL
	xDXbdtEnJ1oJWzndNX4Hs4T3ia+5Pbl3LKtFJkKZRUd6hoWhnwi3PzE0M6laPn/IadHvW5HCvZFGv
	VNGVLN/zYs+fjxyiAqZFV8pFNsL4pRdQzOvdIYmUTj5CS3fyGISMm5rPtFQeQi/YVRh34DWgKHEYl
	8gIO3aUv8xU/d8m1J/M8wKZ7NIU1l93Votz5wtK6SzJdAmX5eOcvRE/hOUEym2WYYwKvC5z9wvUO8
	mQDz1ZD2P0AuAd4khNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAp-000DEl-2r;
	Thu, 29 Jun 2023 07:34:39 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmAf-000DAN-0S;
	Thu, 29 Jun 2023 07:34:30 +0000
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51d946d2634so422763a12.3;
        Thu, 29 Jun 2023 00:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688024065; x=1690616065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6T7r24ENI7G0wksSZQkaqpDe3IM+chAS5vheCtgJd8=;
        b=HhiCdFrG2R5J9rsRLi1nxGDXJKxpX9KspckHRscztDtntM41sPCLm2mq8/92MOtoN9
         cfnaGKnD3BUSBh15iMeSoQi7ynZxYDaj+7R0dgfP5mS8Gn2T21CMYpbsFG90yRVNN1MG
         fzFcZVzP9M7nd+vq8XUzWIrHJGczG0UHmeMkO+Hs4ecCyDxYCiVmML+09BEEIa7vUeme
         43861IMAVjXzlyN0T0uqyTklYiaGGWOn3XFd5xQQutcTHqGV1Cxa7jyDkRc7h/RCWuvz
         9ok71qgh8creWcURWeHk6sZZgSOz3QfXsSufPypeOXVpywoc2oeSUNkWiu/e3dhztnPe
         dPaQ==
X-Gm-Message-State: ABy/qLaoZ45GiSKm2BSDDdzO82oCiBzd9ma32yRUpB2QQ/CP2Sti3XWV
	ZJbOfbytmwj2/RBqUBL69Lc=
X-Google-Smtp-Source: APBJJlFk8i9NeMAgJv7UPq36pyJkMY0ql2BNqaQJs8WwVB9P4KcwdXVQm0eEZEGpoia2vi3M14jaUA==
X-Received: by 2002:aa7:c2d9:0:b0:51d:d5f2:121c with SMTP id m25-20020aa7c2d9000000b0051dd5f2121cmr1291170edp.5.1688024064797;
        Thu, 29 Jun 2023 00:34:24 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id be28-20020a0564021a3c00b0051bfb7de166sm5453716edb.39.2023.06.29.00.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 00:34:24 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v7 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
Date: Thu, 29 Jun 2023 08:34:18 +0100
Message-ID: <20230629073419.207886-4-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629073419.207886-1-tanure@linux.com>
References: <20230629073419.207886-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_003429_176365_A53EBD0E 
X-CRM114-Status: UNSURE (   8.87  )
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

The new Amlogic T7 SoC does not have a always-on uart,
so add OF_EARLYCON_DECLARE for it.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/tty/serial/meson_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2501db5a7aaf..c24e105a98c5 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -649,6 +649,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt

 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
+		    meson_serial_early_console_setup);

 #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
 #else
--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
