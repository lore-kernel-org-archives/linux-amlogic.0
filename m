Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7BC6FA99
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4Z8KK1GmEwII+IZVVP3rwUgp//pAQDG6QWYnmRrUec=; b=H3Ir4D+8z6iy+3
	tltOrndUpFrQqFcxyMLpwE0CMz2LcqF+zm6gwfmCRlcFGatX5wVQoxy4Zwp/BMRQ3pnEe+IJ03EQP
	MBGRtqXN89u73AVYXB+F4f1erdqljhD1zJOtWvIKLuQkiN5qFrhDWt10JCFqmtVyDFIZ8f9ujnGQQ
	6tn3iEBb0QIrdPWgdeMa5aYyOzzypPNXm7BeCJCcJvKOke9wNpC+ClDJgUUT11WhF7KqFgGyHIhMX
	m68RM+5HJplzZnqs0gfjJYVYMzBiLXgjHduMGp74vJ9LMgg0A8DA96OLu3sqm2J21VWUU8/n6uhto
	5hyW9SAOw8rq2TQ5Ukbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfm8-002f3S-Al; Tue, 07 Mar 2023 22:27:16 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfly-002f08-3J; Tue, 07 Mar 2023 22:27:08 +0000
Received: by mail-ed1-x535.google.com with SMTP id k10so34573231edk.13;
        Tue, 07 Mar 2023 14:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678228023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anzenqyGPX1zATM+Ik1tqHmVrqFOd5DGjw4tZBK7I3Y=;
        b=d+sTYq7beUAgj7yD5T+s85jXIjQfykj90WamxBtALfwdLz3hm1skI9C5joR2KVP+qw
         Z8PjrFdH1wPSMyXlVEqAyNb9eHHcI4KuVE4YTFqpSe8ZAhE3lPwawp2Qly14SLhbC4i5
         M6gwlXoSJ1JwcNIArAmazkhWuQd433rC6lRHeuB5Ua1Py5PK6HtMHZb42mixLaX6LWAo
         ir16XK+Q7Ei+JqrkjjEufOkGtNTemfVr3tFz6R8w3VaMUZsmwcYZ3VB5uF9oyIupACmJ
         BqWFXAmWMADPuxdugsNkDmvPHqPlWAMyeFm4Lwhrn0uvfXijtJs+8iqHzO5qq8yNkjIr
         7w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678228023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anzenqyGPX1zATM+Ik1tqHmVrqFOd5DGjw4tZBK7I3Y=;
        b=gLd1eLZCCF9PFEBukMBlTNMFzNR4zitM4HKLKtHAbkjwaLyz6smeYjzq7FXQfK2QsJ
         Y6MdTw+wf7dPSK47ONOfWY+5yaVKTNgEOy3KRP/zlzVYfnl1rM7kW/v0t6IyRTZHOL8j
         h6Nj35nUF1xncutIbJHH2unPpnmJvqSG4HAfkwBWP2im/6baI6VSLwPDVWTu6QtJkepz
         ZeXfHRHXWWj1ghI8qjhOJhvP9bfc4VhfDLoOA4ODBIOqTK/85YbeB5IQ/XDSgtNyrmae
         zmrvVEZdhKkYqVJYE447MssPyWl8HSoHDYoiQ4Q7rDakz/NnVYA8Dxj2pun18UyRNfgZ
         +98w==
X-Gm-Message-State: AO0yUKVs2UBlS3pE3p5iW3CXi29Tu2wiMRKVV+72DiPOY6UVMvluXsqK
	x/dGMmdLDnEbAb3GH5dUIuFqVazARlI=
X-Google-Smtp-Source: AK7set/2RZshpDSi+mZ4EnPSvbJMg/kI5SVgIRcnSFkSj5kO9oVK2qdmERpTEUwnug05sCriwqNPVQ==
X-Received: by 2002:a17:907:7b0a:b0:88c:6345:d0e7 with SMTP id mn10-20020a1709077b0a00b0088c6345d0e7mr17148160ejc.36.1678228023429;
        Tue, 07 Mar 2023 14:27:03 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c485-ef00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c485:ef00::e63])
        by smtp.googlemail.com with ESMTPSA id t19-20020a170906065300b008be996c1630sm6669412ejb.39.2023.03.07.14.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:27:03 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 2/3] tty: serial: meson: Add a new compatible string for the G12A SoC
Date: Tue,  7 Mar 2023 23:26:50 +0100
Message-Id: <20230307222651.2106615-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_142706_154490_75F6C2E3 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A (and later) SoCs also have the "divide XTAL by 2" bit
as the S4 UART controllers. Add a new compatible string for these SoCs
and enable the has_xtal_div2 flag for them.

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes from v1 -> v2:
- none

Changes from v2 -> v3:
- none


 drivers/tty/serial/meson_uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 74110017988a..2501db5a7aaf 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -779,7 +779,7 @@ static int meson_uart_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct meson_uart_data s4_uart_data = {
+static struct meson_uart_data meson_g12a_uart_data = {
 	.has_xtal_div2 = true,
 };
 
@@ -788,9 +788,13 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
 	{ .compatible = "amlogic,meson-gx-uart" },
+	{
+		.compatible = "amlogic,meson-g12a-uart",
+		.data = (void *)&meson_g12a_uart_data,
+	},
 	{
 		.compatible = "amlogic,meson-s4-uart",
-		.data = (void *)&s4_uart_data,
+		.data = (void *)&meson_g12a_uart_data,
 	},
 	{ /* sentinel */ },
 };
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
