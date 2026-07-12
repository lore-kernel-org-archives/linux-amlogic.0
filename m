Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DEAC44501
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFkrKYCrCbipQ79OIG9TTrodgixG4foWY8WYWB1BqKQ=; b=GHQNtviyW550uU
	xNCFD2jpIlUTTWjUTj/Erlp8YyruXlF4ewORCF3yfmv0W1FvzMyq97vdLj8izoj6L6MiSnNiKsuh8
	3x4JI88lPfdU4XrJYPP4mNXgtkPJF1yy1xzJiYqhXCrHVKCy4DgnSx5s+lS7UHn0QJm8mJA5D5XIW
	hL6k9Tcg1PHO7IK5P1hg9KmxC/FqzHgGAxb/nsWVW9BxV15YJHu7zyurNFmMoyP4TU0YBFCvVIpEK
	SemtZjsDFA42ixqqnNSRyKdJ3WBFCu/OlZ9xwRiWR33SL1B2c0Dw3HUWDrlkAXV0f6dmDIHVVD1Xg
	8j3J0oTeCpSqdtWgHwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJx-00000007Li0-3k6z;
	Sun, 12 Jul 2026 10:22:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirJv-00000007Lfb-0mJN
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 10:22:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66C7STcV2014626
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=euGwPsPogDlniuV4FhHgWZRz
	xcZ+x1hQNJ5g0xOwNmM=; b=X58z8cRps5ywNgg0ZH5F6VnwwvBCFv6bDW4o4X2y
	XjOa6whOhh2nd9VITGFOkzZ3HuhovVw37j4++/69sFS+3b0/ZhhA6hf+2iOH0PL4
	1zVGdqE7c5lNXkXjWB+W8SHX0VtI2xZMvv/oP4uONKgKkY8YG74yoEAovI7xD5JN
	DDIMddwjxtje+CrPvhk9Bf+LB9h5dagp947BdyIHCDnkDGfr5C5hdq2aCwPIZIaH
	/aRpuIEXlnNDtoaV7FKGCuIpnBoPkUeXPWLwlX61UT+4UH0BAknhRBLXPCg7wUYj
	40ios19eaDAiCyZYseDVxuPB4IqQsaByNOheIK3jg+4GGQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hjmnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:21:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9f851902so487061e0c.3
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783851717; x=1784456517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=GQA5gzrZlSUwe8S0xMUT7TkRFK2dVr/yhjUT0OxQDvhttGewQFQSkV1RWwApTKD0rZ
         hDMyagc/5YJiLct/kAeY0B3bpUXncubmnmRrLvnVL3mdgFooWq3+U1clzpv2/UjHw8ma
         N+ORmHupb+Lhhp2843oQ3HYZP5/Boq6j6I/ESY7ShV9JclxyLCp7umCv25yvV61dvxli
         zU+Ut6n7xPAU7N5v9lszoOkRQsccWSHNlqXkkSdpIKa3iSo5EUGbSRbZAdpR/QJdD2aJ
         xaiH/YXvvjsJK29srHJs2jRal7bQGuIsv1ubn8k0iZkUty3PVEMqzsPN7NxgxNymse+2
         cYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851717; x=1784456517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euGwPsPogDlniuV4FhHgWZRzxcZ+x1hQNJ5g0xOwNmM=;
        b=mnY2tuSp/Sxwx157V1OTy7RVbwDXvgicB+uK+DRtFBGytgR2Rvk9SLYh+o/PRHabQE
         ZL4S6n/cp7h1KrP3IVFv8CCuU7SjwJKc2AAp3/TyBANoOFaBebH1ORFZzucasIs0XOnm
         aS5Ta06urX7Cg0Nxaoywi9kqI331bnbUnRMqoxCmP2TSUq4+sCFmexjvgDvweDJQTzCJ
         wEGpaBuTOx+4z1UTwM8GBOKmUs06hAl2oJh7DTbKOT6x4XGjgKBUA6aWl5te4f/lXTEO
         5AH9yZLPISj+oTubeP9hp7VVGOAQD/9mNRuXmXu84nrAiIfv8nZBiL78kUOrPdn88pk6
         akKg==
X-Forwarded-Encrypted: i=1; AHgh+RqX/qxlilCkzStsbEexhRVmk45x0dZq/wEOQ1h+D6w9PweIsm/dDTKRAcVceJCkzWEy6Eu/gxe/zkW+C9W7@lists.infradead.org
X-Gm-Message-State: AOJu0YwC28yp+ubxzxO7l2S13FQDGeDukw6F6EklubLc+u9pPd7uzl8m
	lh9+qbppRC0exu+WA4b0CNE5+5LGUBrggoOKhOHke5TKGPDV6T1sZCoaIuDk5XuKm3XZKItkcMQ
	RBB/MPMQzEFqkQ+5woxUQCTUtFFgMxUUyhm4oGzQcuYokKtbg7Or64SputVsTm9AelG4lhdkKVw
	==
