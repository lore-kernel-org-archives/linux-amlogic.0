Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB09C982E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Sep 2026 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ws0USur868OH6c+pBzl0ShEWmAiIwq+ZBdfhRBIJlQ8=; b=NHiq8RoCw+nlYo
	mQ1RHBhpLSfN7KAiflwFKnFSiVE48TKVYxQtAWbAncBYxjd4ssnRxh+2T4wc5ag/HgW2vPrsyZVNO
	UO4+1aQjf+DzBMz/JsQV/NpLyd8iM+F/3+mU2tqOcFHURZWgm8+rbj5LBZXQwQ/sn7D37BYEae5k7
	q94yE7vF05FSPLG6CU6GQKX1dF/QVJZD9C2WemWRitxdBC68E6A/aChQOujG3/ciz1kM62938CgqR
	dzzUDkDyvoELggjjOVIgWbuFrJTISRJcCNrlj3HT3HrRWDPWOTpthSeET/y59waO1fuQv3t2sYOTe
	Pdux6YmQ/K2pdQorgSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J44-000000001hl-3HBR;
	Sun, 20 Sep 2026 15:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8J43-000000001g7-1gfh
	for linux-amlogic@bombadil.infradead.org;
	Sun, 20 Sep 2026 15:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=GkMxE6/6H2AxQxPjVASJNr2a16
	ZAZQnNlVKmCOmRmkNbsVVR55b39oX9IGnf0DwyCH7CF/58SxCF2tH7RvibmNuhLcHS5XoqhF1tp8j
	nCcVUO/gqw61gqu4dcjTrs9lCt1kun+znf57Ltk5duLYlB820X74W3eGczltTTh+BrFNYPVHPKxvm
	6mx9e9bh4B5kVfiHBLC7sj1ybAs9NzzDsNcTEIjYmf7/B+HzegKCkvSs+LwQkq9ZBc4DYHtI1C/Xe
	lMi5yijuF3aOJeReoPh2Jp31dzdjQTp00kBqZqcxP8FHCaiJlN4+xSZDlVmEp87Chc/Z7Up09qobU
	j+WCpkXA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8J40-0000000BSSI-1OzB
	for linux-amlogic@lists.infradead.org;
	Sun, 20 Sep 2026 15:02:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnj463444336
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
	f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
	J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
	7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
	zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
	y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
	AdYkuQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsg3f3j2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 15:02:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so630709137.3
        for <linux-amlogic@lists.infradead.org>; Sun, 20 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916561; x=1790521361; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=bc6CDjsOLVfG+ZHEs8S+jISytz0v+NgIRfOLDpm7lhhFftj7hXbhXFt/GE8ECaNRk1
         p+Y0lATKaczS05sQ/nYaV9/1NSKQm0/jnh6T3VU5BOFbFV3kDelHgNp+iJIZHBFZSnUj
         zElTFDCjCX3Cbf7pqcvuPajbgpyVWsckQnuC4yy/celeuBo3UepxL9ZFCSoOWzc+DVF8
         F3fDe3nUR7Btq88BAsfBQ6+3OospHqHVQcxWe7IA3WAWhsTwsRP+7yzEYUgb1L9drln1
         g2PCmI3Ehpp3q+LZTfD62Em6Q/QAYXykMiminr1f1w9fdhSvOYATkhYIq158HsND3C0s
         rIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916561; x=1790521361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=UGbKxf1Za1Bzo6aHAbhS/wUBkZP+JzUZgFAxLpgh/q/UffPJgxpEll116lzlnE5G03
         XKq9witWfuJL4I7KyaNAz62sqMx4Ks/gm0XEX8j4NE2LbEPZZTybpFA7PYGwVwNz4+6F
         7sdJAnu5H2QjWg6+4b6bRVk1u+4krkxTWY1xiLloS5wJCi+2yCuS76Z+dOcS2ldlEaiP
         BQLi+z2FcoyApJurX6RZT/TuTjgm/YmprKoqAWrrqvWM4eF5TZuow4Ixreozluxyg9Hd
         DZOTgoKRbKrRvuU30y1NNibphljmqTWqeYm0S5zr2omApPEam+FE89gmK2LiuePrtWfw
         Bk/g==
