Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B76ACD11DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZGYR7W69nXx1EneyJ4dKEZlYiuC3a9fMQirM5VjQTZU=; b=AFUyQE0IxsoANM
	UlvbGna6i1feoT/vvYEm6ZleflTahhcEYdyAf7sYuukTr+qAtqwNKAi4AbqiEgfyLwViN3R+3MZaN
	/6LY/RdfxX/dheUMIfL29M6K9eGytTR8qME95oNmaWhxeS1Cos48DTkFZjQAaYHdi8yuHu0o0IC8p
	M+O7XiXXNrJvM2DQWn8zwi2z++YXm9ehEVVKoSTX7mZtddsH1FEpb66h/+2P6hBHpIaVeXLlTOlzI
	e6l1Lf1sWXm347grW0UDgOgvhqPA27Oa8IApSvhM9i4rRnczo7q4NZR8ifnLZbpMJ81eAIcyzPTHu
	OXprqT0tO5E5qTe3sfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvOu-0000000FNMh-0oUW;
	Thu, 28 Mar 2024 19:27:00 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvOp-0000000FNKO-3Iz4;
	Thu, 28 Mar 2024 19:26:57 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D295B10000A;
	Thu, 28 Mar 2024 22:26:52 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D295B10000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711654012;
	bh=4LvmixhzRlylWi1iASNzlMPPp0Wt/MZ3t6kmFoX+58E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=n9yMInIBxBcPBRiF4+4Gdh9/V5Ipq/YOieRDnLAUKG/MJyuG5cvYhD76q+0Lh2XPz
	 8U8cw1uIqHXXYo7hYGGTac1H2d47EJyO1JMuLLb/T5DtR6PM/Mc8+0dNBoIr1pUmcf
	 bDhrpCXDHpQYszKFJciUY+oNVPPKrxwF7MVfIwJIsp4tMYTJP7yR2p4pjYZO8dcgvP
	 NLUt26ORj2vdghSHQ7ANc7qH7Y0DAecsZ4GJYPKJPvU2tY9i8YQcW/iu4Kw4/aL3kP
	 Bye6D44IKNaG51hnne8I2nTGmeemzHHHJyjLKWIT7BvpBv/ydhkQv8ck6hQ/ypLbaz
	 cSqY20dKj8vGA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 22:26:52 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 22:26:52 +0300
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
Subject: [PATCH v2 0/3] arm64: dts: amlogic: a1: introduce thermal setup
Date: Thu, 28 Mar 2024 22:26:34 +0300
Message-ID: <20240328192645.20914-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184477 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/28 18:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/28 18:21:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 18:13:00 #24496606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_122656_240845_507FB0D4 
X-CRM114-Status: UNSURE (   8.97  )
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

Changes v2 since v1 at [2]:
    - provide Neil RvB for cooling-cells dts patch
    - purge unnecessary 'amlogic,a1-thermal' fallback

Links:
[1] - https://lore.kernel.org/all/20240328191322.17551-1-ddrokosov@salutedevices.com/
[2] - https://lore.kernel.org/all/20240328134459.18446-1-ddrokosov@salutedevices.com/

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

Dmitry Rokosov (3):
  arm64: dts: amlogic: a1: add cooling-cells for DVFS feature
  arm64: dts: amlogic: a1: introduce cpu temperature sensor
  arm64: dts: amlogic: ad402: setup thermal-zones

 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 45 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 13 ++++++
 2 files changed, 58 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
