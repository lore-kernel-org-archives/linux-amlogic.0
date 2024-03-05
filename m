Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E8FC54798
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2024 06:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/+37FjPKTJUfklwPv3ofyTtx9t7WvO1OJbYpJxHtYg=; b=ToxsRxi4+ym/fm
	P0cejJLqWd5KVnrSwqlF4LVLxDUmdweH0IUJatpxqRJdlA0gdufvxiErSbeX+7Ht3RI2iR6rCls9M
	hg4n2ShMpFgQsQQo2wXkOuKa6NbKNkIkaDCuXlfc8bAOpwpUm/odWcyUEKVB04p3kYfWKYJAtSQ4x
	O0f5PSLLmcdNvNtG0pS/5aQAVLd3kCrEq297Ho4+4j1l0MLk2du9Ii5lkNKyjpasnGhmX1wPnb5iS
	VThBvP4G4CUnP9FL/iXL6+zdbHDQppbaojQ95r9uvFemNbb2LcENCZb5EpJjkp8U/oZiyg4XM8unZ
	ZWA5yyScZNqCv05eBLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhOkz-0000000CFg5-2nnA;
	Tue, 05 Mar 2024 06:58:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhOkw-0000000CFfP-09I6;
	Tue, 05 Mar 2024 06:58:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4254kG67010647;
	Tue, 5 Mar 2024 06:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=gK3b0IT3wiu25dWPzQzhc0q9hQdh5h0QM5PIZNTwpzk=; b=pg
	JM33lWTHpDRZyblwaKdWmYc4BKhdBFmkT+W4uXFJ41HPNgJ0KMbQWZjPQ5Ns3UCJ
	EXFzjJXdNLwkMKXeU+RtSbBEg0GNSWv7g44G9Wnyynxcty6x47wSIXrBzJkvhLp/
	iVgkyCQZVugCqsp2ufMLIfQXNd96ZqmT+dEluFFnoKGA0cVAy/nOfneFWXkPP9/n
	R3vpAWjT+xRrWN07jQAhW8upIxbSjtI/pj+W0LzacavxFAzIORikAi537NZpnNAu
	2SMkqnc3jEvswar4LLmPS0BdnuqSWzYMB0U92p8pEzNAgwqmFUSukxOeFT2HZoLu
	ZbcoTOClIWCUo8IdBbyg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wnn34937n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 06:58:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4256wPc8009040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Mar 2024 06:58:25 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Mar 2024 22:58:22 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>
CC: <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [PATCH] nvmem: meson-mx-efuse: Remove nvmem_device from efuse struct
Date: Tue, 5 Mar 2024 12:28:08 +0530
Message-ID: <1709621888-3173-1-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TEbPkxtb-smm8XtIyMUxAIr63JFkxxBd
X-Proofpoint-ORIG-GUID: TEbPkxtb-smm8XtIyMUxAIr63JFkxxBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-05_04,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_225830_105925_4DD244E3 
X-CRM114-Status: GOOD (  13.86  )
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

nvmem_device is used at one place while registering nvmem
device and it is not required to be present in efuse struct
for just this purpose.

Drop nvmem_device and manage with nvmem device stack variable.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/nvmem/meson-mx-efuse.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 3ff04d5ca8f8..3f01fe03dde5 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -43,7 +43,6 @@ struct meson_mx_efuse_platform_data {
 struct meson_mx_efuse {
 	void __iomem *base;
 	struct clk *core_clk;
-	struct nvmem_device *nvmem;
 	struct nvmem_config config;
 };
 
@@ -223,9 +222,9 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 		return PTR_ERR(efuse->core_clk);
 	}
 
-	efuse->nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
+	nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
 
-	return PTR_ERR_OR_ZERO(efuse->nvmem);
+	return PTR_ERR_OR_ZERO(nvmem);
 }
 
 static struct platform_driver meson_mx_efuse_driver = {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
