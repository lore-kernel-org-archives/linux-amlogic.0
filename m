Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15115C001B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 05:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2TWhcozXQEflzZ+uN2vZHzdBbjlE4/ycjQncCBXmwk=; b=ZHzPsFiCFu09JT
	9rmDwOmpkAJQ0GF3sR1LpTn0mYxsPhhwNX6x0QCl2PLPjz50sm9cqYDT96qUlVoYcKKQpyMD809ku
	aNfnh/JVHC2W27oKp+H6I67eiwUqu+8EDBsZlXjStPppZEh3LeDvwfYeHvdfV/vj9O5woXts0gUN6
	9JUkDEtYHn4zs/v0a6qVTIxa1Rx2eI2IugJa/lb4ORyLqKtv8oa9xIYi9PzRk3ESLPEi8oh6FsW7i
	W7G5lGqTQd36ECcTMeFDTUDLs8XXCaTob8Tnbm/5oynYCYUMUsj7ZMkJ/kvOC8V6/J/tVMhlHDA8Y
	puGO2A4eY1YCBAZVXglQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzlJ-005Jpn-1W;
	Wed, 19 Jul 2023 05:30:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzl5-005Jld-0X;
	Wed, 19 Jul 2023 05:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UiHzmjG4TaGzVmcQmvisHB6eGM25HydnMEqayp5RuKw=; b=GvvR0lWFYZndWW3jeKJ721UwDF
	mILjGIlxLAuK290liZ0eCbqztocl8JTgbvW6LSnM1/WIqWs8nXTOl4T4F9anGHAYettGD9tKpxhTz
	dkOij8DxqP3CVP9eBEJ3Iz00dsGHQxxroet2ft4EKHHnYjlZjlOoYE3qdgNSmegcIiT2sWRKnkVoQ
	pAQGBfFf9u9uVPFQe6VawulDN3lwKmSnJh9UaeeRh5NwUTUPIhe5Zij+nxQNVujMof981qQ8jxtdm
	4bV95ISn7IJ3LFNGLFV0rB1TQvJxoNO3lW91CeJhMT4kNA5a3NXaqLN36KdkyxdxuxQjTVuK6RE5Q
	jwAMttjQ==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjw9-00BWIw-0C;
	Tue, 18 Jul 2023 12:36:18 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 18 Jul 2023
 20:35:44 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>, "Dmitry
 Rokosov" <ddrokosov@sberdevices.ru>
Subject: [PATCH v2 2/3] reset: reset-meson: add support for the Meson-C3 SoC Reset Controller
Date: Tue, 18 Jul 2023 20:35:49 +0800
Message-ID: <20230718123550.13712-3-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230718123550.13712-1-zelong.dong@amlogic.com>
References: <20230718123550.13712-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_133617_208540_3D19413E 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add a new compatible string to support for the reset controller
on the C3 SoC. The count and offset for C3 Soc RESET registers are
same as S4 Soc.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/reset/reset-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 13878ca2779d..ee1d5caf0ee4 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -109,6 +109,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
+	 { .compatible = "amlogic,meson-c3-reset",   .data = &meson_s4_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
