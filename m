Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E121C369A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGur2HBvogVdvEF05KkubsNazqqvCwI/8vErS9EarsA=; b=L5l558zkidnzAy
	zZU0DaghnKSPRwGBawmMT/lddz5tvrhZne5/bCjhwHGEJWTVHvxgc41R6GVj9DpQNoY7JaEIw+AFF
	JLQDDIve7xRCS9PyrOIKrDmKzIKt+k8HAPSMjnvdG6ZTRIqbA1rz/jDl9+rJc0QkY3fy+uXM69fpY
	7wmbzUtFLm66FcDCpc+1kQXa6plOp0SXHGdmTaSxGpyT+/+QEdxzQtvP1GdkoRHfeDHPWeFHAgDpo
	i7uDBB1TT1DU4Ko/zslvoxPQpWPQWDBlCXtndk3jPI81E7tnWeYmr+5106OmU5UUYXhg2gt7rx8ld
	YC1Sg0dbq0kGOxEPz1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28n1-000000048JS-2SUS;
	Tue, 08 Apr 2025 13:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27kh-00000003wgO-1UFR
	for linux-amlogic@bombadil.infradead.org;
	Tue, 08 Apr 2025 12:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=; b=N+z+YwrY8lHX0VZvnNhWm9XT+W
	P6u6RZQpkV2sqMuazu5UsLYHxuO2JhCBUPiixCj6nnqnBZ22vOkI6kO/+ny4bEHZ7Zu+vyVq1L8O7
	GPn648wzZr7ZOHRHqueHNL/JqKD/sYuFV0pfhLc/zl9i63AT4bE6V14Cc7lXKMFtpnc/w3Spt9R42
	HjFQ/8/YHwLoTTlYpA/Hwsaek8jtuQ4E3XlqnluR/drNVvvzLa92isZzQGRgw7KdCf1VLwcK33zkE
	P9jHd0+Dr64b9A/jmE3zswZVYtSICXMF7W/pmIl2PU6hP6ms5aupGTokoZeIzvdDliYGYUh6W09S7
	hBU1WnYA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27kd-00000008Hoo-1FIf
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 12:08:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AxoNB027665
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Apr 2025 12:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NAOBRVsjJlHCM4CdITK2XpsG
	lU7ZTqgOAiQblGZfMuM=; b=lqaKm3UaJkGn/9imxJ44ZTO0g34+ZC0rt9Box9zs
	kbLzG8ygIFFJqC1cGFGMuA7PSRNKTWRi44hoN/Le03qLh8KdaQx2u3ZLbNsnC5Xm
	Ut8RmiyYtVAJUSR790WSHIc8lf6BfdVyI/z7By0j64549PQfHFDGE3Tj3TEY0nvH
	5g47J7MlDY2RNbLUbhvBtkUznFGNTK6uceO/r523upDptkuadMDfBs3NY/zrLj5L
	yXYNAUoztzv9ZcEyNbZqrGdrKpUJEjf7aCbNBvUYFEQY1eFFKfQl2kCfKNxKistO
	hJ4+lMQaygnkkMeMRS7tHBekwbEOF/NJ+DCG+wWY5h6Fpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcyypr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 12:07:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e28d0cc0so983522685a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 05:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114039; x=1744718839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAOBRVsjJlHCM4CdITK2XpsGlU7ZTqgOAiQblGZfMuM=;
        b=wDyQ84iV1d9LknSgI0o1ZJNPnJ2teg9IHZ6TJRcUhrou1jnfSEFlV2TRANpH4YFbNT
         ydqS/nvsJCLmR+AA/Gj2dKTYythfVYzr6qjg5YGz0Hjq6+1T/ofAwFPgdOBE/zCx4NIa
         c8NT63I3/qGicLAiJjJgAUFY+or3rVsh5XlfAyxVzEKnyJwzUzBgR7KxtNWktvzC1x5+
         BXYrcgYL1iThhkQlivv1cNbOZkhuRbSLSei1z/jFRL3r3FpIqsATK0TkopSXI8yrtR/I
         jI88Zyj13V5GDtaRWpm+3MnFOkbWVyyYzvkFI2+1Go04RGmnrBaAyiHF62e4OViAHjD1
         ztkA==
X-Forwarded-Encrypted: i=1; AJvYcCX+BGCtyg2aB87XsT5QJ3CDQu/9XOOCcRKBLD8a9GJXmc0IjhVoRGHX2eUVXLhrDXED4ekgkcqi2Y5QPmnz@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjv9EHzo3L/wpqMUuWxm+0VdUfz/N5bD1NgR0K2EPGE24c88dh
	HSuQ3S2Vu6FITYEOy+R1LCYWR97QImE5MjY5yZEed+7wd+QCZVRFjo6iMkkQNMd940QJ7VFLHrg
	1jmwyvlv1uq/+XUTTE7xo4b0t26guGBL2nCv7KS/tb9X3kg+JZDBQkUtGIo3zIBZyKu2/Vw==
X-Gm-Gg: ASbGncvsYRDY4Y3jQck/iiG4q98E8CSW1prr5cKScl5JkW0IzkesVFaW/zFtr9peKL1
	XEWTChI7Y8I8DZXR1W2v4eyAMxK3Lhd1vBwD1sQUplGQeHiaV6QLtSuAk9F35xwfw800yiJNo+H
	gnJQGmjtQH4hGXjF47kPIdshNV0cepWl2sOYdoRObEpafLZA78Z8GXPGsJQp1vZfzeoZXagot2z
	vqKYQQaxkz0NuGJDq34Jif9l4M8cnqzIYtCc2hcj4n1rMKNxEZTaDk6GxPH6DjuHlApZ5ZW/zE8
	NsAdBiEDRNbFSPPbBE7OyT9lGTgSVYEcNLp/+ZtRyyDLmG1H3eYDDv3FOhh6HUZ8vaKxcLZTkhc
	Isow=
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062277485a.23.1744114039336;
        Tue, 08 Apr 2025 05:07:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOm+0STm+ulEUG2g1OSycLPEpwZd6FwOx4lE88yO8te3gseQuW/5R7Tv5qddqxIae781y5XQ==
X-Received: by 2002:a05:620a:d8c:b0:7c5:5d9b:b617 with SMTP id af79cd13be357-7c774d531e4mr2062266785a.23.1744114038665;
        Tue, 08 Apr 2025 05:07:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0312454csm19167511fa.14.2025.04.08.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:17 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:07:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>,
        =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
        Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <63airbm25ly5svkym5fuahnlli76kshtq566zjjdswdhoatk2o@wi4uyz5xrnt4>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-7-42113ff8d9c0@bootlin.com>
X-Proofpoint-ORIG-GUID: q6BbTcUBJBPboCg4crqGrhNQolbO6XAl
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f51178 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=v-JOCnpjkiGUajTo4vQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: q6BbTcUBJBPboCg4crqGrhNQolbO6XAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=830 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_130824_196514_F8048091 
X-CRM114-Status: GOOD (  14.48  )
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

On Mon, Apr 07, 2025 at 04:23:22PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
