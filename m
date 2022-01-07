Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC9EC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 02:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+OKSBCAtNx9Vy6+0/2GCNZwlKxa3xI4oLItmeT7Zbg=; b=YrTq3evhkveCgc
	VMovS04MYPb5yz4luEC7gM63S7W0Z4+pyrTkQVdDgAa6wmxKMPhYQcfzzkjg0FX55YHl1sWb4yQ+B
	D8jf//ckqaFleG3kQ8Ax1ER0AUCYP6WOfGOOhULARmV2XDjT/rhjP8S/pqPEV/JcktWOiONbwojbl
	GnPgR8QWaDlU0C8oU0wrUhLTV+5PQqvbW3Ilrn6ducsANj/oPmuv9bpyJtPiJzXPl16s23fx7OAMG
	wmrmI9Wy7haRiqMhVcpjaKTkRjNEoi6Ip57pITHJrkvKVhaW010bPFUgwxjmBIqvhWtXaFy46SnxF
	iTbbQv7RQKuilBU77xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fAn-0020lF-0Z; Fri, 07 Jan 2022 02:40:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fAk-0020jF-E9; Fri, 07 Jan 2022 02:40:07 +0000
Received: from droid10-sz.amlogic.com (10.28.8.20) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 7 Jan 2022
 10:39:58 +0800
From: Zelong Dong <zelong.dong@amlogic.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <khilman@baylibre.com>,
 <narmstrong@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
 <devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 0/3] reset: meson-s4: add reset driver
Date: Fri, 7 Jan 2022 10:39:28 +0800
Message-ID: <20220107023931.13251-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.20]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_184006_527034_528B7158 
X-CRM114-Status: UNSURE (   5.60  )
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


This patchset adds Reset controller driver support for Meson-S4 SoC.
Meson-S4 Reset Controller has 6 banks (the number of reset register)
and the level-reset register offset is 0x40.


Zelong Dong (3):
  dt-bindings: reset: Add compatible for Meson-S4 Reset Controller
  dt-bindings: reset: add bindings for the Meson-S4 SoC Reset Controller
  reset: reset-meson: add support for the Meson-S4 SoC Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
 drivers/reset/reset-meson.c                   |   6 +
 .../reset/amlogic,meson-s4-reset.h            | 125 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-s4-reset.h

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
