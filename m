Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278A4C3DA5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 09:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3IrXC4nIdyWig0XjWHtmwQiyIwQrRKHOtgprVVAyOE=; b=HtO1X/nHEm4Dg/
	XTIjVMQ47o8EhArhox/GPzl21nWAIdYeBBUVeylpIclqsjf7HYhKznLom1rMhfJONBOuMUCaFf7pe
	3JN1JJLk7GWqP2mBvIG/7l2P9hP57evnUXK4Z8K2vQaeiHHRit1cAqgkFlpzpurVY2Y6V2HSi4aFV
	gbRAHj55I7tYSMVVbr5MorLhR39p1YWoaSrFqI76gCVr1UD3nHhZlf17Mk3hN9/R96gGioFgfRG49
	f4Fdtbi4h9u4kL34W+R++7WPvbebgDilT+PfHMDVi5P2zzsIy80Ap5WhI4bFx7TUoAMrG65astuic
	kKzL0aTKZmiki11XllUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYx-00000006RaX-0a9X;
	Mon, 15 Jul 2024 09:00:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTHYK-00000006RHd-2AiG;
	Mon, 15 Jul 2024 08:59:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59594CE0E4A;
	Mon, 15 Jul 2024 08:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69E20C4AF11;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721033961;
	bh=/O2nGpJcr16vRLvgrd+SZjmwJdnjJPrOC4NvECf8nUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M7K882P06PDKXe+45ygDPWh29IXz4bfMKePRHgQV96VoAKoURRRL5g7FFDqRsK0RT
	 srLZotmoUl87ghOID2fgY2+QRlEOvcBbVZ0Ztu/KCowolQvZGvdD+9SKimthH70BwU
	 RYXwdeOFtTKUliJ7uS9V3qpktrd+FcbQM4PmZ2Iyz4JkTc4wUKLw46GACUpRBqCh6+
	 yX10QLeFpP4YINPa2+ztk7pP5oM7NRRdBH7Lna1uv9wR6wN1EgYaMyeE7HgKcaEXUF
	 nhoFiBtHnJjI0RkMq9DYTwyHKSyQ8ZBFWbc2C6dk6Z2HcFHb15d1Q6I6Ojjuhf4MpY
	 ynQRBo9KXD44g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D4DC3DA59;
	Mon, 15 Jul 2024 08:59:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 15 Jul 2024 16:59:20 +0800
Subject: [PATCH v2 2/6] soc: amlogic: meson-gx-socinfo: add new SoCs id
MIME-Version: 1.0
Message-Id: <20240715-soc_info-v2-2-3836c8cc27a5@amlogic.com>
References: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
In-Reply-To: <20240715-soc_info-v2-0-3836c8cc27a5@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721033959; l=1182;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=zRWWsMnyYjBcl83+I2nHF9NZDOoGs2C4FOAOFivyI1k=;
 b=smDNFXgxoSeiIF54/TDERqvLgFVop9bAHAJkTpYw3WsTuikbc3zfL7BHtc/ebZfXE/Yej69VT
 1fK7rlvbx2XAqApVBpLw7a1nHoxW812k77RvHQ7MjowYUVxKU/4tmCF
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_015925_062543_6A67EB09 
X-CRM114-Status: UNSURE (   7.79  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new definition for Amlogi SoCs, include S4, C3, T7, A4, A5.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 8809a948201a..7549f1644e5e 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -41,6 +41,11 @@ static const struct meson_gx_soc_id {
 	{ "G12B", 0x29 },
 	{ "SM1", 0x2b },
 	{ "A1", 0x2c },
+	{ "T7", 0x36 },
+	{ "S4", 0x37 },
+	{ "A5", 0x3c },
+	{ "C3", 0x3d },
+	{ "A4", 0x40 },
 };
 
 static const struct meson_gx_package_id {
@@ -76,6 +81,11 @@ static const struct meson_gx_package_id {
 	{ "S905X3", 0x2b, 0x10, 0x3f },
 	{ "S905D3", 0x2b, 0x30, 0x3f },
 	{ "A113L", 0x2c, 0x0, 0xf8 },
+	{ "S805X2", 0x37, 0x2, 0xf },
+	{ "C308L", 0x3d, 0x1, 0xf },
+	{ "A311D2", 0x36, 0x1, 0xf },
+	{ "A113X2", 0x3c, 0x1, 0xf },
+	{ "A113L2", 0x40, 0x1, 0xf },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
