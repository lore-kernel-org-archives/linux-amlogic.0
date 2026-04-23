Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC867F589B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCvK0iEoVLMxfOx4RQSldEmwFvJtXmIlloOzRBCSPtw=; b=pLeaRg7odH+IsE
	71DIyOoJ3Nyy9JggF5v0Ujb6/7KZx7GNgUwFILYte2GF7MLuaAQ32tNLuOkdUA7W0k54MDa6/By5K
	+5KsyLSTOZX7KfP4VP8qTVS9iA+kIXfKlaVH2H+LD6bKrEtouAUfGKhm37Db2Dc8zpHhI0KhbWm55
	Q0uLxFD2woHxMMx50VZs51qtpWJ50qDzgmG7V3j4qupqK9VuwSMrm4LQNFoFbvXolg8XrbWx794p6
	zLK3paRhe0qX10xv1EviDX9DnNM3Lwg6iD0Xe4zKDGz/E27dgRlZncWgYVPS7fSDtI/zuJMIr5xys
	F23x77bnWVMpvJQBAiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP9-0000000BeNe-0RYQ;
	Thu, 23 Apr 2026 12:43:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtP6-0000000BeKY-3F5d
	for linux-amlogic@bombadil.infradead.org;
	Thu, 23 Apr 2026 12:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=; b=anLVH2gCEE/oKPubRqsGjZxNpO
	EQGL5kxAgI0ykqG4J/4orUNMsBwIxIv3nSACirVfYLkkW5jKMldwMDTwuHhvQeAnUnS76A/8Q6XWZ
	ux0DepePVEo+XlzzYLQnLi8fIFgSHZ9IFYh58X3cpoHLkjP5/E40JQ1gzwZFY+ptgxkK4kdsHTRet
	DAP6Wx8zGGz22VyeBDUglQRf+yZL3yqWlgEYolhCOmQh183sEX786cRpISfn3v++Nz6xbPER9LttA
	t5RgX0ifM/B0YpLv3gsTRauEd/EyjyNIul50YdtIYHA17bG/IsdnxtFE/8eE0zts1fdBa325vTGoM
	pACU98pw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtOv-0000000D38S-0jP3
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 12:43:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94jJP2319458
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 12:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BWsj0dSc6URl6GzhKqtvvsA5
	lvMVdCA8oRPUY5tXRI4=; b=kz7jLeBzJhutORDVFx2iCKLx6BbKBMv6ZD/OAzXy
	A0y9fL8VJ5azBC4WAyY4ur8i751/Cb6BI3cUXuKQsmwXwY34+fQJImLA7H/88D4v
	1BG5/aKfbFE/R3yiLswxqHx22LbWVldKcz8Z7n+9vvLF6H0umWX04940IYnC18qK
	tqpEoazA4Gx/aTQtT+TClBki1rUGdP2FhQ9RJS7+TJ/lTUY5IZeO+dCzFtwCvg78
	NWGFar9sZDj1b7ftpz2facMTIbdcJTW1sSKycWLMr7MmGIEbOm3qQC3OGbd5TyaF
	4WBlrARrtwmAMfi0rdEMVIqZqVfGqYskKA29CbPTq0GlIQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfsruv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 12:43:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso63596271cf.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948200; x=1777553000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=MaZb8/bB2SUzG2Y7ZExdyQub5DLmpBlsWvPy62VQQPLsjDb6YnZS9XomBHbIRllsjg
         +ewqbwBJ++ytvYtkktmumvivfrbyKrjsRxb0mnPmnbzZQHJw/duvsZpq0V7Q9axC+J82
         9v3GeiDX25u8tN9J+bP0+79/nJEzIVtDDy2kMLBNJbSuSWNHJW1dcvUkeL3oWF94nFgI
         MmDGbXMXV8YnzhRttBgUPPKV7q7Ddz1UyX+Wjrsr/td/D35xhbxwnaz6EML1m7dxI+Ba
         bxBTDbNi96Ph/VciCPBP7ztReffh9rqSKuVfd3j2RzVO2/gtuYvBJWtEbwhCg3d5fcU5
         NWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948200; x=1777553000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWsj0dSc6URl6GzhKqtvvsA5lvMVdCA8oRPUY5tXRI4=;
        b=ngoUdfu6RqYoIDID4lXN1S0feZwx2fVTFZ/Oh4JJzu5hLSZ+0OM9Bv8RcB6aEQ+mg7
         A3G0E1Ohfh9k2gFCTD/suFtnroqDszpC3/prl4pJtSEvSftWG/X5rgpNH8aAJLs+UKAJ
         u0xGf8ya7f+ZfZTdAooeFZxLI5HUt4EcvN7hc5I6yqQKp3h4XTppk4S2PdClpV6/ySSh
         UCDvdhTy6ax1L4cAzszyZ9IAyKzHzfnrUXjRXvFvxUZzppULwbeZuWGPCo+F37e/ipd1
         TCt8rHha24tHNeXiB0BKWwyqk7waq/9HILyfvAKArCjFqWIvBklLQggFG5HEjrFexIYy
         4xiw==
