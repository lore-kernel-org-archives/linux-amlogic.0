Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAE606A327
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aSTBp/Cv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SwM5DL7S;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NZDQmjEo;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=etsBhPuF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ws0USur868OH6c+pBzl0ShEWmAiIwq+ZBdfhRBIJlQ8=; b=aSTBp/CvgAJJC6BPvmOneMZWf4
	R3KPqt0qgBxv23YyXZr5uzYM8I8mROOs3vSWOwXIxHs0+rZjgsbS2KOkIZHYcdbH+JZcIZG3Rb54V
	1J7JCigXnB2U1+U46b3mOuhMOrIId5pfdhGtoAI1P7zKoFDhQXe9DpYlGD5SWfMmxBq5frJlo4QE0
	gKKjBqa/YBtF/PxjpvdUp2PVqjAgS/4Thgd1B1EiFNqAePMI7ne7kN9mU0lFRPhIFWloNWOU84bZF
	2QMnRthQjsAkkv8ifoRLfvd3TYgEnYqzGuQoWLH9bSTfu6oLZ8GYVhZp3yZGpxwbNoQ7bhTM092Gz
	pqcdXp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFWL-0000000GPdW-2JIg;
	Fri, 23 Oct 2026 13:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVl-0000000GPGH-1eKU
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=SwM5DL7S1BiwTI1geJYOWZoQlO
	/DMw8VqzdPgeoSrnDUZLIDyrKxahXcLNZ7NIchZBuPk+fSnEf0z1oOm2T7iISa2TH3wha0aCa3+vR
	8HYfH5qDPLi6MnJB8mRZMVLahsDyLAx4bo8EcwdKXbTrNJKwPKbywdaN1JKsZGrdIiMLhRYBStLUZ
	VDSsSjKGeew2mW2dYJQDBR6QNTl2kh7GmYfsDp+Y8BHSNctCH3iMnaE5tBBaQEhXKEruN7SkIDwBa
	z5oFMoUcTEC4FaA940DODp+gNUB2rc7bWs9pecqLvitBXMIYccp4W45e71k7S5MLfTNs9Nb+QZ9Qf
	ZvOpK/fw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVc-00000009j4N-481s
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCCEBd2752242
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=NZDQmjEo3XEu43PU
	qrUt2Yrt5RNEiHBrhrMODLvo7dCNn7vAd+G9DrNpFcK3+vA1y4YExqlfev88biMw
	79PH/yAhbyjzkThwN7o1j9kuIJTRhI7K6EgmIxIjQ0rz33bMhHn5SSkf7hE4QgF9
	SGU8BlGv05gCsCjyKIC6KPwhiWTld2YdDRiuS1YvFppdx2MjXwouWB/MvwUhLfPo
	SdBhQ2zFD4QBatW9pJBcfxdzCt4pG3JQl82VixJB6m3wW0jxV04pueNbdyBUrYjG
	GvGHl0357Xvcf3xrKjxOK0WkSX0WYqe581JBMznG33H9raDKY37gxnLM2VWK1e6E
	0Z8UQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0a6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:40:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso396393585a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762835; x=1793367635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=etsBhPuFHKXbFb4DHzgTNSf8bcTOwM5NmTIkjhYCg1+lYN+N1nYemdeWgVCxC3iBt1
         vBhDnIIEhYgMUabBJfLT0WIIS/q14SicXR9VpSmYQuFAS6BviVXgUDR3J11QS7Sk/vC+
         5FGSHqOrLtzxXFVBvM0a25JOE/ZpgGDQtWDtNT1MZmQoyIR0JUav1MrxAZ2GGDM9+8zc
         K0P2jhuPt6ws3lj+UflU1Lj8TecGskmIRVU9KDhBdZ1ZD/exY7/nGdbKCDv6rdKormHd
         Icmz/2AAikm4QKg6KzlUnOBnoSSw65uTtIBmuvshjxaVN2YrksALpC2cJk9+dnTPp7FP
         YMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762835; x=1793367635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=bTpREX8wTtii+UxiNMfyp7BuV4PZTwlrAZNmVV5OmgMRAI54wE0MeBkIJsUsHHK0qB
         nZCpzJ+bqYt8VgVATeYlU/lne7dMcHMNfowGDk4GApnX1/qBoB9mm0GHkAt28bfdxFVF
         yij6cHcHIDuG/HaARZBgNMmmkGz+69xB1kMBhY3NGeCfJbxXqeXWHGQDb6p5Md/8YCQM
         fQ6CPYH843hGw8Kn62wl+dlgeZ8K2C6lIgB/10hdaqzTe3wHkplatumRKyCLlOci7/3w
         3gBhSBwoe6nDDAqFE8Oj+oZl/NGqStR8Exw0sEwoIjetUmlp9flYDd+pI8lA56fBDc5H
         cjjg==
