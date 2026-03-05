Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FF2EEF30B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C4Lr45WQjINS3JedY+Qyk+hFEWPu3EOmttNEOaRIIEE=; b=qE/Vb6/5qkr81d
	wThGv2TCMczTywIftWHhlwOhJiPh6nQJVPdBDS7h+IKqN5kJ2TS8mu0NXWrCHZnS6lON8rX0bR6ob
	HghLAY132tqo5Inu9U2GB3dI+UzSN8hgrNF63i9f0hIIFV8zxIefccuvURKnVFVpNNfpPO6mZ1DcG
	2/PbXcaHu+SYVa3Y8qkJKqWINr39i6+12v769BNAMgHO2G4HcG9WvmksIlPVout2w+qjqZjnNMn4/
	uWY77Y96ECaYdYZFTKWtAa+lQAzhcxHKTUoaSATB+YmjAsKlqSjBmU3hRLAo/bcZCIMAm38kGVhuH
	wtnjZZqMq7k/vgdGhzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy24v-00000000zoH-2PRh;
	Thu, 05 Mar 2026 06:20:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy24s-00000000zn9-0ES0
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 06:20:56 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251O5EG3665351
	for <linux-amlogic@lists.infradead.org>; Thu, 5 Mar 2026 06:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zvXOPXCbQlaXN8adhJ+Ra5
	kF6Tz5uWjU0aflLiqlQuE=; b=AD5xkbI9PgWUA3qQDSOVYh7+ftEHbxze0S45yF
	v+S+cN46Y+BxytsEZczdxVlWr9L/TsdO4+K/vepzinK0cJAPVrHTVN+S8+YuuQdy
	WTEjkVaAuUpLBbWaTMPOUTJhtwt6R/d5oSDp+Cn+FGw3Zm/gg6cJ0dPqxmgfoqdT
	Jb8aZGJOCkIcTwZuZmmYEzqGb0Y1H7kdK6zbfMGixNnmKYafidNyygRJFWlusOzF
	IUTMHH7XBf0IN6wGRgYXnk9vurPMi8/KV3m1bcsXDxEHG70a9m5AvOQHroZGinxB
	swa3Veeq9QbfhGe/0AYUzFVE6WFjJ1IBZpSJ/gZIuywdh1dA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u0sqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 06:20:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35984b91ffeso4037002a91.1
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 22:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691652; x=1773296452; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=bWY4Oup4aQUeHsDsso9xBkn1a8ZmXbVqIX89MH193QAw9k69fV9m/e7MQ4U3MxQ5Ke
         zjZsKFuqCSBCSUOWS3bF8mUXspasmij/fC7wivJWZrc8/DRIhrhvQdztasFTN/zEsW1l
         1GMi73VMH4ZTW7dcH7k6coJOGHoF2uScN3FK5w9RhlCDRLR5/4gIgd3YygUlAVjY0FoK
         aK17GPtljMhauJUHjirJRqJ86v+OgtU+8b2x60005OpibW4LxtQITPFPdoiWsmXkz7mn
         SoKeurFuWXIe8yR1Fc30rWBr83mBWGTNDVs7U85axzoULTG3q93v1kbqR3pDxscLJjuR
         50eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691652; x=1773296452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvXOPXCbQlaXN8adhJ+Ra5kF6Tz5uWjU0aflLiqlQuE=;
        b=pdKGcHBri2lDa5CBtGLjAi2N4qnANzpEB9xS/F3cSJs1Hgke1wBLGxKZG84w+I4jNd
         +fiwr6/sBni3ucdUSh6qecA2M8Jt8jk4AKHbbDx8LvWXmtRe8AvnZDUk/gC4lv825fX6
         JFNtkeXvh58C7DL+YPAWx2FP42+4B0Q6Nc9LD/QcF19VcPCimThQSabFxcpyzgswie7W
         TxThWhS4gfh4otX+OYw497EyG0IwdaS4ya8Jk/3yuP32zQTjRL3jslth6gE3/UBs/1ES
         8bhrdtbpp/2/lawZ2Ucnl7Eovv/0fRRsqxDACn9/zC43iuabsJuuc53awTFy0ZpfIN8T
         7NIA==
X-Forwarded-Encrypted: i=1; AJvYcCV5MGo7qdFmxKezS3yD+KkbeyDmjweRrR5lBeQsFPWnF9emN8siqG10k3SWxS3OEnGuMfbdChxtcBPa6uZM@lists.infradead.org
X-Gm-Message-State: AOJu0YyBlSfzxagL0C3Y7jb8bZDm2bK2vyeicRtuGCNBO65595uSGHYk
	deVnTzjzMkkWT92EzmlEo59OH2hziv2m07stlMSC3RYKDYFEu/9HumNw9GGzLTq3sOb/msU3IsA
	BTanQP8GlLlYMXTTeIS8U9gMU3uBasPm/dcNBtCflu225jCgqlKR1+ovwWq0ipU4NlUJQSblYBQ
	==
