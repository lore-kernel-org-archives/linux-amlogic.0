Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696DBEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=upPVbYqs0blWlZZ3I255NGWH0mt3oZzlnztx3XwoKhs=; b=K0+6IC2DM+hc83
	assa3VMUuGlB6W6FlF5Gqf4h69oxQaA7RzB+R6XErrhVwEWo0Hf1FAuJz9yw56biyuzMXWPUW7h0w
	69VHOgcfB0XGB9fZzB585IwKojoGNC3X96LEX2BrPIxFus0dT2SU0zvlTIlt/FITAse5lOaVjRVDI
	bfx32j3iIA6xfauPlK/EdaKeafMrUfOkSV+FLA6M6857xB1x2/MBigeg0VKWlvlKQNTHEOtOS1F7O
	+PIhl5+sbC+/ZrisgJPYokrQC6BQ5q+6A7lu6QuaDqjn8h4CpXHhUC03nyVg7ALZ+0nx4B5Pbizc0
	u3tpK8UgSfogOC/47Nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZP-00DSMl-2d;
	Tue, 04 Jul 2023 13:59:55 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGgZL-00DSJM-0c;
	Tue, 04 Jul 2023 13:59:53 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 44F16120055;
	Tue,  4 Jul 2023 16:59:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 44F16120055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688479184;
	bh=r6SG7lpLI9I/NbwtRkLknIz0u9uOXQx48vgR4sPGnQg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BsWXiXBNVIt0liZsYWa9pyaBtocrh/m98ikOb4r0RJCJyYIFERS4Lc8VIu7AMrtiK
	 83GKyeBM+v25HaVoX78N0zAHxHIhyBjQp3j+Ny2KkEewkqWaRH9pU0+8FlxlKmwOoW
	 ywtixPfBY7FmNS/i2TJefpiIczflsTSXX3xOTQ40cXJ8Zl9w89cz8V/JAA6n8u2RmL
	 Xmc+yH8hbh3ajT9N2NCQJJ4NyPyJNcwWZAQOTO3bf+Xnjxwuovwe7+ymWxnickMZyx
	 JH6UlnxsVB/n5Fz93iCfWlumDNxIEBknxlOmFSp8uCNCD94J3hQ0olk5HFGK1kbZPo
	 aFvpK9BTJg48A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 16:59:44 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 16:59:33 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>
Subject: [PATCH v1 0/5] tty: serial: meson: support ttyS devname
Date: Tue, 4 Jul 2023 16:59:31 +0300
Message-ID: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178421 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;libera.irclog.whitequark.org:7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/04 08:48:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/04 08:48:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_065951_938433_FB565661 
X-CRM114-Status: GOOD (  11.55  )
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

During a IRC discussion with Neil, as reported in reference [1], an idea
emerged to provide support for a standard devname 'ttyS' in new SoCs
such as A1, S4, T7, C3 and others. The current devname 'ttyAML' is not
widely known and has caused several issues with both low and high-level
software, without any apparent justification for its implementation.
Consequently, it has been deemed necessary to introduce the 'ttyS'
devname for all new 'compatible' entries, while still retaining backward
compatibility with the old 'ttyAML' devname by supporting it in parallel
with the new approach. This patch series therefore aims to implement
these changes.

Links:
    [1]: https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03

Dmitry Rokosov (5):
  tty: serial: meson: use dev_err_probe
  tty: serial: meson: redesign the module to platform_driver
  tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs
  dt-bindings: serial: amlogic,meson-uart: support Amlogic A1
  arm64: dts: meson: a1: change uart compatible string

 .../bindings/serial/amlogic,meson-uart.yaml   |  2 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  4 +-
 drivers/tty/serial/meson_uart.c               | 83 ++++++++++---------
 3 files changed, 47 insertions(+), 42 deletions(-)

-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
