Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E4C46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 13:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UuhssGx6pFnMDuHxUD9J1JKjUCJ9T6v76wOqne7/Nig=; b=QFd13jxsKAdmxp
	wQY+HmxMhOYgDdW/nI8vT1IqZBIPjpbiCw1vQTaJ3VdSKyU/YXpVlTbgsp1HxgcAtZqZgjiJE3zY1
	I0HhhJllQcmqcak/Gx++p6ZuvNK30s9lr9Hx2CcVgS+wPxDgWZARaBU+X/xASuhr6ke3GVN5OcODS
	tGGjtoXgP+ImRYmTaS1ksz+v2RMEuub6ez2hCrkdz9QydbAO+mKnfTbHdjUJXz4QKqv/zWXFiFIKO
	ZHn3l/aZD8SUurD8jfMOFad7APkFEd8WQlp9+Sdsrqlpk4i/5ZOFDIV7cPiFtT+F26Wn77eW/nbvW
	jEBb1N2TQFgEmkVl9rtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rScxt-003P4C-2s;
	Wed, 24 Jan 2024 13:06:49 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rScxo-003P1f-2M;
	Wed, 24 Jan 2024 13:06:48 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2D63610000A;
	Wed, 24 Jan 2024 16:06:38 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2D63610000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1706101598;
	bh=zsaAaLH6CJR21EnkfyKWpwpt24RWdug8/kf9Nmutwtk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=uZPRmfDoQb5g2BQ5jsyq/TzsVOm1HBSDitGpyhC/BnFNLtuBpXV4UZ/1PnoR1v1+r
	 6qzJaVFiIX8wIdWxXTV0zfM4igd4rrTJZqvGXWhj9gvZ68xjnhfzjoDG0135SgHKiY
	 9WtLkvcuUT9hfbBecjS+jINhfi/nJnUphA95n+xnY4un1IJYrL7s0ZfZpeYHUHFLiC
	 4q3EBQfKAsLqk86jqpnjinde/CcfPdlIvh0gfGQhoF0iX/pjRSyWQxxqIy+KRKOWXY
	 9E+pGec/yTGkntT8Q3aBjf4RCqlcDW3aPl5Ug/eEI/gHGqCIQDNi0LEs2v8s9fbkTh
	 SGowzrEJgXegg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 24 Jan 2024 16:06:37 +0300 (MSK)
Received: from user-A520M-DS3H.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Jan 2024 16:06:37 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>
CC: <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kernel@salutedevices.com>, Alexey Romanov <avromanov@salutedevices.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: [PATCH v1] arch: arm64: dts: meson: a1: add assigned-clocks for usb node
Date: Wed, 24 Jan 2024 16:06:23 +0300
Message-ID: <20240124130623.3471236-1-avromanov@salutedevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182891 [Jan 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/01/24 11:47:00 #23399457
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_050645_463393_B4FDC77A 
X-CRM114-Status: GOOD (  10.41  )
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

To ensure proper functionality of USB, it is necessary to use
the rate of 64000000 for CLKID_USB_BUS. For instance, adb may
not function correctly without this setting. This information
has been derived from the vendor SDK.

Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index cf150f568335..b9fd69112535 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -668,6 +668,8 @@ usb: usb@fe004400 {
 				 <&clkc_periphs CLKID_USB_BUS>,
 				 <&clkc_periphs CLKID_USB_CTRL_IN>;
 			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
+			assigned-clocks = <&clkc_periphs CLKID_USB_BUS>;
+			assigned-clock-rates = <64000000>;
 			resets = <&reset RESET_USBCTRL>;
 			reset-name = "usb_ctrl";
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
