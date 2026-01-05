Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42531C79F8A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 12:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Kl5R6mG8IljRJfnNdtcUvjLjUnz1G9NZ9EEMffWvt4=; b=OvkxbLu82ht6mj
	V5qBQo3OdPTe/Ax+eIq73q+Y324bioexY0p+dUa/8z2DY0vhOFdB9DHNLLYXhsF7fD7N0wnMI1GjV
	l6psBMMORI2JV8buAwiC7rZOk1Gc+hln9eIem+JoPaV8KcXbYt9zavfqLoWb4jGMeTwi09Ka5rOeT
	Yaz7oMUQtyN5nLFALOilbitRda7wTchuu6za9VVaVKe+VPpIcLFEyEWDJk3feGWUemDx5QVz+wB3u
	01IaecnL50IcZq6HAXi16ZQLYSHnyIlkL/kY0bcvP2MbS+rAcAV51Wv8IOIgvxRYv7cTkqu4k0EY+
	ijvP1ACPn8ofCYxug3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjh1-0000000BHGB-2R1O;
	Mon, 05 Jan 2026 12:28:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjgy-0000000BHEq-2M8E
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 12:28:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60585FWv979470
	for <linux-amlogic@lists.infradead.org>; Mon, 5 Jan 2026 12:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FhnBgqCd894h4xDDyalypD
	S1B5tbKhHsA76XEw2zZxU=; b=QPZyalOnblB4vaPsgrD/LCt8SvD882UV71zW0z
	XdlhiHYZwBkV7qbOm/nIGDNyp1udmWPc/kfJhuFovga4cXZILGzTRMCrnd9sGi9G
	cqpDsVGpjjO6wUbZIegEEwTOGky17bZME8R++zkstSucabaNjDewwvMyAcy5pSbl
	vP8wXu4nQMBeTHu0GeVH9XN8MO07EqDd4LIN3BbaAnE57IAJE/AtaYt4W8e209IB
	OI53NTZVNBTkoU8Yh6A/xWlqDS+Uu6GUT0AfohJ3Cnyv6jz/4hwF37US6bUh6l9y
	qPFVFC2m5lpT/lmtabxI21tm+4/wuCPim44/h0NY6/1++Ifg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftgr33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 12:28:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a31087af17so315766935ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 04:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767616090; x=1768220890; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=CgMkQ6PMxIiZDgNQyHLnNf1hopZND9MjzlSt39XwMe9dPHlyXjeS2t1FBt3i1g6NaH
         UaPgqLVVxeN9MZK9rQ4zIxXRroBOK84Gyhkgu9qGnRpdagJva+MFJZn/enDYDRBhBC8c
         5Op/lpP6f4XFD3czsH/v5ShLjVDuMmOq4p3W18GO0+eoYRcMneqpCXe7Rt6tEKhO4sC5
         SUp9we0Wn3Rlfkr4MKIkKkrtzYfErJZ9LFt4z8mgNgX6ALEeC/nGadyuBJNgpY1Rz/ox
         KgKhzRtlQYtuEuCU6PpuGrltcWOD1/33LQ5GRwQvAYiw7sGEpvHkbuPjAB2pJYXvk526
         ZeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767616090; x=1768220890;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhnBgqCd894h4xDDyalypDS1B5tbKhHsA76XEw2zZxU=;
        b=QQrFmmaYZgBvCHXdyLnE23EWTNts4mvNLVgk99w5C1Bt/FJR8a03xzgTL0qBdT4NGV
         6sZH2I6SXIYbWtRE3KaiBvOSbPRXlkJrnVheWOwM5hkbNy8+ga66ydd3DXAJFDdmT86l
         UDZt46NpkoLXybLn60fm51idxZkSLOoYo0zpr/s8azVd9r1IzFxdu7XDhX3ZCA6n415X
         s9cwMd5+DzqDWUqUR4YbRvDsJQDfgB7Zto23Sb1XiGLkRRqqUNxQ7gdmDSXShnKm+hnH
         3NHhjO38QohYUzT/Jra6axwBorLr11r81KikaAWXykX39QscwwRqTQ5+AqF0izuecz8b
         d69g==
X-Forwarded-Encrypted: i=1; AJvYcCUyh7xJHUR/6Fhl151w74i3BDI3ZEojCN9RZ0PAfUjEtC9O7FYvYl0NH/Wjecqk+AVQDjS9jmpLitt2rcF5@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Uo679Myn/Wj079ZZp/wbG2k5MK+LwDV1shYFJ9UtIosRCGi4
	nNowfIT9zUBnfsW4d4ufa6sF7ZAQNLePn3GBLkqiG9hzpHwv9SxHgEakYulaAAlv3qe7bBC56Zn
	p34OiBoOlyFkzcKEQoMr7zn6C0s96zg4NIslQjVUNV1CKgXRlcfbvOAxskTuNDMbJyLtH4zMB2A
	==
