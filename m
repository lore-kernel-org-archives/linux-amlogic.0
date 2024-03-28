Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CAFCD1283
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVzIqNrt/qO9diyyB4MLJkBDPr1SmYZ5msu2Q8Ifw1E=; b=DQcnuWxta5QFjr
	5C0PZlCih+LQ2H5Tt1DIZtk3SX65Rm+cmRU4qd60Mg+09YtRZuUHHltZumjhYWwrvMobCa1zhnGJq
	opo3WEbC/oo8Qp9LpZi1rQJrodw9DnKrWHyOx4xritSK5VlC6ZJlM9TRE4DT9C2HWjTf/638oR32l
	DnIWJq5QD2mBhwpfDazpk/tO9vggNVyLDHRRHfzU+duvXbXQfl4wKZISrDdJp8L3w76UFT7zAPnpm
	mo6qpn99Dyx6YPChoEFMQyatSpz3BLEWyObQx5F8rP15afrz4WsGq+TNQo72q7d1Qh9RsYlzcMqra
	7QfGvIfpSx6VswDovq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvBy-0000000FKWr-35UA;
	Thu, 28 Mar 2024 19:13:38 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvBv-0000000FKV1-06dT;
	Thu, 28 Mar 2024 19:13:37 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4CD02120005;
	Thu, 28 Mar 2024 22:13:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4CD02120005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711653211;
	bh=OpsGFI4AB8/F54l0oI8YXsgaWWxapVihfAczEHmbJxc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=boDSLKJtz53S5gfNoeeWNZERPcL8BH509Y74DErvlqwdw+M0ZL54RVBWAIo/jRMOr
	 zU4NE0ZGAzW7Tb4ZnUyFoz5CLYcMAjnoP2NLC19wG3DGWIy3sBCRHAWvTWUsD8bJFH
	 KQda/lZgP72a0T4f44vo2CppIJSp4oqU6ne6JvWIr8k3FwDoSWAl7bRcSlEg4L5ZIz
	 7DncGRTd0YR1NYIU1L7FLvyjKMQP+qzaQRyg3Gx4CAl6cWWNIYLoeK7wdhuoT+IbHw
	 Kgp0vMbYZPGsVhvrziQoUdECkjQmPB1lbpEGvm6rcGLzOijwqsuAIBSYRDb871PVRh
	 GpOzeVrgg6vMA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 22:13:31 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 22:13:30 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <glaroque@baylibre.com>,
	<rafael@kernel.org>, <daniel.lezcano@linaro.org>, <rui.zhang@intel.com>,
	<lukasz.luba@arm.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v2 2/2] thermal: amlogic: support A1 SoC family Thermal Sensor controller
Date: Thu, 28 Mar 2024 22:13:11 +0300
Message-ID: <20240328191322.17551-3-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328191322.17551-1-ddrokosov@salutedevices.com>
References: <20240328191322.17551-1-ddrokosov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184477 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 18:13:00 #24496606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_121335_805229_500F6D9B 
X-CRM114-Status: GOOD (  12.16  )
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

In comparison to other Amlogic chips, there is one key difference.
The offset for the sec_ao base, also known as u_efuse_off, is special,
while other aspects remain the same.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/thermal/amlogic_thermal.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 5877cde25b79..1d23afd32013 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -222,6 +222,12 @@ static const struct amlogic_thermal_data amlogic_thermal_g12a_ddr_param = {
 	.regmap_config = &amlogic_thermal_regmap_config_g12a,
 };
 
+static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
+	.u_efuse_off = 0x114,
+	.calibration_parameters = &amlogic_thermal_g12a,
+	.regmap_config = &amlogic_thermal_regmap_config_g12a,
+};
+
 static const struct of_device_id of_amlogic_thermal_match[] = {
 	{
 		.compatible = "amlogic,g12a-ddr-thermal",
@@ -231,6 +237,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
 		.compatible = "amlogic,g12a-cpu-thermal",
 		.data = &amlogic_thermal_g12a_cpu_param,
 	},
+	{
+		.compatible = "amlogic,a1-cpu-thermal",
+		.data = &amlogic_thermal_a1_cpu_param,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
