Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7846C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Dec 2021 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rzTiQJPxXVaeM8JjCDJYMRjByQIsxyt9ibEWdpOWCDY=; b=dt+nyS6rOGcWJx
	uskOYn08ip0+2XNovJ/dZS2hFOkMkiDILkBth62NkJG/yW9P4w9aDSTCI1l/W5FoLVPhJylylnHaZ
	EJ7zmfvCqMgcH3aX7UF7GwksL5m52CjibNLRpK4oXLmVYGFjc3K4jojEBWpMhXehdXyfQ4TOhGHhM
	SRma9E62qXjeHPxbDEoPZbpKycfl/LKFVEaVWiQOY8Iid4T+k5IYlTGlW1DyNe9RFxxL0UJ5g7qez
	2mO0gaV1KolagoEa+hHE4uVVXlCbioK8SikAp84XhSKpW/ch/XKzg4vdnr4fhQA//LmN+T8KmEGzb
	agCr0R2wLy4PRBl3oyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2ZPV-002r0U-K8; Wed, 29 Dec 2021 13:54:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ZPJ-002qwz-PV; Wed, 29 Dec 2021 13:54:23 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Wed, 29 Dec 2021
 21:54:15 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V2 0/6] the UART driver compatible with the Amlogic Meson S4
Date: Wed, 29 Dec 2021 21:53:44 +0800
Message-ID: <20211229135350.9659-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_055421_875103_E7125796 
X-CRM114-Status: UNSURE (   6.78  )
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

1.Using the common Clock code to describe the UART baud rate clock makes it
easier for the UART driver to be compatible with the baud rate requirements of
the UART IP on different meson chips. Add Meson S4 SoC compatible.

2.Fix some omissions

3.An interrupt error occurs when the user opens (/dev/ttyAML0) twice in a row

Yu Tu (6):
  tty: serial: meson: Drop the legacy compatible strings and clock code
  tty: serial: meson: Request the register region in meson_uart_probe()
  dt-bindings: serial: meson: Support S4 SoC uart. Also Drop compatible
    = amlogic,meson-gx-uart.
  tty: serial: meson: The UART baud rate calculation is described using
    the common clock code. Also added S4 chip uart Compatible.
  tty: serial: meson: meson_uart_shutdown omit clear AML_UART_TX_EN bit
  tty: serial: meson: Change request_irq to devm_request_irq and move
    devm_request_irq to meson_uart_probe()

V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
discussed in the email

Link:https://lore.kernel.org/linux-amlogic/20211221071634.25980-2-yu.tu@amlogic.com/

 .../bindings/serial/amlogic,meson-uart.yaml   |  10 +-
 drivers/tty/serial/Kconfig                    |   1 +
 drivers/tty/serial/meson_uart.c               | 359 +++++++++++++-----
 3 files changed, 265 insertions(+), 105 deletions(-)

-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
