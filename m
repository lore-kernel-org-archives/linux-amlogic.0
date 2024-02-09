Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093CBC4828F
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Feb 2024 21:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bGYmIxqbWAn71Vj9YAkc3D7vDjctsLdSlzyQgyC0oc4=; b=Kofb4Z7dQT2R5p
	/qx4WcB9SIb42/hmbs4iSq2tF9J6XHQftfaYl2kFW20cR1IS4lRH8vx9aMuXYqIg0eC3of2e1cxf2
	JDmtkNLhJWD/cX7YN5xIkKTtT+0ztKxcdkHveitPfi0cEHz/UR/3S+O8kZ1uMsbHmnAC4m17eZc3H
	65FihvhcrwRLycqtqfJqUgmgFQGo/9KOKwZAYzS3bdc9CT44tK+yBYsELGO/qHTqogvJ9Qhhcp1a7
	GQCQUvYUAhXhWbbxr4ddo2o2o8tImYcR7TFO+hVAoO/HeDMgsjFY+i2FYW1E93kyqUhKkxYOWACrt
	MhlqvmP5UWckymInALiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYYQG-00000000e6x-0zrk;
	Fri, 09 Feb 2024 21:28:36 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYYQB-00000000e5Z-2uvp;
	Fri, 09 Feb 2024 21:28:33 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 43968120003;
	Sat, 10 Feb 2024 00:28:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 43968120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1707514104;
	bh=dLmQ0i/jpUoW9BKIvHqBZWYTMFOGB89t6XHByYjn+Q8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ZH6AOevfVZ3AJKxqbu6FhgIDEdRjLVV9kowdaOV/THlihTRQYUIhlUCN8/0ohxiwF
	 PH76yZJcc3FCCKYgC5VKGBgCbN2wUc9fmgveZ2FqFr2Ib51qY+3Zs/5W7Eq8mMsC2t
	 S69kRTVSfuyzd31uGwliYDA1MZJ2B98bEMWlEIQ7UIGtAYDOD48DUbjSEUPGshJmE+
	 4J/szHV4Ta7msD2sySkIG78g9LeUkqdUoXgJQ3gzYi9H5WbKOUN35KHfXcLGsLbwQK
	 SDjVkYMLAZQm6kOp7Y0t1QWnYYxeQhUTJqsU9nahd+zwuzyqkJ+eYzOOdw7HssYJmd
	 ioKnZXeOi8Lng==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 10 Feb 2024 00:28:23 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 10 Feb 2024 00:28:23 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <adeep@lexina.in>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 0/2] meson-axg: properly setup CPU power management
Date: Sat, 10 Feb 2024 00:28:04 +0300
Message-ID: <20240209212816.11187-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183341 [Feb 09 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/09 20:35:00 #23447606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_132832_285673_3E01649D 
X-CRM114-Status: UNSURE (   8.66  )
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

The Meson AXG leverages the SCPI ARM protocol for the management of CPU
power, thermal, and frequency. This series addresses several issues that
have impacted the functionality of the power_allocator thermal governor
and cpufreq cooling devices.

Dmitry Rokosov (2):
  arm64: dts: amlogic: axg: move cpu cooling-cells to common dtsi
  arm64: dts: amlogic: axg: initialize default SoC capacitance

 .../amlogic/meson-axg-jethome-jethub-j1xx.dtsi   | 16 ----------------
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi       |  8 ++++++++
 2 files changed, 8 insertions(+), 16 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
