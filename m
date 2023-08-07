Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE07BC001DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MPhttlESgs4S1P7QkDFj8EzlXd5/cm8rLYIQnxT4l+I=; b=CXSgQC9TVPRUaK
	WRt0Z2X+UpVUf9lstkzlE3kRfqT+NfRUJVuSh05flfr4bBhbKlBEBhrQIXyk7ELrXpbv705BrbCNL
	QDgzuI3Q0jQeK4BieozHaXzeOveKq4//3Z6YMwk60nMM7hemEuayifkdpG/hdwoBazzzofEOSBmiP
	vbh6Mzxx6hKraNT6d6gnMECLacqhejrSXHWOqSCE//fPR0fP4jwHVRNdmMU8mQkt3wGvE+uueNIuX
	vsl1n4XSlG0T6FCqiYieU67PRo2doKLkdiN8LE9z+IPAlv7SiGhpIxiQtvpGlcTkGc2dUnkZ/hVhr
	7Vu1cVmG1n1GKRRGdFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzwQ-00HIWk-1z;
	Mon, 07 Aug 2023 13:06:34 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzwN-00HIUV-1g;
	Mon, 07 Aug 2023 13:06:33 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B302E100009;
	Mon,  7 Aug 2023 16:06:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B302E100009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1691413581;
	bh=KKKzrKIwXHkSy5iweyJO5KiiQOThLktg97Wb/xfwR1w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lSeOE25frMru7IO0AjXLUrVLKM/he/9NAK+9H7ty3BMTctNhBOwiYwug1/4cQosve
	 uZfRDPk58vnznTrKhFxlyXnYOF/38dP8CBlo9Gf0MGiWvWYVNKWnxD864viGfTgvrZ
	 TyhwamT6HRLa7lKNZLXYn3YhLIcfN48O0zC6/C6iWb0YDPwYSxbkRUv4dSLetO6cEI
	 eP9BRTuI2yf3Ftpfx3Fi7JzFzN1wvZ+TjXSVg16GpULHN3P0qnI10Bmvb9FIxgk+KJ
	 zj9YLi58R1jifolDD+B/0R6Z2+sR4XoQaCVD5QbMVqarJ5ih/mM5EuCmyoQmqAu8/z
	 ExfvKOxmDNruQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  7 Aug 2023 16:06:21 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 7 Aug 2023 16:05:55 +0300
From: Alexey Romanov <avromanov@sberdevices.ru>
To: <narmstrong@baylibre.com>, <neil.armstrong@linaro.org>,
	<olivia@selenic.com>, <herbert@gondor.apana.org.au>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<conor@kernel.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <f.fainelli@gmail.com>,
	<hkallweit1@gmail.com>, <lists@kaiser.cx>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<kernel@sberdevices.ru>, Alexey Romanov <avromanov@sberdevices.ru>
Subject: [PATCH v2 0/3]  Meson S4 HW RNG Support
Date: Mon, 7 Aug 2023 16:06:08 +0300
Message-ID: <20230807130611.63914-1-avromanov@sberdevices.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 179098 [Aug 07 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVRomanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 526 526 7a6a9b19f6b9b3921b5701490f189af0e0cd5310, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/08/07 09:29:00 #21554951
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_060631_925066_6B751055 
X-CRM114-Status: GOOD (  10.72  )
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

Hello!

This patch series adds hwrng support for Amlogic S4-series.
Now, S4 uses a new random number generation algorithm.
This changes implemnents new algo and also adds description
to meson-s4.dtsi.

V2:

- Use readl_relaxed_poll_timeout_atomic() function instead of loop.
- Use two different functions: meson_rng_read() and meson_s4_rng_read().
- Fix naming in DT schema (meson-s4-hwrng instead of meson-hwrng-s4).
- A little code style fixes.

Alexey Romanov (3):
  drivers: rng: meson: add support for S4
  dt-bindings: rng: meson: add meson-rng-s4 compatible
  arch/arm64: dts: meson-s4: add hwrng node

 .../bindings/rng/amlogic,meson-rng.yaml       |  1 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  5 ++
 drivers/char/hw_random/meson-rng.c            | 80 ++++++++++++++++++-
 3 files changed, 83 insertions(+), 3 deletions(-)

-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
