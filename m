Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC6CDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 05:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o3/kHGhK9PdpXhQaEbXRi3UXPdxyqkMTaKgpIju030E=; b=UYrRB7EawpC+/U
	eO5bZ0NU/xQKBQee0qL1fj/Zqr1NoVULVA8qiTKpbEqw19U+9NWOFXKptfBjcsITR7C0+jk0tiWXW
	YsyO7z7GazGYpzSnD8/kfw9onuYBpauP/y9yklttwF1NtelBZVP+tC2bDQ4M2JPgLG4u+TU09Y0Hy
	0sjX7hzKTEhkG+zC7VsfUW3M14SiVLp8yra3XL3p2YB3V6UBoxcqydX636uPR8kpIpDx4/5vtO/Ld
	dwqC/cVo70rydJ/Kqgjdx7UK1aS6xLdo7hbi3YmCaiM+ThuPjjpg9qO/gqkoKfyfP+rab/snAA33s
	Jy089ANOyPXiO8ZzrKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsG6e-008Njo-2o;
	Mon, 16 Oct 2023 05:25:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsG6a-008Nga-1l;
	Mon, 16 Oct 2023 05:25:30 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 16 Oct 2023
 13:25:09 +0800
From: JunYi Zhao <junyi.zhao@amlogic.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <linux-pwm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: junyi.zhao <junyi.zhao@amlogic.com>
Subject: [PATCH V3 RESEND] pwm: meson: add pwm support for S4
Date: Mon, 16 Oct 2023 13:24:57 +0800
Message-ID: <20231016052457.1191838-1-junyi.zhao@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231015_222528_589781_8AFB7E96 
X-CRM114-Status: UNSURE (   8.82  )
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

From: "junyi.zhao" <junyi.zhao@amlogic.com>

Support PWM for S4 soc.
Now the PWM clock input is done in independent CLKCTRL registers.
And no more in the PWM registers.
PWM needs to obtain an external clock source.

Signed-off-by: junyi.zhao <junyi.zhao@amlogic.com>
---
V2 -> V3: 
Rebase and Review the latest upstream code again.
After reconstruction, stick to the previous code as much as possible.
 drivers/pwm/pwm-meson.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 25519cddc2a9..fe9fd75747c4 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -99,6 +99,7 @@ struct meson_pwm_channel {
 struct meson_pwm_data {
 	const char * const *parent_names;
 	unsigned int num_parents;
+	unsigned int extern_clk;
 };
 
 struct meson_pwm {
@@ -396,6 +397,10 @@ static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
 	.num_parents = ARRAY_SIZE(pwm_g12a_ao_cd_parent_names),
 };
 
+static const struct meson_pwm_data pwm_s4_data = {
+	.extern_clk = true,
+};
+
 static const struct of_device_id meson_pwm_matches[] = {
 	{
 		.compatible = "amlogic,meson8b-pwm",
@@ -429,6 +434,10 @@ static const struct of_device_id meson_pwm_matches[] = {
 		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
 		.data = &pwm_g12a_ao_cd_data
 	},
+	{
+		.compatible = "amlogic,s4-pwm",
+		.data = &pwm_s4_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, meson_pwm_matches);
@@ -451,6 +460,16 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 		struct clk_parent_data div_parent = {}, gate_parent = {};
 		struct clk_init_data init = {};
 
+		if (meson->data->extern_clk) {
+			snprintf(name, sizeof(name), "clkin%u", i);
+			channel->clk = devm_clk_get(dev, name);
+			if (IS_ERR(channel->clk)) {
+				dev_err(meson->chip.dev, "can't get device clock\n");
+				return PTR_ERR(channel->clk);
+			}
+			continue;
+		}
+
 		snprintf(name, sizeof(name), "%s#mux%u", dev_name(dev), i);
 
 		init.name = name;

base-commit: 4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
