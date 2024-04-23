Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85218C04FFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXJp+0z310WT0IIaGP97Cg739uXd5IuKFpghFEn2c+o=; b=clPJmtHUbUz+YW
	H1njVKeYxP3fPbiA+d6cAfFbbilmImL5dNlmxp6Xcqd2lbUEtT9Nz1Pd0eUtI7WLSx+9jjxjIudeG
	Jqu/ug97iuWIpxqm4es9uoAz9thHE7V7Hr3BF6LEgl/BTAbS4m1h+9FzKhn9+J3pMcwbcCanlH/yc
	w78Mt5/ruZrmxYmU95Y22+IF1tNB5yMUWRKw3peRcpgrq7Z+oDcFj/2DgxLc8uGV1DSplNoEKI6kF
	A986gCYj7+I1dYC+6VuqVnq9yXoFqMlpm0jazt+mhkGKO8Ez8pxBWO1QsiOxM6+LW7boSRZ21O2pQ
	WGjilKwcxbEMvW11YEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIj4-00000000fEE-1Xh0;
	Tue, 23 Apr 2024 16:10:34 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzIiy-00000000fB9-0n2h;
	Tue, 23 Apr 2024 16:10:31 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8981E100014;
	Tue, 23 Apr 2024 19:10:17 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8981E100014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713888617;
	bh=AjYUV33RB86oJg+nTKakP4FezRMrY73vE/+v4LYaSsk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Xs70cbnsb1hAp8xJuUHKjTAl0z4UeO0Ebrc3P7uHmIHD/BgzFwXCgf7/LFU9OaZYk
	 Oss/0y5enExkLkuKCPXpH0TYjiqGkF0qQGXDrnMLsWFgEhL3SJAdMIdTlIBwXGiFYk
	 aXBtWNAIm8MPZJYCYgOxA3kyo26VgD0/UPWLS2M8U0biG11+2G9Vt9xdPVygHbuTu0
	 zPVYrAi8ETs9Xxuiks86NvexNa9gXr4DRfFY6JQ5OtOuKMbgDHyZtGRjv6zKr62/hP
	 A/YCOr+v/Gg/9SgWnkX6FHhur9gFVdg3ltnssF84P82YCvrlEtPPQZJx45Uu9HlBHl
	 AKBKPH3zM68mw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 23 Apr 2024 19:10:17 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Apr 2024 19:10:16 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>, George Stark
	<gnstark@sberdevices.ru>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH 2/2] pwm: meson: support meson A1 SoC family
Date: Tue, 23 Apr 2024 19:10:06 +0300
Message-ID: <20240423161006.2522351-3-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423161006.2522351-1-gnstark@salutedevices.com>
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184882 [Apr 23 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/23 04:11:00 #24934400
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_091028_883973_8758645C 
X-CRM114-Status: GOOD (  15.24  )
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

From: George Stark <gnstark@sberdevices.ru>

Add a compatible string and configuration for the meson A1 SoC family
PWM. Additionally, provide an external clock initialization helper
specifically designed for these PWM IPs.

Signed-off-by: George Stark <gnstark@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index ea96c5973488..529a541ba7b6 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -462,6 +462,33 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
 	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
 }
 
+static int meson_pwm_init_channels_ext_clock(struct pwm_chip *chip)
+{
+	struct device *dev = pwmchip_parent(chip);
+	struct meson_pwm *meson = to_meson_pwm(chip);
+	struct meson_pwm_channel *channels = meson->channels;
+	struct clk_bulk_data *clks = NULL;
+	unsigned int i;
+	int res;
+
+	res = devm_clk_bulk_get_all(dev, &clks);
+	if (res < 0) {
+		dev_err(dev, "can't get device clocks\n");
+		return res;
+	}
+
+	if (res != MESON_NUM_PWMS) {
+		dev_err(dev, "clock count must be %d, got %d\n",
+			MESON_NUM_PWMS, res);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < MESON_NUM_PWMS; i++)
+		channels[i].clk = clks[i].clk;
+
+	return 0;
+}
+
 static const struct meson_pwm_data pwm_meson8b_data = {
 	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
 	.channels_init = meson_pwm_init_channels_meson8b_legacy,
@@ -500,11 +527,19 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
 	.channels_init = meson_pwm_init_channels_meson8b_v2,
 };
 
+static const struct meson_pwm_data pwm_meson_ext_clock_data = {
+	.channels_init = meson_pwm_init_channels_ext_clock,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8-pwm-v2",
 		.data = &pwm_meson8_v2_data
 	},
+	{
+		.compatible = "amlogic,meson-a1-pwm",
+		.data = &pwm_meson_ext_clock_data
+	},
 	/* The following compatibles are obsolete */
 	{
 		.compatible = "amlogic,meson8b-pwm",
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
