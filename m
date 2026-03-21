Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259FE109448A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Mar 2026 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSB/62xSeED+IueGI5sGEc9t7Fm0xSZcHajj7NVjJd4=; b=RGIa65fmOMJ+5L
	u9cQdQ3CFaYrv6GMwYwWey/UNj4lQOpzVNNYpFzjTo6yyVkDIQOsz2kki+9xuKwVGLfDFe/lXUwCg
	iX/kCnX3PDewjPHi19e0XlAa9O9QAxJRZiJg8+sNskAeAiYqDjDODHsusMwaWz0c9HEX8kOEa9zUk
	h3SglqakQ+UxjAWTk6cJi+jf4fvTOLovzNu46qryQUp+WTse9bI4eimPm1s4mX6Fy0pjoUcbAhoiV
	20Gvu82IikG9CaFMnflg6AHyCTHxuskbJfO75UNHtOkkVQ6IlB+NAU+4MP2tux7wXlg151UDkm/TV
	J/HmiOdDh+5ouvgfXXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zwR-0000000EfXP-1d2v;
	Sat, 21 Mar 2026 17:16:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3zwN-0000000EfWd-2Y9R
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Mar 2026 17:16:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LEr2Rb1793423
	for <linux-amlogic@lists.infradead.org>; Sat, 21 Mar 2026 17:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5/WEKlSuRIQ3y6kLJmolINvh
	UCSFxM2orcg3n1rvkHk=; b=JvEB4tIyiA+gzVx5h+ULOk/e+RLbmaLaiqi/cU4z
	QFmV9OhEurr9W98gb8dSyeg6YZRZX6FIeTKc11d7Ty0qfTnO8L9DA5ac9Bry0Nry
	MQP+qc/58iV3XEj+W/omxMkehv2ybPkxNeHHEDiPIb20TiRxtv2Fy2AFP3lWl0s3
	s++FheJb1Dj5E/J8acvRYETrxcWpAhrvQs4+hrkYkKDkJi5/imE2I4ji0gbQKBOw
	oFumuQmE6OM44y/qc+NeNGxUPovtSuWoensY3S0WghtWtMpBQCeupaSb2Uwf7/zc
	O4q0AmZYh7OMlIxAvIT2QRi9WhV02yh56h060dKzSu2rOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mgh8wmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 21 Mar 2026 17:16:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so157190131cf.2
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Mar 2026 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774113406; x=1774718206; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=ei9saCabKBu21V1cZTCkAwB/2ik3EJAP1VaIA5wO0ciRCe5dQzm4gzxuOl+/rC5yv5
         txBGwF5DdEbkzV4+xVPeH0vqLYs11qzAYgp2hGNhiFolozrS6as75ZjTM8QixcfxNjUb
         Bs4qCrqEN14pwMkiEHB5Xp9Bfl63V1xKNW2HVGvLs32yn/j5dgV3Y95zocJfkxFK5bS2
         M6zvc7NhycnZlmno+M3Uq8noWj2+whiYmZAgqwpfPlgQF4tT6zAYuseIS3w2u35guTck
         jM8K1fuqZQ914YQC6r0QlHQVaTga47Az8fcdp3w5wZ+hcNMVhMbD0eEkDQu10s3NWjS8
         igFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113406; x=1774718206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/WEKlSuRIQ3y6kLJmolINvhUCSFxM2orcg3n1rvkHk=;
        b=SAec4qQnfRpy5ZHjTMBwkMXS5x3Oez8yiJygimoPui9yxzVYMGkrdmLH9WJo2YX12W
         eKkSBWeYTUImlFp2dN93BxvLlwxcwj0eW4mFm2ZF4eAtw7/zpXjxQSOlvr/u8k4/GIcE
         TTTmKUUXzGH83AKiNkexK0HwGEZA/Azq6n4PoO1IWy8+ye56X7uBMA0Y4LbexsvvxCGb
         hD2XxLA2rV1oHtsAO9+5b3jx9kz4Bad93ze+BfcnDIzaT1wtm8vv/ovB9LU5KIsiK8D6
         Eclbp+5g/xzkllUmAJ3GCSGktL5MbKPObyq4VLKQOOO0TLAA0647wyTQ8ufoM0IoSPAs
         orQA==
X-Forwarded-Encrypted: i=1; AJvYcCUqiRBH7q8rm54h9yjdaz1ux+9bw231FY1UPocswxXfJXQfAC8ffgsynzonERXjcUtJn+HXRyU/InQYRfwB@lists.infradead.org
X-Gm-Message-State: AOJu0YwgciEHbzYgw+x+V0kG3/v7zgThZkENaRRedK6KtDlvLAxwSkTj
	6q/AMqEAeoLstqWGnnIzkk3/lxDdvqEzVKkZN6/9AZBX/F62GeWLiAb+JlgR9BRa7mtWxQInUnv
	tf98g212Xn6kLkhjIpFNIgPlX8tyTcAwDeRZRpmRgGpUs1o/JI/EQVNdztwNV0cKgAGDu+AykTQ
	==
