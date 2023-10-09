Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6F7E95A91
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y08+XuCOMChI9XdLcIILvRN8CNO3kdUwhcrWL56Rp5Y=; b=tXYZd3xCkMHfdA
	wDmBLAmyHEe9FVkZrgif9qE68EVR4hPXCrRQjeI3RG30OUUWBpSOj9gnV4zS3hNl9vntnDKz26BO+
	wKjiw4U7VCvT8m7ANbp5bK3ttUEq806f+2+H6n6yC10ZVMKrmtua51G8alXJoClXlcmNvoGLu8Dn+
	JYdbGeraqNhfecgulS1ZA+PTslh1PGok8EF5TGmi5H4qDVAu9Xt4TE1FtBwXlZeV/gFa5csY5v+oR
	Un8rgAb+39eHa3o51dEOUzgPUDa5z+1sqUGPh07uCS41G6SuRTGcP8wp74smW+i8VW2cOw7IENkYy
	Khj3+GWCTe+ggMwZwyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7C-00AaHH-1O;
	Mon, 09 Oct 2023 12:12:02 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp78-00Aa9C-18;
	Mon, 09 Oct 2023 12:12:00 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4060b623e64so26711835e9.0;
        Mon, 09 Oct 2023 05:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696853515; x=1697458315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqMkCHIJg0J3KfyKm+ow+U1NVWJ1Dko3B1vIyVCrYS8=;
        b=kOolOIhmUmMTS6+qYNWfWH90Jpx5j5KMHg39pyefI17lvCd5rXV7wrmMfrZLsmRaJJ
         NdH9qV6iTgsUOe5ml7NR5SaT6kusE3jmy6MW0Z1z8Dl9NTk3NhLFSyHaerXTk8LYWyl6
         ahimSexC6ghrnETLvIhDsszvD6UBJtp5o15kbKeTSnuLw+9fVyh+AkVTo33v2RkHEOQW
         +gR5wBfxC2N9ovFlI0RyqSJ0KLt7ShVfbQq7Joue9fnn3Ps2F/nmkfCCkGvXjne6E//j
         B6TU2hcb1Z9boMr7ZKtU4q+Ii3XPEdoaDXeanp72+5UK5HCyz+kId2QG+506TCGjtunL
         RQ+A==
X-Gm-Message-State: AOJu0YxidTsGux1YbZwC8hIgQb3SaZaPfROkdGFaHH0E/5DcR1dxr8n5
	CpFGMd2TryPCIhCjpGquEZY=
X-Google-Smtp-Source: AGHT+IEhtAtDaeK55NICa8MKuOXjnXZ6tmxOZYYdrOr4f2t7yKAr2Ky48cjoWtiT1sZKpLGG7j8S2w==
X-Received: by 2002:a05:600c:224d:b0:406:80b4:efd5 with SMTP id a13-20020a05600c224d00b0040680b4efd5mr10651820wmm.14.1696853514542;
        Mon, 09 Oct 2023 05:11:54 -0700 (PDT)
Received: from localhost.localdomain (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id l11-20020a1ced0b000000b004051f8d6207sm11067123wmh.6.2023.10.09.05.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 05:11:54 -0700 (PDT)
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
Subject: [PATCH v2] tty: serial: meson: Add a earlycon for the S4 SoC
Date: Mon,  9 Oct 2023 13:11:51 +0100
Message-ID: <20231009121151.4509-1-tanure@linux.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051158_407761_92105C64 
X-CRM114-Status: GOOD (  10.56  )
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
Amlogic T7 will use this as fallback.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 45cc23e9e399..de298bf75d9b 100644
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
