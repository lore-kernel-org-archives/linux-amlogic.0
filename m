Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01838D2A529
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2024 15:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0fjdneXk2+Gst22et4ASsk2JWKHfHe+4SkFOT5ufYoA=; b=d40bCcbFl72b8Q
	iJtc1h7xgxc4wOajidFCNmx4c62lZLyEk2ed5FTr5pzVoeMZwjLSLIEaoKqRxM9LKMtKDP+n5JjQP
	zivW62HJcZP0Jf/uDaMQsZAsFhHaHVO7FL4aAf6CcST6WGpQ5jFl9d4AEtmimB93rw0oTDWUEdGde
	4k9bzAXtEVpWMoogMGfvZNMGXeAFT2+NQX7l4sA13C71aunKQ2xQXCDnTc8L6Nh6y5u98SgxDpcJ/
	5q77lrckHxhFFivVtciYz+81nT20IG+1b6tqcTn3R8C+am0MV/WJe8HKZbdprP1m1qBPaSo2pp6a3
	gToY9jbuu/FyhAU6E16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15yu-0000000CFSb-2u41;
	Wed, 16 Oct 2024 15:30:36 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ub-0000000CEat-12gB;
	Wed, 16 Oct 2024 15:26:13 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id C10FD12001D;
	Wed, 16 Oct 2024 18:26:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru C10FD12001D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729092360;
	bh=T3Q1msRaeqxF6VzybefXJBK+HzKQABZ1uZVeBIxYoFo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=lAJ8Llu23qIYlVS/UmkWoFAYtBOyPX3negL50vqIGE3ubb/+uiM+WYKeZiF+GWe61
	 UabP+Dd1WH5CBPUi9PeJneUNhGmukkPtwCJmbQZykAT1x8OfOSEsxV2o1eK3fsuhsy
	 cTb5FustcsfJyaWxgzhFA5nAdsTgqXFX0E1nBmHcQ6E/Z56MKbac2/3/B/9zy9lvOz
	 w2RLO+fAidAuxQPMmAI5f9OlpLtPZbjaI4nV01/eFWquhAfyYklW/Umqh3tRUFjC45
	 wLcycyua/k7TAopaNM7NUi0ZJ+WnpcBCM1arfJB1XHwaREb0WD2AEv8HSrUxp68OM3
	 +HOayN/AukuQw==
Received: from smtp.sberdevices.ru (unknown [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 18:26:00 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 0/4] pwm: meson: Support constant and polarity bits
Date: Wed, 16 Oct 2024 18:25:49 +0300
Message-ID: <20241016152553.2321992-1-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [185.8.126.20]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188483 [Oct 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/10/16 12:29:00
X-KSMG-LinksScanning: Clean, bases: 2024/10/16 12:30:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/16 12:08:00 #26762169
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_082610_079707_FADB4567 
X-CRM114-Status: GOOD (  11.93  )
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

This patch series add support for amlogic's newer PWM IPs hardware features:
constant and polarity bits.

Using polarity bit for inverting output signal allows to identify inversion
in .get_state() callback which can only rely on data read from registers.

Using constant bit allows to have steady output level when duty cycle is zero or
equal to period. Without this bit there will always be single-clock spikes on output.

Those bits are supported in axg, g12 and newer SoC families like s4, a1 etc.
Tested on g12, a1.

Changes in v2:
  pwm: meson: Support constant and polarity bits
    - drop separate set_constant() and set_polarity() and move register writings
      into enable() and disable()
  pwm: meson: Simplify get_state() callback
    - add new patch to make .get_state() callback consistent. Since I add new
      fields to struct meson_pwm_channel either we should fill back all of them
      from registers or not at all.
  pwm: meson: Use separate device id data for axg and g12
    - add splitting amlogic,meson8-pwm-v2 into amlogic,meson-axg-pwm-v2 and
      amlogic,meson-g12-pwm-v2 with pwm_meson_axg_v2_data for both compatibles.
    - update commit message
    - add tag: Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
  pwm: meson: Enable constant and polarity features for g12, axg, s4
    - add enabling const and polarity to pwm_meson_axg_v2_data
    - add tag: Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
  link to v1: [1]

[1] https://lore.kernel.org/linux-arm-kernel/20241007193203.1753326-4-gnstark@salutedevices.com/T/

George Stark (4):
  pwm: meson: Simplify get_state() callback
  pwm: meson: Support constant and polarity bits
  pwm: meson: Use separate device id data for axg and g12
  pwm: meson: Enable constant and polarity features for g12, axg, s4

 drivers/pwm/pwm-meson.c | 103 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 11 deletions(-)

--
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
