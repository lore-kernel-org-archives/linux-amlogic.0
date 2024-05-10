Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67CBC25B10
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2024 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBTfz2kUvn1UHPEMRwbtgqQ+2ndk5Y70gTU/UkKai3I=; b=XMJ9VLoBXNuyL6
	xnowRgTN+GPVw/QZIlt2vIUGeUi4mLnmQeVztQ4q0eNvWmZrK8dGWRuC6s3HzS/3fnK+Q13aKC15U
	8MB39C5cj6ywroITsJkjHjiwGOYJzaN45JF37NUKxkaRxwj979LlFuCWx5MWK6nfZBH38mt1RvD7N
	6B+BekBnM01SEnCtCTTfN7nSj225S3majEh5wjx9/Fu2deHvKuwbpPG8jiA2QeLFF02SjWANIgkU6
	glh16eEQaWv+Zdrn8Gj8K2dfjN932bxU2ef3gj8mLI+u2Z2gl9s500LvOtLva7WOPe3vj39p1q/Gw
	DESn2A438xcyBD7r8aIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJz-00000004dyR-1JzG;
	Fri, 10 May 2024 09:13:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJO-00000004dUx-1Q3v;
	Fri, 10 May 2024 09:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gQ9FhGrXLgPhVgt8ePrWVQvsA5pd7mfVzSDQoNepqLM=; b=fuFPd2YjT+hajt6OegEbgimfOg
	GoY/OpMrKCeIOFSWGS/3YUQvj8JNIaQS8oqOhBtKv/AD1OiBZwRuRo5Dop9bkAeL0vQP0de4m0irT
	X9Es4R8vlgXUCnEpvaZ43Gn8Gmj+IJT4OgDrCUX9BAnBWVWCBrmoOcPBDIyQJt26he3LSIldYDTey
	/MMP37R56tYcviANeRQjHKdrsiqnNswgHstD3u++kUqwPfSHgCazuxnxHnQO4+EV0keF7TjqGm4dS
	+nslHF/pvyzideD0Ui4ZjRI9oFFLtgE24v7FvAPQaXSG115ak0UniTlkJLxpl2YJ1PU1arcT5mKlU
	XEWJSBOw==;
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5MJK-00000003KQl-0mvJ;
	Fri, 10 May 2024 09:13:04 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 163FE120003;
	Fri, 10 May 2024 12:12:59 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 163FE120003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715332379;
	bh=gQ9FhGrXLgPhVgt8ePrWVQvsA5pd7mfVzSDQoNepqLM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=BooSQd2WWgBd1Q+ranGD+5mmTzkBVYop0Q3OwU25F0BW7OQANkci3KWsC/HGbteth
	 ODvHQwcemtcbZ3sJnnofiaYUVZ6QBwHtHo63L+cAKDf7fmB7MvUa7jKwzMYKgcXRiq
	 kpB488GJTatgX6HJyO7DTRJ6xE4LoxhYGjy6sgfiJ/Ad19N7Hb/09FcXiQ30ugftsR
	 3/TxSGoMoYOReOrjO5A29l8C+K1W+9WoMRe+8cVtZEAPjGd5qkvTG1e/J4azZU7Tld
	 WGY3mVLjSPsA4l8sxxYrf4l09g80WTGlULHmVMAkeG3Re9oh+OfT3JMFgyiWjhWwUC
	 eUPNUU31D5srg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 10 May 2024 12:12:58 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 10 May 2024 12:12:58 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v2 1/4] arm64: dts: amlogic: a1: add new syspll_in input for clkc_pll controller
Date: Fri, 10 May 2024 12:12:23 +0300
Message-ID: <20240510091251.20086-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240510091251.20086-1-ddrokosov@salutedevices.com>
References: <20240510091251.20086-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185158 [May 10 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 19 0.3.19 07c7fa124d1a1dc9662cdc5aace418c06ae99d2b, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/10 07:36:00 #25144647
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_101302_542593_E10196D2 
X-CRM114-Status: GOOD (  11.38  )
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

Input clock 'syspll_in' is needed for the 'sys_pll' clock and is
inherited from the Peripherals Clock Controller.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 93b85b26199c..feed2bd7ae48 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -889,8 +889,10 @@ clkc_pll: pll-clock-controller@7c80 {
 				reg = <0 0x7c80 0 0x18c>;
 				#clock-cells = <1>;
 				clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
-					 <&clkc_periphs CLKID_HIFIPLL_IN>;
-				clock-names = "fixpll_in", "hifipll_in";
+					 <&clkc_periphs CLKID_HIFIPLL_IN>,
+					 <&clkc_periphs CLKID_SYSPLL_IN>;
+				clock-names = "fixpll_in", "hifipll_in",
+					      "syspll_in";
 			};
 
 			sd_emmc: sd@10000 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
