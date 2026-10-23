Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27066606A323
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Oct 2026 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oi6wHyGy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j9KEdRm1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mQlti2RkOXM3Hm6rt7vWvl50a9AwlEHxvi1pzVxZxtU=; b=oi6wHyGyRRjmxmu65BZ+Efmgfr
	l/N0oG6VDs9Ieko2EUdgBNtpp6mIk7MiqYreFiC3Q90Yaa/WpYeY3l0abQce6hz8ImC6spM26ha3E
	V87mAlLUgrFgw6XzfPp9eH143KckmPYgv6K/mGokae6YeFvg/KZGb+XDiarMby/u4wRq0sSXTcg/x
	MH6FveYndyaUOD74eYdY+kPD5MaQLdIwWqyqpmxPMx6NvGaOq6HH69tvjVEDj5pjAnKdmr71rX4Vm
	JqjsYbOGQoQPFz23JRskv7NGagyBy/f7+MtvlA67gWNw5FHVbFM41dpYdGcIj6uNDbNrhIEAmoPN/
	sL1Kt7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFmw-0000000GSCf-0oBq;
	Fri, 23 Oct 2026 13:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFms-0000000GSBp-3wvl
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Oct 2026 13:58:28 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAYsp3045386
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Lokafbtj5YFNefAbCjS5Pj
	lLoXzpnAAjQItwYXw84=; b=eKZn6itYuZIK1NC+9xHZfchb8KTvAyZ4XOZFYKW3
	0+eTAk+I5XmKxB2IVs6XMk3Q4p/ByPrf1ZTnpvQHFTOeI1KGya6D0PwH2ZIYkgrC
	7/7GGI4RqWTsbZhM5FFlTpPlspHcsdoo0xAMW3mvg4cF340wjMk+EcguNR7RBcnB
	Zo5LqK4fOujLdPenSVOkz7Oj7zyEgjkhOSYGBWpROdPrzaVvRMXhrDPDG6O1uF0e
	bCJhqZmO7E20D9jboC3u2wZEW8oVDDYtHRQAW0FVHWH1+eE70DXGzC1uBMkSDGj9
	vH7u0yaK7343vdgcpUEcNsip5r2jE9+ZdhE4dhen2LK7YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjc0jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 13:58:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so167936285a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763905; x=1793368705; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=j9KEdRm1uwSgGREGw3xV/qA7+DAtIsIkUaPalsG5gXXIqhNWdP3OAI7JB8NuLVtrEK
         rfEi3ctq1x+aupYsqyexOkyXwiA//V0rPNfe0lXH2ru2Q6ahnaEIgrp+1fL1vAWrmoVV
         B1AgziDu1JnOAkK0Pe0HyjHDTBVU4F7gHiEPAaKYwkG6wdPuiFJypvT3SekKjR4L5OHf
         dvM49YvTJahbth3A9LJ1okpgD1SJ6XvpEFBmmqM7fMr/wnwmh5Wl0eVLgi0YGDiQvrlV
         /2e4ifl40PhqkRTjGq+qtHeC1ssksnNpsVpz67XAxRtHM8F5SnuFDuObunMjmFhNQy5+
         61SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763905; x=1793368705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=a58Pq/Gapkeqst0wI+OmefDDp4HbhO03KI3AZHkcfjuvziaUwuTeAckHX2rglJ1hkw
         4RUuTOMQlZdPv38hqLUIsUs6Pgazien7WO0y+XPd2J3xR0OJQvw5c646E1eSf2tcrMMT
         n5lf1ojuuTI5fDX+0za9JxubH+JPTshHOkMCrv2ypxegjtYCpBiB/RgmF/FgjYm3Cz6G
         4zr1XtC5m6/iwNVCW9HkqOcsB/MJzb68jBm5u1ludmXcyFzc6yX0uI7GOloGb+mWN7Ep
         d1PnN6ru3+hFpIQou7aKsNNlgA8tryvVbd1P50+xQzDtJrZ+BhVnq3shnaPcG0rP0IbP
         LTCg==
