Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D08C369A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8cgKzqiNyq517XxxFFSTIXMWazBfzIwgHFQcdW+r0I=; b=H0Gc+D+rx5yH0V
	xswf8CCTxSABzzKYtC+pP35h3hNorp2hZVnRLHall8aLdf9caKobTOXHzPcAINOO/i43C9o+wD1gj
	23DzkikG3miCg39KCSGwLy7K78NKmx2g80WFbjtARvMYUDcvcFIFxE2XpObpBr3C5S/+UYDrSZF+s
	FERP0HSKLEMIOLyeJmDrGrfr+qY9uy4RyS07Pq8Naw5ynOTkMN2i5IC7sIq39fBae3X1trYsWrI2c
	KC02PKjPedq6rwZaXslyBNdH1Q9YvmfidfDCv63htmLOxWJI5PRbTEsGq9kRAFbQ1K9Jm6T/71YMZ
	xpVQg7l8KtY6kxWBB/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28mq-000000047y5-43nO;
	Tue, 08 Apr 2025 13:14:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27jM-00000003wTB-1796
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 12:07:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BGKK3015134
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Apr 2025 12:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okr4ff8snDUBXMIQ3O2Kjam3
	gElpjdiFVfB7cr7ArbI=; b=UGSHs8IecqIbnMxL8cE1GcJ8I8WeNKJR9JUc1AsP
	p2wvlCfST4uFdb8kTot56MzlQCypCTyqcHkcu2J3Qmv04DDP3odCH20qUYjQ/iTS
	kwXyL9wAxYAOKtbt689MAPkn7omIy0lc0PpDQJaXZgEyWtU8KXMEpVqisIDfCHRT
	bnq8uH65plRDMMdvgxhTBO752R41Uy/u53ibTzjTFWiJQAxUePstp8LhNa0vLEOa
	AbeGPbXj9HaHmT4/4Vm/khvxuTFXxbU9EUMvBR76FsXMDx9zvgfxxfbUUAd93t2U
	SsRWUWH/PFGqGXW7N15KN9AEjSCq4Ll8kmt8vWaOufuYjA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbufphc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 12:07:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f64eb467so45961916d6.3
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 05:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744114022; x=1744718822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okr4ff8snDUBXMIQ3O2Kjam3gElpjdiFVfB7cr7ArbI=;
        b=WOPRYq8nsEiYcakJh2p/PX1JaIVEN/YRaPjuibN3FwIHRYGhpo0nm+1psBP1Kt1dol
         sO/sNw560YZI456dx+bcvIgboqPGaNgFSx7JTV260ZV9IN3/FpUXmphoH94wA7NiUzqa
         pvFc79ZBzGlKrlN5bmZ88smXJmKDyfuUv/hIN3ImZtPAQSTg/VM/CnyBihqmimFEQUbA
         5hS3GEJBODyc+hY/AHo8unf836PFvw+8VWVVkmTKmv+cQyMn3PhiA5MQ6YTx5QVFV0nh
         KCwgDQBXsl0kfkRGVsJcyqYX3sdVcWHx29nPot7tHk06VEoDWNUXTWUJpx591uBiyiAU
         5jBA==
X-Forwarded-Encrypted: i=1; AJvYcCU/3JzKFUBQm2E+6cxc694D2brk4TUmdtSzK58k/OV3dyiOhnxDHskYtlZXazSAx8wEVg5wenxHmcnKWoNh@lists.infradead.org
X-Gm-Message-State: AOJu0YxFXqJkbwwOx6sN0XL/uBU02YAePzRBJQg63VieFHQz3yp3d0in
	nr9iolBQhEL8Y4Rj1RG87esFi3GNLCZ2zfTCVgUdUXIjUQ0lGA4Wozf7EMM38tfpPxS51HysF0N
	sFhQgcaQWppRCczuTg79pABYuOe2TDpPdveJsc+sm1V3rQeKeOIf8Z7R2ffXwzS3qdozoXg==
X-Gm-Gg: ASbGncs8vivboozY5usXb3sL3H3FiVFJzaJtg8FRla5weIAc6UJWh9xP6OyQQm4RKsY
	3ra1n2HMKu7aKjeAtnJUAfWS40DbTQPUHwmGcGxRF4LljuNNnQD0a6Tw7gh5JimdmiS0oGLvnjN
	baJd7Z0dJp0mbZn4zvOtvBUCQsQYfvb2+TdAU/JDug2agt61BBHY4+XIf7PkpggSo68awMXHh2F
	8AC4Y82jELEXZIQS9xM4PtrjQvr+BXrhk7eeE06dXRozKgn/wUkPed+Ic1w0Q7CXLFUEXKsDcuf
	6OfWU8rkV6UoR0kwrXiunR/gnDufzeyM539WHMFDuD9eZW4r+q2PlVxl8cREP3t7k4P//0ADkUE
	xU9s=
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250716d6.8.1744114022423;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9w2RBz2reqBHaAnbyBnIgRXepoq+7WOMXuECx/UyL5hge9Ble8kyyEI6oTqzp8dfXIATI6A==
X-Received: by 2002:a05:6214:2588:b0:6e6:5d61:4f01 with SMTP id 6a1803df08f44-6f0584a4650mr222250096d6.8.1744114022090;
        Tue, 08 Apr 2025 05:07:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e66377esm1493456e87.209.2025.04.08.05.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:07:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:06:57 +0300
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
Subject: Re: [PATCH 06/34] drm/bridge: display-connector: convert to
 devm_drm_bridge_alloc() API
Message-ID: <o23cjtq5i6m5xwjj7ymknorjsv32e27anugbek42nao643kdct@6nghdmm746ij>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
 <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-6-42113ff8d9c0@bootlin.com>
X-Proofpoint-GUID: BcrA6MRYDweRQSBnOr_Wqwhjhw1QD5SY
X-Proofpoint-ORIG-GUID: BcrA6MRYDweRQSBnOr_Wqwhjhw1QD5SY
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f51167 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=IO8BAnyXGLrJ2ajCqTsA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504080086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_050704_322587_55ABBE33 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Apr 07, 2025 at 04:23:21PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
