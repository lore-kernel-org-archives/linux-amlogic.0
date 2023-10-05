Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A21CE92735
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Oct 2023 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i24UWifq0BAXARaJ7R1mzhgVvCzM4TqtJhiUm6EGfZ4=; b=Ec1fFUKCtd8KjH
	nKcMdeXfqtH4ahxx8t5lHTXCStzFxbUf+IzggYyoMozw8KKAcoeCfGqZQUYOh07qWVttgcTDbpQAj
	SctO3LccJMcIijyk9u0ris0NsxJsO8Rd//6kmsFEABFvnytP7j4sLJODuY0bNN0TMXHI0EhLn2he3
	mUHeX8BQdcMuQ4lMj+UetgdufJ4R/eguqJZRV+GGOLQkKZyTYmf87ilj3PwjvrTgpHiEMzfi37xcM
	gmOxjjaIRTlRz74Axl3CCXtGKp5E1d8OdNsiPDPpVpQvP/kecfXI7wV8s1mxJ1MLJh6n4w4cAa4X6
	+LCasVqymdAdSs3OwQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoUSA-004Pi3-2a;
	Thu, 05 Oct 2023 19:56:10 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoUS5-004PfO-1F;
	Thu, 05 Oct 2023 19:56:08 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 10071120002;
	Thu,  5 Oct 2023 22:55:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 10071120002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1696535757;
	bh=GFVOVJuxSXMmj0iXYprQcoTAJINrQ+vTEeNVJ0+O/kM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=IVyNesMWP2yA/afFXt/+smVB8oN19ETBVQs2XKvke2PhmMSCVCC0hmPJyN+2DrNIj
	 IZneBZIeOAQ4do0PWg8W9+JW5iq81SXferNdtqmYjCt+nYRYCibDDXYQ8EWPPu/lys
	 BeyTBhvDGeJg6SkergXIw3OS9ZZVNLDXJKfNudNAqgEL1E+kEaEmzxpJlNdT6N95WX
	 0SKObIy1lGPzFeymtEFVWJZcLwapCazQSCn/3LmKeJP74SRCyLlgj/Y21s+foThaRi
	 FsXE74rHs0B5YxoJE6o5AbiLNxVi0EUyoZ9qQwQagUdLnAYRlxD/5d6exxjxM25ejM
	 bircYzUxXtS5Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  5 Oct 2023 22:55:56 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 5 Oct 2023 22:55:56 +0300
From: Igor Prusov <ivprusov@salutedevices.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>
CC: <prusovigor@gmail.com>, <kernel@sberdevices.ru>, Igor Prusov
	<ivprusov@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] arm64: dts: meson-a1-ad402: Add SPIFC pins
Date: Thu, 5 Oct 2023 22:55:41 +0300
Message-ID: <20231005195543.380273-1-ivprusov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 180400 [Oct 05 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ivprusov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 535 535 da804c0ea8918f802fc60e7a20ba49783d957ba2, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/10/05 18:34:00 #22065600
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_125605_972804_EA19F260 
X-CRM114-Status: UNSURE (   9.15  )
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

This series adds SPIFC pins description to A1 pinctrl node and selects
them in AD402's SPIFC node to make sure that muxed GPIO is properly
configured.

Igor Prusov (2):
  arm64: dts: meson: a1: Add SPIFC mux pins
  arm64: dts: meson-a1-ad402: set SPIFC pins

 arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi      | 12 ++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
