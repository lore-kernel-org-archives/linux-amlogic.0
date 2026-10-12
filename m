Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E40CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syL1rJEPWN2rX59owSDDEFLWedBPT6/WorRrLF88ufY=; b=VjRRqJ+VefuVpA
	tuheiWf7TrIjR2F7ZpNKt4VdEX5r8nUR9iTANZkHidSb74RKuUvCf07G7S/8qfQdvTf89OnajZX3f
	OQqlr+BxRPSYDx/Pux/mXkUGYqMEesx9SP+HoRP0wlAtgDci3lRbq3nY8oP3aymrPCE1r9kKzM/dm
	X6aKIFiwf1WXsRZVEoP+tPML00hgHZKbeRoES3u+Y2qdZ1+1uD0+OOlujKLADl2ki9RqAewALn2au
	Cj9B5YpgIBJIxa61gsKXRPAnEqOqigPB1Ku+2sfS7S7wedWFGO7cFM8Q5kxlgqGs7oJQ4XmkXWRAo
	7zBMHV6TsjpMOD7a9hHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKX-0000000AitB-1Eaq;
	Mon, 12 Oct 2026 14:48:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHKU-0000000AirJ-46yF
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 14:48:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0bAi2679930
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bpOndlgPfv1kdWQOBM72wFH+
	Lnf26uksnJykK9/Hdy0=; b=leQ3bD+g5c4VwVA6byRTH+0bNQu9f658P3LBrm0T
	OeuBlhUzGR7Ak7FXaNvBsYmbvOCx4iV/fyfr7g2TBld1Ih9q5tdgxeH4Zrof98pY
	yer49v/uHQp/PuurFmz/HVauIFCeyCmNVC/UZQ3jRqT09sGtEI58x+P2uRzRufva
	CR0Npj6JR4C31oqsUyLrqhqGA6FhBT4LJondzTSWoOOwl8JrTrYTSQW0CIP7++hE
	XC13s1ELe1gMVTM48x+eMKyN+20CrBsX1zL+ninXNBmkvBRSoQtSIfugCPaVBVI4
	ukHpmfzp7qGfeT6y8elgPZ7KAmFFIntQNJSm4G+aJvO6/Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1tfe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:48:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b4bf686ceso74576126d6.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791816521; x=1792421321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=EiuvBguNna9NqFDPcs84n1+vNG4Pd+C/mHJj+dfoV6EX1/0KL/r+2dT71c0jaCrn2E
         gQcO6hyUD3r7q9uf3apgvOj1eB/Oxyl7em9bps1aTmD9fHuMfYsMi1lfZvEd1MaXFkR9
         aIVZ1UaJFccFGr/ElDJJRVia4JRO2UJDu6vmuy110P2Pm+IEYOrE48Fd5ydu0rAeLthR
         0wUE7S4V4FEpdi+KyMDb1fytBrjzdxHYBfi7k1k6ky7i2ucdKAczBNIbbzuQvAHPY/7b
         8SdlzNNZzN7mQHz0P0ntaFFcqj3j5DhBz2DER2F8H5q5a7NfVmwJXlHR7CmBBGPlGT+r
         WJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816521; x=1792421321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpOndlgPfv1kdWQOBM72wFH+Lnf26uksnJykK9/Hdy0=;
        b=ilislUHH9k0Ur1jYoMqOg+mBCEibw0LKxo09RYY27JlbZilPNVp0J1H8dhG/aICBm0
         EopZZsnXVbhVLl8XhnSQbftDsVOa1DYdOG3xUvYG8Lek7h3lA7sL8BLiDLGxbuktYq50
         1RpTjCIstvOaC0JDqBzYfG0W+guKsaZDJpXBLhnUUJMv0DcNdsJTit4Vwc8z5MA25MDB
         B6qMUKb2LwGN6aEPWObV0Ew6YFLdSGDRfupwnydc6i82mmXCLwhFpaq1wMuozkxu4A56
         bGAb+bGabcu9QRDLG7vGCCwIsZKABRNNymckBLe/MWJsYmZ+EigsLdVk/SAD7eAljO1l
         cD4A==
X-Forwarded-Encrypted: i=1; AKwUvBxsP9UhAHAtZy8BkU4PXaqve+nA/1QrN4C1eGVSGS3Ny7gDSs8E6yTdHzvOqksgkwfcKdncHXH8Z+Mnp8Ix@lists.infradead.org
X-Gm-Message-State: AFq9FYI5R6Ngi+hRdhC8nnjabYyyO5IeCHKevjB7tRBYBj+cYGL9IPF+
	yG11mwC7hjU8D/ccb4Z+CusAwXIO3GnJHssi02Cv6VzJi/Z5Jslgh0C+ZIG9oWERS397+3vj8L0
	8AgT5lRtHn9A1GyMpjYVBjfPUZA/AYUyqViY6y3YsR4pm8lQvvwIfoR8Tq5vxAt7L7pRZIvUWJQ
	==
