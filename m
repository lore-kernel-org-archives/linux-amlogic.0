Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A33C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BDSYiwcnYSvB2INoSzo4GIwPlEYDbBS37NBhgAW4WE=; b=fBrpkdAy/z4qgG
	t/we/moK2wvuqL0EFEqxa/dQMGUAvjWOfqflGBYwWrkVzGVH/n/SqPWfSoVFI+mn/ilWUWR68z/s/
	RblY33TibG3EBCErQ18WLWwuEq9xek6JEImL8oKAuAqMFB/xwqTIju4YsSu5M3DrfQevChLYduLn8
	0o2X6z0we3YH7CuFdARM6DkAmOcSpgrTel0efH6GfZqceAOOC/p2H+CDBItgIvYlXxjMVH+DDUZnC
	gquJIf2/ihmj8YDKeD98NEh8c8Oa+IsCrbzcN8bmRsqw0rWAt7/wyBFzAOVpTxokjOSPG+g0MinYQ
	OXSE2BLZik9j31+kSBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrh4-00CpYn-GF; Fri, 05 Aug 2022 07:24:26 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJrXo-00Cl0l-Co; Fri, 05 Aug 2022 07:14:54 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Fri, 5 Aug 2022
 15:14:37 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH v4 2/4] docs/perf: Add documentation for the Amlogic G12 DDR PMU
Date: Fri, 5 Aug 2022 15:14:24 +0800
Message-ID: <20220805071426.2598818-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_001452_471953_8088B920 
X-CRM114-Status: GOOD (  17.24  )
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

Add a user guide to show how to use DDR PMU to
monitor DDR bandwidth on Amlogic G12 SoC

Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
---
Changes v3 -> v4:
  - No change

Changes v2 -> v3:
  - Rename doc name from aml-ddr-pmu.rst to meson-ddr-pmu.rst

Changes v1 -> v2:
  - Nothing was changed
---
 .../admin-guide/perf/meson-ddr-pmu.rst        | 68 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/meson-ddr-pmu.rst

diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
new file mode 100644
index 000000000000..f8601f3b103e
--- /dev/null
+++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
@@ -0,0 +1,68 @@
+.. SPDX-License-Identifier: GPL-2.0
+===========================================================
+Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
+===========================================================
+
+There is a bandwidth monitor inside the DRAM contorller. The monitor include
+4 channels which can count the read/write request of accessing DRAM individually.
+It can be helpful to show if the performance bottleneck is on DDR bandwidth.
+
+Currently, this driver supports the following 5 Perf events:
+
+aml_ddr_bw/total_rw_bytes/
+aml_ddr_bw/chan_1_rw_bytes/
+aml_ddr_bw/chan_2_rw_bytes/
+aml_ddr_bw/chan_3_rw_bytes/
+aml_ddr_bw/chan_4_rw_bytes/
+
+aml_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are the channel related events.
+Each channel support using keywords as filter, which can let the channel
+to monitor the individual IP module in SoC.
+
+The following keywords are the filter:
+
+arm             - DDR access request from CPU
+vpu_read1       - DDR access request from OSD + VPP read
+gpu             - DDR access request from 3D GPU
+pcie            - DDR access request from PCIe controller
+hdcp            - DDR access request from HDCP controller
+hevc_front      - DDR access request from HEVC codec front end
+usb3_0          - DDR access request from USB3.0 controller
+hevc_back       - DDR access request from HEVC codec back end
+h265enc         - DDR access request from HEVC encoder
+vpu_read2       - DDR access request from DI read
+vpu_write1      - DDR access request from VDIN write
+vpu_write2      - DDR access request from di write
+vdec            - DDR access request from legacy codec video decoder
+hcodec          - DDR access request from H264 encoder
+ge2d            - DDR access request from ge2d
+spicc1          - DDR access request from SPI controller 1
+usb0            - DDR access request from USB2.0 controller 0
+dma             - DDR access request from system DMA controller 1
+arb0            - DDR access request from arb0
+sd_emmc_b       - DDR access request from SD eMMC b controller
+usb1            - DDR access request from USB2.0 controller 1
+audio           - DDR access request from Audio module
+sd_emmc_c       - DDR access request from SD eMMC c controller
+spicc2          - DDR access request from SPI controller 2
+ethernet        - DDR access request from Ethernet controller
+
+The following command is to show the total DDR bandwidth:
+
+    .. code-block::bash
+
+        perf stat -a -e aml_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
+
+This command will print the total DDR bandwidth per second.
+
+The following commands are to show how to use filter parameters:
+
+    .. code-block::bash
+
+        perf stat -a -e aml_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
+        perf stat -a -e aml_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
+        perf stat -a -e aml_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
+
+The 1st command show how to use channel 1 to monitor the DDR bandwidth from ARM.
+The 2nd command show using channel 2 to get the DDR bandwidth of GPU.
+The 3rd command show using channel 3 to monitor the sum of ARM and GPU.
diff --git a/MAINTAINERS b/MAINTAINERS
index ac8a98dfbacc..8ee68e699e6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1054,6 +1054,7 @@ AMLOGIC DDR PMU DRIVER
 M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
 S:	Supported
 W:	http://www.amlogic.com
+F:	Documentation/admin-guide/perf/meson-ddr-pmu.rst
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
