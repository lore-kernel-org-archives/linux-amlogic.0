Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B381CC6FA83
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Sep 2022 07:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nl0Q7Ym+YiSXIjItX6pu3MYMis/hK2NxWcEDzJipCrk=; b=2Q5EIrvcRjMjKb
	DtE4w1Mp4LMdql+h83egYVmZaNi73NWIPW72+g5y9xIO06VbmQLnAHtop+zUKUenOkY+Hu0ubidPl
	tQ3EvkfvRHagdm87Qu6chpCA8PS409vK9hF32OKZV0n2BYPr4S70FvIs0u/mvNSI4Yn6Si4A5dnBe
	JaD91PsD8wtMCK97+IAgJ4tV1TCguypWGinJpanpVooxiCjk7fiyd4E4TDznfXl+1EfIieQfDBddc
	FEaCu7ebmgpu5qJ8c6CLtG7Q9M0z3ZcD3p5ERONTvC3C6isHxeSo3+a/b6Rf/HULIY7ctwTxqSeFf
	0318dY0ggQJLJIjpEI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXHCV-00GaIa-SG; Sun, 11 Sep 2022 07:16:19 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXHCD-00Ga4F-DM; Sun, 11 Sep 2022 07:16:03 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Sun, 11 Sep 2022
 15:15:46 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: [PATCH v7 2/4] docs/perf: Add documentation for the Amlogic G12 DDR PMU
Date: Sun, 11 Sep 2022 15:15:17 +0800
Message-ID: <20220911071519.2881258-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220911071519.2881258-1-jiucheng.xu@amlogic.com>
References: <20220911071519.2881258-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_001601_476630_F880A92D 
X-CRM114-Status: GOOD (  16.65  )
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
Changes v6 -> v7:
  - Drop the Reported-by tag
  - Fix spelling error

Changes v5 -> v6:
  - No change

Changes v4 -> v5:
  - Fix building warning

Changes v3 -> v4:
  - No change

Changes v2 -> v3:
  - Rename doc name from aml-ddr-pmu.rst to meson-ddr-pmu.rst

Changes v1 -> v2:
  - Nothing was changed
---
 Documentation/admin-guide/perf/index.rst      |  1 +
 .../admin-guide/perf/meson-ddr-pmu.rst        | 70 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 3 files changed, 72 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/meson-ddr-pmu.rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 69b23f087c05..997a28e156c1 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -17,3 +17,4 @@ Performance monitor support
    xgene-pmu
    arm_dsu_pmu
    thunderx2-pmu
+   meson-ddr-pmu
diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
new file mode 100644
index 000000000000..15e93a751ced
--- /dev/null
+++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================
+Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
+===========================================================
+
+There is a bandwidth monitor inside the DRAM controller. The monitor includes
+4 channels which can count the read/write request of accessing DRAM individually.
+It can be helpful to show if the performance bottleneck is on DDR bandwidth.
+
+Currently, this driver supports the following 5 Perf events:
+
++ meson_ddr_bw/total_rw_bytes/
++ meson_ddr_bw/chan_1_rw_bytes/
++ meson_ddr_bw/chan_2_rw_bytes/
++ meson_ddr_bw/chan_3_rw_bytes/
++ meson_ddr_bw/chan_4_rw_bytes/
+
+meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are the channel related events.
+Each channel support using keywords as filter, which can let the channel
+to monitor the individual IP module in SoC.
+
+The following keywords are the filter:
+
++ arm             - DDR access request from CPU
++ vpu_read1       - DDR access request from OSD + VPP read
++ gpu             - DDR access request from 3D GPU
++ pcie            - DDR access request from PCIe controller
++ hdcp            - DDR access request from HDCP controller
++ hevc_front      - DDR access request from HEVC codec front end
++ usb3_0          - DDR access request from USB3.0 controller
++ hevc_back       - DDR access request from HEVC codec back end
++ h265enc         - DDR access request from HEVC encoder
++ vpu_read2       - DDR access request from DI read
++ vpu_write1      - DDR access request from VDIN write
++ vpu_write2      - DDR access request from di write
++ vdec            - DDR access request from legacy codec video decoder
++ hcodec          - DDR access request from H264 encoder
++ ge2d            - DDR access request from ge2d
++ spicc1          - DDR access request from SPI controller 1
++ usb0            - DDR access request from USB2.0 controller 0
++ dma             - DDR access request from system DMA controller 1
++ arb0            - DDR access request from arb0
++ sd_emmc_b       - DDR access request from SD eMMC b controller
++ usb1            - DDR access request from USB2.0 controller 1
++ audio           - DDR access request from Audio module
++ sd_emmc_c       - DDR access request from SD eMMC c controller
++ spicc2          - DDR access request from SPI controller 2
++ ethernet        - DDR access request from Ethernet controller
+
+
+The following command is to show the total DDR bandwidth:
+
+  .. code-block:: bash
+
+      perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
+
+This command will print the total DDR bandwidth per second.
+
+The following commands are to show how to use filter parameters:
+
+  .. code-block:: bash
+
+      perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
+      perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
+      perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
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
