Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C4CC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jk9jjT/qr0UDHf7Ara4rWBIGTJmMNcFU6MbNZiihc3Y=; b=cRSCOqxbfgLs5b
	3E3O5EVc1xc4Kg4QTDOlJh9LCw+PFI9HvpGXbMi7s10BCnMyh4mnTw3a8j+BzM7rLz9/UpK97g/Tm
	jU48/7qhWw58qL0xUR0JKI7XBSlRX9HWfyIk7nuSNlHcAN0nQa7I6+UDzoPV7UdTYwNBXKPWo/fvj
	e9X5xphtsCyoUVGYY0z0oEAfOb8CHud0p+jW87+UsaTGSn8NZTImFrPeM+ED70JNfjm7zzfJsUMO4
	5vjHjWj75k4B/nZ2zRgg2IMc4KzwYCqU3LjsN1fdF8ikUMr8ddDJBU6TbnJXPT66hMtCBCK5dgpV9
	8X4efuq6nd9uoruBxvFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6qk9-00AEe5-9W; Mon, 10 Jan 2022 09:13:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qTz-00A64q-JU; Mon, 10 Jan 2022 08:56:53 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 10 Jan 2022
 16:56:49 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V4 0/5] the UART driver compatible with
Date: Mon, 10 Jan 2022 16:55:59 +0800
Message-ID: <20220110085604.18042-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_005651_696103_176BDCD3 
X-CRM114-Status: UNSURE (   7.10  )
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

Using the common Clock code to describe the UART baud rate
clock makes it easier for the UART driver to be compatible
with the baud rate requirements of the UART IP on different
meson chips. Add Meson S4 SoC compatible.

Yu Tu (5):
  dt-bindings: serial: meson: Drop compatible = amlogic,meson-gx-uart.
  tty: serial: meson: Request the register region in meson_uart_probe()
  tty: serial: meson: The UART baud rate calculation is described using
    the common clock code.
  tty: serial: meson: Make the bit24 and bit [26,27] of the UART_REG5
    register writable
  tty: serial: meson: Added S4 SOC compatibility.

V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
discussed in the email
V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
the DTS before it can be deleted
V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
in the email.

Link:https://lore.kernel.org/linux-amlogic/20211230102110.3861-4-yu.tu@amlogic.com/

 .../bindings/serial/amlogic,meson-uart.yaml   |  10 +-
 drivers/tty/serial/meson_uart.c               | 244 ++++++++++++------
 2 files changed, 177 insertions(+), 77 deletions(-)

-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
