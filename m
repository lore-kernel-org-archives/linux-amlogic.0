Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14A6C3ABAC
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyJidC0cfmCw9Eo6dc8SPBgfmMBTHfM7s5wpsSNEx0Y=; b=ezVn6gANNUOEAS
	o3YtsMzYr4Itah3/ieIL6WqefrF4MwYMstPH+9rsXHD/iVdpnbrXBuQeq/fc5ByZec15urNDbWCcN
	+9vD+rW5nTDL0mJdfMcUN1QokVfxnbm18ncDxdKE/klCUX2GShg0N5VMVloK1jWEiinNCsiX3+z+b
	r0DE4faeJyZa7vR6DVeJ04frKnCAhzOSrviEhNEov38x5NLLG3vhuRGr3EsSVCsaWI/e/qj98Vl2n
	P58OaOovtChogsqVi7tC7GnKlKWbD9Ogt3LUjOk4tf4meN2Jl40RNQY/5KKF/B+IrDHUKzq/xmmCC
	DgXO5/8R0+j2IO2kf0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhq-00000009rwv-2VU6;
	Tue, 29 Apr 2025 14:13:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jmN-00000009cB6-3Ei0
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 12:09:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA7gri013273
	for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q324d5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so962324585a.2
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=JfVXEQwnQmsm5gNDQrKgaAAxTJUmXeX6c5NI9EpVCyQ/Yw8DlcL3EUmh8QQV/Z1vv3
         AVO1Hz4A01Hgeg3R5tJe9d2rWg4OB/nr8xQav+MMPKmAAPUEWXjpyWHQhJPtENU6Ivrr
         8PoAU8GuMy7KcaQtjNzj7BZOLtv65JO5X/0jXdH0urAsw5tKHKm5McmXTB1X3jSsmc+o
         XICbI0iP+YUJFvSM64M/h1HjyqZZxUCOXn/s4dy8xIhluF2YoqTQosxvi/Z2vG5c7sQC
         gI6HRNVxTuSrZH9XzVooPHs/1bqvupuTE7JdzGm17gWW9lEDGvHFpCnvMZYknOsPBffV
         S6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSXq2u9WESSZoKHc2mBa/vvuiZrAw+uxOJH4G3a6GXC2xPsf81d421zTCbSkLJVeMANDIV/dr3Dw4toFjU@lists.infradead.org
X-Gm-Message-State: AOJu0YzuJBt/vt+ZnK0ZrUFLIgysOVRoKqRMlCj7lGKuULzsXLsL3A7g
	FcK6lEyz3GuoHA69o1KiuJJ1rmOZUebBSFVjQcXVLjx3myfBLSzglp7nohq0VHvRUAxVJ9oZS2U
	HzyX2gPaFcejg02wmQEpEvk6Cxv/6/xgqghIR9s2Kp8X7lVSEEBkiSt3RVRSZ7vj1Y1FeSQ==
X-Gm-Gg: ASbGncvRU8xIH8r/6FVSKUv8TcLQ6N+yHBOMkp5MV1EjHQvQDzhkT0/BFfdLIgIa7AG
	7hB05Whwta9midfoYcsF21qNFsgJ3BGJAI20OJiiXGh3oCIKIXTex6V5FE14vcqC+JwDHocXSnC
	ohs1f3CXqFCWMWKn+csSNLyB52L4ap9DkCPCA6Yg6JbsxHcQOuJ9+v9+ApHZqCX+48qbz+XNd7z
	S41AenOPdrhINqHe49QNU7jNjRIRn1zvx5hH4TTw88dMwL+ile4TxAEWG9lbzRcnztv5MSaqQa0
	w61zHvyNJrgxMbciGwWJGlNFpF9zE5aHbBhsQUPu4ilzUxYhIMsqXPeNBMpu4LoQZ64z6sjicrs
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556718185a.31.1745928576941;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
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
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: IHHvr5cYMT9kK6YgQDP4SDOf7knGIsi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfX21mkLvpgZfBd G+HGIql8KTL+TY72bBMchypyCPk+n8GZ7vlH5zlpR9ANBKcx1Cj6YzsOFFe8s7kIrqZXU3CmeQU xmSKTg0I78UA9nM1pQE9BqJAkSS2Uf/1htrwpXwBSj2oh19DjSi79DsJ+zAku+4MxZnzuQo+9av
 0F7DGTSBEApEYuJ1/x2IQGlV0GR6fvTmzw2hsSbRuxri1vb3USqOJPEG/z2ioU7MMzqaEulwpiR bbaFt+lqgOzFsklYji0L6bPDA8gG8hXl0FfZ9bWzfmLEP1aK+Pb3D46gzsugEYfB4JaTgAocTR0 QbqBUs7TJGVAecRNTet/UpukIW1k3niRURO/ZC1qUNWBxI1xgnMnKnvWO+qq/bKQOrVGHv3dxlA
 26P0pJF9WLijGIjh67AilWJULh1hVIHczWBtDml5lNK2Cmh7EYB4rg6W87ziPzJ4uvdoCU4k
X-Proofpoint-ORIG-GUID: IHHvr5cYMT9kK6YgQDP4SDOf7knGIsi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=868 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_050939_949663_B9B17574 
X-CRM114-Status: GOOD (  14.22  )
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

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
