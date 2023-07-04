Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1451EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 21:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NSg6K9Pv1ALaEe9fCE5aqoBJTMw5I0KTignZ/HJfbSQ=; b=juAnqxuROgptXB
	/fHokmB7XiLE+BYJfaj6JfuHDzNZjec5p9EmA7FzG6RqBdxip+mw9I7SiOaYT/rtX+0tEgYhi6gOW
	FyXxN8xI/iiBJsdCEAwQrunlnaVDzckgtr6EW4+4gGWbGFv7tp/EpIomoWuPbxxa8CjVtkwjPkWEA
	urtP6Szw9vyX6GLPJyYC8wGlhnzNpwSz2s56yCco+TqXicfjrK8b6ljiJRUKgEWIqkDsUT16Btwr/
	JpFou//SaAzbW+zzT6B1eJWJi3Vfyhu076p5AI/yykbBJ2cfun/wkQfe+ScKYOqUFEgzYb2Ov8xMd
	oQvXa1nQi++07+Xhcfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGnyh-00EGEl-1N;
	Tue, 04 Jul 2023 21:54:31 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGnyc-00EGD7-2k;
	Tue, 04 Jul 2023 21:54:29 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CCAC3100069;
	Wed,  5 Jul 2023 00:54:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CCAC3100069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688507657;
	bh=sMHKeng6YabVu1I8dRw/uL0UU93WVerpkNgP4pxZLzY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=rpmRKrpVDesQVijIsKp7PCvkhThX73sNXsYr9+Nsw4vfhGsBqh2cUebtGtW9+V/xh
	 iZ/uoyS4Dn1Ks7wksuOg5KornPBRCCsUi5J7V9TxO+67KsBYWkxxRllRAI0Utm2vKm
	 IpFEXviTHYWMtst4VlDJnlnc/w9y3ME+75l8kQgfHz3FgQHkNln6sUHjbJ3dueBAqc
	 s+h+POjDs1vncnibrvJhxJVCSy9zB2kCClHPc4nhsZK5MmkGwnniQ03BQnvq4eS1XN
	 FeqtCK5zZhlpPt9fJiYQr3KxnnihKgEIp/YF/U1Uoe8/ZotbjzsrYX+VAw/A2o0TOG
	 JA1Y/S/s+7CZw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  5 Jul 2023 00:54:17 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 5 Jul 2023 00:54:04 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@sberdevices.ru>, Jan Dakinevich <yvdakinevich@sberdevices.ru>
Subject: [PATCH v2] clk: meson: change usleep_range() to udelay() for atomic context
Date: Wed, 5 Jul 2023 00:54:04 +0300
Message-ID: <20230704215404.11533-1-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178432 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;sberdevices.ru:7.1.1,5.0.1;lore.kernel.org:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/04 20:47:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/04 20:47:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 15:36:00 #21561860
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_145427_256126_1B17A100 
X-CRM114-Status: GOOD (  15.68  )
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
spinlock from the clk core logic, which risks a kernel panic during the
usleep_range() call:

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

So it is required to use the udelay() function instead of usleep_range()
for the atomic context safety.

Fixes: b6ec400aa153 ("clk: meson: introduce new pll power-on sequence for A1 SoC family")
Reported-by: Jan Dakinevich <yvdakinevich@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
Changes v2 since v1 at [1]:
    - remove redundant SoB from commit msg
    - drop unuseful reference to clk_core_enable() from commit msg 

Links:
    [1] https://lore.kernel.org/all/20230703200404.20361-1-ddrokosov@sberdevices.ru/
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
