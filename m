Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F51CD8CB9
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOdJz9KxjLCZRc4C/bn+SrJHRiCl/LlVnAlO8xxRSuM=; b=Fd8aoitnM7Xh2B
	fuzy7hoQjFZD5gcTvLcahqEUfg9bDwSNo33SKEh6PEZhTi908A+/u1XE/rOmlwFt5xKtkZcFVkjnE
	Bopg3NhFO6/T4e3/X6E+rGUd0q+CGDbRWVacjphVY5sj/rGbaIRjZrQ0pHkzGo35crEOZYO4ijIq2
	UfEHydAd1JoVA7CmrZRLUN9EVSZXHnwrnWYuISKjtJqYuFTXH1+YgWzERhbhsbTMq4YqIl2/Dvfye
	xNYEus2OwVIKuKZTs3p8uDsI5ErFlPj9hMS9RLAIUTFxK/76j3A5dcQI7WkKkgoU+dQJIxyPbT6Zx
	ihEJ8IaAQF3PkSIexdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzZI-0000000650A-2Uoz;
	Tue, 09 Jun 2026 16:44:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzZF-000000064zJ-43v9
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 16:44:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659GOKFF1155646
	for <linux-amlogic@lists.infradead.org>; Tue, 9 Jun 2026 16:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=; b=Qs1uAAYitqroo6oR
	MEex2tM+jfALsKMXl4umzN17elvz1uSM5FrlKwfR8IqOh6Ya4uxiZnSVO0tbq9Tr
	QK481/Xt0zZOHbucSbNwg/ACKwZBYUILxpCm3VtL189aNeTmat06ophQGOxKEXZa
	Gs80R+I8O+HI3tCavUrCrRhQbyEg0mUr7VR6xgOLejbs8/POqlMQyKY4OabUupcN
	qNXyFBkCCv4abVW2RcZbqDqfvjcGD1SbntKqVZSd2/ex/8+nFOxqSpbZJvyag/Dm
	2sUVmlNpVRh6pxgWa12soJ7jCMC74ByJzUr2QOJ13cAC9aX3KRyypDVgEChjNt+7
	dEO9eg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sthk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 16:44:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85807671b1so2857556a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781023485; x=1781628285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=;
        b=iIvOD+bDLnqEPs5vezuKOzzQBNkR80BITSnfW0iDo9T+yCXL1rzJMZdKmweZc9P6X1
         YMt/bQ2Fj36KdF+nigU4xnlprefZjYcjmi3aL7QLyM54iLz5TP/gsasTupPE1hvHY0+5
         8hItnkIV4HdDDP/Q/ewHUZnCOtNGGKWXIzNDr/RLxPjuNieAfIc7rByqtSq8GO3syvhM
         ct3FHYvvvtWeX06fm+O+ujFSoSh31gPsb7NhKNwWxq73JZFsmDh9U1NUzkXyhBY1MeVS
         7rYaZBiWNChgJtWGk880Nc3QkAS5JxmGRtTtdOdU9cK8JZCqzKOMBBXZXKOmsSzI8iwg
         dJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023485; x=1781628285;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xg4V4XVPFGl1sJFsiI9GpGRx0QGGgthYiJp8Gmdz5BE=;
        b=fJuKG6BJFbUuEWAdj88Onv5107IvDx7IzQnXB4fK38ao76fYr6fEFcvAI+wJV9sxAe
         6m834z07NDhwiewJqT4zsjUQ1MnWCfXA3Zq9WsF0llyNMQD/NgjqxzI+cCZOsbS6HvR8
         F9hrqoz3JnM89U1XAf2XQI0ksf0+amz5BKVVsTAihT2X7defVP4gSNMieB6+iP+mRzxS
         1qvUVkMWw80Ha83js1bd7rQZ/uOwugXJMF/guDfrQ7zQ10bjImYFGX37ial8shBGxzjd
         2ggN4icCUzRmSKDrLE/71KMJsbmb+kp/FKPWn3SlQgjTrMC8wbsc1H/Gux/dioyzSnCF
         FKAQ==
X-Forwarded-Encrypted: i=1; AFNElJ82yOUNd1N5PPIBP6f6oAbJwC8ST99Y9Gjs9TjXXjoOPOSNzpwWg4NnoMosmZFc1wLJZyR9inGplJUwplU2@lists.infradead.org
X-Gm-Message-State: AOJu0YyCu4O+DA4+mnJkkkPlvoHRdRzqGCXyjvwUULlhwLivwea/qrNu
	fyTd58G6n/tvtIfHs5uk/n7a234OpSMne2BoQ4EPXi53rBERmMEMWJfV7B8BvM4qe02gyy0h6kL
	JfzDPCjTIYluG+TMxKVFn1P0b3PRmg2BM1sgehnhJ4gELAac/cK+554yj03jTws3DnNiN0Xr5Ww
	==
