Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C480CD11DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jr7K7a0iDURXLXNYW+U+X5YnCNzzldHmVeoUgB0xlkw=; b=GC1HcX+slJd17x
	13XWqVePLGmqVhC0laflFLI99d3lNYqZ9oU5Ev3PIm0GLl4SVdlzXX2/mdyK3AM3EfOntapb8O9aO
	irmitiivxtk7/wsvm/g4GrFr/hSZ8MXnK2M4pj/qhPploI97A+/c45TFBJxM7zfJ+i8SUDue/khFD
	1TojbXw8uKTtVyT45GKCvsxJfmT0lTEMO29y1ImTiZMAX0xGj92+c5hRRyYt2QTmfGgmIX4MThDci
	4jcsz59NtHngvzrGoY+ZF9tf4eR20wU26G6tdYq3MGEExlygzzYT/vgzQ9H6KqPHVHTydvCUgwAX1
	hP+GWpyh3SQA0Ubm9VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvC0-0000000FKXs-2Nq0;
	Thu, 28 Mar 2024 19:13:40 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvBv-0000000FKUx-06mb;
	Thu, 28 Mar 2024 19:13:38 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 82B33120003;
	Thu, 28 Mar 2024 22:13:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 82B33120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711653209;
	bh=JInZBtKkASoN1jfIy+D2n9+9WIjAH4zJOpdoFKT/o9s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=N6dgwb8qUyNXhkZD3Jyr958bqrEXqGa3Fqecuy3VA0XcXBO78XHQw1e8W3+x0goUD
	 mwWOy09wL8/lie3378OX6EUipQwKrRq9nebA+ZU3Ir+00Y2OtEYbBMT/ZbIrcrT+OM
	 fbiIUSCjCdiudGDqTBQl69caIkImIe9QhnSeYoioDf8bORB4TYE3/21a7f+OsqZuIW
	 5VzRwIY9K8oIcGXDxhwtDIhH/ZvV8U6j2bXCb0sdfBWnHgezi3xQjSBSWvECA+N91f
	 PLGW3lIXrIXI5xOUWwgCKr0WIOhDY+Lt4qxhgsfGq/ZkaugG9f4CElgKTAdBzc8463
	 ia9qTvX3ZajnA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 22:13:29 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 22:13:28 +0300
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
Subject: [PATCH v2 0/2] thermal: amlogic: introduce A1 SoC family Thermal Sensor controller
Date: Thu, 28 Mar 2024 22:13:09 +0300
Message-ID: <20240328191322.17551-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
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
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/28 18:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/28 18:21:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 18:13:00 #24496606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_121335_810482_97FC80E0 
X-CRM114-Status: GOOD (  10.38  )
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

It is primarily based on the G12A thermal controller, with only a slight
variation in the offset value of the efuse parameters. Therefore, this
patch series provides appropriate platform data and dt-bindings to
ensure proper support.

Changes v2 since v1 at [1]:
    - provide Neil RvB
    - remove 'amlogic,a1-thermal' fallback, cause it's not needed

Links:
    [1] https://lore.kernel.org/all/20240328133802.15651-1-ddrokosov@salutedevices.com/

Dmitry Rokosov (2):
  dt-bindings: thermal: amlogic: add support for A1 thermal sensor
  thermal: amlogic: support A1 SoC family Thermal Sensor controller

 .../devicetree/bindings/thermal/amlogic,thermal.yaml | 12 +++++++-----
 drivers/thermal/amlogic_thermal.c                    | 10 ++++++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
