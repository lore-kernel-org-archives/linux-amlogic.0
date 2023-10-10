Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54076CD8CA9
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Oct 2023 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2neUVvuSnEqoNgaS8QWwnFr6wtwqF1VC5kOF1EiOzm8=; b=l58oXgZMqCi2uE
	SJmc3EsDpMezj8PYSSadU5Xy/JujE0twUgRPj2yt4PJYIAndgVacX+2KLHOQsfQ0fXCkjuBwhJrKD
	t8NYj1lcccw1vUPPk3ERzVtL2zo/E5Cod1/SrUvWlI6ixyu3+POntltmdm3oNRyDVxTFFksHs5Vdh
	UamSkx3y6Ki19ncfIOVTFl3Th/3N6r/MRBgU5r0Ty+2xJ8HoWOCsy6wqVReDrsNBjZenUZUIziTe2
	QR/qQx1baryUriYCcV/vfae9JUg8QH9Va2LD2ZCDvScodNpYjcpNz8L7sM/es6ecxd/4ifOkJuuja
	i+r0tpR5xGMuum6cwF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFr5-00Dmpz-2Q;
	Tue, 10 Oct 2023 16:45:11 +0000
Received: from mail-sgaapc01olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:feab::82a] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFr2-00Dmp0-03;
	Tue, 10 Oct 2023 16:45:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iELm5inVMeNQ20FWSEXjt61pQotJXt0sZjhFhohHXuVLJxSjDJK2r6+O1UXd4L1UC/ea33xM2+yHLuQR7sgetE5a1K72Xqn3TcThgKvKcrANXTX+546XGh35pd7p037nrw4bVNZ/4FRIEKv5BRudEnSR9iz0iMBfBvaw3I8IRkr0WOepByouVQAwCpmtyQbzYOQb2nKn84CfL4EV5FShcgOqUsMKELzp4x7q+2VPoF3rLNJr12XAylf+cBcQL9aZ65QqpnvvVAqyWES32ro8TvoOa5e81rrLGaIclNtAgF4DqzNeKtDuO41clsmXshv55sKrVLiW/T1DS5hE+aSQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Er4IMpZfPSX54I809Kd72s9uLIY/b8EKWkK3Gvhuco=;
 b=LzN+IXylStAg7SYOy5KK1LxDAimNTOlE8od/ldTUvQTU0Yu95T+Dab/LQ30aR+27zNLToBVhLICCXssBW+yUijxmkWuK7uRxY7toDNlYm9OSE4Da7tfomr2F0cKMfvWb43uvRGXyxN5C5FteeRFmWuP3Wu+zO/uyva3fP/VWoTuLQTS0NTxMF57AYgkJtQFNmSdUwL1JfbGCKc/Qxohdmqog4odtKbn46ZKqKqAqqNgBy8WeDwR2pWwxjDIaLSBt6suO5XstSOKIJ+QSRb4q1DyMCw2SyHjIRGjnZvJXstiAoFrUs50VyTzEROo7hIbB/E4Q5mKUeYS/+N92LsuP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Er4IMpZfPSX54I809Kd72s9uLIY/b8EKWkK3Gvhuco=;
 b=i2VRuLN1AGiPO+b3cAT4/HRyiIsCVjcGQnzghid+lQi3E0H/9iiXC8Scu77ASfryoENq3mAXUcJKfZx9AvX1fgkrPDzpowqrI4jcM1pQiQeg/LDtWloJ7gv+7zDKZ2LEGHsItymQwtgPV6qSnKvDxfEKYoiIrnK4cJanocn0nHDVl8na6U/JjFekeVLLdQlO1zYhMzQV0Mw9An1fCQDrdvDXCxgrQlrkdqk/Ofz4duPPcnCMLzs1sSOgwPsflxMPd+qhzjlWHgnJNvZ7pW3ngW+BV1PPlyPaSwjKAxCESqzVK3r9yrc0M2n5bAgTG1IAXqNzd2inIeGxoXOYp2MnXQ==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by SI2PR01MB3962.apcprd01.prod.exchangelabs.com
 (2603:1096:4:10e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:44:53 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3ac0:a6a4:2d8b:7fb9]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3ac0:a6a4:2d8b:7fb9%4]) with mapi id 15.20.6813.017; Tue, 10 Oct 2023
 16:44:52 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: ulf.hansson@linaro.org
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	yinxin_1989@aliyun.com,
	regressions@leemhuis.info,
	briannorris@chromium.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>
