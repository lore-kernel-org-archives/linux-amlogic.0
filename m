Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E650CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Nov 2025 04:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=221c1O02Q0qgdsweJElGr0VB1VXFPhd4qKRV3VPWjhk=; b=TKzEhBDbrcrjuq
	TCAst/J3pDam9VdsUSa2xMkmGsBae+bwMFy9nCJ/FWOEe+LdBGNpI2x/9sBNAV1O7Tapv3utsICtl
	WR+rufXL5/a32EqPzJoumauuRnCckO/PlyOlvBT6MuGWv6HSaSWHbpgmZfgR2aCRg9cfpxpIyVvm5
	BwJpkXtXiAexdEWrBa6x3lCLAzt15N9WFU4aEy65PgZMEwOkpK9pEVqw28wTQg3NdLiX9H0Si3vNt
	FB/Mpcdk1x/yqQirlnYnKzVjr82EDmUsaAg1s/iPKbmcxsrgCtV0Rtpf9uOTEmkddb+TqjeRDobN9
	MNmeROYMkl0tjFotJUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Fy-0000000747U-0nRc;
	Sat, 01 Nov 2025 04:30:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF3Ft-0000000745E-29rG
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Nov 2025 04:30:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A13kiRl559501
	for <linux-amlogic@lists.infradead.org>; Sat, 1 Nov 2025 04:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=; b=RecnS/G3GBUtr5sn
	0pgi0zH4N0oEH5hRWMkSNXc/6hZzq5ceyfpRNFy7Nt3gTjsVNCYb4uAFFxZZkkzU
	o3vUIkg6nZ3oxH9EIgBrYqKEAaOJbkaRquqZgeFNSNvweh7dWRkJBqcJDl1DJ3V3
	5qw+dTA0Hx2N/wrctsew1WbkBVhWpcg1oLhX17KmPwXugMUvr+bpYiD/ZgOQ8x32
	0AKKl/88Ju94SEkZ/xaSqWhzWd/e2GF78B/06lRImmUY3OXRNO5a8ce7j2VXBDw5
	SZSDZGRUJ4UE3vsCoWtgfsdwA+hMyGEZ2aDsBaLaRkDmmbWtfszTkaEqklbGvYvD
	/vfZ5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8g1tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 01 Nov 2025 04:30:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2955555f73dso3090685ad.0
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Oct 2025 21:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761971416; x=1762576216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=;
        b=TD/qice6k681RNy7DXMz6wAMNc2JrjwrGGkGOnM264OZZkcBznC1xbj24ovVbjRo4/
         G+d0EiSqzdKAWIIo77a16DoamX/RXAxBZ0Jv4ANN+t99C8HKXSdc2S7WsQ0YYLcNs5pX
         Rdh7JCEkPSKTX4y1wi8ROIkLsuRTg/FJT5EtpWar0ceKPVn7dphfPBFLO5MLO7snJgTp
         jGQ1yoaVkXch2y7H03YmuvWe9+GknbAM09kjjXBnFBoI0vKp1B/067Nj+GnvMDXRkJ7N
         qUzVQRSqUbu0GCk3HVWemWtbExR3DfvbQaWyQacPPM1k0b1KV7GAz1pBYX16c46A+PC7
         1T0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971416; x=1762576216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qVs9Q8bbIIjhgXIhLzUmZHcUu/XIpCZrPOB7b/VeVM=;
        b=fFkk0J7OrNLzYjb+bz2NyHkqP8v/i3d/pO4e2o+k0WkvmzI4U4xC4w/Jgk8BfLO07B
         /1CCqQw4Ra0sySHTZEd42eHSOCTjoN+m8I9LXbVi849OePsbd7ThyVf0bi6tWengqNi1
         PegCr+I2ozuTEV2W33vN+EQENQQ3dSo5xF52yX9XuSC0/JJ7jy13STtYkDCVW8aBKOqF
         MVX/MkWe+KCnF+DlAZgSS5qW6g+jQyO/t8Bi3Jz+nAJK1+vh4swX+0pa2gvMOHRH2GR5
         ZKtDRxTrH7NK7TEbjX8KWkX0OQd/qA2avLkOfSCmJw5iAdQ4TWEUHzXQsJpeZiQqrG1S
         fLgw==
