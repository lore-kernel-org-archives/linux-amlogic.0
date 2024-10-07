Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15516CFB456
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9JYHJTpuqzaY8QtvhLQLTpcl2CAaSZmjGp1fSSXiJQ=; b=zjJQnXCgZmMoyW
	mazAxCcuBh+SNbYdNluIsUKFjxiLBfHKKOx6U+oaY4w6WwkpCjjYOvPxu6vG7tWnKoyX++6Vwz63J
	/SpdOIwMgB/kWQ1fqdyJ1mdLQZyfxBXresnTtWu4BWxkbWZu/9Lj33u5tJTpGfohljMuzpft4xWzn
	6WKTOHEqRZj8hPLK7EmOCxlrFaRs0bpd5HQqA4+jfB3biEcddmv+cTuv0N++ULIG6tFnZf1o9R9/d
	re2XWEXEl+Ij3VtuibiRd+IZhavwufQRe0h++pP9ELFGCyB1xudJz/FKE8XPGzOZjoEnVLZOFlh06
	ihtzP/FElmb/YLi1HUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtUF-00000003cjI-3gxB;
	Mon, 07 Oct 2024 19:33:43 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtSt-00000003cTQ-1TAF;
	Mon, 07 Oct 2024 19:32:24 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id EA44810000C;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru EA44810000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1728329531;
	bh=JJ23VCJzDOZTr2V6x1enTRhokP19rysAyyD6vIuZ+ys=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=gdmlOQcn/wWaHGlTSWkXrGCI2dhv99T3tV30ubn9XEDCXSo3c4fGmOtut4td3n5P9
	 /U8tp92h5fxr3nmgpNMVGGd61MCP3cD5LWWXyhspyQZDKJg8FtT78xXxWLS9zpjjBa
	 dk+ARcrsmFswgHuJL5GWCbZp701xPkFq7iQWsq/GiIuE8lK0lz5O+24l7bAjNTnQA1
	 /iqcJ7bW2eVf8WQcGuU5Kt4JG3nAV9xlSM882lWZU7UitBw2ogLBwSsf5LtQ1Elqkw
	 xfDLwBy6h7/oNM0uVUbRG44FxW8BiUO3ALNs76UQy0I1IE//79QkwfSufvhn/hCY0V
	 jGyoQql3XW+sA==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon,  7 Oct 2024 22:32:11 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH 3/3] pwm: meson: Enable constant and polarity features for g12, axg, s4
Date: Mon, 7 Oct 2024 22:32:03 +0300
Message-ID: <20241007193203.1753326-4-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241007193203.1753326-1-gnstark@salutedevices.com>
References: <20241007193203.1753326-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.192.106]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188277 [Oct 07 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/07 17:50:00 #26714324
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_123219_923351_908716D4 
X-CRM114-Status: UNSURE (   9.50  )
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

g12, axg and s4 SoC families support constant and polarity bits so enable
those features in corresponding chip data structs.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 6701738c55e3..c6f032bdfe78 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -571,26 +571,36 @@ static const struct meson_pwm_data pwm_gxbb_ao_data = {
 static const struct meson_pwm_data pwm_axg_ee_data = {
 	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_axg_ao_data = {
 	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ee_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
 	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct meson_pwm_data pwm_meson8_v2_data = {
@@ -599,6 +609,8 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 
 static const struct meson_pwm_data pwm_s4_data = {
 	.channels_init = meson_pwm_init_channels_s4,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
 static const struct of_device_id meson_pwm_matches[] = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
