Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F42C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JwyK8BQjeCRp/1VF5ooZvlyMkHn8ubOUYYf8+odbnzo=; b=4bsPkyO5aS4KJx
	IKmE8In0hlYOfoHnMHTOKl6vXB1xCvsPfeIhwIr9ifg1x8ep6OnPoOn0ODYOWBCVYhbKdzYbsHnaf
	vDNqbcbnNN3oIsaTuQdg65gV18V+5AGyAKQ6LCAlUXDNS+ZWqOXfMEc5pp61css9b8Ead0gpoqmsF
	2J42rufcoAsM8VxtYLCmD3DKiNE1QiMYdLklITU+8HxE5KuidoL+H/i+CsMoSjdJij7KAoCEkLuJc
	cgBsjcF+UolvQNR54UXRKcqVSkf0Rj6NdLcPDbtPtRzY6a6jIx1nBBgr33TB0iuDkyJcQPoTHfwAg
	mBTZc5fuSyq8doG5sTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mf-000000047cB-2efp;
	Tue, 08 Apr 2025 13:14:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27c4-00000003vbK-2rWx
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 11:59:37 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BETv9023306
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Apr 2025 11:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NEuaNgipirFcEWokWSaWAS/H
	yieGaYJXo6f7MVJMQQ8=; b=Xklge4heqEb6htj8B5O7IHd428xO57ftGWanUiIw
	mR4/sOdbi8VjXnwUa/ND193G+DoZbkPHxW2lv0gGqWArKaC4QvbiMDqbKNYNn0RF
	QVwRWcIUMVSe9xonU831+uYGwXOTZ17u7ZTIoMDhD7tO1bEtxkzMZZ39nOSo7AwW
	w3Wg1ispeItWnd1UvoIbgN1aDTOo/NYdJhqKlDXO0EFK5isRGO7hg2LaSSEawevu
	ftk6T7ByD0kTjgLBRvUix5cFS0MPr2WbshmO3ILW20l4gSXfoXM3mfraDwCcXWXJ
	fQytu+NoPZiBJqSR3yhMlc9oLW4/uxFhMHFSFd23bIDFqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfhx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 11:59:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so1640375485a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 04:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113571; x=1744718371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEuaNgipirFcEWokWSaWAS/HyieGaYJXo6f7MVJMQQ8=;
        b=rs1iWmWGyT+5JBY4LbD3qafT9Lp/Y7HYJALfV6MyR8cpsJ9UpIk+Ppr+Ln0sjTwDb1
         xWgLmhJZpvevQlq4dJg1VQUlt6fPzpdcbIzFD0Mdqgjh7a3ZqqdON4IVwtWu0KKy2lAv
         h3VgBjTqp2qln3SQFsrLWha+qFPEsjptk5ouKdYmB3tHbjJZyVhobMg1H7T0/VIZ4NoF
         zUzZ5473TKn5A3CyHLmA+YriitUlFIy2AJRmR/M7XyCjzYS2VUh2AomBQYZ05ujsfE+/
         c7iJCpq8f91OjeEjDEWTH/Lfiqxfv7jVqmETdxw25GnvGy0jgpRFaaG0x0envjkFv0RM
         Y8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUFj/rbPUtvlJoBPFnSVgP0YihzsKFI7NPNDvyHOq7gFnXIGpyvMOx/jDCNxPfdV9AnqbSHNvqOiiimNQLk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3oMVePEcYM/dmS4sAvcDR9wVuFo/Stg5ex7V19JqYnv3BjBIu
	Bicq2Z4cXyv091UWFbOl2WuFjrFGW+m+K4pxTzomXg5Lur0iaFnS6xw7xRrXEMsDgZIAr9jk/sR
	Pl47pxSUvERCl/QRaeviy6OlJPYpB2Zvxu5GJ8o0J1QAzqNOkuK7qtc6d3WceSBJuUlXgIA==
X-Gm-Gg: ASbGncs5VTpbK6euJsFlbpWdSy7Ci9mXsFYqPvT/OMg/uSqzQA9UMk6qo5NlTXjXsXW
	5VBPZG9qigdfmW061rclp4KxceLz4H5KAINqqBIedxTyUVlkJqtfGWcQOm4tN/wDm8fJZJQ9V/J
	E77G6JD26q9Wr3qR9hRtZcPfE6LuAoH3kxf6Zpvlx41XaRFJjOaEOuUeXXD0S9oMBMEtliLCN45
	uqnVMko7PL8n552udQFc9QxXhYqLABn4XAiWBYqRWdUIBqsbu43MhNZWrg6aMDcBQv/ArHbtU3d
	Wf4+WQAxOFM3OfkDD7pktcY41lx2pHvFseE1pOyKwEjAByFVnBTX4dwpI1b9/4ykkFdiscHK/VH
	JUsg=
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077713885a.38.1744113571000;
        Tue, 08 Apr 2025 04:59:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO0pdqrUOojsKZC0LUZebfwayX/lBneIGD6ckCJRsQXTk8bZ4JOWxGmFcuR+OIU3QqcGFMkQ==
X-Received: by 2002:a05:620a:4452:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c774dd611emr2077706885a.38.1744113570585;
        Tue, 08 Apr 2025 04:59:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab4e1sm1507877e87.23.2025.04.08.04.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:25 +0300
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
        linux-stm32@st-md-mailman.stormreply.com,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
Message-ID: <megx72fwv3xljmimtftryg6ueusjd2f3wv37u2lstdrjt2vlyf@3w32pt3ozivr>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f50fa4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MqdoT2xZwiyagvIbdbwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: QdnBDf9sVyfPTHd5cTv7YPJJZLWMk7Tv
X-Proofpoint-ORIG-GUID: QdnBDf9sVyfPTHd5cTv7YPJJZLWMk7Tv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=952
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_045932_724920_AF59BD42 
X-CRM114-Status: GOOD (  15.03  )
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

On Mon, Apr 07, 2025 at 04:23:32PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
