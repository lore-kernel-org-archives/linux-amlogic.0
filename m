Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA6C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 11:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j2BgrDFVm2AfF7OwGxxkbbJOkh4cJ1sc49cqO++g+lg=; b=bEaHi82Xrm4qYo
	bbkVaiFwEnozr45xe+pSPKV3LmqIyplS4yOltAbJh/q3Mu4UnoQ0MubOK3qo04YOnp1nAXbsF11PS
	YXFjeRCHeota8x6OOXUUOb/x+BUvSgujx1O710VzhrTnuuweE3z3/ut0Gms4XNThDSBUSlS02QlQH
	w+bXO2rMS+GDecMNB67VTUHq4P0mUZHWky8/i/0mFLazuWkNfmoRu6nM8/jJDHyQDwDwo5cd+/JHD
	ISLoaDqx66jP4+x+Q1bX6PPLPE5/6bosXs/0TQzyxT6z9nVXFkPbAVdh5hhRY/PUVHRrTQNQnjO91
	sfuY8fCtzChyulHWrsww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhrFS-0009nn-Ka; Fri, 22 Apr 2022 11:14:50 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhrFH-0009kY-85; Fri, 22 Apr 2022 11:14:40 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 22 Apr 2022
 19:14:28 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 0/2]  Add q 12MHz internal clock rate to calculate
Date: Fri, 22 Apr 2022 19:13:18 +0800
Message-ID: <20220422111320.19234-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_041439_326960_27936DE1 
X-CRM114-Status: UNSURE (   3.87  )
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
V2 -> V3: Change format as discussed in the email.

Link:https://lore.kernel.org/linux-amlogic/20220418053202.24528-2-yu.tu@amlogic.com/

 drivers/tty/serial/meson_uart.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)


base-commit: 05fe70dd2efd13de700c2dfe5169d3a7a5050bc2
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
