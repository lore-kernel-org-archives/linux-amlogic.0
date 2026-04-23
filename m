Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4A6F589B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zihXBuvYhBQ0LHATPplCeAAKjnH93vbjRF8/iG1tYA0=; b=iz6Fn4G6IWsyvo
	hiE9FVe2kyCVRCn0jqILEwLJi/jlADK6W/XPhHnoZ2FNso4zJvAdu0Y9pfmxUKDAC3OF1f5Zv0yYM
	6pL5XKJoxn6NzkhbAI53intf/Z52h9iy3jO/pu9Uo3GEr/1Vanf407yCo4wASkLctyxflQXqHEhD6
	xV6q/dZmIov/pV/9ezABNK3UPcNZ6jfBeBJ13rvvcSP/U+O4Mc03mQsXm3u7vsXue3LJXz1gBgv0c
	vxbSsJt9qwtElI9SHfyMFrZEbcyen/5NSAKp8L4X6vWGM6Ig8nxjc2tTbmcf1vdrqB4PZS5sFZ+JL
	3FVkInYm9TshSGhG+uOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNi-0000000BdN0-1ohQ;
	Thu, 23 Apr 2026 12:42:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtNc-0000000BdKl-2PiK
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 12:42:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8tr8e179321
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 12:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nPbpkNj9ABhjGDGvKynwI0Mf
	HPrmaa9hsgMYHe0+7+Y=; b=eC09PN2i24nCZriljMh8JR/1ApJQAbNzTeI0q3AJ
	ecYJiOJZrZDmKs0KMclx5mM5sSs8rMozaTP5vcHDvT6EfMr8LxW+x5nNByuVX5p7
	0uUBmLUzk6EA4s/nXj7aqxxQ1tinWuC2x1wOaVAMZq1Sa2VVoYq1weIuCjZxa3tu
	rhcKGUnyeKVxQZozsBCCOeMugfw36mfVVMH3UPQW1yW5HYB/X+81gylFHiXPKmkd
	tsh9Aj5mT3OOS8YrlxbAJ+oZ/Hnm54MGwRs0gB/1MQOxg9xz6RvZyFyFinuqNOR9
	QAshNI31RpsjkNwnbsfUoVnHp16VxLx0svestX6bUeFzVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62hfx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 12:42:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf0245b0so93914881cf.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948123; x=1777552923; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=RTOvW+Mak02nmAf39Od32jcWSKwgoGO9O3BkVoEZFTsic4hqpVVyxfI7emmkpK9AEj
         Hu7HQsLx5sYBk+vBuYDGZ0odScX5AdfXQTJWWXgHAimaseR1j16xf9P/ud9GtBadfzII
         fk2OvQ/H3PfEO1FMntD26gAnzes+Fs/4w2xzuEdgExZHzRpCJPJhrWGvZ/8m3oo/hoMp
         PVs85TMZIAx5QlmR9AjvyXYUyhJNEY+Vn3eBgE1i5m8L6KMgz+i3qfI2i1hbSJqcfipV
         vVGeWh4mIlP8bJZeFz0ArsmfhHkJkLuhXrBJC631TSS/1hQNfOMwhQEAZMHQyyijurWj
         3NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948123; x=1777552923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=ZLhhy1GsHn6agx9FyqUETq4yVoqs9M/ekOltidBQe9Ne3b9PKs9EjgI5LFARerF2Dv
         bQ4pW8quPd6ddy9Lm+NwS7Je0dbk9Hlj+A2YH/SGpTtN6/5VfPv65N7O6EKm8YMP+8k3
         yC+h8XjUwCrih8R1F/nYyJ3j6dmfZr2dNQ7NBvsR3h8IPBg3ju87lnHkgXhon2o9zxF5
         Gpq7YS/CtsF4WJKYYb2rB9th2vrxbCNBnpl5HMVQY40WmGDNFTYVDhF3GDNqYnvQm5zF
         JHVJxFcgRv+WZlE7BxFVBXvAxzj/Btdj7ZL1O5wxoh7FPylVknojj2t61uWfySkYvcP7
         52AQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OO1DjYR5kfazbHmXZABolSmhdNdyTuOPHO4wZpqFb581Wfc1hk5dYeAe7efWo960ip+qnWp61W/H5YW4h@lists.infradead.org
