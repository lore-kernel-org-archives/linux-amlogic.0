Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC131C369DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxPL0K7NhM04g2riBFxCAvC0ZnXk5SXpHxDv9y5iY3Y=; b=jrY25QdiM23IDB
	IzTkbJeEXQmhDmKsN1uQnti4Nt/BNujI0GhZOi1ArpPLZyCR/EYKEBn+dBWOF24+LoK/MNFLZF1eB
	XaUtqZC3klpReEq1uvbsS2Rz+mpPepj8EXsW2p6TKSH286+xNUrSu+TebYK8rF8s68z8FNKSaSOAY
	xfGoQyzJfNC1k+WR01RARSRIz47TOWCXomc3/zFpQlRa3s2BU09WCmod7EW+EI3dOlMAEOIYFmzsg
	I/MmaPWEzg+t+4tSZM+XHSmnMpf21PwnFex2Hly5ppuASDhXZ6C+YKOLKA0KnpzCUAUZf30jvBXnM
	nLTfBtae5SYmwHAJxV/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mYC-0000000A3ha-2DA4;
	Tue, 29 Apr 2025 15:07:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mAV-00000009zWi-2RoS
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Apr 2025 14:42:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9ti7l006831
	for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 14:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=95T6lUWWSMvDyPMIc22M5eNK
	HqFKHq2wCTghZ6/oaJE=; b=WaLLtT5C8FQJcBDimbkuPt6TTht/cqWy5fKvWqMW
	ILpQ4FF1A55IxDrswWlIclW1piFJUsnCWdTYFUGmuQysFPqImmV7yUh6xBE/ilPR
	bb2G6myBogFm4RPgPQrk+conHuGunajECg0n9cIdzK9XsFIwHOvJ5mFV1RUDGjbs
	ZNqm9qaxetcA0D+BTMmzHMm8am9RMW5W5xHeAzwGubxvVQ5DwqDd/2+Mf+3fMfTg
	YZ47bkm9K/StMh6cpwHU8/Epk21WTDsx2zpEdRJiFUZw5CT6/OzmtbcaRFmkse0p
	jVHxBm/tqOBWWPBV3MuZV4aGW4uImQHirEavkGqJTHITLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmmw3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 14:42:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff78so362781185a.0
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Apr 2025 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937762; x=1746542562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95T6lUWWSMvDyPMIc22M5eNKHqFKHq2wCTghZ6/oaJE=;
        b=jb1ULC5H1uBwVIHh2eJGx9U7AjBkH2UeFqg2SD+nQ2OmKCrCPlzKjKf2Z48Zs/nqgg
         yDvpZiOadgYuZArM2eZ9Cg/z4Kb2lsLSHbDVZQYNASjL2OIzuk88aA/OHWpLYii5b1vn
         p3PMykQVlFN1QS95EPy2rrcC5JCSfMRUeki2Tnwh974xHYHVH9udgI1gVcLhWH9nXvqu
         YkzwNV6WcGSVNLNLXfjHvcFQAzaWBS/AYmr96uS7ZD+tGLXSZKAne93TGqi5PZFyL1v1
         +XIKpsJIp06g55EeZC81xYq9IJYuhfhgTeuegYKK5j+68XnDO17akxJiwpr3JFpIrLA1
         2U8w==
X-Forwarded-Encrypted: i=1; AJvYcCV/qDtYs3ufwrF9fPeGrnCFw+olGZCoIM7hzOrcRe9l6PXYSt3P7US2HmOF3mcYvJ7jUndLCRBQ4DMGVCb+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8od2BUDwJQWSC5U5w0PY6Eb72jOYY+e4W1JdJYEgpqyY7IpY7
	GaI4XXHZK8bWwEqWCNXF8HsI5uqXPazOb+rSnyQW2jDNUdK+01m1erOk+0ZMAlPq0yP0dicBbaG
	3NHqU1eEMDMHLExwUEoab/zBuoWyg2v/h9+zV1Lr0Xx3zVJ38fj+8N/hSaCwTWbbkUAKONw==
