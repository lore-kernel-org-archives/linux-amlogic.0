Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78764C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c+t7tMxKE+EGB/RvGJZAhiYvMkVem0pYcqbQag2g0ik=; b=a8/pOZQvbke3+N
	haqwa/zZ8yW4mqN9NjtWuXVvN9K0ndsXQCH6Qy5DiVO/dtf7HXodDkuvrQxeasnbpBAbHZzgxLzV3
	vSshr/QmKHlNMks1/PchzZXVb+965J0rBJycSQAXMbS2o1MztIR3/6OdLeF3KjVAz2JBuqvaIsUuB
	RDI2w3gLFg4wcMgfA/kLUY4wFTPU328BcJPE3NEyyjid1xMvjnsqAlz20hbEKXuRS5bmX+tqrw7/t
	Xs9uTXxdKcOZTvaP/tG4sJE0LHxW+E/w9gh8FKFtUOehrGpDQW7IXVhQ3obAwEMlJn0UEDZftpKln
	4JgbqFVlRQqzbL5GcO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaOi-00Bfw7-Jx; Thu, 17 Nov 2022 08:37:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovaOa-00Bfnp-7I; Thu, 17 Nov 2022 08:37:17 +0000
Received: from droid01-xa.amlogic.com (10.88.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 17 Nov 2022
 16:37:13 +0800
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
To: Jonathan Corbet <corbet@lwn.net>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Jianxin Pan <jianxin.pan@amlogic.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Chris Healy <healych@amazon.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v11 2/3] docs/perf: Add documentation for the Amlogic G12 DDR PMU
Date: Thu, 17 Nov 2022 16:34:16 +0800
Message-ID: <20221117083419.2084264-2-jiucheng.xu@amlogic.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117083419.2084264-1-jiucheng.xu@amlogic.com>
References: <20221117083419.2084264-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.88.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_003716_298437_432B42D4 
X-CRM114-Status: GOOD (  14.90  )
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
Reviewed-by: Chris Healy <healych@amazon.com>
---
Changes v10 -> v11:
  - Reword perf documentation

Changes v9 -> v10:
  - Rebase code
  - Add "Reviewed-by" tag

Changes v8 -> v9:
  - No change

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
index 793e1970bc05..c767e03e4d34 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -19,3 +19,4 @@ Performance monitor support
    arm_dsu_pmu
    thunderx2-pmu
    alibaba_pmu
+   meson-ddr-pmu
diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
new file mode 100644
index 000000000000..8e71be1d6346
--- /dev/null
+++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================================================
+Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
+===========================================================
+
+The Amlogic Meson G12 SoC contains a bandwidth monitor inside DRAM controller.
+The monitor includes 4 channels. Each channel can count the request accessing
+DRAM. The channel can count up to 3 AXI port simultaneously. It can be helpful
+to show if the performance bottleneck is on DDR bandwidth.
+
+Currently, this driver supports the following 5 perf events:
+
++ meson_ddr_bw/total_rw_bytes/
++ meson_ddr_bw/chan_1_rw_bytes/
++ meson_ddr_bw/chan_2_rw_bytes/
++ meson_ddr_bw/chan_3_rw_bytes/
++ meson_ddr_bw/chan_4_rw_bytes/
+
+meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are channel-specific events.
+Each channel support filtering, which can let the channel to monitor
+individual IP module in SoC.
+
+Below are DDR access request event filter keywords:
+
++ arm             - from CPU
++ vpu_read1       - from OSD + VPP read
++ gpu             - from 3D GPU
++ pcie            - from PCIe controller
++ hdcp            - from HDCP controller
++ hevc_front      - from HEVC codec front end
++ usb3_0          - from USB3.0 controller
++ hevc_back       - from HEVC codec back end
++ h265enc         - from HEVC encoder
++ vpu_read2       - from DI read
++ vpu_write1      - from VDIN write
++ vpu_write2      - from di write
++ vdec            - from legacy codec video decoder
++ hcodec          - from H264 encoder
++ ge2d            - from ge2d
++ spicc1          - from SPI controller 1
++ usb0            - from USB2.0 controller 0
++ dma             - from system DMA controller 1
++ arb0            - from arb0
++ sd_emmc_b       - from SD eMMC b controller
++ usb1            - from USB2.0 controller 1
++ audio           - from Audio module
++ sd_emmc_c       - from SD eMMC c controller
++ spicc2          - from SPI controller 2
++ ethernet        - from Ethernet controller
+
+
+Examples:
+
+  + Show the total DDR bandwidth per seconds:
+
+    .. code-block:: bash
+
+       perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
+
+
+  + Show individual DDR bandwidth from CPU and GPU respectively, as well as
+    sum of them:
+
+    .. code-block:: bash
+
+       perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
+       perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
+       perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 415eaa30c523..b76c4deddf22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1098,6 +1098,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
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
