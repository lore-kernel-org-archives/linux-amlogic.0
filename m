Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC224C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 08:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+nDBQDfM+MtyKPsPvoE4wQ6gIHmu0r7hJELUeoB7aI=; b=D8a78v5FWJmmVZ
	WemsIqVLgbuHl1KqPyWseps5CJQqPcyMNq2/PxgxWJbxSAe76qJ2RQFNw+TQI4ev1Vj+Uah3uCST8
	/eG7ySmf19nMVvT9IePLop06py+ysuk+hh1I0DXmXVRytvO0KF/Nd1Z56NLMQiJPgkhySC5xlAGPA
	+4chwCFPfx3Mx1ecPmSh0KPE7fAfPVe6wf9lQFriyJXCDkQQH07s2Nzv/+GUJt5R43+TkKSADQQzY
	34RtbOiMTtNgch+PbyxxPoooVqDMmi3dEXewjvFhnuqV5oNlaWtgBLbMsHxwiSybbvf7j5cDpyoSY
	ku2zNn993Lw2rIDcFfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6q1a-009qfn-Dl; Mon, 10 Jan 2022 08:27:30 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6q15-009qSs-HE; Mon, 10 Jan 2022 08:27:00 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 16:26:47 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH] tty: serial: meson: Make the bit24 and bit [26,
 27] of the UART_REG5 register writable
Date: Mon, 10 Jan 2022 16:26:11 +0800
Message-ID: <20220110082616.13474-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110082616.13474-1-yu.tu@amlogic.com>
References: <20220110082616.13474-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_002659_602360_EDD0C0F6 
X-CRM114-Status: UNSURE (   8.70  )
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

The UART_REG5 register defaults to 0. The console port is set in
ROMCODE. But other UART ports default to 0, so make bit24 and
bit[26,27] writable so that the UART can choose a more
appropriate clock.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 7c3f30cea68e..b0551750dff8 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -693,7 +693,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 							CLK_SET_RATE_NO_REPARENT,
 							port->membase + AML_UART_REG5,
 							26, 2,
-							CLK_DIVIDER_READ_ONLY,
+							CLK_DIVIDER_ROUND_CLOSEST,
 							xtal_div_table, NULL);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
@@ -719,7 +719,7 @@ static int meson_uart_probe_clocks(struct uart_port *port)
 					CLK_SET_RATE_PARENT,
 					port->membase + AML_UART_REG5,
 					24, 0x1,
-					CLK_MUX_READ_ONLY,
+					CLK_MUX_ROUND_CLOSEST,
 					NULL, NULL);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);

base-commit: 93a770b7e16772530196674ffc79bb13fa927dc6
prerequisite-patch-id: 95191c926509964c8e9bf4128b8bbad8a277b84a
prerequisite-patch-id: a2e4756ff85f0df0efe111d7e2cb51b8e26e226f
prerequisite-patch-id: 4e4d909acabcb7533da20e2207207be73454a88c
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
