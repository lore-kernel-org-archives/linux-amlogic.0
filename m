Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AA0C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2024 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3z/r6jZeKhigzjJ7xbaNFTNqx2oZAL1sHjjmYE5TZ78=; b=h+BXIJpnV3iJFP
	CSpj4g0YCNcZVGjYykMrI8PDlgaLSH4HHxshZHDbKzDPUkTt4CIW3E0jwGxrEvZd4XZu9yCgmH2Py
	D9U5HtT8E0SIeQlCKx2tRFLYlFnuM3fO7Oz0mY4gsRBUMdp/JSPf5T17mmNWfU9fT5EskbA7xYhHC
	m4blQeL3pBMH3dz3CcWz27Qjo7OAd5y7ftHaFFsIETt28CNxeOe8X2XFjoHVbDxzmfA1ab8i+fclx
	l3jFvcYh0zdpjXgJwfL2QkYob85bfUx6aK70rvsDYh80VJkfXTDrvGRHO5+jyq7HEKEcPWz4tizh/
	/6hIlg31obTq2Zm9JCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyHv-00000000B8Q-2Wlj;
	Wed, 20 Mar 2024 15:55:35 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyHq-00000000B3b-0MgQ;
	Wed, 20 Mar 2024 15:55:33 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0C270120015;
	Wed, 20 Mar 2024 18:55:19 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0C270120015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1710950119;
	bh=LsoQ3oF2kg2yK04bv75oYHFuvgq3Hd3YI9kmS9zzWiE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=XDydmRx53U4e4RBhlk3rasEQtc43OdENArhGOxnkb80H5xxbVbJv264GHZnQrNE52
	 jhZbqmT+yk9H5HzRDmaYwzq6Ul5LJi5VA7DXxTqF8oE8mKowK6T33U2hjp7vqYqwlD
	 yKmJ7mGPgdBwWhdLMqVjNofutV6RbKrCg982ivOv0xr6TrisyUKfZ3al6fe7qDK4PA
	 Xp+H9fGda71a1R1OjE63WDhQE01uNQlLu6HSb3bxVJPZGaYiMdEVrwhciY+JLvL4Aa
	 nsfAfgDdq5UvAR5AgiRFuy5bj9eJJ4Bx61fZn64YVj+pVQHX2Ih4aeZVibsEPSU553
	 8tVbXtWfcC9Bg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 20 Mar 2024 18:55:18 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Mar 2024 18:55:18 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <sboyd@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v1 0/4] clk: meson: treewide: define maximum register in regmap config
Date: Wed, 20 Mar 2024 18:54:44 +0300
Message-ID: <20240320155512.3544-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184300 [Mar 20 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 10 0.3.10 53c821b925e16276b831986eabc71d60ab82ee60, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/20 06:45:00 #24314254
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_085530_867705_7A8A1B83 
X-CRM114-Status: UNSURE (   9.65  )
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

The 'max_register' field in the regmap_config is an optional value that
specifies the maximum valid register address. If this value is not
determined, the regmap debugfs API will not show the full regmap dump,
but only show the first register value.

Compare 'registers' debugfs file data on the A113L SoC-based board
before the patch:

```
~ # cat /sys/kernel/debug/regmap/fe007c80.pll-clock-controller/registers
00: 14f10440
```

and after the patch:

```
~ # cat /sys/kernel/debug/regmap/fe007c80.pll-clock-controller/registers
00: 14f10440
04: 01800000
08: 00001100
0c: 100a2300
10: 00300000
14: c000002b
18: 00000000
1c: 00000000
20: 00000000
24: 00000000
28: 00000000
2c: 00000000
30: 00000000
34: 00000000
38: 00000000
3c: 00000000
40: 00000000
44: 00000000
48: 00000000
4c: 00000000
50: 00000000
54: 00000000
58: 00000000
5c: 00000000
60: 00000000
64: 00000000
68: 00000000
6c: 00000000
70: 00000000
74: 00000000
78: 00000000
7c: 00000000
80: 15f18432
84: 01800000
88: 00001100
8c: 10022300
90: 00300000
94: c000001d
98: 00000000
9c: 00000000
a0: 00000000
a4: 00000000
a8: 00000000
ac: 00000000
b0: 00000000
b4: 00000000
b8: 00000000
bc: 00000000
c0: 01f19480
c4: 01800000
c8: 00001100
cc: 100a1100
d0: 00302000
d4: 00000020
```

Dmitry Rokosov (4):
  clk: meson: a1: peripherals: determine maximum register in regmap
    config
  clk: meson: a1: pll: determine maximum register in regmap config
  clk: meson: s4: peripherals: determine maximum register in regmap
    config
  clk: meson: s4: pll: determine maximum register in regmap config

 drivers/clk/meson/a1-peripherals.c | 1 +
 drivers/clk/meson/a1-pll.c         | 1 +
 drivers/clk/meson/s4-peripherals.c | 1 +
 drivers/clk/meson/s4-pll.c         | 1 +
 4 files changed, 4 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