Subject: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
Date: Wed, 11 Oct 2023 00:44:00 +0800
Message-ID: <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-TMN: [m663dbzJiho1ItKxpjDRASwyqKXEVYHHqVdT8Z9XEEAGOnwkEjJoxw==]
X-ClientProxiedBy: TYCPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:1::21) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20231010164400.549969-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|SI2PR01MB3962:EE_
X-MS-Office365-Filtering-Correlation-Id: 90674f13-7ae7-4cae-7aa2-08dbc9b03957
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xh36sGv6HxhlcLVmuo1jPnpGZmuCaD1eix0QTlW9LkK17hOjRNc07cStNBqxnUFOcKhTPxS3VwOaCxCmdSpnM4HxPK3kYSDE8NdHCU9LDD+3vsq7ET8Pa98cbYd9c623eHkgr1HsfaP9gTo0z6ITrlXdCX3A2h66iyWhWgyEJZyAg33lkBJKJS801dSFRDDRHxqTK9QQsUGeRB6ibn+OObOmINpGgLn1uH1/mig/A6EvojahMTWhKEP8WyCFnNdrk/JWuG6arAvR3NdBC8hpzZ8/+twxKjQ4GCfYH9+mjIeAIQ/PTcgzuWksRQI77BLwomgH80JivHSmjdRnPBNKkacHemnuhq4KVtiKC3y/TjHIUy7NpEyhsAmroxTvR8XYkR4dooobUP8VjgJizmR6ttGaYdqCxiEsADfUra3/h611G58402bFE/0NiUlkrDnAKLav11kmJpcfSfP4VG0sIZPqcUcSfrD6BSY2dBx3IVNaaRriiJQzFMkpKJCxdlQmTzjphu99bIuPgWq46Ly8xViWbXnfe4VsB7B+SRmN+Mrv+rdcXf4sko58uUkJbgXUyLJXtO/FGl75Q+9CwSbnas7oCD7PYUMIgbgYYeIlrW+QtaQ+x0oWIIJFdhP8RZBo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u19E9jMI136bHM0F1ig0fVyxurvuMLClQr0p0MjgOBog/YirxwJRqiH5eNjw?=
 =?us-ascii?Q?iXzUVhgJ7oUPsV/VEN/PVQTLwuFLuzuDjSkEKlCV8tIX/fpII+lbULekJUy/?=
 =?us-ascii?Q?kx7kEYaq7AfOQIC13imr5pTFBuw6OFzVEvt+AOGZi/kEPq/SEz/wxeJTcv2H?=
 =?us-ascii?Q?Iioon/d84R/oCX/npb6/SCn0cV41NaxTc91kU4IPMjUqbn0qbBPMvRGPU3HN?=
 =?us-ascii?Q?W/Em8OiJqRSCq4IQ4KWF3hMZrxy7ZH77or3tx346DOAGw+R/v/d0hYlbgraY?=
 =?us-ascii?Q?yzKyct/eCD/RsPHyKi4pN3FisY1a0/NyiOg1/AfmBv/vb+aDOlZUvz6ZYxSK?=
 =?us-ascii?Q?VIGmthXvqAt28Ac5IAbbAi+Ei2DksJibdjXchOgZRk4IapscL1wRCTDlJsMN?=
 =?us-ascii?Q?DvooWrWXeqWfCisdhj94kof6uQsCn7/4lGUkV4kcpWVZaL2bjHg2CSiMdAVE?=
 =?us-ascii?Q?7z7IBuB1PzkvRUkCE7Wv3BDcgtJ7us1x2Dh4xYxYlatvmpljIwTTq8VB70Bs?=
 =?us-ascii?Q?iw/1fFbwI4asZVhsISkreFhrMOMvhHcFfCP3lXBajGTmXb3d5dPMkP2QGmOE?=
 =?us-ascii?Q?lcPnj3jiQDKvMOtJLtsMUl3flwSeTlJNZIN6gSg8fy+vbwShH7EeHXBCxzRO?=
 =?us-ascii?Q?EOBjLtpY0S+AZ4h8fa0VNlAUfnN6d3Zgc6rqPuJ9WGb/olH/xbj8bDEP+OIj?=
 =?us-ascii?Q?xLqwGlQG7tdKB7fZi5wqzzYGaD505Sv+g6bx+Jbz0eovDwJsblh+HqlHLHYQ?=
 =?us-ascii?Q?4Nm1LNSXQjPuo/DQ8/QLbNMfLPLzVGETk8PWEG9f2p70ZXqXadm68eDeUaPx?=
 =?us-ascii?Q?vZEYnfI7KQK1xb++jYUAt+SdVtBtN65M+DmnDkBBSQoZkwwonYbetv2xdIwI?=
 =?us-ascii?Q?0QFRTqH539lzzlm4IE67Pbruc6zFrD6cco/KNDdaJ2zXCHuyERazpe8ZUe4o?=
 =?us-ascii?Q?pOSwTX3Mbu3s7yPIL+kTA1zd/POieG12hoA0+jIM/njWlAAfVedJnvyB1O6o?=
 =?us-ascii?Q?LMG440mzC0TzUaIPBbYM9GameOsoMbS5hKPLxqhMI9NDw+XILri05r2VO0kF?=
 =?us-ascii?Q?PlYkSXVwD90zgjXXeMpp4BOgXI0tgIK0zcWKSO0H/YbASEesahglvRt41b/V?=
 =?us-ascii?Q?hE0emADtdtn3kOvSpYODJhznLok0itp5MujIeCTpcz3BrYXjmLnotQqPPi2b?=
 =?us-ascii?Q?B2ONpRmeeRyBY8naAeIUW1VWFSvtNTB7Rb65jC7qC575kNq2yvMA3hJq/jg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90674f13-7ae7-4cae-7aa2-08dbc9b03957
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:44:52.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR01MB3962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_094508_077132_25B2DD87 
X-CRM114-Status: GOOD (  12.81  )
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