X-Forwarded-Encrypted: i=1; AFNElJ/aC8j6vLA5HC4lmEiASkRT/4QcivSZdI5vt8yoMLn5y55PlsJSSwHY9PUl19A4sfjayhIAJLoi/64F8z6y@lists.infradead.org
X-Gm-Message-State: AOJu0Yys/N8uTAhftmZio6KBrFJpkg0wf3yA3z/HiZeLxcpB5V9XepOQ
	foVUxiqdioLZyU9HqTCejm4gy3fkPj/B+ksKY+VY/FS06i3womHkuv6tyoNntVYe/7/odENTWyD
	o63Ko+5AqW2a93E3HDkxI9gtH71dH/ACmBZ0XUYBkkQf7c0up0C5SxIFG8QEcKeRvUBzbHFKbxw
	==
X-Gm-Gg: AeBDieviPpmR2a4AIsb9P4ekYoMHPvNI8WeQ+DzfaA8ddf2DavxbZXaE4kPNAS8UeTP
	ryvThhcZpyZqWlV/lYZv8j6y+wfHwVXSMvNpOG+mZDgDXg6sT9KulbQmMFSFajvaGQuBuAFY28L
	mbFTBdZwzHboWWppikmr//4x0Yq0QKixeuuo+6/EDq5UdjnbsujKYuKfb+abDk4Y853txC0YnUa
	FFJfqA9eccOlNcC3FOgu+TQ2+Yp+0hEoGMcniwHnMZZSWh198ylggZKgIAcH5ph0ZIA+cYgS1zB
	MN4y3KzrJ5wGSXV0NMQXYXDTm2Jxbnp7FXk8v0P0SsWZXmXNdhGKF2NIerf+Y8yMMnMenlBYfva
	DETcIGkLdVIyLc15X1RrMGs5o8+MF8RUfaDmw06ZU5swTo2tKOXdI0VVrFgq6GVRneiy14+R3m2
	eYhmpGNUmz+Tdw/4DC5rPENTg1lm33rudh6/l2lOnsrxllbg==
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157722121cf.27.1776948199542;
        Thu, 23 Apr 2026 05:43:19 -0700 (PDT)
X-Received: by 2002:ac8:57c1:0:b0:50f:b6ef:e10b with SMTP id d75a77b69052e-50fb6f016cemr157720991cf.27.1776948198942;
        Thu, 23 Apr 2026 05:43:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12d5sm5133222e87.41.2026.04.23.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:43:17 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:43:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
Message-ID: <kxltg2wx2zwuliguszipn3hldalok36finlqwxe4qh3e2mr3hv@ymc7gwkozlzo>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
X-Proofpoint-ORIG-GUID: BITiF1V-vgQBmPSIOGSjlapY_eRmwU08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX46aqSea39E7x
 EPpRjiE5qxtQ6/k62ehzL7tqsFHP09K9cKiuaDTPqvvlk9Ec1pb0QoxOwKstHZgnsMOWGyhJvGQ
 on75wZ/jv9rl/mfjeFGJgAGc34SCnLz/K+I9getzqcFW3jI0Wokk/8BXa4IB1uHu9YKPCjWUQvM
 2R/BDOS92ymTNvDxZbcLOx5//lVqSx0ZFIJuF+/YKtBRJSLSu1G4GfrvX/whjHT2bsMF3hxKAfZ
 8GW/fvdj90GJz/1yefL8R/+Cyd14rPXASzzSuJfj/ot4CFbralxkys6usuYc1XX4AlFCNRgI8cm
 0PwnSPrVCbvjkH12TQ+apGBU2rf2lenHWE6xzT+9qkLfBQB95c0l0PqFpBVRY55oARV3sUWq/g/
 hgLadB7Ne2pxIyYRTGGAjn5uMIhu2P4aVpZn+44WjinLLvTKmNY2haLCEvnLNr4ZBPEnf/QIACd
 0hHl2kpw5molDOhjX+g==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea13e8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=W9-MdjkIhrGOmg5mk6gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: BITiF1V-vgQBmPSIOGSjlapY_eRmwU08
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134325_598460_6D51F157 
X-CRM114-Status: GOOD (  20.38  )
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

On Thu, Apr 23, 2026 at 01:55:50PM +0200, Luca Ceresoli wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
> 
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
> 
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
> 
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Changes in v2:
> - rewrote completely, fixing potential ERR_PTR deref and ending up with
>   a cleaner patch
> - also wrote more extensive commit message
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

LGTM now.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
