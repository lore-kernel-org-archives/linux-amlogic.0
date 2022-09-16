Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE31ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Sep 2022 02:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSi8QMAjq8a6FX4q+1hCyYDt0nqhAG56tgzqYn1Q9LE=; b=aqb+71iPnSOdHe
	5a2wxwGUW0321dmQNR083SXcquTeHfs1wiY/EAqwBQuyVccO18DzQ/EWUzvg6z74S/aHnjQdsGtwc
	b3dYheGIdNLCBFzMTTp/3vnEs5cpmtuLlhROq0pqNwLWzlKUWtaw9KqTr753NJDLyemCtJPjT71dX
	IGtIShO82H01ke9OAMaFjN9qvJArLbO5ZAEE34IXvst4UBu5hmJDq4oMzlhKW9yiZzMgeZShN+8fz
	OBKhcvkpH0mw2aUZJ0LlcA6hI4l/SjOR12V/5zx4u9Zi0laT/jFk9Pg+HsvBjjto7YQsr7iwf1wbq
	Ep/z4NbviPAs4pB7SZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ0iQ-004o7h-O9; Fri, 16 Sep 2022 02:04:26 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ0i9-004npB-AC; Fri, 16 Sep 2022 02:04:11 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Fri, 16 Sep 2022
 10:03:27 +0800
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
Subject: [PATCH v8 2/4] docs/perf: Add documentation for the Amlogic G12 DDR PMU
Date: Fri, 16 Sep 2022 10:03:18 +0800
Message-ID: <20220916020320.2455580-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916020320.2455580-1-jiucheng.xu@amlogic.com>
References: <20220916020320.2455580-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_190409_380802_40D7A880 
X-CRM114-Status: GOOD (  16.97  )
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
Changes v7 -> v8:
  - No change

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
index eb63b9cbc149..5ed563368a48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1055,6 +1055,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
 L:	linux-amlogic@lists.infradead.org
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
