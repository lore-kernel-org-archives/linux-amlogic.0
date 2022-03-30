Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BE3C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 02:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lu28o/EViJENDVJfE7nlRzDP5jumYCTK4TYbaa98yzU=; b=QbA/u97uPDKONo
	dY2MkwWa0S4W335Pu96Ux9jCw3bokfyaZt50mpTZT8mKpgra4jMywr3gLd0bWcogfPiUg17k0ffKu
	ZgwxwadBRM540PHwrF60unuuOXi47XdG/VFMqihTdZTlglJ0eg0h2/CvtaIDGC869yua6kHfIepah
	8HbmjzyLPLQgO4Kq5Z42QpQog8xt7oVdK0JNfnuIWx0a3M93BLAtjWn5s3OF4GYFwVd8gR/R90QYd
	vsC1h/g2H3VmCkIsdLmJpUU82Gt6rpvwJAKzLatS2YiSl7oVdksHY3i2CPgtAHyIV45lqbxgHUx84
	JBfd9pLfiWEMsHp3giHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZOEK-00E1fX-Pk; Wed, 30 Mar 2022 02:38:40 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZOE8-00E1cm-Pq; Wed, 30 Mar 2022 02:38:30 +0000
Received: from droid09-sz.software.amlogic (10.28.8.19) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2;
 Wed, 30 Mar 2022 10:38:20 +0800
From: Qianggui Song <qianggui.song@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
CC: Qianggui Song <qianggui.song@amlogic.com>, kernel test robot
 <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] pinctrl: meson: fix unused variable warning
Date: Wed, 30 Mar 2022 10:37:19 +0800
Message-ID: <20220330023720.18238-1-qianggui.song@amlogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.28.8.19]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_193828_878564_E3AE40A6 
X-CRM114-Status: UNSURE (   9.06  )
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

The kernel test robot reported a warning as below:
>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
   static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };

Fix it by adding missing description about this pins

Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
---
 drivers/pinctrl/meson/pinctrl-meson-s4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 3c7358f53302..cea77864b880 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -575,6 +575,7 @@ static struct meson_pmx_group meson_s4_periphs_groups[] = {
 	GROUP(tdm_d2_c,			4),
 	GROUP(tdm_d3_c,			4),
 	GROUP(tdm_fs1_c,		4),
+	GROUP(tdm_sclk1_c,		4),
 	GROUP(mclk_1_c,			4),
 	GROUP(tdm_d4_c,			4),
 	GROUP(tdm_d5_c,			4),
@@ -936,7 +937,7 @@ static const char * const iso7816_groups[] = {
 };
 
 static const char * const tdm_groups[] = {
-	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
+	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c", "tdm_sclk1_c",
 	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
 	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
 	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
