Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B4EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/CF1VrmxQyk1e0mK/Z50fxiOmLaa+oxYgXT6jL3vE8=; b=P6Q02xUJLSw6+8
	Y3XcNGGoJ9pk+WWjNtl/oXWhvTnNC3dVKRNGKp+WWvnO3H10o8ePmbjhrmm/eT5jEc9O5bXhHQLOP
	uazd/+Hvh529buGWgeUDvCf3CJhCdKijy7GkI6Ci5yaLq1y3WN6yw+IlnV5EIs8WGBUSxRIWonH35
	wX4aZDFxARTwD+WZq3vxpcZ2jW2saS0x9kCj4+3YQaq0WHUo8jJrOQzEatX/VrzwtiU2t9PAu6d6N
	q9XFJZD9i5SGnPo6R128rQJWn2WvdP6m8J+0p2HCJK6XAB9/uKqMuHKqMz4C6hK24OD0nfOHmdgh5
	T6wa8XZVFbsCW+oJq9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rjM-00Fkhu-2G;
	Thu, 15 Jun 2023 18:30:00 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rjA-00Fka6-2K;
	Thu, 15 Jun 2023 18:29:50 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31119a33ea8so656388f8f.2;
        Thu, 15 Jun 2023 11:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853787; x=1689445787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rljMIAz3eZzDzsPXsEwblV15FzZCxzBSB/L1bn8LJCA=;
        b=VxyyK6aP5Ys322Gp4VF7JFyvVdyh4BCXrcxJzdFYdwhJyTREZfF03PmZrOo0ih9OHf
         eV9RjbfUNy9EgGMSAUpcfHOKh6flEBiMGSj6l27qveIq3aXAx78aIVRPukm3B1lzQ7Tu
         +HxBapHEe2yFakcBMljqicLhgyNhEuXaAAwX5GBHXVaqU11ncFEJ6oOMy7LkrVM55FYV
         Q/oC4GUWH6smBrtEojmsPHhIZWakJS2hPjIZUqUlQAN/hBHnVEXb3f4Q4ViGhUGs6HO0
         07c53VCVLzBGXTFAiXd/qIIT0KdF+dP1UR605rSl8aJdXdAiPAeUaoe74MgBJwUMH65/
         VvXw==
X-Gm-Message-State: AC+VfDxfspn2xPLHK17ylWKAR6ynVHiIFW5IwfCVFZvWHgV0tdTOHb5S
	9yB35F4jvPhgkNz2UmfVEYE=
X-Google-Smtp-Source: ACHHUZ42fJgQgOrOKzgTBUo/P4dWEDA319DLseAkmLt8CW7hBygQiDkavmgcmQUbZq0mtu7H+NMyxw==
X-Received: by 2002:adf:eb92:0:b0:30a:e93e:82aa with SMTP id t18-20020adfeb92000000b0030ae93e82aamr11756161wrn.42.1686853786778;
        Thu, 15 Jun 2023 11:29:46 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm21525887wrr.46.2023.06.15.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:29:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 5/6] tty: serial: meson: Added T7 SOC compatibility
Date: Thu, 15 Jun 2023 19:29:37 +0100
Message-ID: <20230615182938.18487-6-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615182938.18487-1-tanure@linux.com>
References: <20230615182938.18487-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_112948_774465_A3D78136 
X-CRM114-Status: UNSURE (   9.66  )
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

Make UART driver compatible with T7 SOC UART.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 2501db5a7aaf..0208f9a6ba7e 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -796,6 +796,10 @@ static const struct of_device_id meson_uart_dt_match[] = {
 		.compatible = "amlogic,meson-s4-uart",
 		.data = (void *)&meson_g12a_uart_data,
 	},
+	{
+		.compatible = "amlogic,meson-t7-uart",
+		.data = (void *)&meson_g12a_uart_data,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
