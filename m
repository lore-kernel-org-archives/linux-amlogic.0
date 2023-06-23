Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A48FEB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3L7tz/go3zeNY55DVZfMFE0hNcW/yurnKJPEL7Mhz0=; b=HZkAo/Tx/lenBM
	i3AqbK2cTb7xaZxrueVErz7W9HqQ5e9E18DEp+VMNLTMziZwvhgp2e+9ew9MPtSEf5SYr7h8s7cLG
	P7RY/wPGUkZq7FAobQSAJ+kLuZmRI8/ZJfVj8EIEnmyhdO+VZzkZWp3PxTmHpTvyPTy39DETesoFj
	by5+9un14HJvMcgzReALS9OBch5DnfH3HURspwbhHMGT3Wzdj4RM5j8ppgXR/pdQ3Ig9NltV9LSGa
	h2/LGI9tI6malS7oWQ1fI3T4azc1Oagh6/ikeTZ3+mIGXP1tq7Ql6gc52Fp5o1XPpYkq2WNOxC7j0
	/62rqOQAcwFmn9zjf/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuW-002t4r-1G;
	Fri, 23 Jun 2023 08:12:52 +0000
Received: from mail-lf1-f50.google.com ([209.85.167.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuT-002t2d-0o;
	Fri, 23 Jun 2023 08:12:50 +0000
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4f95bf5c493so331175e87.3;
        Fri, 23 Jun 2023 01:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507967; x=1690099967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upg0hHPusTHNHHtpH4yxVwhsX5Py4GST1osQ8SxWcwo=;
        b=Qq0eo0bm2zbtJiUJaFBRtW4YULw/LXk8inXwVznJUcrENSJ51EbAd2avr+xlAK0Wia
         Sz9UMvHq68A7ZpbGQPk8cIRYUXYjBGrjvyNbLhBRtRALT1cADv2oj6gdWPeTgsJ3hIqt
         8fkJgJ25PfPpmcGmFx+hkGidxllbsgqPUe+ps6pnuUPImp2Dhf7UW662F8MbcV4Ggibd
         E429vSr9y/0/LiTgfTXXe5gicmxPuHxP/bxEBP/vla/mr6JSvF0AdJoFF6xfvKlIuzr/
         ay/7HMZU00OyAOa3rNtdPWVfdpAADSxnGxahmlQUGohP7d/ZDHm34CvD+U6fauxWISOT
         RxLA==
X-Gm-Message-State: AC+VfDwxGIqb2n0/NP9zUpqlqytQtaqMzZK/qcojxAKNA9q38xDa/As6
	UaoJRlcdCTj2kQxieUqTOJY=
X-Google-Smtp-Source: ACHHUZ5e7jJXR6du4xziaPnDR4mPvThK3pjT/SA1z9xUsBWSRcruANHFzNte7v3kqfjF7i3BLtOuwQ==
X-Received: by 2002:a19:7912:0:b0:4f4:dfd4:33e4 with SMTP id u18-20020a197912000000b004f4dfd433e4mr11028306lfc.51.1687507967132;
        Fri, 23 Jun 2023 01:12:47 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003f9b29ba838sm1594141wmi.35.2023.06.23.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 01:12:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v5 3/4] tty: serial: meson: Add a earlycon for the T7 SoC
Date: Fri, 23 Jun 2023 09:12:41 +0100
Message-ID: <20230623081242.109131-4-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623081242.109131-1-tanure@linux.com>
References: <20230623081242.109131-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_011249_284368_67FE40B7 
X-CRM114-Status: UNSURE (   8.73  )
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

The new Amlogic Meson T7 SoC does not have a always-on
uart, so add OF_EARLYCON_DECLARE for it.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/tty/serial/meson_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2501db5a7aaf..84d33903038a 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -649,6 +649,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 
 OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
 		    meson_serial_early_console_setup);
+OF_EARLYCON_DECLARE(meson, "amlogic,meson-t7-uart",
+		    meson_serial_early_console_setup);
 
 #define MESON_SERIAL_CONSOLE	(&meson_serial_console)
 #else
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
