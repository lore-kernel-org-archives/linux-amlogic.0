Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A324C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZjababPUu5chXMZzU3SiHGscU6dRRpKqaKKqJ5eX7XE=; b=W/AeGi6Ftk8rBn
	DR556YCBZAZAmlHB1zegv99gLrNBFgJa2LK/rZBZRlyur8EU5kDKZckUAB7pSdFQ4qI0LqzYkjfmE
	iRpyz55yXSQPD5C574mp1Vvr6a8BvVnFcOFZ9oeENAXiGtd90XdD9s5DaGeKy9C8qriDIRJxjhi/E
	OFjWCbsOJnen3VFq5Ya4gJIiX9ZqI2Af8MSz6bStn19MCCiq0pnpSAlHRXngTWX342Ml2E8L0kG52
	BgKF5er/iHZLZfcaKRLvNqLh2D+prPipx38OvGMvSiZGOU9jvqVDzw8LMLmOpVBZstBX3TobtJxOf
	OST5fp2DvGVJlNVITg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgwn-0000000C6nw-06kF;
	Wed, 10 Jul 2024 23:42:05 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRgwB-0000000C6Wk-21xf;
	Wed, 10 Jul 2024 23:41:31 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2E3CD120006;
	Thu, 11 Jul 2024 02:41:23 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2E3CD120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1720654883;
	bh=qRhU2crivn/2xTODAHp+2oPbvB1yAPDlRcyKl3MlgSo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RjyXBTc3Gl147fEQhywvoAtRVsEkNsqXW67MIWT/VVc33gjZphsFQ4nJEBCWN1hmQ
	 AGD3N1+sSZC5HT7kyFMHjlMN/LnLYBDEr1S7XjrVvJ8ucYPkM7k4yu2HylbvepStFw
	 qMM+XyPQm0ANEZGve3Wo4BlMWfdtT38LH9A+dnPhUVZTsy4yBmRmdDvFMRpsGSuhWi
	 dZoNU4eZEI5q4rM4Eq7IP+vEfuJl0W7+7CBw1Ye0yaBAF0JIAV+ef0+yEePmsWoQVv
	 fV/0RGpYbG2EwOUOe514ufqjQD03nUN/oMP61mSpzUgr+C2e9fwr7pT7m0TDy17Y9w
	 lGh3NZzyT8nLA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 11 Jul 2024 02:41:22 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 11 Jul 2024 02:41:22 +0300
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH v4 0/3] pwm: meson: add pwm support for A1
Date: Thu, 11 Jul 2024 02:41:13 +0300
Message-ID: <20240710234116.2370655-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186446 [Jul 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;lore.kernel.org:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/10 23:02:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/10 23:02:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/10 21:42:00 #25942395
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_164128_256548_CF3AD14E 
X-CRM114-Status: GOOD (  10.77  )
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

Changes in v4:
  split bindings patch into power-domains patch and new compatible patch
  previous version: [3]

[1] https://lore.kernel.org/lkml/20240701130113.433169-3-gnstark@salutedevices.com/T/
[2] https://lore.kernel.org/lkml/20240701172016.523402-1-gnstark@salutedevices.com/T/
[3] https://lore.kernel.org/lkml/20240702123425.584610-1-gnstark@salutedevices.com/T/

George Stark (3):
  dt-bindings: pwm: amlogic: Add optional power-domains
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
