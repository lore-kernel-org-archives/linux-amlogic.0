Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFCD2A52B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2024 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WKJ6T5g9mBvhUTOw787nvVOGBUgh4xIP7RInghf4tw=; b=Zw0bXzSiMVD5Os
	7qxyJbaQ5EbjhfaW1G+LhjVJ3rMNpoeydqfg454JcudYEfqu3t2bSinpXFvCOogchzmhPqvrXFzz7
	xrZMyzZV/1OnGo5iuQAwdJSq2xInAW53hUhGHM7+3HNYBM6OW5SUA4CBS3NGGPb8QB/4V36sKExYM
	l49eKLsDMz0oKud6YeS1PSrj2DwleQKnvjv1mRfTbBzuhigTas/IQIvhXALYqIAU5erAXLvnzVuF8
	XYkunf4Fg6DF/+9xDScFU46XesBMt3n652TrKz2PnWL13oCJYYJppFUiEu+GKfwdR7HoizdJVnKDf
	BVeuXcgymp3sCiDHTXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ug-0000000CEfh-1xIu;
	Wed, 16 Oct 2024 15:26:14 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ub-0000000CEar-13sh;
	Wed, 16 Oct 2024 15:26:12 +0000
Received: from p-infra-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5F1F512001F;
	Wed, 16 Oct 2024 18:26:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5F1F512001F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729092361;
	bh=1ikeBZbubc4DVoAfNpzprl2Ps8Yd9DmnJ95uv3sHsDw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=f7T1o1PwryalGIHyzDwlzmyxL1yUBFvfyM7YlT/mo4MgWBmZ63Oj/Rr6m/Q5h3tXm
	 M9FMnAtpUwr+07h+O+0ovD9aKhLOoRl9xJz6IQe6JveqdZgC2m4sunTVXSCfSuVcp8
	 ZY/PvcPVjEuAitbOIRyBWW4YGvDPUU6SHxVmDqZQjGfSuk0F78/huBeYm0BLCxIybr
	 X3ZgDODd4mgnZBiOLh3KaTBaBq1pGdHlFnXurk+VtLJt91CRqXrIbxhZyfvu85vLBF
	 akvC/FoZNLAGFkD7y3p2bpHR+nH/8OCBSM0m5VY43Cvj14v+Yvi5XBQMMERRMBF/Ib
	 q6lvBX47DiZcA==
Received: from smtp.sberdevices.ru (unknown [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 18:26:01 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 4/4] pwm: meson: Enable constant and polarity features for g12, axg, s4
Date: Wed, 16 Oct 2024 18:25:53 +0300
Message-ID: <20241016152553.2321992-5-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016152553.2321992-1-gnstark@salutedevices.com>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
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
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/16 12:08:00 #26762169
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_082610_039625_BAF90A2A 
X-CRM114-Status: UNSURE (   9.64  )
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

g12, axg and s4 SoC families support constant and polarity bits
so enable those features in corresponding chip data structs.

Signed-off-by: George Stark <gnstark@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pwm/pwm-meson.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index d9d51f0af103..ca822174f7ba 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -558,26 +558,36 @@ static const struct meson_pwm_data pwm_gxbb_ao_data = {
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
@@ -586,10 +596,14 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 
 static const struct meson_pwm_data pwm_meson_axg_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
+	.has_constant = true,
+	.has_polarity = true,
 };
 
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
