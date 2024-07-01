Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4908AC41513
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y+7IGjQxPeKitotfLNdGmKL+weB1GpJ7cZva63RhEIg=; b=ULnQ5SEL7W783x
	BcPe8sibCJgj2YdDvYVAYEX1NojNfe6+huawZB0HHIW4sQIro19V1XvBk7+uGdF+zZ+rNx8p/e4pL
	OaAfwuJxS1IKWi+GakOLL4mL7XlODg5VRVkxRsbSplQ3h7oCJHuN3nwjsqKok0WqBnvM/4fJypb1i
	fbVLvatAGoR4c6NqaUwKNQsxJy2WBGMZ/6hPeM9vkQEloIg1v4HHdNrnWSjFL7pZe99J06L+21R22
	8HYOcYN+hqHwWHqW2utyjCLxy9Pm0u/jo4xrTxOm5X7lNi4pFL3OiWimQCC6M6kZ1xRo+vd1aFEhg
	efyvzo2xHcjW7nm1u8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGey-00000003NSV-1gyP;
	Mon, 01 Jul 2024 13:01:32 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGeu-00000003NOx-2VNU;
	Mon, 01 Jul 2024 13:01:31 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AEBD2100020;
	Mon,  1 Jul 2024 16:01:22 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AEBD2100020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1719838882;
	bh=u8k3tcTnpuTH/PJpX5qayEs3QW/i3kdJlSiuUB2g0ww=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=UY1il4SOWjSidlDgmgTqG0dbU9WJLinsFAMfLf7lwuXSto4H/3192vEfBpz/7p5lL
	 nYon/u79o0J5f7/Wsuo8T22tiJrDrCii9GDO8S8t3xxF6GjpQWSwsQByktRSiLAbQR
	 IdEpNdPOs5SaPka3G5FTBuDgUq46UK03B87kbFwwWuvwlHjbaz8l2fpVX1whRBi00J
	 +kbGOo8LRTE6KnHimZCvvz575pUhcVd9swPF6CAdJwkBmMipG++oCvv0xrnr2f+7BO
	 vBpFNt5kFPjq2gnffhNqwmqwPfR5W3K8Na+UtYBkDIvKCoRQVqiGOZNcgxFSI3XvaB
	 NORGDfdXRA8hw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  1 Jul 2024 16:01:22 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 1 Jul 2024 16:01:22 +0300
From: George Stark <gnstark@salutedevices.com>
To: <ukleinek@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@salutedevices.com>
Subject: [PATCH 0/2] add support for meson a1 PWM in dts and bindings
Date: Mon, 1 Jul 2024 16:01:11 +0300
Message-ID: <20240701130113.433169-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186241 [Jul 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 21 0.3.21 ebee5449fc125b2da45f1a6a6bc2c5c0c3ad0e05, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/01 11:44:00 #25786379
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_060129_165052_0D5C6FC9 
X-CRM114-Status: UNSURE (   9.40  )
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

Add support for meson a1 PWM in dts and bindings. Due to pwm driver code is fully
the same for a1 and s4 then a1 compatible defined with s4 as fallback.

George Stark (2):
  dt-bindings: pwm: amlogic: Add new bindings for meson A1 pwm
  arm64: dts: meson: a1: add definitions for meson pwm

 .../devicetree/bindings/pwm/pwm-amlogic.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 215 ++++++++++++++++++
 2 files changed, 217 insertions(+)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
