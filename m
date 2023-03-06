Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDA3C6FD1B
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPsCnL1QvKLA+/qVd9tLT4H+naATfGTHgCGdpsFtwkg=; b=gVhpf7224kR8Z9
	qDjmrBVdJXp5Syu1llALQ65ZB00N3+sQCL6VgXcCPG7Mzo3bmCH5EZ4elCQxD3CYWY2SLt0/3dCpa
	kxiofjW7pIlkhWL2n1BDyQBDn2rJsQwDRyl9Grjk1jLVOZwoYtRpGglPTHYckt4R+AmvVCcgP0PN9
	nKAjsXQYkntF3v9XB4ttmsuTkHeee5bDWT8P9e6+cIC8eU9Pm2cSzxGauQQ2zT1uz84Od0hjPJjwc
	W3+ml1o/yzRkFD8/uHs/Ifp1U6Md6oqmB9X9AMCArTHS5qlJHtRHGPa8G5n8UMqhWh15eYXcxoQVc
	6l6ILOVomJi1p/Zc759A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjg-00Ee4E-Iu; Mon, 06 Mar 2023 19:43:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGjT-00EdxZ-LL; Mon, 06 Mar 2023 19:42:55 +0000
Received: by mail-ed1-x52b.google.com with SMTP id da10so43443629edb.3;
        Mon, 06 Mar 2023 11:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678131763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q41eI3CW9uAy7k5oi4qNmPdGdSMRz93rZBadRTLziRk=;
        b=qVMrDRmQn/iaiP9Wa2lsVvY0Irv1NqrUfRTXCepPG5gW4vXNaGEtS1CxDqleR6VYrx
         soQwe1Bola+ES46V3O2Ha/+bItqmj23kDdUN/5YfYEywdpla3BYqwnitqWDttTYPn6RR
         10VhYy2tVr7o0yWAsH1ouzn2but4BRxcoVp6MC9GExtFdr7epyhBqRgO6xAR/V6/K7Ht
         oW0CYLnJrkB97sERv7jp18DzTIBQmnBNf16zsCbxL1UWSD3maO/f7e8MIBMekdTayNs/
         Kabpc360zAECQGiJXsl66tEqpls+ECpFruy0gmgRGYoyWAwVsMTlimaMfWs8UkzSsdoj
         rKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678131763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q41eI3CW9uAy7k5oi4qNmPdGdSMRz93rZBadRTLziRk=;
        b=hsj+9JQi8HLdVCwX9WcEB8XNkidpfkfBOmlu4q4SDVSwakPqWHGh/jc7/YelkpBk9v
         CUre+6UAX5WhQlkPB4uRm+ugk1RWDhbcEMaGhdCZREuiGZYu7pPFTaVO7m8JTa4fXr2n
         dnfT7FRedF5+VXrIQV/pgNnN0hyDfQzJnAcem/Agru78dglInX7Sms7o54EzfNlekbDv
         Kyay74w7uJVKDPzBQO/XGWALcCU6EWOeINmhFxVcYYrhV4PGtpKw5bepn7PFKwjM1ofa
         6X1n8Fp5yEiF2AEv55cm9lik8KXOnfhCcdqFYZ/EcsnPNGGiT6T6XQSTIUrIUkuP+W1/
         gSHA==
X-Gm-Message-State: AO0yUKUESKZkKseSxDZEQBAsJnhaO7V0Lpp3IYwIcxj+zvjESda8X78B
	+O6w9/vLJ9b60fP0p5SOhVArW0Rmojs=
X-Google-Smtp-Source: AK7set9HvmALN/zwsmRbaBhWZ8lXmYT6BfuINzZbe8SDfa45rG8WuMTks/HGygS9zDUm/OQ3bSgQ/A==
X-Received: by 2002:a17:907:7fa7:b0:8d7:6699:3bae with SMTP id qk39-20020a1709077fa700b008d766993baemr14147626ejc.57.1678131763279;
        Mon, 06 Mar 2023 11:42:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c405-5c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c405:5c00::e63])
        by smtp.googlemail.com with ESMTPSA id e19-20020a170906315300b008f2b0c6052csm4951868eje.89.2023.03.06.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 11:42:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] tty: serial: meson: Add a new compatible string for the G12A SoC
Date: Mon,  6 Mar 2023 20:42:22 +0100
Message-Id: <20230306194223.1869814-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
References: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_114252_237985_929F6A6A 
X-CRM114-Status: GOOD (  13.88  )
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