X-Gm-Gg: ATEYQzy/dB1/vsDecaEO6ZoysmacL21r9es1FJ//e4ALg+FyzlaR/ifua6NUWCnOwLF
	FdxN2A8woY/ZuOuoX77inb5PXtRZqWjqwWc6BThL/i2MJNqs/obJjuiCrnVr5OVV33y1V25ojuO
	V7WWNtsJ3RsWjk3rE1fYyMt9XgsRyo9A+BmibN4ojzKTQ1XZG1KWwO9KVmd3e6GrmDjk/NPeSoz
	n4zHzloy3LuJED5ee/p43Y0v1aqPeFYm+ghJT16jwp0XJ7dmX/U8L1bHn1eYqhqLz/CGiSPya7A
	a9UAawpsbX7pHI9sfKiQba+faMnhP92gkdZLc/6ZOZ5iWGeZ/mnpu4Y331gK2kEA113XIWqpife
	GkYY5Vc7h7CWDhofmMAlOjy52Y7V1WGJQMFRmplVhWM2Tyxc=
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234060a91.13.1772691652234;
        Wed, 04 Mar 2026 22:20:52 -0800 (PST)
X-Received: by 2002:a17:90a:c107:b0:359:84a3:1942 with SMTP id 98e67ed59e1d1-359b1c31203mr1234022a91.13.1772691651634;
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d38ab8sm843378a91.1.2026.03.04.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 22:20:51 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Date: Thu, 05 Mar 2026 11:50:35 +0530
Message-Id: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALMgqWkC/32OQU7DMBBFr1J5jSvP2GPirrgHYmFPJtQSbUpcI
 lCVu+OUBSFQNpa+Ne/9f1FFhixF7TYXNciYS+6PNeDdRvE+Hp9F57ZmhQYJDBjdnvUpDpXSoUl
 kWKDpGFS9Pw3S5fer6/Gp5n0u5374uKpHmH+/LABuYRlBG91YpNZyB/dJHvpStq9v8YX7w2Fbn
 9ldQV/bcQ0y+RhicIlc9x9IazABsLecSJB/g/P8Eb8n489mnJud55iErEC6IbBLgV0KbBXYltA
 SExL5W9NnMKxBR0QSvJPQ/DV9mqZP/33nPNYBAAA=
X-Change-ID: 20251010-dt-parser-98b50ce18fc1
To: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Chuanhua Lei <lchuanhua@maxlinear.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772691640; l=2442;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=pEc/tNwHOsDbqggAZEgpmAYE5s4SuUbHuqybzx9zRvo=;
 b=t+bdKd9rpg456k4BQVhND8q7IgX2Q/VxxdegM8QDbAtfYkujEJcMPuMBnFidboo8oaraGHI+l
 fGr4D6tEANDBwAWNqyzdV633zxWT7xdh5IMhQ6/B5lDsMAcYO7jFdNS
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: e50Sp2cYrZeJgWDpVJ1LVHty10kPNhpJ
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a920c5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s_SlZju52n3xP1ZgpLgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: e50Sp2cYrZeJgWDpVJ1LVHty10kPNhpJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NyBTYWx0ZWRfX+BEExDnGuJSh
 /LpwB0HkeM96p9U14uGTjW/Bco/Y6jHwKkP++HLYp73sMZM1BXKaEpnmPcoYw8ByimmjbAlV47Z
 QGHZFUqKhtd+5ZddJhZOj+LYqEp8XlNx0vcddWBdw3Qoo+k1Lbo3YtIH+U+zA8ZkAoHG/fhdb96
 s//fNeuKqKNaPdp1/wnd8B49eOKszBJIZ6q7yGUQxuh6EDHP9nfwMMJ9GuLN0oXmXcu2HrBTDn5
 BATU32FfNgfPl2OnA4znLkhny2MXu4pjNHZz5y2oLcnIMUSfnJ0a48cN+Eb/ejnonPi2D4SVLXh
 U8C4vjMVINe4Xo4IRuX6yQtfrqYrsLCOMfNDCS/PkkPqkDdSJb0TQuykeQk7d/yRy4J4fPhLRno
 cKt0J3noy157hPCRUFcjSCJaS1WK7OJrOmZJ1SFpocTUR61wTQBFn0Vac46pxQ1KeuQlpA7cx4I
 kTxGrNmMOKVJtaBVhsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_222054_104261_304E2D69 
X-CRM114-Status: GOOD (  15.86  )
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

This series adds support for multi-port PCIe controllers in the DesignWare
driver. Currently, the driver only supports a single Root Port with
controller-level properties, which doesn't work for multi-port controllers
where each port may have different configurations.

This series introduces a per-port structure and parsing API that allows 
each Root Port to be configured independently via pcie@N child nodes in
device tree, while maintaining backward compatibility with existing 
single-port bindings.

Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
---
Changes in v2:
- Fix error code preservation in dw_pcie_resume_noirq() to return actual
  error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Mani).
- Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani).
- dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
  failures fatal for now, add TODO comment about making properties
  optional later (Mani).
- Link to v1: https://lore.kernel.org/r/20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com

---
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
 drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
 drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
 drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
 drivers/pci/of.c                                  |   6 +-
 drivers/pci/pci.h                                 |   2 +
 16 files changed, 232 insertions(+), 74 deletions(-)
---
base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
change-id: 20251010-dt-parser-98b50ce18fc1

Best regards,
-- 
Sumit Kumar <sumit.kumar@oss.qualcomm.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
