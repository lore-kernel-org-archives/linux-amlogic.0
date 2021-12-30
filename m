Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B060C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 10:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lubAAJtrgX6jJSipF9gwsPia4RkjB6aUalHo6s+sMWI=; b=KcFq+S/X72EuSS
	stpq0nw2r8pH7ao2UMbcT6/xfZ8oIyBQEjd5Mjb3W6GNderF56G6r6SB1kRUCzUUGw4WNXZXlDpKU
	ZRIDqty37g4ODrJG1Pgfnq1QJYuQNkF2AD3k1ivQ99Ig+Zqpic9gOCOe580jb/QX8OYUxJNg+taER
	k9itMJYZEYbb+KF8FY246saM+zznnfVvCTpRFMCqtZYbvkUK3uIcDIjRNb40cJymXRAqq+dqJfpdf
	7AZcrjY8xW+R0fiC4zrGNaCfCz/bub9i59FOtfA3AhwKNziyuu202t7klMhBce7mYRGbAFr/Toi+X
	GF+yV+9zJnf4QUtaEWqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2sZF-004BbW-Ax; Thu, 30 Dec 2021 10:21:53 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2sZ3-004BXP-DS; Thu, 30 Dec 2021 10:21:42 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 30 Dec 2021
 18:21:38 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 0/6] the UART driver compatible with the Amlogic Meson
Date: Thu, 30 Dec 2021 18:21:04 +0800
Message-ID: <20211230102110.3861-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_022141_482252_362F3410 
X-CRM114-Status: UNSURE (   6.74  )
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
easier for the UART driver to be compatible with the baud rate requirements
of the UART IP on different meson chips. Add Meson S4 SoC compatible.

2.Fix some omissions

3.An interrupt error occurs when the user opens (/dev/ttyAML0) twice
in a row

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
V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
the DTS before it can be deleted

Link:https://lore.kernel.org/linux-amlogic/20211221071634.25980-2-yu.tu@amlogic.com/

 .../bindings/serial/amlogic,meson-uart.yaml   |  10 +-
 drivers/tty/serial/Kconfig                    |   1 +
 drivers/tty/serial/meson_uart.c               | 367 +++++++++++++-----
 3 files changed, 273 insertions(+), 105 deletions(-)

-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
