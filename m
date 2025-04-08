Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE5AC3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzUhdTpfWgB4nyPzskc97ourTNyyeu54Y6HHRI9aqN0=; b=Eb2JGQEnOV4Lrs
	kTjjSKCdkTgYv0W0+q7dXVQzPURQYj2OjKbSou7ZZhXAvaTpsKbL7uNnNf5jcBUINzYUkNTUtXvhG
	9e7Z0rKmqbWrD2w5vpcZxxaDOcU7joHrYDSc44XjA4o7wQHniUPgtQKWZW4gNO0TfUr/aNNWDb6dm
	d5o4h6w47tEf7fMFJo4AjLO6AHS9RoP8uGMNi3qELaEqEUKVsMaEuO8mhDwRy6XikHlQEWcg7irVB
	X2gidGl/A6/a3Hf36CUxlhdTFNOtrDYK6pp9yJz0TBG+hw5vXOynOXg3VIde8jzCLLgarn7O/lrRo
	NH1baub8UusOUHX22Tjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mi-000000047hW-1DWF;
	Tue, 08 Apr 2025 13:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27cV-00000003vi2-2G7P
	for linux-amlogic@bombadil.infradead.org;
	Tue, 08 Apr 2025 11:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=; b=clelddlGe8KZiL01j70+Z7pbWn
	+AZn9YD8WBnNTAGIRdRzqDsw/SQTxRcs32IscBsOajJKA+DUVy1ZZ/K9Lj+5VZCdI0Xoj0u2Mmd4F
	iG/Fh4U/luuRB7LpnWf8hw/ViRdIYX028Pp2OZTYzdWH+Trfhl02D5uoJeUfOd+sSt0pfOEd9vYxA
	Zv9RS2ibSCMEVPBoMVqWl9rzfkB17/0psb1WH5x3bR0h5tt22CorhzlrkrdnAaw1LoUhy5O0/zvvX
	c1OXyTVQ5fCqT/ju/6bNG5KtRAJ08SPnF3klgI6DU8Z9TwopG6xoaxK4eHimfSAysL/98H9sq4uH3
	ioeIM25w==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27cS-00000008HVm-0WM7
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 11:59:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BC82m014971
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Apr 2025 11:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5UKc7ae/UXmKHiunvfff8Ov
	kaw6Ua5MEgH+S/e5ZyQ=; b=kAsOPgkPIbWTYpxxLnV2o/tiI/3bdehvaBEoCyZ0
	dKGf+6HEMV+mOXtQg3TKew5ae8DTSn+qdcXvJtxK8ge+EnSr0tx+sCis1veuSQzg
	3edDDEClKZRUG3Frlttq3EXW9eGg6Cq4X/qOzYcAUEzeYFIgmgXGz/jg2tCX0Qeh
	VWNmF31+A/CHv5/qZ4QGp8dwZPB7U8WGPeLlfGkV1qCdeh+Pr9a3vvCkTGjqRHjf
	xF2zmMvSqSQDEiIKdecpulOEdxi8iAwxtfFzVa7K2HvKyiTWyAFBTNH+DWP29d2W
	vg8Y4qTFoI8b2c5ttNqjBRTpAkdNMdU6PF+BTUhr0+c3xA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbufnuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 11:59:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so1026199385a.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 04:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744113589; x=1744718389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5UKc7ae/UXmKHiunvfff8Ovkaw6Ua5MEgH+S/e5ZyQ=;
        b=sW68HAlqCdtd8shsRtoFLX9x0oGEUbzc60V/IVxyKW8/34LUK4mt/Gjp9HSlKf/YeA
         pV98V6yh+OThVWwB1eZu18krtFelCpyFl7emmuqp5f/jXE4z0xdN/sL6whJSXcp3ZamO
         dORoPMILE0Kj7x0LGS3+My4U8r9gqJBYBooc9pdVxRU4vs/MXZKHgnfHJbV07DZLFwDK
         dRsptSIw/HfIz6t+ND7SPTG7l1EVtDiq91M9yiSHyh1VdqHZlcayycbeoyy9PxQZAc9N
         f/w+wV9yUYu3uxfEl5VENsHLLqNAuDewgY/MXDgKcy+QQMFk2TvRWkm1WZW34OLSTgLy
         iapA==
X-Forwarded-Encrypted: i=1; AJvYcCWu8Q3fW4hhpU4BIHH6fxpF0/0iz4vB3HFMmLj+rqUJEfeEaWop1N1fDuQ46kvXJ96T5JusoXibPwFnMN0B@lists.infradead.org
X-Gm-Message-State: AOJu0YykG3+ajThgA1FxOaH2ebBZXl0O463w4pFb21ZVYclcRoG8IpuZ
	WJh0Gi+jcRt+LCTWLloqbhQbQsDbP4ru6szhkKMFt6iY5WViCwu9bryPDHiXeG6mEBW61Jin5rd
	pCqWXs33ZANVze7ptv8L4owslC82kpe1XK5K1GtielMIekQ46fnsMTwEp6khO08stjU5Xyw==
X-Gm-Gg: ASbGncsDcudmUxTkpJCkgYHppoMz73WOrXoJlcGdzI925plFGZUq729gLixjf4B0r98
	QoWnPbefHdKicMaFKXJtJkwZBpI0xRJ0mMpcQtRpZhVYD28hOVyrA9nuKNYs4/ERUyjsJ7Mk+bp
	JQsIiuOvChSRlfCmEnhhFW5ZUZjHJiQGacX4S66Gpqtnkac1FMmP0LxDFokoFut0RpPf734V7Md
	JCRTJ3NwHLF+5W9qlxsV/hesdzbz+YyBLPu41QEv5h+O+/Mr9cmHc+mAA4nIfEz4VpgdAXmKPXX
	5sWEWgPeRiOCRbxu569YFf9+C5TLzcHTzI3xwrBdDnm/200of0ljXA2ogCu+J+NhYtm10y5kKtD
	ptco=
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682362485a.6.1744113589004;
        Tue, 08 Apr 2025 04:59:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjG0AgWeS1WAQhJR3SCJI5Qh4YJ14xwCKURGmhWqtrP5XHH87RDOupWg+DezPfWGcaUO7og==
X-Received: by 2002:a05:620a:3189:b0:7c5:a513:1fd2 with SMTP id af79cd13be357-7c7759e8788mr2682358785a.6.1744113588696;
        Tue, 08 Apr 2025 04:59:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e6370ebsm1479003e87.130.2025.04.08.04.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:59:47 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:59:46 +0300
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
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
Message-ID: <s5uvbdcv7pqogwg7gyy42vfxv3ubffj4ww7nili6sd3y67kdf5@byctauuurvwe>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: saY7DkQPn-51M8YEf2WQ3MPgEInF8wq8
X-Proofpoint-ORIG-GUID: saY7DkQPn-51M8YEf2WQ3MPgEInF8wq8
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f50fb6 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=Yq7wtpIrRiHUN6cIw-cA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1011 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125956_601820_73F21BCB 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, Apr 07, 2025 at 04:23:31PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
