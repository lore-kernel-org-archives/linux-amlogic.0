Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4A6C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 03:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x5fTFcERdXzLTXnA+d/46gaSGckjsudm73jBJoQ4v0c=; b=PwSqZGUthW1CIu
	P6gEE3a2M1RiNAjoCLfrBbFLWd1VP3lhvbmlpoGPOWtBlAg9B/t4cOUNZsGAif+8wybWE9qhC3EUS
	eyRahKeO+zDqDFmT4IvKiMPVYS/groLx1EuZsCJb1QoDFQKyTw4o/2TT/4PKUpyYhrKQW0qUT34PQ
	jlXvJkFDLvKws2ju6HjnD88uNJXJoKALvHIFv5MLTk//FfvFT6ogBuxlXdEJAxvfaKOVfAJYeErKC
	VVf20V6anup/ah7RcoL95G0r/wzbRuh6IbZbe8mItqq3cw7/4V8k7OU+IIUxaMu7Vr1utlGBSHK12
	LbUN8V9D8NoLSqf64s1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fS3-00HZxI-Nl; Tue, 18 Jan 2022 03:46:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9esd-00HKH5-D9; Tue, 18 Jan 2022 03:09:56 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Tue, 18 Jan 2022
 11:09:52 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V6 0/5] Use CCF to describe the UART baud rate clock
Date: Tue, 18 Jan 2022 11:09:06 +0800
Message-ID: <20220118030911.12815-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_190955_498400_54D0BABA 
X-CRM114-Status: UNSURE (   6.76  )
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
  tty: serial: meson: Move request the register region to probe
  tty: serial: meson: Use devm_ioremap_resource to get register mapped
    memory
  tty: serial: meson: Describes the calculation of the UART baud rate
    clock using a clock frame
  tty: serial: meson: Make some bit of the REG5 register writable
  tty: serial: meson: Added S4 SOC compatibility

V5 -> V6: Change error format as discussed in the email.
V4 -> V5: Change error format.
V3 -> V4: Change CCF to describe the UART baud rate clock as discussed
in the email.
V2 -> V3: add compatible = "amlogic,meson-gx-uart". Because it must change
the DTS before it can be deleted
V1 -> V2: Use CCF to describe the UART baud rate clock.Make some changes as
discussed in the email

Link:https://lore.kernel.org/linux-amlogic/20220110104214.25321-4-yu.tu@amlogic.com/

 drivers/tty/serial/meson_uart.c | 217 ++++++++++++++++++++++----------
 1 file changed, 149 insertions(+), 68 deletions(-)


base-commit: 4d66020dcef83314092f2c8c89152a8d122627e2
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