X-Gm-Message-State: AOJu0YxIppN1KblwgBeXyctxwnT89SF81zRHstTkK0TGX84/D9oS2Wy9
	BF+EI3X1J6mVl16YcpTR3Wbl/PgqovtECiHWBk9ufx1wFUUEFs+CznTBgCqkuX0tsvrt5uo0Xpv
	2tYNQXaDoK/5m5734/2auWiR3ZI16lRe9OqmRRsDIc08jIzxQpLvwKGow7zFp764hX4on/rOVYQ
	==
X-Gm-Gg: AeBDieuIhjT81lMYHb5KJiDntXpqqN4RVZF5+klJbOixg9OceqqWRkkOlJhXnqzqGo2
	Rt34cMhocDU+wmxP++/dxDX9uJKgj2ANDI0S68vEIGW7UvpxhgJ9Hvtfm/5PXDF+9LyeJKbvsJR
	7SOhefG/7S5QiT5bWnkOnhV5oIOAs+lNnZR4jpzuFwv6YaSrjyqhfdSwA607ZzL1UKYr0LrFDDQ
	D0sIt5Us642S3yqbrnS70xUIeGNYVt5GuryJAvq7PlR8qYpM+aB+eG8/zyUChmqsb3tZrQFp7Xy
	ZJsTMsC1H8tMk5ybbpDcFXcl+T4v5lw3+spxl9xLfkPfjWoqv05sO7PIG6cVSehQMdSr2NUdTJc
	unciSjRr1hloGyk4VyrvoYjwK/GYnJyxMUzqmNcbGhQ0yU3JkJAhBedaCyxjUmnbY4KHd09aMjO
	NQGg8LZWDbohHAxr6PGQFhyQnoyb+g7XzJJzP3/sNJvWl4NQ==
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230996781cf.17.1776948122976;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230995701cf.17.1776948122428;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm5134146e87.23.2026.04.23.05.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:41:59 +0300
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
Subject: Re: [PATCH v2 19/41] rm/rockchip: cdn-dp: remove now-redundant call
 to drm_connector_attach_encoder()
Message-ID: <lxwchrttkseoqo4e2njsyvpgingwymabvgoqh7xmwd5ysie2dv@v7t5q4qelqen>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
X-Proofpoint-GUID: 1xVKIMckMFMUc2YzrCDkuFnJmOlZDgkq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX9UPCP0Ob7i6h
 MDUans5OjFyMDqzC4TPxl3a2hjAOtnJOkk00UEWX9vkSBvg5u5+0e4gT6FQFIAM3VlvzhPgPpug
 mBuJ1j2KQMSJTL7GUfRt/mLYNwyUsRze4ggvpuqD+7FHUXlGVeJFG00ZnYtdykwPs8F84vIdIkI
 NKeJAZuNvpx6zDDHiRf78B5GDyF8IiP1BoEw4RbpewGuxpHTZyrCMU04MkRnyNzttdn7hIml+AW
 CQLFA5gvxpp7h+xwDgkdF6EO4KR5grb/onKfdNaqcn2kGhc4LEp8m5iFDheqMCCQD6FYhD2Y8Vv
 BSXGnojny8IzzUlBFdHLu0IwQ8YeXaNtYHe0nwqFbmTs8TSgeEeGboJnnDFKa/Nn25mAuEgf/7T
 NxmVR+n65HLlR6fn5jSQUWCf6+e0H9P6s8qZ1P9FLuzOqHb1lRWNYbvHpiPgZkSU8omrvYUjeia
 Qs3922dx0+Y+ubvAwRA==
X-Proofpoint-ORIG-GUID: 1xVKIMckMFMUc2YzrCDkuFnJmOlZDgkq
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea139c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_054204_613710_0D428CC6 
X-CRM114-Status: GOOD (  15.18  )
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

On Thu, Apr 23, 2026 at 11:17:13AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().

Nit: there is a tiny typo in the subject, but it can be fixed when
applying.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
