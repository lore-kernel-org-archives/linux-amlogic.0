Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF39C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Apr 2022 05:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7PiOiL5KWewYlof1ywbetveQQXqXNXQPBaKv0yOK5xA=; b=nE9rrkmv3hpWFk
	1Dqq4cgAA07I7BW90B9+ehmk1rsq/mRTBkjdsQAegnMfkEJGa/OS/TRjFsIuPKVt02fUYatyA4FIP
	LZZQpoLzGAcIg4o+Xtbzwk7Br3+wE/gvuuY7VatZVXHI8j+PkWT0JNtQVjWP0NA94KrIAw35kdytb
	vagwLfPk62HWVRKFTjfIOOCZJfV61JSdGJrPMpeXlNpejxpiT4/9XgFty3V6dNhafQZYBpoCbW0N9
	oaNaNHDL2e08VTUItlB0dheMHvtGfY6zhxcwuoowDLkecw6IexY6m3Im5tGUgNf/KUBFFB2lIBLkc
	87AknRPJJ1Vyyc+Im7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK0z-00Fg4g-1N; Mon, 18 Apr 2022 05:33:33 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK0o-00Fg2J-Ep; Mon, 18 Apr 2022 05:33:23 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 18 Apr 2022
 13:33:09 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V2 0/2] Add q 12MHz internal clock rate to calculate
Date: Mon, 18 Apr 2022 13:32:00 +0800
Message-ID: <20220418053202.24528-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_223322_523540_EADE0C8A 
X-CRM114-Status: UNSURE (   4.30  )
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

1.Added 12Mhz as the clock source for calculating baud rate.

2.Added S4 SOC compatibility. 

Yu Tu (2):
  tty: serial: meson: Add a 12MHz internal clock rate to calculate baud
    rate in order to meet the baud rate requirements of special BT
    modules
  tty: serial: meson: Added S4 SOC compatibility

V1 -> V2: Change format as discussed in the email.

Link:https://lore.kernel.org/linux-amlogic/20220407081355.13602-3-yu.tu@amlogic.com/

 drivers/tty/serial/meson_uart.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)


base-commit: f398e0aa325c61fa20903833a5b534ecb8e6e418
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
