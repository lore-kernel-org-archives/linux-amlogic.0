Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78772C001DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/7h5BqLHnZKnJSa/3tO+6KLRUFn0IfQJd35TfCXbZ5M=; b=maBdWFbo+mB9cE
	yz/yUq6adCOgYxdrcDsoychgLZ6WFlTgozifa+1JFhy7JpSdMxAbUe62ash84PIega2dd/+2+1piD
	lD5FP0AL9QxwxUczVzTLluZVXMuxMeZr8gBEDVRDKvsQdq/evUFjNg2xNWrxjFapndRSSO+lcE0Z1
	tua97Uadc31UcKFJU0sBZU7iefF6NO0LOxNQK4OEIy1q9UcJbdtDUYcCpeIqLdPf3fhM8auK9PghJ
	PCUqgizQS7VwqiBcVoSLfZ/5/Z9+04EqiL4vHd+P52cgxb2a3D0vKiOSpfy7UHggiUjOHufy4XKbz
	Da+FVCCIOnPxZaa6hkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPmU-00BLVt-2p;
	Mon, 03 Jul 2023 20:04:18 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGPmR-00BLV9-2Y;
	Mon, 03 Jul 2023 20:04:17 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 72F97120029;
	Mon,  3 Jul 2023 23:04:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 72F97120029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688414652;
	bh=3glFyjcepOK8/Kxd5LbRvbqIMFcThbI+slfTdN39SXQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WjMN6ZhzyZADuzwnFwMQ3gUPW2zr7aMn5XdG790qvsjykfMk5YSLaehgLDmfmroLQ
	 pUIV8KPbgJYcmvuXXXBLEsot0h7mr0rjc87cMhlyPYZZKln2gbvxie1oWDiLgL6MeZ
	 1i4gzY9FTHTd+impmjhyACUY2p67fekGBp8+bnVfPxoF2U6YLQK0F9gK9TWoRC8Ur+
	 sc9DrgR5qFEdzPBR1SkC0KODwWIU/WjSjmZLxA32+0cHNteYLymxa08/tmVHRt1wxY
	 gbucrOtXG3RhW7mV+AiQglXYWhARQlEkr/ZUiALCbw9upJs9UXj9bFkokJmxdcjqtO
	 Vry38FB6holOg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  3 Jul 2023 23:04:12 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 3 Jul 2023 23:04:08 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Jan Dakinevich <yvdakinevich@sberdevices.ru>
Subject: [PATCH v1] clk: meson: change usleep_range() to udelay() for atomic context
Date: Mon, 3 Jul 2023 23:04:04 +0300
Message-ID: <20230703200404.20361-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178409 [Jul 03 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/03 16:02:00 #21557037
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_130416_177065_7836AC96 
X-CRM114-Status: GOOD (  15.47  )
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

The function meson_clk_pll_enable() can be invoked under the enable_lock
spinlock from the clk core logic (please refer to
drivers/clk/clk.c:clk_core_enable_lock()), which risks a kernel panic
during the usleep_range() call:

   BUG: scheduling while atomic: kworker/u4:2/36/0x00000002
   Modules linked in: g_ffs usb_f_fs libcomposite
   CPU: 1 PID: 36 Comm: kworker/u4:2 Not tainted 6.4.0-rc5 #273
   Workqueue: events_unbound async_run_entry_fn
   Call trace:
    dump_backtrace+0x9c/0x128
    show_stack+0x20/0x38
    dump_stack_lvl+0x48/0x60
    dump_stack+0x18/0x28
    __schedule_bug+0x58/0x78
    __schedule+0x828/0xa88
    schedule+0x64/0xd8
    schedule_hrtimeout_range_clock+0xd0/0x208
    schedule_hrtimeout_range+0x1c/0x30
    usleep_range_state+0x6c/0xa8
    meson_clk_pll_enable+0x1f4/0x310
    clk_core_enable+0x78/0x200
    clk_core_enable+0x58/0x200
    clk_core_enable+0x58/0x200
    clk_core_enable+0x58/0x200
    clk_enable+0x34/0x60

Considering that this code is expected to be used in an atomic context,
it is required to use the udelay() function instead of usleep_range()
for the atomic context safety.

Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Signed-off-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
---
 drivers/clk/meson/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 56ec2210f1ad..eef6f37c8d8d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -367,9 +367,9 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	 * 3. enable the lock detect module
 	 */
 	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
-		usleep_range(10, 20);
+		udelay(10);
 		meson_parm_write(clk->map, &pll->current_en, 1);
-		usleep_range(40, 50);
+		udelay(40);
 	};
 
 	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
