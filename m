Return-Path: <SRS0=faxg=3M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C19AC35240
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jan 2020 23:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2734D218AC
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jan 2020 23:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DPGOf+OA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2734D218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D5fl8IYT8HRz3bsaDT98hFDsjhsFIuWHD9NdbLKJc7E=; b=DPGOf+OA8HV1sC
	ouJIA3QsPnEjLXt0bCO5EztA838K280DhBVCWQ0L6DKP6apneHxoq4rOTnVE8s8KtJ9tZIowgsyHT
	rucHuYdOA6qOeSS5TSbyWHmtzSI1EuBqxjRxHkTYzGdYdv/VVuu89d4kH0FcSQK09YpdOfIunip1K
	LhRTIoenc0pHdmzdnrLF0wfG87GKf2ooPCNnA4RsGyN6SrfZ5uGsLngaL3WZ23bKjcNVDlUg1xVZh
	7FnGWTUldbwCdrTe6J2Py8AXViIbLqV8W9778r8c22uCJL4ja7GkzX7CPo7HzMEy3HOScDMaAIWK5
	srAor1/ZVPActAKB0KYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iulnc-00024C-6Y; Thu, 23 Jan 2020 23:22:08 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iulnY-00023o-W9
 for linux-amlogic@lists.infradead.org; Thu, 23 Jan 2020 23:22:06 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5ED7E240002;
 Thu, 23 Jan 2020 23:21:49 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 0/7] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
Date: Fri, 24 Jan 2020 00:29:36 +0100
Message-Id: <20200123232943.10229-1-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_152205_173672_F0F3ADDB 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

PCIe device probing failures have been seen on AXG platforms and were
due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
in MIPI's PHY registers solved the problem. This bit controls band gap
reference.

As discussed here [1] one of these shared MIPI/PCIE analog PHY register
bits was implemented in the clock driver as CLKID_MIPI_ENABLE. This adds
a PHY driver to control this bit instead, as well as setting the band
gap one in order to get reliable PCIE communication.

While at it add another PHY driver to control PCIE only PHY registers,
making AXG code more similar to G12A platform thus allowing to remove
some specific platform handling in pci-meson driver.

Please note that CLKID_MIPI_ENABLE removable will be done in a different
serie.

Changes since v5:
 - Add additionalProperties in device tree binding documentation
 - Make analog PHY required

Changes since v4:
 - Rename the shared MIPI/PCIe PHY to analog
 - Chain the MIPI/PCIe PHY to the PCIe one

Changes since v3:
 - Go back to the shared MIPI/PCIe phy driver solution from v2
 - Remove syscon usage
 - Add all dt-bindings documentation

Changes since v2:
 - Remove shared MIPI/PCIE device driver and use syscon to access register
   in PCIE only driver instead
 - Include devicetree documentation

Changes sinve v1:
 - Move HHI_MIPI_CNTL0 bit control in its own PHY driver
 - Add a PHY driver for PCIE_PHY registers
 - Modify pci-meson.c to make use of both PHYs and remove specific
   handling for AXG and G12A

[1] https://lkml.org/lkml/2019/12/16/119

Remi Pommarel (7):
  dt-bindings: Add AXG PCIE PHY bindings
  dt-bindings: Add AXG shared MIPI/PCIE analog PHY bindings
  dt-bindings: PCI: meson: Update PCIE bindings documentation
  arm64: dts: meson-axg: Add PCIE PHY nodes
  phy: amlogic: Add Amlogic AXG MIPI/PCIE analog PHY Driver
  phy: amlogic: Add Amlogic AXG PCIE PHY Driver
  PCI: amlogic: Use AXG PCIE

 .../bindings/pci/amlogic,meson-pcie.txt       |  22 +-
 .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  35 ++++
 .../bindings/phy/amlogic,meson-axg-pcie.yaml  |  52 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  16 ++
 drivers/pci/controller/dwc/pci-meson.c        | 116 ++---------
 drivers/phy/amlogic/Kconfig                   |  22 ++
 drivers/phy/amlogic/Makefile                  |  12 +-
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 188 +++++++++++++++++
 drivers/phy/amlogic/phy-meson-axg-pcie.c      | 192 ++++++++++++++++++
 9 files changed, 543 insertions(+), 112 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
