Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D30C54E64
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 13:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rhrCGbFLVpaCh0i7c2+fZ4oLvoalSPWojTrz/LuMvg0=; b=SHNqbEZ2MeoRqO
	jQ3zZl2YnglYvsnwKnyiAWNbrFBmH8L6DF7fe1aJja/gPqxhtdAtvV8MLSGkmmb0kTF6BgE443cQ/
	N/TRQu0NrqwkyMnVgYdpWOHLMiNUOR/WYQObmBR7BWj6qGYISM+muVvP7m26ew/JOTJW+iruIwiaA
	HNWn9t7qxEYs+Lr3MzCFlb+IQPwuqoJSjXapwH3KRizeMjjaaEqAHtscLqx5QwhGDmu258C/wc5CA
	UVLAphRQgoR7rjj8X4uVTTwfo4OIwFJJVvoEwX2U7N88NGgzTrXP/+WeLAZ/Pc/UGBosw7sKuWsY9
	TMLjRhPMo/e6PydPHZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq4D-0000000EAVP-03tp;
	Thu, 28 Mar 2024 13:45:17 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpq47-0000000EAST-32Hy;
	Thu, 28 Mar 2024 13:45:15 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8643F100018;
	Thu, 28 Mar 2024 16:45:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8643F100018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711633508;
	bh=bxVgZki4tnU752Xc7UAMONAMGx/Fa1Rm1HjeoL827+Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=nnuYkOb8h3rQRJ3wZBkfT7Agyq9H1zrL42vxY4bPYIBeSThupI5mw5TIsX8i1uPCW
	 pZ1PmfBpvCnHtMN8CC6ScFTCSXgslj71rX1L1I70fwsDJ4THMf+ddUGFc0ODRaLu6m
	 U8jbZrrq7W16vC/btZekrgDYrWbeRSr1lHd+c8D0XaaLFvnYj9ETVff6ckTTW+cLmR
	 oCFht4mPqidD5yz/+t37ZYwsYHfA9lGertdrzrEEeJO52d6CWgVjNgACB7m4fKqtQc
	 p+lSYqrOIfSAREDw6kIcZpnb60EF0dhIonm4Nv64UgoYd+x9V25zSLdCFohTrD7UQj
	 OfJoRog7kyezA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 16:45:08 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 16:45:07 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 0/3] arm64: dts: amlogic: a1: introduce thermal setup
Date: Thu, 28 Mar 2024 16:44:36 +0300
Message-ID: <20240328134459.18446-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184470 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/28 12:39:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/28 12:39:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 10:33:00 #24492761
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_064512_148585_7D83B58A 
X-CRM114-Status: UNSURE (   8.42  )
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

This patch series introduces thermal sensor declaration to the Meson A1
common dtsi file. It also sets up thermal zones for the AD402 reference
board. It depends on the series with A1 thermal support at [1].

Links:
[1] - https://lore.kernel.org/all/20240328133802.15651-1-ddrokosov@salutedevices.com/

Dmitry Rokosov (3):
  arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
  arm64: dts: amlogic: a1: introduce cpu temperature sensor
  arm64: dts: amlogic: ad402: setup thermal-zones

 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 45 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 14 ++++++
 2 files changed, 59 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
