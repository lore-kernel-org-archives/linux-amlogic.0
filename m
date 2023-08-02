Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD8FC001DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Aug 2023 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fTtFa8vU98sRxBPNKLXK2DQVt5IhcgIIDlvh3DdItUE=; b=L6h7ecN1XBnTuK
	N/AL52SQMF62H+ghT/akKjkTXSoOF/6gezg7vvNASKYtcC+0YzE5oT8QHfDRt4woHE/SOT0t0PFXQ
	4pHzfaJphxWy2SE3MlgcJ2m43izDmKMCwuYLrGbzz3mPbK6EnYBfRUgvsKEbrnVT7+Hs1c7IYBteD
	Df/Dgb6prbcGfzHkDDNsXWSZMZmLm+GglzkAZ/nVbzb8vsHQTMa5SVUa9n9tO1zeTkKs8wFzU4RNo
	/QrpTqgOQu5FqhYaJx3OOjUegqrecn1OB9WivcrMZLQcURFzF54lk4nkhgzSS1Zyg6ivYoAC3udZU
	EgHAFfM+A2SHIkabQ/JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2be-003sYg-1p;
	Wed, 02 Aug 2023 03:33:02 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR2bb-003sUl-10;
	Wed, 02 Aug 2023 03:33:00 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 2 Aug 2023
 11:32:30 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH V2 3/4] watchdog: Add support for Amlogic-T7 SoCs
Date: Wed, 2 Aug 2023 11:32:21 +0800
Message-ID: <20230802033222.4024946-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_203259_348195_3804A79D 
X-CRM114-Status: UNSURE (   8.27  )
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

Compared with the previous Amlogic-GXBB, the watchdog of Amlogic-T7
has a different reset enable bit.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---

V1 -> V2: Use the BIT() macro to build rst initial value.

 drivers/watchdog/meson_gxbb_wdt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 18180d91543e..a48622d11ad7 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -147,8 +147,13 @@ static const struct wdt_params gxbb_params = {
 	.rst = BIT(21),
 };
 
+static const struct wdt_params t7_params = {
+	.rst = BIT(22),
+};
+
 static const struct of_device_id meson_gxbb_wdt_dt_ids[] = {
 	 { .compatible = "amlogic,meson-gxbb-wdt", .data = &gxbb_params, },
+	 { .compatible = "amlogic,t7-wdt", .data = &t7_params, },
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_gxbb_wdt_dt_ids);
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