X-Forwarded-Encrypted: i=1; AJvYcCU8XZyitEGWZ3j/e7WA8ijAeBrmsWF8irzV5U8pU8hp644l3EgM9GNBazMr+A8QkLuKuRha6uQPXlQlY1+L@lists.infradead.org
X-Gm-Message-State: AOJu0Yz993gnhT9yrgYdFZU64enPwsK4WHrz7TtwPA4zSkGTkbcLaQZ4
	W5ho/fBaeAaPbo0J94Sz5YxjniXJCkfD6lTY5p+Uww6DBsByH2H+CXF+m1rzhEcpaflZd3RiVaU
	TgKlA54P1JZEgCG418d/IlxJQIGU9U6x4JpGzcRytaySy33Np9MIFrTVfiINFLHEGKc3PknXB1X
	IAFMC3TA==
X-Gm-Gg: ASbGncuZeDMIPb65tweJU823g0b6MLskR5jgsvZSuqnGcu//bQM10WYHLci3usbA/jg
	4A/7WOYDoDndkAmw6hnl+4yD4KbAZdHPgON6gHli5/DqKuA4A+H0sFxwP/WM6ea8T7VXHoEI1/w
	zDwweYlatFCd+QhxPjG5U31t0zkCjNWT99MKhSEVRUg/ws39h0cjzkKuZEz+dGqDrTZ0x9UZLeg
	gDiuLRzFpXsWps9DckloafxFbVCf8U1DRw96YqecP2W0n8PKsqM/0KesZ1CI3uF9OqDT/KDqA3+
	L0dVXNRmux9TIrOsX5y91iAa9H0sl7Yph418fBKn29d3srnfGRWelaaqvga+3ClYR0/MABItTp/
	nBlME2QOqJ7W9eyk7a8fvP6Uh
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2952c8e96d9mr46357415ad.31.1761971415811;
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERXDukIavO9PR4//phPyGJduf0lbjAG/4vEikdn++zQ0+zjHP/5yiGYQHVqvMFXMVQNa2R6A==
X-Received: by 2002:a17:902:dac7:b0:295:2c8e:8e50 with SMTP id d9443c01a7336-2952c8e96d9mr46356885ad.31.1761971415224;
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
Received: from work.lan ([2409:4091:a0f4:6806:9857:f290:6ecf:344f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm42273285ad.2.2025.10.31.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:30:15 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:59:42 +0530
Subject: [PATCH RESEND 3/3] PCI: meson: Fix parsing the DBI register region
MIME-Version: 1.0
Message-Id: <20251101-pci-meson-fix-v1-3-c50dcc56ed6a@oss.qualcomm.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3414;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=z6Ma1tu8vEZQke3NjkVPJHb01xM4bsdEHhx7cBiREVQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpBYy++GDC2FdF4Z/6/YuKrqvsPRDzSYzArhNo/
 +csT538cMWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQWMvgAKCRBVnxHm/pHO
 9Wl9B/4lJRWgp4jLVDF1SYqDPGUDzcb472y2yeMmk2rkFfb2Uv1hlk/XcpOEfQgBpX/u8ZpXBEq
 T7H5Bx2EFq4Soc4HdtjIYaui17kadQmI7NRJFmmxhC1xko8FftZXxZfEtoP7KnqUP81m2N60jRI
 lMArC53Nmr1Sf+hjpHeorOGbMovA2mC7P2H7k9M4hLM015Lj6soWc5ViRjg3fdJyHkz/sZ9YvNN
 uoQp8w6yVTVJW+fZ5JSvDDRb/4HVStZmmu0VCObZK3EqVhOq8mGy7HXd5724d3JaWSl+0Ldj3N6
 zW3Xk0bmCRmxWBjbPLOoTUS+M5L+oB3GOZ2L9kk3WUiDVkYR
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Proofpoint-ORIG-GUID: -nrkL_oEViiw_sMFNpNZrYsX3ssHui1J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzNSBTYWx0ZWRfX+lfavvo5/tMJ
 P8Lr7BWoNp+TxbFi3Nha7uw2DDWmI4x3B/hRHm1Mypvi+vjG5a2uD3Ps2+wg66FBfS8SVf0hVz0
 dD6zpbA2Ijl3I0z7fDGTaoaOMDW2W4t8tV7pfQaBbft/D5AONW4aaeCgKDxSPP+cvVbjfZGPOJ+
 2ETQ+boVgxjSZ6hfdBedYJntV8M7pUdMx6G3ytPh5avLvtjPuswRl4mvFv/d+jA7bVbJJAnUcR5
 Ft2q18WGPTPNtWJlbdOoOBLHOa36HCJRkhsHJorTH+7FK+a03q6N6Ifq1Vg8py24qu3Zb1k8rzZ
 96GyOwf9dEf3Zl7vTh3ZJRqpQXd2rlfG+VZgFIZ5GnU/M5VSYwv6jH5f4boUrdADgbubpStINSI
 06lVD+28LgQDbsM0LM5JH8ktofB5ag==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69058cdc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=Zk3OmFfbAAAA:8 a=EUspDBNiAAAA:8
 a=szRsftEmMXlY6Mt0pVQA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: -nrkL_oEViiw_sMFNpNZrYsX3ssHui1J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_213021_695009_FE579BB5 
X-CRM114-Status: GOOD (  19.35  )
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

First of all, the driver was parsing the 'dbi' register region as 'elbi'.
This was due to DT mistakenly passing 'dbi' as 'elbi'. Since the DT is
now fixed to supply 'dbi' region, this driver can rely on the DWC core
driver to parse and map it.

However, to support the old DTs, if the 'elbi' region is found in DT, parse
and map the region as both 'dw_pcie::elbi_base' as 'dw_pcie::dbi_base'.
This will allow the driver to work with both broken and fixed DTs.

Also, skip parsing the 'elbi' region in DWC core if 'pci->elbi_base' was
already populated.

Cc: <stable@vger.kernel.org> # 6.2
Reported-by: Linnaea Lavia <linnaea-von-lavia@live.com>
Closes: https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
Fixes: 9c0ef6d34fdb ("PCI: amlogic: Add the Amlogic Meson PCIe controller driver")
Fixes: c96992a24bec ("PCI: dwc: Add support for ELBI resource mapping")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-meson.c       | 18 +++++++++++++++---
 drivers/pci/controller/dwc/pcie-designware.c | 12 +++++++-----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 787469d1b396d4c7b3e28edfe276b7b997fb8aee..54b6a4196f1767a3c14c6c901bfee3505588134c 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -108,10 +108,22 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 			       struct meson_pcie *mp)
 {
 	struct dw_pcie *pci = &mp->pci;
+	struct resource *res;
 
-	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
-	if (IS_ERR(pci->dbi_base))
-		return PTR_ERR(pci->dbi_base);
+	/*
+	 * For the broken DTs that supply 'dbi' as 'elbi', parse the 'elbi'
+	 * region and assign it to both 'pci->elbi_base' and 'pci->dbi_space' so
+	 * that the DWC core can skip parsing both regions.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+	if (res) {
+		pci->elbi_base = devm_pci_remap_cfg_resource(pci->dev, res);
+		if (IS_ERR(pci->elbi_base))
+			return PTR_ERR(pci->elbi_base);
+
+		pci->dbi_base = pci->elbi_base;
+		pci->dbi_phys_addr = res->start;
+	}
 
 	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR(mp->cfg_base))
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c644216995f69cbf065e61a0392bf1e5e32cf56e..06eca858eb1b3c7a8a833df6616febcdbe854850 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -168,11 +168,13 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
 	}
 
 	/* ELBI is an optional resource */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
-	if (res) {
-		pci->elbi_base = devm_ioremap_resource(pci->dev, res);
-		if (IS_ERR(pci->elbi_base))
-			return PTR_ERR(pci->elbi_base);
+	if (!pci->elbi_base) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+		if (res) {
+			pci->elbi_base = devm_ioremap_resource(pci->dev, res);
+			if (IS_ERR(pci->elbi_base))
+				return PTR_ERR(pci->elbi_base);
+		}
 	}
 
 	/* LLDD is supposed to manually switch the clocks and resets state */

-- 
2.48.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
