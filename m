Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351CC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Dec 2021 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4cdDCg9/U5lhr6o4IW8ZivoSyai8ducbbn5w5Dgoln4=; b=uX1UcOcNMBRc1T
	IQiS7zr2wQ69b2LThG8DT1vJD42ZAgGthlxcpAHl1z/0t17345sPamxmXTxZAx+4t/Z82OxrDxKqa
	03ltNQz4VDkkSXKDXygifB5qlLitXmqfuQElTo4oXcT2sTEeyRpkralw5l0Y3ESSrqxSYQ2/YgqI6
	m+ZxlpV7UC4efZfRBIohBJQJx/cKF8v222pnwtGYPg72urx1LoBp+8pOeSHLOMW/CqfFzg0EBH64F
	LPBDt3lNaHziNA6OwdAphrn2VA9qsN1NhNYyiIIXv/jy1w5YRu3qeyVmyVnLvDE88Hh21NYDOzEAf
	L2yHzg5eU8pe3m9PQvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzZOo-005jkM-7U; Tue, 21 Dec 2021 07:17:26 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzZOa-005jgE-7R; Tue, 21 Dec 2021 07:17:13 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 21 Dec 2021
 15:17:00 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 0/3] the UART driver compatible with the Amlogic Meson S4 SoC
Date: Tue, 21 Dec 2021 15:16:31 +0800
Message-ID: <20211221071634.25980-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_231712_318303_CC8D3281 
X-CRM114-Status: UNSURE (   3.92  )
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

The UART driver compatible with the Amlogic Meson S4 SoC on-chip, change the
UART interrupt interface function while adding IRQF_SHARED flag. And add clear
AML_UART_TX_EN bit in meson_uart_shutdown funtion.

Yu Tu (3):
  tty: serial: meson: modify request_irq and free_irq
  tty: serial: meson: meson_uart_shutdown omit clear AML_UART_TX_EN bit
  tty: serial: meson: add UART driver compatible with S4 SoC on-chip

Link:https://patchwork.kernel.org/project/linux-amlogic/patch/20211206100200.31914-1-xianwei.zhao@amlogic.com/

 drivers/tty/serial/meson_uart.c | 70 +++++++++++++++++++++++++++------
 1 file changed, 58 insertions(+), 12 deletions(-)

-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