X-Gm-Gg: AY/fxX4fYp307mn7bXbOhwkwL6CHCWb5cF99rDP8pCqDl2PJqgqbcLMRST9GkPZcFFc
	aXMFrDATHG/AqSEn2eTSI+QnCUVbrA+f0A7NSDWlewhKZkZKlYyuRSiQgjMQTydf+xqqSDq5L+o
	HAfeByJ9X/x02Gm5Sf/Rbffn16yqRrFaBfcA/YKoIpaVcT0pppRVl/PFMW7EXQYsRhLhlYm7MH6
	GsKvJCRTpL+xaxh9R6PAP2QBzFKntaWctAyafp72WX8KmDbbI23K1/K7U/B9C8ytmbL78pp6Pk+
	I3hIqQS2up9TPMmDviqnyXb38IejdXzHWh9rX2YdYfZ9bUy1OVVo7BGVUO2GATdj8/s6b9VUbUc
	qAMWZN0gRNBZ9S9s7V54rZ4K3DwiiDDhG6mA=
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391761005ad.58.1767616089411;
        Mon, 05 Jan 2026 04:28:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IET+z4gvln2AUwlbFjFw+MzhBkeuBLY3bqxJej2pC+/8tWtSlxole94SJbnplA8xuBW7zdQcg==
X-Received: by 2002:a17:902:e5ca:b0:29e:bf7b:7f36 with SMTP id d9443c01a7336-2a2f2a41a08mr391760755ad.58.1767616088758;
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
Received: from hu-sumk-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82a10sm448109275ad.26.2026.01.05.04.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:28:08 -0800 (PST)
From: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: [PATCH 0/2] PCI: dwc: Add multi-port controller support
Date: Mon, 05 Jan 2026 17:57:53 +0530
Message-Id: <20260105-dt-parser-v1-0-b11c63cb5e2c@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEmuW2kC/3WOy24DIQxFfyViXSJsMBm66n9UXQDjSZCaTArpq
 FU0/15IF53msbF0LZ9zfRaFc+IinldnkXlKJY2HGuBpJeLOH7YsU1+zQIUECpTsT/Loc6Wk6wK
 pyNANEUS9P2Ye0tfF9fpW8y6V05i/L+oJ2vbXAmAWlgmkkp1G6nUcYBP4ZSxl/fHp3+O436/ra
 O4K2tqO12Ak6513JpAZbsH2xYR/zfhfgE1gbPSBSTOEBwK9FOilQFeB7gk1RUIi++j1Brpr0BA
 RO2vYdfFO8zzPPxbKniedAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767616078; l=1933;
 i=sumit.kumar@oss.qualcomm.com; s=20250409; h=from:subject:message-id;
 bh=oOdjw5Byp9hHCPO/ockAN81t86SXy2F/vEnb3wQ8Fiw=;
 b=WU8lb1IRlgnKDoA9DoKTUmSQTgI6f7zeHzmNW0Tkt7aRJYhehUZTwlR+K5OXYgJ0gdfAFYhjX
 qSneDuM7UF2AaUjsAqusdejjuvDVr2QpTc2oXVQufADAoi3I1PrM2Fo
X-Developer-Key: i=sumit.kumar@oss.qualcomm.com; a=ed25519;
 pk=3cys6srXqLACgA68n7n7KjDeM9JiMK1w6VxzMxr0dnM=
X-Proofpoint-GUID: GY14101GWzPKe3IUEhHUZFovxyPNNcYW
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695bae5a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=k2kXPNx1VYhKFT5-HLMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GY14101GWzPKe3IUEhHUZFovxyPNNcYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOSBTYWx0ZWRfX9O4/AQqUPLpl
 aKBnnPNz0B8kf3YGuciqEoti70bsYn00N1CqjQIR5LuXkEGroSt4CQafzvsNHSCnljn/777ZDTQ
 2O2yzD5m4ALrexhgAKcaisNh4C3rOlPEnu3rO9bTeu2817MoOmS7oIsb70IZeC7cL7DNlZ73xZR
 H9Tl768jRNwouYFhPQq9+apUoCn4z3o7msW7/fdiaWiBvGTZxvRqIQ13/SHmV4ftzJPOuF/KEoo
 +FhXB4N3tp1bJwL1uHwCAJZpu4t0inF+RoYbFfPcpzxJ40bJkmkKSCCcJft0iQPmV2SOeeJ6yX+
 tjTRv/s6X+bH48RH6xvqEL8jSxiUs6eil7Ru6xI9Ijem4E2OB8yk7IoRGVHA5xNl6LZyl8AzVnT
 iUvfqRbsaZnrSoUEGfckbdENpK54SKve9BLiPjp2MIaQlPl8+GGGqiEigOt3Azxy3f4sSy+N6Ae
 grvLS4M9dABEy1olPRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042812_713041_B50E0BB5 
X-CRM114-Status: GOOD (  13.51  )
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
Sumit Kumar (2):
      PCI: API changes for multi-port controller support
      PCI: dwc: Add multi-port controller support

 drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
 drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
 drivers/pci/controller/dwc/pci-meson.c            |   1 -
 drivers/pci/controller/dwc/pcie-designware-host.c | 168 ++++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.c      |  32 ++---
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
 16 files changed, 226 insertions(+), 73 deletions(-)
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
