Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA9AC77B7E
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Jun 2023 06:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0q91jUOKIiZIXM61xZP9t79PCEezTpwDxWyHWXmx5I8=; b=TsEl8il5Zp+u/E
	h6y3fYBXE4xHkbczMc/o1lrkyVn2LEQiWCxCzEGzu0ZWNH6nKg83ZuEHGFdTbX6c/8RQJutgTNXEL
	tXcpUWTZMdMERYZKBLPoRcRhaopTbPMiwrCkXov3NK3rEhZThp5w0c9xr6lA1kXGC25PfharZ9Lve
	964FBHtZomfUAMvVZigaBFxjAUyzvzyuuMuJD6QPG0akVNzJdyPPqR/EhH8LUPcHpB9SlMKjEYm5V
	ziYlNXQsJF8gwZJbe0+cYbrFu4ndhTzwlM4n2anp35YVlc3ZGgs3ET3N9bBbdLDh55H3usGqUnl6e
	ljUtmqBhmDIJZEsEZwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4bjJ-002AvY-39;
	Thu, 01 Jun 2023 06:24:13 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4bj4-002Aft-0f;
	Thu, 01 Jun 2023 06:23:59 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id D00845FD74;
	Thu,  1 Jun 2023 09:23:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685600634;
	bh=6FX/oDhV3UArFeFozJZTELPsj5XEanV7an9T0MKnXa0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=j9W+l5s+BZrwcotRo28gMX6RXqEkq5D9k/kIRuYPog9sgetx5bJ+AWNQHDKK5Ui55
	 OhxgVoHTIWtqz47Q4J0Vr0cMIt7g4YpeR2qxj0duCA4A0m/+aVukmeRD75nRmzphzL
	 VztAbMb4blmdU1arX3QrHNrYYxKNGu57vCBjw5oGfqWMTDKGLxpN8xfkusf9X3be9s
	 a8RMCLuZIMpD48OlnCSKxCHiNM9Ls89j+GsFSyZFtsHkCgkyezcp48gIerMtI1nEY4
	 r13++/1CepWAi+isP5fV6T15I43mhIEylc9mOSbrogWFYYHp2wc3rF47DN2QQUd4CZ
	 MLycIbZ9iCoww==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu,  1 Jun 2023 09:23:54 +0300 (MSK)
From: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>, Arseniy Krasnov
	<AVKrasnov@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v5 6/6] mtd: rawnand: meson: remove unneeded bitwise OR with zeroes
Date: Thu, 1 Jun 2023 09:18:49 +0300
Message-ID: <20230601061850.3907800-7-AVKrasnov@sberdevices.ru>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/01 03:13:00 #21393813
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_232358_451305_4F7FA79D 
X-CRM114-Status: GOOD (  11.00  )
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

Both operations have no effect.

Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 2a91916566f4..e78912bd3b4d 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -626,12 +626,12 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	cmd0 = in ? NAND_CMD_READ0 : NAND_CMD_SEQIN;
 	nfc->cmdfifo.rw.cmd0 = cs | NFC_CMD_CLE | cmd0;
 
-	addrs[0] = cs | NFC_CMD_ALE | 0;
+	addrs[0] = cs | NFC_CMD_ALE;
 	if (mtd->writesize <= 512) {
 		cmd_num--;
 		row_start = 1;
 	} else {
-		addrs[1] = cs | NFC_CMD_ALE | 0;
+		addrs[1] = cs | NFC_CMD_ALE;
 		row_start = 2;
 	}
 
-- 
2.35.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