X-Gm-Gg: AYBFou0XEQ2XFSWY8f9SpyC31d8FBRf+TN6zRrlXjiVFt9VSRA/lg36ltaxywbEh/fe
	wujvb+4aE7CNdJZvZsWa4pXVl9EXj+ArJX8ZIwcu5Y5d4OUguk2twdwEETmc3Bv/8WEg2ygWSPD
	x2VQTqJFxlv5LKKyOamK98Hl+5M7C0PksoesjX7kmtdKpJYQ01Z2+PneUN7qfWwh4GHxDeqOcCw
	17HatDmlHlYOQHSSIxnmqDdoA08j8YvX6E3dG9cf6Q9ve+MRNuqa5yquI4GyHBtw2FPA7D4bXjc
	Z2Aa3rRQhKcJ79HJCsGEjaPF9SXwZvCdQ+oQT4PA6nI50DCHnDXz81Dri8MTOAug7WP9GQFGKnw
	yXAold36o7MvJfDwor9Z3uUG2NfViklifl8/KoAW80L6CarAHSCFJRDDCQxYBIRxzjunLQwCiWf
	TkHzy4/8uySlMq
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036815785a.51.1791816520929;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4694:b0:93e:d1d0:67f with SMTP id af79cd13be357-93ed1d01a42mr1036807885a.51.1791816520206;
        Mon, 12 Oct 2026 07:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cc7689sm32134791fa.24.2026.10.12.07.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:48:38 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:48:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 18/20] drm/msm/dp: Signal BT.2020 RGB on DP and eDP
Message-ID: <kjt7k6nrlctvykvqrlvl7ftjeul6woarmjcotlvdasd4u5jb6k@oc246xwutq4h>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
X-Proofpoint-ORIG-GUID: cjWDZ9oC4_KlMCZ7b_E-vWRSgjTGJm6T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXwcWJ5aFNOCbK
 AZ5Fx/4YGSukanfnPcX4DEg85ggVk3YeRUARDl20k9VxHCi2473FTr+34xF5lLwfDRPI6VFigQr
 Xk8a5lVN2UteR42nmlRpHGn1fe33i/Q=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6accf349 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ksxQWNrZAAAA:8
 a=EidWXHX74OIilm-ZvMoA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: cjWDZ9oC4_KlMCZ7b_E-vWRSgjTGJm6T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX+qy/g/Edgd3/
 1n1zmsBI9okL6dpoLxH2hGxIRukUZjvc10iytqyNXDoy7IefkBzTkPoefH/Gx122LDQiG4QkEkw
 fDM6pPO4lj4d8suXJQDraq7G5W7B/wrGqPJAGANW0vxMcCf6MCYJGdcH2jgA5W8PIsBO07+VnhJ
 bRRDGG5h+fWRhiS8Vu5gtaBANTvPMgcHYzPQAbBB2MYnhSjH5ID1LvYGNH6iEVfAaIs8o5uLYLF
 neu0mFzjclJw5bW29ilQ2E5kJAT2uPIHqTfder1PYjY2BoVAbvj4WpDdoR1NCdrebNkfTLUZkeV
 vsKoJYF+bQ7NT9dm/YyspNskMZiRB4CLcQAVA5RXCeAHiWdNtKkbL9cbWNxQbPUuI1T4XFrVAxg
 iLxqKh24EZKQp+XvaJGwcLq1r3iiBFgjNbvoEFs/ty0Sw+xhESsgx7rnmnuNDPR6Ux078gF70No
 OM48FZLhRrdGTqvIwEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_074843_322866_2A5A1CE5 
X-CRM114-Status: GOOD (  20.30  )
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

On Fri, Oct 09, 2026 at 11:16:10AM +0800, Xilin Wu wrote:
> Expose the standard DP Colorspace property with BT2020_RGB support and
> carry the selected colorspace in bridge atomic state. Force a modeset
> when it changes so the stream receives the corresponding VSC packet.
> 
> Signal full-range RGB to match the existing pixel path and retain CTA
> range for YUV420. Reject BT2020_RGB with a YUV420-only mode. Reuse the
> preceding VSC state, update and PSR handling for the new colorimetry.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  9 ++++++++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 12 ++++++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  3 +++
>  6 files changed, 29 insertions(+), 4 deletions(-)
> 
> @@ -456,11 +456,18 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
>  					    struct drm_encoder *encoder)
>  {
>  	struct drm_connector *connector = NULL;
> +	int ret;
>  
>  	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
>  	if (IS_ERR(connector))
>  		return connector;
>  
> +	ret = drm_mode_create_dp_colorspace_property(connector,
> +						     BIT(DRM_MODE_COLORIMETRY_BT2020_RGB));

Don't we also need BIT(DP_COLORIMETRY_DEFAULT) here?

> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_attach_colorspace_property(connector);
> +
>  	if (!msm_dp_display->is_edp)
>  		drm_connector_attach_dp_subconnector_property(connector);
>  

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