X-Forwarded-Encrypted: i=1; AKwUvBxsBWhAnkt724DyITTq5TQU4Fs/o2zMtAtmgLjvOQbiacKxa37s/Yt9y7xvjLjRhGVW3ZnaD+cW45IAFzny@lists.infradead.org
X-Gm-Message-State: AFq9FYKMFpiTOolGupgC6rdCbiz0JW2j+ORbVgmq8lwJWZ5QUSEXwyq1
	XwQZ3aKWQkVbxfkcj0MLAMwT+1DvEmB4frjQXIgGrfEoYayHSrm9pdstsNAZ2Ku+dQbYch/15+h
	IGtNbiJ7/mVTKX6fP5p2ZioEeTvkpBeTYnuvf4n4kq/jBtpPDDSVonMPoTrWEnPnBMc8bcQzmWQ
	==
X-Gm-Gg: AYBFou3xNl44gshjmVs/t8v7ZaLK0R+0SWMFLgzq5e95U1n2J6O9177Z30I/AyXnLcd
	kDx80FDHH3wRn+IGwBKN40Gw80h3Bgf6TYsPBZQDi+a1vdk+2VPKAwrASDQRRYq8yirr6AcziD1
	QxW/VK7+vjWOSosNhL6UG+5CCeefBjcrbY430Af9px0uNmiG00S12D9X4tNwXLpRh3HYE3jT9aH
	rIZKudNfX2T8XRziKsMhAAqi/C2c35duKDxUZXJQO4JfdvNy/sGfb6Tre+oD1D90HD7PHpGkdaJ
	ldzaS29bYhzXjIqVhUCmnTQmgCBovMRe5x/jCk1pHMr6VmO9KIEiJgB6w6Fj6wHjYO3us94HI7m
	pk5D04HZ0gQYRJm5TXjWLxv+MZ9k16Io2ouFh6OidfjjMQO38f3OuVF7Jvht/Sv8xnYwb11Warq
	IDdjCFVyLt9q3b
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856691585a.13.1792762834358;
        Fri, 23 Oct 2026 06:40:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4727:b0:93c:65e3:df81 with SMTP id af79cd13be357-93f626db2e2mr856686185a.13.1792762833809;
        Fri, 23 Oct 2026 06:40:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:49 +0300
Subject: [PATCH v7 9/9] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OtA5kQaJAzu3uDsBpPRilZ5f2hkyP8+qPHe
 NeTG5AI00KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrQAKCRCLPIo+Aiko
 1RI2CACg5pQDUEeajZzHEEghd4rfxKwDm4JgwgS9OSplIDBiAHrg2w/55A4G94IWULDp5wDxMxc
 jlgkqR47eCTeNzA2l6yZUkkMMvkCVWKhBM8U09/ys0hiHXYUW036cBiTAsb0Dj58VFU9dRl/R8+
 abZrn9cWVIKIHzllDpGW+CiM838Koz2EgVRrFKk76B1j/Rwx3fzwTPICryRsDzdbAzliuRvqaXV
 O8Vvtzbw/1Z+5I7/WE9Ic24Yk8xBHdCBSoATwKaz16mXwtSI8XwYvM0MQqwwSSiJ98d9mY7UwAo
 LfRTAJ62c1+UgsjyAEfClwnjIwik4AOmFfFZQCmJ4l6CZhuc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX2+2SBXZ09lJD
 dj0HQvgyt0k31ln4XN2BjIl2kXUFDBcmt/ga1s4cuTkOhbAVFZB4OBMEa9B/x8j6aYTno8pTdD5
 N7Q4lXfh8rh526qEoAOHYSP5qB88MXRhM4KLrKTMTo5/SepazwJ8jy1D4/WexfCqvI9Tz6XP+Nl
 zioXHatqx9JZuSkvqR+2peGmJRzfIQYERsNj0YWSbQ846G833oT0l1aoAnX0WF1MwjSVQgVFwoG
 6fbn+0ZgNJbNCCO4nkEqq1aXWSLj2eRIZ0cvU9WPQoGIqwd5HOcaQS9ALSMCht0ajz8YSBaVeE3
 r8LT4iU9Fh/e52njw4gBAU40Z6s3jhs868XDC9KqQ+sKw7dEZwvoI0649TziS+t9QyJMHwmJGrZ
 U5XRNIXqRWmhkiG5OsXDusnRKaIJc6k4u6sZgrCpKsCylqYDkIGmDv2w97oZx6ignOXnc0cXU6K
 IiUTtOnKlMc5kX6uyEA==
X-Proofpoint-GUID: 5tLFjUQ1758FJElFIjQB1m6WcBcQBFbT
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb63d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 5tLFjUQ1758FJElFIjQB1m6WcBcQBFbT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXz+D17QutYLwl
 YvJOYx7+Ir6qZXsp5GxpPFsxM5M0EMhlwSJpJ21dXMVdnbti1lH7GwbF1Cd8L8pi5KXYpKqPprH
 kKTd94QAy261dhIJTVi1X69YJmKtvfc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144037_296475_BDD95ED7 
X-CRM114-Status: GOOD (  12.37  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