X-Gm-Gg: ATEYQzxasznjGGya3SF/wWNeFtBkNvGHPvupBHokfSFu8wo7ZkDxNKKMTeQg1Vy2Lhv
	4U95vyseBrDHJD7J5x702Sw+o1Dgxyh2Ozy4P9uOFkzoGnrUl8LH67ag86C7o3tUgvIO0erJbmc
	Y8ariTBmG813I+hZWSENLkG16HE9HyItX6+h6OqDTpwJK7gVs48YdX3g3W+TA5M/RiQq9La+IWc
	9O1HkVvsg3XTh4Dy+FXRBK+Rg3CvBUWYe28kxWAJjEkls4FXzDu+jPDnPkwpEVruCZ9Pa3mhksM
	eQrookZcxiMlsNoGHCeaw2Y1SsfzmDOeOsmZEjpwLCNqBdjQH9WY6hIfIVi8KmSBnklvyOUAQ7S
	bhnet+3gBN3sO+zn90d0c3SX8nmltbOZDximuYUfEHy9GCT3jjRFh5CPu1byeeuUmxZhAKls+Ct
	cKIckloh2ZCzIrUBO2oDvLOI9fOc84x0vdeGI=
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534451cf.64.1774113405551;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:4ee:1e82:e3f4 with SMTP id d75a77b69052e-50b375d0dc7mr119534101cf.64.1774113405142;
        Sat, 21 Mar 2026 10:16:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285206f73sm1223501e87.54.2026.03.21.10.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 10:16:42 -0700 (PDT)
Date: Sat, 21 Mar 2026 19:16:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] drm/meson: handle RGB101010 in format switches
Message-ID: <lu6cjjfcrmhebizkuf3hcghgktlyvw7f7docmoo5v47r2uidvu@c3rqozgop4i2>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
 <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260321-dsi-rgb101010-support-v4-2-eb28ecebbfe8@pm.me>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69bed27e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=4dpF3GFcmnioVf4f6KwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Ys-7xT97MRmrZnWjvAH2p4cn-ds8GaAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE0NiBTYWx0ZWRfX4FJQ60Tpc1Sz
 749TDYIOtmIQQdBNIDuWIrVAv91xHE2dxDGlnAmdzmStnwQu2EEnZFXs5sFA6rxicUgEwrLEcCC
 9iwC6Iq4cIjwYevu7dG62mxR0qi0Q3WWDdffi5lx311coQe/9CEA+LuGIllIfX3Kd6725xWiyhh
 qyYbQxPnzHCMy8Ft3yFZhYi7Df8o/YJWdVYBlhByUkDu7wQwOobFRA3dcT0ghjR1zuHomcrp9IL
 DV6cxRjHWKOVtjuPGN1sHt42CvsoOv6TfmTQT9Ah9hDq9qkrggtVDIbUKnQc7SBBQTkr5lejZZ1
 qMJxEdZocksTqolSbTRcNdbPfQOAl0lQrHGY7Yn6rd0bm1lJ6xkjqMxvC8/5mklyCiReyyJXQ4t
 PomhXUFT4CmOaVWpWH8ds6mTtylO40XR4V94GpE1+ZjcZ5/+3FyY0BVz4X9dsVGK8lZ9eQP6X3J
 IACoVkqSKQGmgMFWG4g==
X-Proofpoint-GUID: Ys-7xT97MRmrZnWjvAH2p4cn-ds8GaAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_101647_667507_A539F958 
X-CRM114-Status: GOOD (  17.98  )
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

On Sat, Mar 21, 2026 at 07:52:30AM +0000, Alexander Koskovich wrote:
> Add RGB101010 to the unsupported format cases to fix -Wswitch warnings
> introduced by the addition of the new pixel format.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index 66c73c512b0e..59fc0083d318 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -119,6 +119,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>  		dpi_data_format = DPI_COLOR_18BIT_CFG_2;
>  		venc_data_width = VENC_IN_COLOR_18B;
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

This would need to be changed again and again as we add more pixel
formats supported by the MIPI DSI panels. I think it would make more
sense to use 'default:' here instead of listing all of them here.

>  		return -EINVAL;
> @@ -232,6 +233,7 @@ static int meson_dw_mipi_dsi_host_attach(void *priv_data,
>  		break;
>  	case MIPI_DSI_FMT_RGB666:
>  		break;
> +	case MIPI_DSI_FMT_RGB101010:
>  	case MIPI_DSI_FMT_RGB666_PACKED:
>  	case MIPI_DSI_FMT_RGB565:

And here

>  		dev_err(mipi_dsi->dev, "invalid pixel format %d\n", device->format);
> 
> -- 
> 2.53.0
> 
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