X-Gm-Gg: ASbGnct0KBW9MjUId1Kq/Poe8XC9jTN5TlXd39F5TCGf+9X/08IqGtKo00g3WsO+4zE
	cXmwNegA01UP/22LQ/pSvN+Clf1ZB5iQMHOAremwAn3mqEyxADuTmAFcE0hhwMma/0ZTbGNBtfR
	EZTaG5wmNC8XvzHIiRwc0Zb0uLtzZ3LNDa9fzMfj4GXNr/7FerBApimL2lcmqCONxO2N/G6hDv7
	YIvDWaxajk+R4W6kDO8iX9YLstsHr4lpgZCXnc0yUGX05I+hznvjs3VEWLL/qNdxiHmmr58OlzX
	z/CnfzGqi5I4g7JYbWpcI9ewO/yXtFwERbKo7Q9vVkOYRb4CGCE9mFA42D5Ah0mLwJcW3T/vEW8
	=
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109278585a.58.1745937761679;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNJAkS5MxDnNhkLq8y60Bm1ZZecLba9P4Zw5IB7TV0UsyjpIf9foZNs6LWwIvq9tQDTlZsQ==
X-Received: by 2002:a05:620a:4609:b0:7c5:6a66:5c1e with SMTP id af79cd13be357-7c9668cdc37mr2109266985a.58.1745937761023;
        Tue, 29 Apr 2025 07:42:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb26258sm1895708e87.17.2025.04.29.07.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:42:40 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:42:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Douglas Anderson <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, Christoph Fritz <chf.fritz@googlemail.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Detlev Casanova <detlev.casanova@collabora.com>, Dharma Balasubiramani <dharma.b@microchip.com>, Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Vitalii Mordan <mordan@ispras.ru>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Rob Herring (Arm)" <robh@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, Pin-yen Lin <treapking@chromium.org>, Xin Ji <xji@analogixsemi.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, Peter Senna Tschudin <peter.senna@gmail.com>, Russell King <linux@armlinux.org.uk>, Herve Codina <herve.codina@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Helge Deller <deller@gmx.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 00/34] drm: convert all bridges to
 devm_drm_bridge_alloc()
Message-ID: <sdiwpe7nnhud3fvkgijjbfyenlwpchbxgehyxmsy7c5loo257h@hkfcawkjrlhd>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174591887152.961603.7706063017853945511.b4-ty@bootlin.com>
X-Proofpoint-ORIG-GUID: FoEbEijKkwh6vchDR3u6zmJvcHN_fGme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDExMCBTYWx0ZWRfXzmrCK5anxd/K Y7th5w94UPGbQXbgXIP3ji827ngrBW7SP0nCY3s6LXEygat2w2iLldW95WtLMvd189h/kkBQdqF lVm06gDCsEB8wuObYkJt6JB3G1Mw0uu1uoo4xTsOCxk7dO0miwjeNiPOX3Qjpq13qbWRQu02IzK
 TWSjFF50ZcQSZX7rkW+CUMy9qqLf/r2P9fBvf9RMHGu+FWJWDjDh270rijfPaxT6T2u9pkz12rH 3/t2anf52y/u9vyAbhxbxpTjqP+oxpEsMvOenP4o2FDzASpVf5WjbGnJ0VTVDwhyXyve83h7eU4 zCmMeqozrp9q/gAxxh7VzmOFCVIBj6JEcFLhx626OrHGfY8R+Z3e5XB29lJyRCZnYmvSAAAHOFf
 PTsYKHH+lzK4x0mHERzL7uhHBZjP9gqS2w7yDhr+4v3Pz4nGWdJjwhFDHGO3Qa5km2skzt8Q
X-Proofpoint-GUID: FoEbEijKkwh6vchDR3u6zmJvcHN_fGme
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=6810e562 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1X4oNAvfgwtBicUf-4YA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_074243_747544_A5A3EBDD 
X-CRM114-Status: GOOD (  18.55  )
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

On Tue, Apr 29, 2025 at 11:27:51AM +0200, Louis Chauvet wrote:
> 
> On Thu, 24 Apr 2025 20:59:07 +0200, Luca Ceresoli wrote:
> > devm_drm_bridge_alloc() [0] is the new API to allocate and initialize a DRM
> > bridge, and the only one supported from now on. It is also necessary for
> > implementing reference counting and thus needed to support removal of
> > bridges from a still existing DRM pipeline without use-after-free.
> > 
> > This series converts all DRM bridges to the new API.
> > 
> > [...]
> 
> Applied, thanks!
> 

[...]

> [16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
>         commit: b2aabe5c6b65516d88214aba4b12ce2ca78bac6c
> [17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
>         commit: fffc8847743e45604c4478f554d628481b985556
> [18/34] drm/msm/hdmi: convert to devm_drm_bridge_alloc() API
>         commit: e11532be87e437648521a8ed5358c56df11933b4

Why? These drivers are explicitly handled outside of drm-misc. Please be
more careful next time.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
