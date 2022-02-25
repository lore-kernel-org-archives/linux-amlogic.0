Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF874C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SBSE3tT26sYdEhoQzJHw0sNLw2so872pxKgxkpO8yfk=; b=IWzMhVvzTaCjH+
	zONDDDN711FtVDGmnoGTob4iFNxifqL4HfzDVPg15X/dhwp4FV4NnKTXywopVKPJ0qyrX4C+CMYJK
	dx4kUqpUTzpGbJaRSobMgZX0UBiPnmmsXSNQOtHN1yRbBwDpekkvM/WLFpfI92e+0szeIHGQIA2M0
	ImWt2FdH5hQUGVuD3UeFje2pm+LNCnt5/rridnGYZPDJ8PoazZFQlPV23UcqWFTEI9Lu871cqErKn
	O3jdPyhyBwo2V7FUQnW4qvhO3+69F8x9vpRe8ivqryqSSqvg1WYxsYwC3LMT+EklCACXzED+65Abz
	rYldHjYRXN42kICqs1JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVDJ-003di6-Mq; Fri, 25 Feb 2022 07:40:29 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVCq-003dXE-Mi; Fri, 25 Feb 2022 07:40:02 +0000
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
Subject: [PATCH V7 0/6] Use CCF to describe the UART baud rate clock
Date: Fri, 25 Feb 2022 15:39:16 +0800
Message-ID: <20220225073922.3947-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_234000_803252_D61147CC 
X-CRM114-Status: UNSURE (   9.30  )
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

The test method:
Start the console and run the following commands in turn:
stty -F /dev/ttyAML0 115200 and stty -F /dev/ttyAML0 921600.

Since most SoCs are too old, I was able to find all the platforms myself
such as Meson6, Meson8, Meson8b, GXL and so on. I only tested it with
G12A and S4.

Yu Tu (6):
  tty: serial: meson: Move request the register region to probe
  tty: serial: meson: Use devm_ioremap_resource to get register mapped
    memory
  tty: serial: meson: Describes the calculation of the UART baud rate
    clock using a clock frame
  tty: serial: meson: Make some bit of the REG5 register writable
  tty: serial: meson: The system stuck when you run the stty command on
    the console to change the baud rate
  tty: serial: meson: Added S4 SOC compatibility

V6 -> V7: To solve the system stuck when you run the stty command on
the console to change the baud rate.
V5 -> V6: Change error format as discussed in the email.
V4 -> V5: Change error format.
V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
in the email.
V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
the DTS before it can be deleted
V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
discussed in the email

Link:https://lore.kernel.org/linux-amlogic/20220118030911.12815-4-yu.tu@amlogic.com/

 drivers/tty/serial/meson_uart.c | 221 ++++++++++++++++++++++----------
 1 file changed, 154 insertions(+), 67 deletions(-)


base-commit: a603ca60cebff8589882427a67f870ed946b3fc8
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
