Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ECFC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 07:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYPQYQ/VGRmEe011Q2sUjE+SoFRSRfGEsfkUpXVbmlQ=; b=tRizagFAPaKr9t
	A1hY028NVoDykqdJ1O7riBN8+WPLzi0480kB0MpVvstNLyHplJ6ePRYDYMu+neAB0fbTN4vco4EP3
	NJZLksZHC4kfZ0v4Bj/RsSmGYl7kPI3GO+Fy48nReX2Hi6uzWz9V89OUyzsvU/CN6Gid0jXDIlJDI
	OxsUDnuw0yMgF8C3B7S8M6SDalqCDVmqj6JxeHdxL73w0rtYPCBEzMnJsalroQJ9zWSxC+gEDgX7C
	yJjwS0C2OlAgWAJMghFc+/LEmnqaMKZubNFgxpNJylxTkC1mxYMLKEGvBqxGu/EWBAy0Sv41DEMih
	kVwFnCYRF5ZY3urLArIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVFB-003eZ1-HT; Fri, 25 Feb 2022 07:42:25 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVD0-003dXE-Rb; Fri, 25 Feb 2022 07:40:12 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 25 Feb 2022
 15:39:55 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V7 4/6] tty: serial: meson: Make some bit of the REG5 register
 writable
Date: Fri, 25 Feb 2022 15:39:20 +0800
Message-ID: <20220225073922.3947-5-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225073922.3947-1-yu.tu@amlogic.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_234010_949446_4FFA159C 
X-CRM114-Status: UNSURE (   8.59  )
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

Make the internal clock source mux and divider writeable, allowing the
uart to deviate from the settings intially applied by the ROMCode and
using the most appropriate clocks.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 4768d51fac70..ba8dc203b9cb 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -686,7 +686,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 						CLK_SET_RATE_NO_REPARENT,
 						port->membase + AML_UART_REG5,
 						26, 2,
-						CLK_DIVIDER_READ_ONLY,
+						CLK_DIVIDER_ROUND_CLOSEST,
 						xtal_div_table, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
@@ -708,7 +708,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 					CLK_SET_RATE_PARENT,
 					port->membase + AML_UART_REG5,
 					24, 0x1,
-					CLK_MUX_READ_ONLY,
+					CLK_MUX_ROUND_CLOSEST,
 					&use_xtal_mux_table, NULL);
 
 	if (IS_ERR(hw))
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