X-Gm-Gg: Acq92OG8Z6258cAUmo/vjyrmtBrpWh8LRIxmZLZBuz8IAZRSmd3vxPcaJ94mjmt1m/X
	5EE2S95w4Tybv2MMcbxYVkXcjkfSgHEPiMnTr8BIBO/pEqpWQRulq/P40waPdRe9HDcFh1iXZLT
	qlidMkHU86OOqmCuWZ5W+1ui8nEbH37oRFAn4/F9r8YVec24bIXPzhZpbpNqemDnoNpmDGTZ9Qn
	5GHJ05L3isCSPsJUTKa6kbNte+7n5DCcut5eYnQ0pfNnNuCb12jYhENmgXczGtOR9Dsw4YEpcZt
	69DgEov4d00Ps7GEddInPbT5dNgNttO1Px7TMChctVgFh7NBQIwuMEuoRRieLF0I6TR46efpYqK
	cemajuRXI5wUqfbeVQ3XFjB4z+h55hKg=
X-Received: by 2002:a05:6a20:d505:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-3b53bc604dcmr5305654637.14.1781023484747;
        Tue, 09 Jun 2026 09:44:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:d505:b0:39b:89e0:2e37 with SMTP id adf61e73a8af0-3b53bc604dcmr5305599637.14.1781023484241;
        Tue, 09 Jun 2026 09:44:44 -0700 (PDT)
Received: from [192.168.1.11] ([120.56.203.186])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b374fsm18673938a12.25.2026.06.09.09.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:44:43 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@Amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Shuvam Pandey <shuvampandey1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Fan Ni <fan.ni@samsung.com>, Shradha Todi <shradha.t@samsung.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>, linux-pci@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
Subject: Re: (subset) [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
Message-Id: <178102347813.14565.586041970354711771.b4-ty@kernel.org>
Date: Tue, 09 Jun 2026 22:14:38 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE1OSBTYWx0ZWRfX541h5JwwbgAS
 ApuJyqyZRFsy3A1r+/2WF08HbDxsBPfU5ptpQBy8Z9varE4bq5XXAcx2a3Na5YrAkOTWUfsCF8q
 3St7/xsBSxvThBWlgsC08NFaUTMkwkGzPCnl9imRjvhy2Udt4FVhJTqDgD9L2oUGnAaMwsdjYHR
 T+7oRUwv6pDIoAKI+0VU9uNRikzW896NCAzN9AaG2oFplvyYwBrJuBEI99WOT7YX32r9Ax+DXkA
 iyNp3HvZblE6CB46EHqux/cxwcACOvvllCR7HjIYHdd2GHvVaYXGrXwAU6+q3zshzndSfG2N0rV
 mKV1cni+OA4roACNFESo4ogiY2Q6CRFEaRFVb6coytrFfLCEJZfAdtmKlEj0dMv62dP7gIQ5wEd
 auOgzXpe+PXPrrUIbHd86ivRfDoFUXjHJeu68YyKwcf2Re7zlys6ziyi84WgVli06b70InVAdPU
 h1G3PUp7kyizlCWvLYw==
X-Proofpoint-ORIG-GUID: ykDYAYDPayjJoSGeV-57fVaoiwpG-AYh
X-Proofpoint-GUID: ykDYAYDPayjJoSGeV-57fVaoiwpG-AYh
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a2842fd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=eDurORsI8St+1bJHqsJewQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=HaK6AIl19eK7yf7b4pgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094446_335615_300C2516 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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


On Mon, 18 May 2026 22:44:17 +0545, Shuvam Pandey wrote:
> dwc_pcie_rasdes_debugfs_init() returns success when the controller has
> no RAS DES capability, leaving pci->debugfs->rasdes_info unset. The
> common debugfs teardown path still calls
> dwc_pcie_rasdes_debugfs_deinit(), which dereferences rasdes_info
> unconditionally.
> 
> Return early when no RAS DES state was allocated. In that case no RAS DES
> mutex was initialized, so there is nothing to destroy.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Guard RAS DES debugfs deinit
      commit: a5ee214bb36f43b4d8bb2615b30d3b5c0ea80826

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
