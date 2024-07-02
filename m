Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C39C3064D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/S2cUyrQ+xGpQQcX2iY5rsOWgAxNftEEqogwoy2Ldcg=; b=n//l1wGWupO2eC
	Co0YQP7hiQEGA+A9DEH3weJynihn6Vwf80O/dqBSJKdnrIiAHntNnFVaqDzPJEpDUbXlj/jYfja7z
	CkTaVx5ozjSXpA6pEYlOpoQbBMqrbnY2ZBetVzw6pGyKiNjOckiRF4qKlG0BMPc7oxGAvkAjpUCKB
	kwyzYVzOmslnH8usLl+WS5qtew3Bw46QAgVaj6QTix8tb4S7kJybUKpLD+YYojbXDhqa2gcuMVKxr
	k1rTVXVxEuJTlc+JgjA87LIeUxtR8xAqD7vmkUjDWdagJD8BqOt3HDAMo+27q8wK19eydowfo7IUu
	I5ekIm3LoYVxRNfrbvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOciq-00000006hxW-3oWL;
	Tue, 02 Jul 2024 12:35:00 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOciX-00000006hnr-2fZW;
	Tue, 02 Jul 2024 12:34:45 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 7731E10000C;
	Tue,  2 Jul 2024 15:34:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 7731E10000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1719923678;
	bh=+BMRFgVBIuPaIZdMG3D0mF67l9umTV7y8YA0DsYyPYs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=sl8bjlNJ302qbicuiJzAb2510VGm5tkQah5SQIwuoL3vMOci486jncsWBXQBxMEVg
	 drL/d5IC7EDfN5RMcavLPtI8eEcGzeu4Dwi1iyntWysVnhV/cuHWepd550oMuwojYd
	 cjrQkkong/6fyy5RwrTmHbIZmnsbj3vmT4m/GQfhnRvu+h9Zj0+eM9xsRFmKymmqeE
	 DycPvrf7YNl2Vvyr+/LBjnxn5mTS1L3DITD20of+JIYU10na+QlvHSaiGWjx8/fu4W
	 bRYZbOAvzFZP6LkP3WBsgCUEyVa8zcxk8ovwftLkVRzpxj6SJ42UHRGjAcGiVUDZeA
	 NmyIJIXHQJj8g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  2 Jul 2024 15:34:38 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jul 2024 15:34:37 +0300
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v3 0/2] pwm: meson: add pwm support for A1
Date: Tue, 2 Jul 2024 15:34:23 +0300
Message-ID: <20240702123425.584610-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186278 [Jul 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/02 10:26:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/02 10:26:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/02 07:59:00 #25796134
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_053442_032161_14279EC9 
X-CRM114-Status: GOOD (  10.59  )
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

Add support for Amlogic meson A1 SoC family PWM

Changes in v2:
  add patch with optional power-domains to pwm bindings;
  fix syntax in a1 bindigns patch:
  - use enum over const for amlogic,meson-a1-pwm beacuse adding more devices here
    are expected
  - leave only base compatible amlogic,meson-s4-pwm in check section
  dt_binding_check and dtbs_check run ok now;
  previous version: [1]

Changes in v3:
  squash power-domains patch into main bindigns patch
  add conditional to bindings that power-domains property is required only for a1
  previous version: [2]

[1] https://lore.kernel.org/lkml/20240701130113.433169-3-gnstark@salutedevices.com/T/
[2] https://lore.kernel.org/lkml/20240701172016.523402-1-gnstark@salutedevices.com/T/

George Stark (2):
  dt-bindings: pwm: amlogic: Add new bindings for meson A1 PWM
  arm64: dts: meson: a1: add definitions for meson PWM

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  |  17 ++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 215 ++++++++++++++++++
 2 files changed, 232 insertions(+)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