X-Forwarded-Encrypted: i=1; AKwUvBwegLFX9WRidAaLbCoQcihQn71ZSz7mGR17NUQd86lOt4jFFB5n4YTCYYHK513JNcBlUlRkWL1xkErNj+yo@lists.infradead.org
X-Gm-Message-State: AFq9FYLwGx5LbfZ4uFHnoz1+F5YFaPE/UozgPdG2n0ZRWHzWnPf8jyTt
	ovxQiniAA1RQSgW5WUTNs/ddtaw9s1XQIDltX4hvmIvrsnHjaPZ3UBvAaevuwPBnXTZYAISEIsn
	Zm13nvO29O7NsrVlGjkuwhIemI3EPl1s1hAKQ+owIla4NjykwofFI6nJtI0wVFGnh3kjOSGaY2A
	==
X-Gm-Gg: AYBFou2c8azR2ZI/2QN6/Xy+2V+dH0YYPVRYqAsSdBnel707ndNiAX4UD2Edfa1mO0V
	k2DQ7OTfht3tiCB1yBhE4JhI+z1g6o+IKMY7mOLek5dNGgTFFJ53kSdniylATM7+gR87Nwe49HL
	WeEEIOCv2KbhduTOwxDR+M42MPnLYndGWuVM76y+RkXS0f+gxwB5uU6woNdkCCYPwMNDtsQ58IB
	VdC5pzvfPGyXHRCSDftvZXw75fxGNPih3GAY8kv68FQFJqetll8a8KiJh6wtdpL0PdHFw8TO7LM
	9RtGtnbDoGAEEIwdpbllYMfNKO87/ZPqGUVH+uNWqiXuD1/D/PR1oL9tEl6qeF+U5ikCHxbNK57
	T7/EAlgS2PPymcoPcE+tYnyQ+c4wsSgAU4Yk1bnvFVNFms197s9yZwC96IztGsL5PbxAFNkHz4i
	vlxaJYc5CVt9r4
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398211885a.32.1792763905155;
        Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398207285a.32.1792763904719;
        Fri, 23 Oct 2026 06:58:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a2033sm389578e87.77.2026.10.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:58:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:58:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD callback
Message-ID: <g5jbcwga22grufhguvkmq7scyd7ur6kxqeii24bedzli7nihfi@4hg5tcvlftnv>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Proofpoint-GUID: dhu4h4apWdxMA4KWWxDKCuqqx_jHzv4g
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb6801 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FczUWju-UfBOor4io5QA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfXxr0pQu4ZI5ll
 HQbbpOw4u3IJ7enIONRlQkp44NBWNxmCDIh1gWOeS9KFyM8bDFs7xuIeLpZ7yTAysE4JJvdA4px
 VgYru4xig6yVXXpuCnytOTE1uIkkaRw=
X-Proofpoint-ORIG-GUID: dhu4h4apWdxMA4KWWxDKCuqqx_jHzv4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX+CT3SF9WInui
 x+duHl6ZZn7BPszV/HtibJ5CihUI27/K6RJrxLGBoQAu5ZyTCTssP/NZrdwyGGHNbkm2mEeFcJX
 V/AMJCX2+38ZuYQB0GCcDan04SY2wLnr27y+mQvnGKjJL019MIRiYWnIFo3p/XphRH60kllsk8K
 b0QYG/xuNYhbU6FpV/HlpOpJgNUDMpJa7hdxDdXNsM2+CkPyIR642dKWw7RpCxcRdEKqGcp7p+H
 4Vy4OsRB1AncFZARsdevqIPFwurrRhMdz8J+/O2FdZWkO+SlhGCcmVsptfKXzD+1lUYiJb/COcn
 FGUyRntDARKmb0cK+QLDN6rMiN7vWB2B0Rg9OqumBwz9V0JMtfIV9ziiBLUpjONo8FcJClJPAHh
 gPltvhGIuByvtFFS9A3XRf4aJtQkBZD5Lbj6urrEQJAoGRhFyml5Eq7/hQPb9xXyF6MeS/1T1lx
 GK+YbFarWeVg+m9Lj7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_065827_093278_7AB11D42 
X-CRM114-Status: GOOD (  19.92  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 04:39:44PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
>  drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
>  drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
>  include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
>  7 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index c542ba6ce7d3..a21f9355594c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  

This chunk needs to go into the previous patch. I will update it
tomorrow.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