X-Forwarded-Encrypted: i=1; AKwUvBwE9P3zO8VMbC6Hh50TXNRh1/WMyBgjFtMq13+0WzL83+oUVtieOhSNSWsdOpdZ+v54w9Q0RQkmARDHNudk@lists.infradead.org
X-Gm-Message-State: AFuF++nglTBnZZdHAx+4pRYyMYAMtbs4JNFup1hpo2annjQQ1Pv/nUOe
	SyWXFQ66dS62RN6JPk4tchcIQCJD08bFYVkV4BTvJR5Da5oWj6SEFQuseqfL1BW59n6/jc8jTsy
	U5lYCE3N7vsZgDKmyj+09yYUHaF9WrNirpAK6AbauQVUAcuxwj36iEJ0fnSP7nrIvEBrJYxI/sA
	==
X-Gm-Gg: AYBFou1k2DwBADhN0QFPjQ556CBxzPlLQBag9iDYYseyLXeKx9xoqGoCsF7iiKI5gB7
	erPssP64HbKp27KdXHzmInE/G0pd2CHLYzwMtYFbadlX15l4vb9vBj2gzLlOR1WEzJVPQrdvgyU
	Z2IJojABKZMFQac9YmJyovvm/GyQgkEntEGNujziI8z3qnNU4P5qbK7h7skmhaivs0QWSl/Wduw
	E1kRb/W0PvC3bQLM3K+ZtE6ulOOB3Im4vasGMP+GqDroI0wUrMOfc2hQcbobINCaThm+TpuUArJ
	OdOjlIZdDeL8agdHlGSamKNIS9C1p0DxawrSHxsRGB3mtwHEEVEdg39L6kt68DjsU8vakudkd41
	eW1anPCSAlO8CcSSYLS/5e1rB8Yx1k3PTUx5xqnyHMKUangXBQEAyX1+nc++8h21l9xps0YPNDn
	SeD//QmIBnG2vT
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2385178137.20.1789916540465;
        Sun, 20 Sep 2026 08:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407;
        Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
MIME-Version: 1.0
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX3xx7Tb9TtsqC
 n4jh7xE0QgC1onDuXhgYlcgaNeVQlmrjpwdgLh1dCp0zWxReVpux2Y/SP+5aEIre6djAVs/0ldX
 UQ+MvnAlemIrHh2+Icn6minFHEuGw70=
X-Proofpoint-ORIG-GUID: iczY-AqL-4IxxBqWncjSriMBvTEEbyKB
X-Proofpoint-GUID: iczY-AqL-4IxxBqWncjSriMBvTEEbyKB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXwcU6iUi4d/WO
 Jwn4aYpDJR4l5CykQ3OF7x0kEp7mmr0RJq5JodkMBiYpc26QZKZ5TYAvs0yhyIbKM02riX2dW2U
 +sg/yQR37TZp9BgXXm5kac6M6hnDK4ma7zW3Qv25zNp+7jrvFWbKg1oYqI+dZRzQ7iUBOOqoHXQ
 gH93gmh1+WN5rRIEYhX9pUXmXyOoqC8FW2HfgtTF8owwM6eIVN+jMw1WdvSuCWHy/rQcJWoioMf
 gjyWraLo08qVndVpqbBVZrZd01M4hUb4OhhK33Th5oyoDlqgPdrKsHZntK4SO3R4ZXnSXm0iduO
 bHHZpS9aKG77vGnyMuBLxMwoApeOBtAbiC9/rKz7GE3L3D5pKdIHgBIloihVL2O5is+HK9XQdNZ
 InMw9O9v7giBTUFKVi9L9m00/2XxkAEhN7uwEmDc0QiTc+whI5l0vPu6FknDTzAAW5l9T38h6Ve
 eEgt6ug93VQhm0NFJ4w==
X-Authority-Analysis: v=2.4 cv=N6S8hG9B c=1 sm=1 tr=0 ts=6aaff591 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609200219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_160244_822128_5A8CC954 
X-CRM114-Status: GOOD (  11.76  )
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
