Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79949C4167D
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Nov 2023 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ku1o1lnd+c4aCjLiPz1Syo9flJ7KH/eEX8DIDUO2FFQ=; b=3BXME/5gn7DeCT
	l9Xqm+cWa3yt2Efa6y2I4hgIjRv4a+rkPCdv+Mm+Rh6c7g3lEPJqxNyk6+x3/i5GFsaYROB/DwCXK
	jqXGWtUzT1wGCrJv60dKLEQjTb23DZvJ9c71PSZhFG2yFbsHjuuPHeEO/RPDketWXKzIm60UAW2F8
	aQUUzm9vxmAVlWIdP7+//gGnwu1kWHmPL1KvZi2sDqQ3ihD+PmgcSn9hXlnFpw8Pfoam70Gnl/UVk
	57uSs718yqLDsmIclrzT0BCG26CqkAW9lYfrLPExAMsIEH5aioAP8xBZt2gBY9JwCDeN+pC1LZP2Y
	qXkj+fuiuWYgv6Y7ofcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7Z-003oXo-0b;
	Wed, 08 Nov 2023 12:57:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0i7U-003oTK-0p;
	Wed, 08 Nov 2023 12:57:23 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 24A0A120005;
	Wed,  8 Nov 2023 15:56:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 24A0A120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699448219;
	bh=o3HN9w6B5G0SK9zVHy0ukaxr6aC9dqXoqv66Yn0Zd9M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=DdqjDPh8qW8V14JgGwGL/HvMuY+T+kFXf/EYR91Btj4Q/P9WbejwgzshPuvYvjZHM
	 sYGp7grnbNQY4Tko58HVM43Qjso+cGCNnj1mqGy0RzseaAiwA7vzb+Gk43ALEu5bqc
	 /HxD9+z6IucoPa3x2QB781ao9GVq4qO0X8UtLNgac1ABArq/7FP6TMqbBHuSKlm+7D
	 OWOVTQHWVYH5XPOn2IIDDP9mENqeMjmiCPNAkDeD2Gi9vAhGVGZJZvMCEBb2Qb3khi
	 De77qVz09nGFcjIh0G/eNV2wH5vSasEt4v+9zizfhEXtWKXq5YcDQxgpMbVX1Bdcod
	 rmxez/vr1KAxQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  8 Nov 2023 15:56:58 +0300 (MSK)
Received: from pc (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 8 Nov
 2023 15:56:57 +0300
From: Evgeny Bachinin <EABachinin@salutedevices.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Evgeny Bachinin
	<EABachinin@salutedevices.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Miles Chen <miles.chen@mediatek.com>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <kernel@sberdevices.ru>, <evgen89bachinin@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] firmware: meson_sm: cleanup error paths inside probe()
Date: Wed, 8 Nov 2023 15:56:02 +0300
Message-ID: <20231108125604.162383-1-EABachinin@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181206 [Nov 08 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: eabachinin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/08 12:09:00 #22428609
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_045720_496997_C43FAAC9 
X-CRM114-Status: UNSURE (   8.40  )
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

At first, patches series refactors sysfs node creation to avoid extra code
paths. After that, the resource leak in probe error path is fixed.

Evgeny Bachinin (2):
  firmware: meson_sm: refactor serial sysfs entry via dev_groups attrs
  firmware: meson-sm: unmap out_base shmem in error path

 drivers/firmware/meson/meson_sm.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