Commit 4bc31edebde5 ("mmc: core: Set HS clock speed before sending
HS CMD13") set HS clock (52MHz) before switching to HS mode. For this
freq, FCLK_DIV5 will be selected and div value is 10 (reg value is 9).
Then we set rx_clk_phase to 11 or 15 which is out of range and make
hardware frozen. After we send command request, no irq will be
interrupted and the mmc driver will keep to wait for request finished,
even durning rebooting.

So let's set it to Phase 90 which should work in most cases. Then let
meson_mx_sdhc_execute_tuning() to find the accurate value for data
transfer.

If this doesn't work, maybe need to define a factor in dts.

Fixes: e4bf1b0970ef ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
Changes since v1:
  Use Phase 90 instand of value 1

 drivers/mmc/host/meson-mx-sdhc-mmc.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index 97168cdfa8e9..29698fceb89c 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -269,7 +269,7 @@ static int meson_mx_sdhc_enable_clks(struct mmc_host *mmc)
 static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
-	u32 rx_clk_phase;
+	u32 val, rx_clk_phase;
 	int ret;
 
 	meson_mx_sdhc_disable_clks(mmc);
@@ -290,27 +290,11 @@ static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
 		mmc->actual_clock = clk_get_rate(host->sd_clk);
 
 		/*
-		 * according to Amlogic the following latching points are
-		 * selected with empirical values, there is no (known) formula
-		 * to calculate these.
+		 * Phase 90 should work in most cases. For data transmission,
+		 * meson_mx_sdhc_execute_tuning() will find a accurate value
 		 */
-		if (mmc->actual_clock > 100000000) {
-			rx_clk_phase = 1;
-		} else if (mmc->actual_clock > 45000000) {
-			if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
-				rx_clk_phase = 15;
-			else
-				rx_clk_phase = 11;
-		} else if (mmc->actual_clock >= 25000000) {
-			rx_clk_phase = 15;
-		} else if (mmc->actual_clock > 5000000) {
-			rx_clk_phase = 23;
-		} else if (mmc->actual_clock > 1000000) {
-			rx_clk_phase = 55;
-		} else {
-			rx_clk_phase = 1061;
-		}
-
+		regmap_read(host->regmap, MESON_SDHC_CLKC, &val);
+		rx_clk_phase = FIELD_GET(MESON_SDHC_CLKC_CLK_DIV, val) / 4;
 		regmap_update_bits(host->regmap, MESON_SDHC_CLK2,
 				   MESON_SDHC_CLK2_RX_CLK_PHASE,
 				   FIELD_PREP(MESON_SDHC_CLK2_RX_CLK_PHASE,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
