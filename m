Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD71C0015E
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RemFa0Vuhk4Hb5LrKxRFM8CZnbeo5cNJKTH+rktHrLI=; b=fSq2YyANj6QaFx
	jrOgbhCvy2F1rshBzbxntfcabgsODb0ZcID8QYkL6rsMLQ1kGvhdh830LZQA1A7FTViLmFO2HlFBK
	0rViTLGDQtmw1QjS4zkQSvXuMcWMzeByg0DofkGEoT2qa3ajFfR4WPGUUEintRjMClFl5Lr1n+YLP
	Huzq/5/RF9FISiUH9AkX+nuPuLxXtr53sxSA+bPDPG34I18R/T0XnciROPrLj8gsEqHV88n0Ber16
	/TxZOs9FoScnor9dnImaDK9JuosRyIqOMgnJ9W5rT80xlqp6kFOM6w4OwF2bPZCbLpf9Ms7JwLmx2
	kA4ggbcIOVbg+V+z9iYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG8C-009z8u-2A;
	Mon, 03 Jul 2023 09:46:04 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG89-009z3D-1q
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:46:03 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6912F100009;
	Mon,  3 Jul 2023 12:45:43 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6912F100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688377543;
	bh=lcOhlx00oXE7ulbYTnPi1yKlG4AkGFl5PtjjLmrQcFU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=o5r2wsPZPKz//+smAOsuYHKAY7/4imLKzyE8Rtm0vRj9QZY4F2/Eyq+ZZTq62p/SW
	 ESVNNyurvDOWBzve5acNzT4bPyFPZshffQpC+ZND9XCx3+87a4euA6DlKELcZv5A8a
	 PRQKSq/JhscyqrrXlKnJ41yZrkkeNtcJOwjWPELitlNGnuTxvFkdDBivz45hqs339E
	 Kor9o0X+eWYlMmVQoh6qO9TsHyeNnpjyFTasIf5ftdeNIoujocYyomn/4YlcfP/wLg
	 TfZRel/OA5YL7vB2Ya9kT+aGXLCGG+IG2R/8UeY8W50VmZu/mC7uufMgTjhGPcqf2I
	 ZYf8PPGlcGLVA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  3 Jul 2023 12:45:43 +0300 (MSK)
Received: from CAB-WSD-0004828.sigma.sbrf.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 3 Jul 2023 12:45:42 +0300
From: Martin Kurbanov <mmkurbanov@sberdevices.ru>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-spi@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, Martin Kurbanov
	<mmkurbanov@sberdevices.ru>
Subject: [PATCH v1 0/2] spi: amlogic-spifc-a1: fixes and improvements for amlogic-spifc-a1
Date: Mon, 3 Jul 2023 12:45:16 +0300
Message-ID: <20230703094518.53755-1-mmkurbanov@sberdevices.ru>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178391 [Jul 03 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: MMKurbanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/03 07:50:00 #21557756
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024602_133147_1A5C90AA 
X-CRM114-Status: UNSURE (   8.68  )
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

This series adds support for max_speed_hz and implement adjust_op_size()
callback.

Martin Kurbanov (2):
  spi: amlogic-spifc-a1: implement adjust_op_size()
  spi: amlogic-spifc-a1: add support for max_speed_hz

 drivers/spi/spi-amlogic-spifc-a1.c | 83 ++++++++++++++++--------------
 1 file changed, 43 insertions(+), 40 deletions(-)

--
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
