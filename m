Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE06BC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 08:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LaLDor8tEKE2P7hExi+UMXbYNud4xpvS9rvYB1/eIJI=; b=TguI228Q9wIrj4
	DmTr8qelnhqNdKgrwsIRbfGIDEgHbjgjdBoFNZBQYgs9GKOVa26GZpb2APYMehDpH6DJUAEJZ5GeE
	gf/RCgih9i8Qew32ja7eWjpyCgXPelC6e2WgwmACAFMq8NZTcnv6o81WLcnQ4nVUqYxV4hGJr9KnB
	MSoGzmxXEGtcYZW3Hx0g7UwOrqjtUoYVmtjDTW4hZvuN/zTDQ9A6h7ADE23muEm4kpMl3Ftc5f8Qt
	I5KxMV2wdptgfveJ2AzSuBJ32XIRihX/NM5hsBZ9AocyW2zqM8dKVG+rvZL3i7VJ8fw8/NPYqtKqo
	cPwv/LRE3aQW6EiFBgGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNk0-00AWgE-4S; Thu, 07 Apr 2022 08:43:44 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNIT-00AIWS-MX; Thu, 07 Apr 2022 08:15:19 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 7 Apr 2022
 16:15:07 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 0/3] Use DIV_ROUND_CLOSEST to calculate baud rate,
Date: Thu, 7 Apr 2022 16:13:52 +0800
Message-ID: <20220407081355.13602-1-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_011517_796128_4467EC17 
X-CRM114-Status: UNSURE (   3.44  )
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

1.Use DIV_ROUND_CLOSEST to calculate baud rates.

2.Added 12Mhz as the clock source for calculating baud rate.

3.Added S4 SOC compatibility.

Yu Tu (3):
  tty: serial: meson: Use DIV_ROUND_CLOSEST to calculate baud rates
  tty: serial: meson: Added 12Mhz as the clock source for calculating
    baud rate
  tty: serial: meson: Added S4 SOC compatibility

 drivers/tty/serial/meson_uart.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)


base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
