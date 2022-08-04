Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8112C19F2A
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Aug 2022 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GsjkyKgQeIb//A1UoTgWkFd6PnCwJYKrmIXf2YXV0gg=; b=og4W3cHb+eCUcn
	uqO+SWCIdvSlXkd6SwdIrYH+rQCQYFYlGHULpFiAufOrsbLR++1scFo1f+mO2UG/0GkQi5N9G1X6D
	Wjbxf63rgPMJAaZ/2ZYfL97E4GzgSpVLVGUZ+XrwipjtMUER07k8iUpJC323JDrgiuITQzQj24An/
	k/WoWOBOm7yf/CY2s6LEQxbmaa7e9EKZ3u8dqTFnI5ZvHxPum/VNEOCy+xx/zSSdDyijiQfeJzqhI
	KAB3giTKWPxaS/T71sUxjvc9A2OnMHZnFZGrtSVijZFE+QvIdo4b85hSqX3oUMt9VjkcCBavwXZOR
	XbBMd+kEA4bLYC3oyuXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJe6J-007ezo-2i; Thu, 04 Aug 2022 16:53:35 +0000
Received: from mail.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJe6F-007euP-Rc; Thu, 04 Aug 2022 16:53:33 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mail.sberdevices.ru (Postfix) with ESMTP id 174735FD06;
	Thu,  4 Aug 2022 19:53:22 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1659632002;
	bh=7VqOZGtBUV2rPszzt+iOd/uivE15FHVsI8evbC3zCPg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=eHQCywSVaPtlqKMhx494PMfhccsQ6LkWBwuqmwxX0aR3pQ9Dupxm3rEGu27kS82Yd
	 MadISbStWePQJuOT4M8KSDFhslHuOJr5ZtnHERDK9Jdg3+7eaiBhf4aMRrbpaB9qJ5
	 mEeSZsZHMnGzldlzRn3mKNNNEKxolhHlkRiLaZ6w3aeb3zKeU54qLyUM0EDIXRv7wf
	 RBou3VFs5y8L0PWsyG3CD3ulOJfeH8mQkeKwi7VUydTAMlk2QyWSF2OZMav48ytZHo
	 WtSXZDLXFlW7SwBjP/vL728whqeweaCpDwzOFbD6xiUgnh/vUoYBIKmBNR6cMfBCKc
	 B4L9ecwOLWLJQ==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mail.sberdevices.ru (Postfix) with ESMTP;
	Thu,  4 Aug 2022 19:53:20 +0300 (MSK)
From: Dmitry Rokosov <DDRokosov@sberdevices.ru>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"narmstrong@baylibre.com" <narmstrong@baylibre.com>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, kernel <kernel@sberdevices.ru>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry Rokosov
	<DDRokosov@sberdevices.ru>
Subject: [PATCH v1] arm64: dts: meson-axg: reserve memory region for Amlogic
 TrustOS
Thread-Topic: [PATCH v1] arm64: dts: meson-axg: reserve memory region for
 Amlogic TrustOS
Thread-Index: AQHYqCKmlgn31IcXkUK0U/+U7ZMA5w==
Date: Thu, 4 Aug 2022 16:52:59 +0000
Message-ID: <20220804165317.29086-1-ddrokosov@sberdevices.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.12]
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2022/08/04 12:57:00 #20050432
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_095332_125543_E7321836 
X-CRM114-Status: UNSURE (   8.45  )
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

For the all AXG SoC based boards, which run Amlogic vendor ATF and
TrustOS this memory region 0x5300000-0x6300000 is reserved by BL32,
so tag it as no-map in the kernel iomem.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 3f5254eeb47b..1fa0d3805969 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -142,6 +142,12 @@ secmon_reserved: secmon@5000000 {
 			reg = <0x0 0x05000000 0x0 0x300000>;
 			no-map;
 		};
+
+		/* 16 MiB reserved for Amlogic Trust OS (BL32) */
+		secos_reserved: secos@5300000 {
+			reg = <0x0 0x05300000 0x0 0x1000000>;
+			no-map;
+		};
 	};
 
 	scpi {
-- 
2.36.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
