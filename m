Return-Path: <SRS0=gULv=G5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFACC433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 07:35:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8300E22B51
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 07:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8300E22B51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4hmthdtso5+roSeh9SA30Z7JtDJzbflepXo5JdlRTk=; b=I9xA9hm5Y+Movvew1lQ+I1bRSp
	tb488f5pwm1KVVNR4+3akf9UqdcjJmR2uJbgUBWTODF9E4QvdMRRC8AJjtkO76Z7rOolSU8/ZFY0U
	+++GQ/THjYrGXLyuV80ynMM/wmXod7Mk9cYpD/ox2Euq3BKWL5nZyj3w+OCLq8REgrltKKJ4A+d4A
	VFtUX5WPB7nG1DkcQylan9jME1kty73JYclRu9QndctZAXylZLFoIgguvEJkSqO4BZ1MZIVuPTkyP
	G81VZgobqmsN4JeU+0AHAU6fE64Y3ovZHNbwD7lUaTcG7nSWJRVff+NzmffAx7lt1rylVVYo1sIYB
	Bh+DQ0Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Isg-0002x5-S9; Tue, 26 Jan 2021 07:35:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Ise-0002vf-Ee; Tue, 26 Jan 2021 07:35:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 121D9230FE;
 Tue, 26 Jan 2021 07:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611646515;
 bh=+VAs2ymsR3wvwxQFkon4/lt3ON1FUNprV+UepWushio=;
 h=From:To:Cc:Subject:Date:From;
 b=DH2Lp/8Ef0k9WGN0ll9FmubItN0Z4unrWnNQS2pyl2CUBL7o4QsLZbVTFfKsobAFJ
 rqis4X+XbAgqsLOIi2xs0N9LOezi8R1B3MJRlaAf+t5K7louVm5tILOwBOPekx54Dp
 gxGYVH9sPqyKT9rTqpWuBYCY/4Ml/MC0cOYw5dSCTJwQMG0iNcMSQJWPiMJQGz01Ki
 A22EreErsNsWRT1n182mAs2KUT0HFIOn49DPq47GwhpEw133zKoi2C3eSrEIDvRSro
 yals0i+X72Z5A+lrvA7iUlU3O1m7Ebf/8Fx9SxxtUcGSuay+HFsCn+KXGiyEhuM4Q0
 ot6GUJlxXOVnw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1l4Isa-00BqrJ-FX; Tue, 26 Jan 2021 08:35:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH RFC 0/2] Convert designware-pcie and kirin-pcie to yaml
Date: Tue, 26 Jan 2021 08:35:05 +0100
Message-Id: <cover.1611645945.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_023516_606312_62F7BB61 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 devicetree@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob,

As I'm preparing some upstream patches for kirin-pcie driver to support
Hikey 970, I opted to try first to convert the existing schema to yaml.

It should be noticed that those two patches currently won't pass
cleanly with dtbs_check/dt_binding_check.

I'm out of ideas about how to fix. It sounds to me that the checking
tools are trying to enforce different types of reference types than
the ones used by designware drivers.:

$ make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/pci/designware,pcie.yaml dt_binding_check
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pci/designware,pcie.example.dts
  CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
  DTC     Documentation/devicetree/bindings/pci/designware,pcie.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/pci/designware,pcie.example.dt.yaml


		[[2164260864, 0, 0, 3724541952, 0, 65536, 2181038080, 0, 3493855232, 3493855232, 0, 218103808]] is not of type 'boolean'
		True was expected
		[[2164260864, 0, 0, 3724541952, 0, 65536, 2181038080, 0, 3493855232, 3493855232, 0, 218103808]] is not of type 'null'
	[2164260864, 0, 0, 3724541952, 0, 65536, 2181038080, 0, 3493855232, 3493855232, 0, 218103808] is too long
	From schema: /home/mchehab/.local/lib/python3.9/site-packages/dtschema/schemas/pci/pci-bus.yaml

$ make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml dt_binding_check
  DTEX    Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dts
  DTC     Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml
/devel/v4l/hikey970/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: 'reset-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /devel/v4l/hikey970/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
/devel/v4l/hikey970/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.example.dt.yaml: pcie@f4000000: '#interrupt-cells', 'bus-range', 'clock-names', 'clocks', 'device_type', 'interrupt-map', 'interrupt-map-mask', 'num-lanes', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /devel/v4l/hikey970/Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml

I ran out of ideas about how to solve that. So, I'm posting it as a RFC.

Mauro Carvalho Chehab (2):
  dt: pci: designware-pcie.txt: convert it to yaml
  dt: pci: kirin-pcie.txt: convert it to yaml

 .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
 .../bindings/pci/designware,pcie.yaml         | 194 ++++++++++++++++++
 .../bindings/pci/designware-pcie.txt          |  77 -------
 .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
 .../bindings/pci/hisilicon,kirin-pcie.yaml    |  98 +++++++++
 .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
 .../bindings/pci/hisilicon-pcie.txt           |   2 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |  50 -----
 .../bindings/pci/layerscape-pci.txt           |   2 +-
 .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
 .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
 .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
 .../bindings/pci/samsung,exynos5440-pcie.txt  |   4 +-
 .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
 .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
 MAINTAINERS                                   |   4 +-
 20 files changed, 323 insertions(+), 158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/designware,pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/hisilicon,kirin-pcie.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/kirin-pcie.txt

-- 
2.29.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
