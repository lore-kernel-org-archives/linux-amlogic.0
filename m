Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB689EEE26C
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2024 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocqbewNyduJq8DFCMpSVLlJzttUoXZ4FPAVvcFEM6uo=; b=O9qGhHkVbe0XGA
	Y914NnmfCjf8+XbeUc+EdnhI7I85nxS6h3Zi5UhDXiveb2+QpGe9IrL7lX6U49CCzEp/Cd9iVnXBu
	fPZo+SdOUh+qN+W1DuHbsVJQjDwWJEsmdX3XLOdwMRD2Lh57Niqcjz+szGtfe8U8W5rrb82wOHZQF
	I7LmEVkzbHjWRlyIoZZiQMDYfxq4VUkAHj9mOjnJ0uNaLlEN4xAS458zPKH4HEah9ZDS2cl6AxeFE
	RxkFJs2s9y50fexOsYOkYSkssQ6t4rNc7pRDPxgpFCme7PxNY8vdcw/MfrVDB6eeBlyRdiRcaC5EC
	WpALUckFs8OVUNC9+PbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5HU-0000000FsPW-366L;
	Fri, 13 Sep 2024 12:20:08 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp5Bf-0000000FqxN-1RgT;
	Fri, 13 Sep 2024 12:14:10 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A405C10002C;
	Fri, 13 Sep 2024 15:13:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A405C10002C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1726229633;
	bh=rPQw2F08Uz4xjVSwdhVa7ZBFlR+M5A8/MM2JJ0d09Ek=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=u88BGvsZ7TlnGfnkgrQDbRP/2ei9GK8oGlsIr8txKU2lwG6DWZIqLa8nycsYdqKlv
	 JA5OZCpgR2k+jjwGkNRVT4/KVexp8+m+/NKvMk6R+876EWY95DHXyC4Q6obsHu76xD
	 jKtWsm0DJcx2Z3s86Lo5/lBJWJ8ud0+DINqcV+KXACfSEEO55/90NFuj01d/F7NMih
	 ZLGl2OvULDnnJd6plIrVKpDiq5bve3DKm+aHHdcriqfmUA6oGR9T6HotpjVbR1J9IL
	 rnPFn4E5nFCM4229RSljye7r5EAopOU5Er5s246pm7E0cZZZEkMJcStK6oh+LIFw/2
	 VvVHuLMmJZG3g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Sep 2024 15:13:53 +0300 (MSK)
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Michael Turquette
	<mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v4 1/5] reset: amlogic: add support for A1 SoC in auxiliary reset driver
Date: Fri, 13 Sep 2024 15:11:48 +0300
Message-ID: <20240913121152.817575-2-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
References: <20240913121152.817575-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [172.28.129.52]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187732 [Sep 13 2024]
X-KSMG-AntiSpam-Version: 6.1.1.5
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 34 0.3.34 8a1fac695d5606478feba790382a59668a4f0039, {Tracking_smtp_not_equal_from}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, FromAlignment: n
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/09/13 11:43:00 #26577866
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_051407_862079_BD6DD68F 
X-CRM114-Status: GOOD (  12.57  )
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

Add support for the reset controller present in the audio clock
controller of A1 SoC families, using the auxiliary bus.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---
 drivers/reset/amlogic/reset-meson-aux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
index dd8453001db9..a385c0125836 100644
--- a/drivers/reset/amlogic/reset-meson-aux.c
+++ b/drivers/reset/amlogic/reset-meson-aux.c
@@ -26,6 +26,12 @@ struct meson_reset_adev {
 #define to_meson_reset_adev(_adev) \
 	container_of((_adev), struct meson_reset_adev, adev)
 
+static const struct meson_reset_param meson_a1_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 32,
+	.level_offset	= 0x28,
+};
+
 static const struct meson_reset_param meson_g12a_audio_param = {
 	.reset_ops	= &meson_reset_toggle_ops,
 	.reset_num	= 26,
@@ -40,6 +46,9 @@ static const struct meson_reset_param meson_sm1_audio_param = {
 
 static const struct auxiliary_device_id meson_reset_aux_ids[] = {
 	{
+		.name = "a1-audio-clkc.rst-a1",
+		.driver_data = (kernel_ulong_t)&meson_a1_audio_param,
+	}, {
 		.name = "axg-audio-clkc.rst-g12a",
 		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
 	}, {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