X-Gm-Gg: AfdE7cmvSic1Fz+5kICZMSnEsV2nG5GMQpBfJUCQVSKDGFM0pTo0hPGwzG5WnICNzX9
	oYNb5kyBQTB3zpEe0lFbuHum42mFK5iVeYd0NI7kuH5NQcHh0XP8qwExkkiD7fgOd+C2+O4m1Oa
	2twsCFmr0+O/UagJ3bArmZgM4A78RtRdBZ3Y03DLK8ARJ0T0WGKHs4j4QQVBKZBeJw6G4xAgjK/
	iFwphmkUzzJAZmyDDV9Ukd127OFZA4S94Gco2MGDZKTSusYYJuHtx7ACrJ8WalRZLFGxIuLINRo
	CsVP3p1ZZHgsUr+1/UnTiTMglAiMXAz/xlDqdhhLf9A7ZZ3W8HvEokKDKrM2IkpRjl3el6PlD5+
	GXiZy3S1I/LI/Z9eaa9biyD3steFnx8r2UJmHXxsjVrbHzYKewL+W+GNOdHK00l615kkat+a0Iw
	edm8e2ZsGuqryjPCDtoeFRIMOP
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242373e0c.7.1783851717371;
        Sun, 12 Jul 2026 03:21:57 -0700 (PDT)
X-Received: by 2002:a05:6122:35ca:b0:5bf:d2c7:c481 with SMTP id 71dfb90a1353d-5bfd2c7c633mr1242356e0c.7.1783851716956;
        Sun, 12 Jul 2026 03:21:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84bb39fesm21064931fa.42.2026.07.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:21:54 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:21:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
X-Proofpoint-GUID: Vb8zigajKaHd3MZRXm-iRveDssS5T5Yu
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a536ac6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ROdofPDD1fpM39RL8CQA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: Vb8zigajKaHd3MZRXm-iRveDssS5T5Yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfX/ASw6rJG74Ua
 feHHUjJx/RDvXTdh7l7i7PvA44uP+vUjKGt/L9kXxt5Ca1xMVREOo3c5WsBpvVGd6IZ8hIyzAs4
 WL1lYbYburbuld1XnC5dz5iHMSBukXIvMvs0AoK4ulVhJbwHbjKrulD7OnpEYd38gYWZvucp989
 LA6+Tu7YfNT2HYOLi7F42FGyTVXZj0MT2nu/6AK5D8ugaPDJ0nX88PA5s0bxP3rJQFtV3m3MczC
 ElKLzrSTr5ury1VEP7jDTFDyq5pJirbr6JNwZKqt7Av2FN882CI1Y7Sz3S8XzWHpfWS+/sV7mfX
 ur1PF7XRLiC6k8YahxHnQnAVtXPY0CXwLyd1FXwTUPKKmdBruatbEbIsQBe29qWMtMd+307kRSv
 hik7yXPrwHh99EaZnQ6WpxJFbKR2XLGDawXBEH52rMycB4+5JYH/gtCKFyE2GOk0UdQBRm76Ai9
 OCaGv+1hRI4KzGzPLQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDEwNyBTYWx0ZWRfX2zJjkWRKJFXP
 HRNFoc5TFalwe3xkdRVN+GA71abM0yYQChc0xNCqeaczZHOXXD4EMzmXSdyF3Ey5FVq+dM4lv54
 YxBy9gXX65jgSxH5FWHg8onJk39fjwE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032159_332288_ED187178 
X-CRM114-Status: GOOD (  18.69  )
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

On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> The bridge connector framework currently invokes all bridge
> hpd_notify() callbacks and unconditionally emits a connector hotplug
> event afterwards.
> 
> However, not every HPD notification requires a userspace hotplug event.
> 
> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> IRQ notifications through the bridge chain while the actual hotplug
> handling is performed by the DRM DP MST core. Connector creation,
> removal and userspace hotplug events are already managed by the MST
> topology framework.
> 
> Allow hpd_notify() implementations to suppress the bridge connector
> hotplug event by introducing a bool *send_hotplug parameter. Drivers
> can clear this flag when HPD processing should not result in a
> connector hotplug notification.

Why? Worst case the kernel receives another hotplug notification which
gets ignored by the driver.

> 
> A NULL pointer indicates that hotplug suppression is not supported by
> the caller, such as the connector detect polling path.

And nothing in this patch makes any use of it. I'd say, it's
questionable addition. Let me check other patches...

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>  include/drm/drm_bridge.h                       |  3 ++-
>  7 files changed, 21 insertions(+), 12 deletions(-)

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
