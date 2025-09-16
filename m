Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE8BCAC598
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Sep 2025 17:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UslMStJ3aN5aI29i0C7LQs6pVP91qY/snH1dhC8ECeg=; b=l7ngV79thgRK/j
	IiTrkjKL2qgnSifc/jv2xdPlpHZrNkxFffuxrY3CUvfc0QduFmsQtZ6IcFfpvJ6pc7AzdsW0VUTYJ
	NZEU0/5WfGoTFnZ1c0PCI7xAiusTlbnDIxKOoeXiYAzopRU8B6xxtnhl1Kz8ApQ+bm6czQTYTaf11
	UzcZdWF1lbtpa5nk5ZfJwNdjDWN06P9SimPrmlTXdCfHq2AwSUWzUd/EM+w2sRewFCcAKDjyuSLKE
	K1+nstkP8DrrNsgbmfRz+1nQO3HAtPhRLk0IoQH1muHXQYq6en01A3XMNTOVyAl+hye/lF3ZBZcg9
	DR7MVq6t+kzSYmegZqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZco-00000008eAw-15Hj;
	Tue, 16 Sep 2025 17:37:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZcl-00000008e9T-1fnK
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Sep 2025 17:37:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GGLTlA032445
	for <linux-amlogic@lists.infradead.org>; Tue, 16 Sep 2025 17:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asmJMTOYWO6MF0j8LTYTYFsk
	hlkUXWRnPY3+bCKiCFM=; b=XjSML6OUsA7YEzsSUp9jzWcCdOj2nMcPPedHkIu9
	SiBG0MbFV6Eh9qVS+Xi9etlfsevozD7saVGyecfN/LKtlqdw1bGuB3a3EInXjH2B
	dPbYiMHzMSydct75/ZBHqiqAc0JzK9XTfbWVBUYKb4uiVjkQ9EZYsVRIfbojdbw2
	oflzVPFO8/qEfWOD91rhhvYmkL6vor2rSW+mTDuiagjZLfVjj7aVnwj4tdX6sKTF
	DnoPQ0AcJyG3kDCZCNmn2+/akw+kwI3gA5vyKlAFzpbmERkFAcAIwufRc6qF5w/N
	SJ6er7IRlPl+rAL/GMAAxSL5jceGigwoA/poIUa4/As7Fg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497bb5r9fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 16 Sep 2025 17:37:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b60dd9634dso134743601cf.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Sep 2025 10:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758044269; x=1758649069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asmJMTOYWO6MF0j8LTYTYFskhlkUXWRnPY3+bCKiCFM=;
        b=UMjcLYLKdy6Kp7HqaLPQ/2sN6Xr5w9KtqC5KGNsJ+zyl7PwwzSCSldgHkoCU3lDrL/
         Zu3oHgwJdVfsYg06UkmJzSBLh1lrjNKkbwEUnGC517xO6JBsqP3PSSCMuUHxLFrOwW6k
         dke3R8V9vwHP9LvmhAopTamxTH/r3cPpOgVh0cu7SSVYRv/B1Fec6bbSW+0x8Hi3IIpz
         ITbfOg4ogtY1my5bmN61FZlw1Ohq0wzp5nFfsZ/0Xps9SXB5QGtAgMVe1w0OKMTmqd5K
         /dqazJQK7P7kGR87F1uV42fOsLyfvMGHiZQTVSeTi9EcKajam9nzmGiKD1gxBKdPVMty
         Q9rA==
X-Forwarded-Encrypted: i=1; AJvYcCXdjeb6r7asfSI5xuxFQMAcSbKlK24FxZHyyr5OMyIhwnh6Oj62efM2u46rBWa5JPWkNHDsLI5UYWd3LXaT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw85mYhT4y0IgAd3hsUHsJtP1fLUGpe6U7ObtxVWb9KDVWu5EtI
	Ce0T+YlbrrpCZMQwobX2NiBK9yarWtXIe3jvRBtuJ6JUKJwVYXlrCFzrZsB03orxopJT84sSUzd
	cUxSsDCjodMu4JXJBL3zKmZHRBjHanTUgmk+kW7GTCRhNE0MceQhDNlEMCwuwtAWNQAdkaFpWMA
	==
X-Gm-Gg: ASbGnctkLfBiwxovrbUkFoftX/5qjM7cofap6XGCRffak9UTCs937KM3jHVz13mFc/a
	mhSZX50Eqow1eX7DChmGVFNj5VQytr+41Gun6aUnowByEE4FGoYw10oKHZSmZZ0afF5uiykqDJO
	2Onx+tGUeLczcu6l+kbgIsmZNU65oonW9DDo+PvxzxyocENEO0BoaiSx+UHx7ffF4vjvh5q/zm7
	LLo3WKiTlWlE5AO2nWJEUe1LkYRq4i6mS/7utZrCjnbjyrREnAkB8f3LBNPhTVX0ewVPX0Yy+zC
	OFRd5trCWIoIPuzKlh0GpBArtRDV1z1BHqNC/xvIUPNPCXhQQSJmABMU5LuqoVUf28YsKGu723j
	f7wp+kFRqnW+u95sNxpIBdgf1FxGQheydGkB2/yk5MsGy/HTG5ERE
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4b77d08c1dfmr178883771cf.19.1758044269014;
        Tue, 16 Sep 2025 10:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEINTEPiFvuj+G9ik9pEiQhi0J/sHmetYeMmXJ12N3mEWuP8rQExfbslVak9k+CMhjZMs47OA==
X-Received: by 2002:a05:622a:428d:b0:4b6:2336:7005 with SMTP id d75a77b69052e-4b77d08c1dfmr178883081cf.19.1758044268385;
        Tue, 16 Sep 2025 10:37:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460f61dsm4437835e87.113.2025.09.16.10.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 10:37:47 -0700 (PDT)
Date: Tue, 16 Sep 2025 20:37:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
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
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Message-ID: <3n5gjebxuafxgsl7yl6ife76cnfwblsggsp2kkcrbjjansbvi7@smi7zeexy5gy>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
X-Proofpoint-GUID: rksvl6V7x2K7MvFpOtAwtW1hnyOQZKm4
X-Proofpoint-ORIG-GUID: rksvl6V7x2K7MvFpOtAwtW1hnyOQZKm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDE1MiBTYWx0ZWRfXxZdDklTPcRs/
 5ST25zezLXtfOR4qk9Wb6ivFwsEb5MPdHLHfV2CP6qKCl7NrXzqoFowYIhXAIdVnggREoa47wAY
 oXxi1N91N5RZqckrVpLUpXMHPW+UWLSpufyFd/faHJcsLYlyiH/tWiBBDIHau66DBP56rEL42xZ
 gK8QsnnISh1PmoxzbcEmcr8xx3TkPNtXEnKy7EpKSiGvHuavak4EqCg2gHeV5TMPGD7EXR5ZdWi
 y0nUGqmnrpS9QDq70QU1/1KnoO06EAA6iUDttjsytTJRTxrTZvwp5ILpRq/B7Hj3dK6m0biFOnD
 bPoUxTwxRqcR136lkyLH1ajNixLuyrbffyODG0Ysm7ZNDXdzkNXqDDZ7icEMNiOc6mY9bfsNG3b
 jlZbO06w
X-Authority-Analysis: v=2.4 cv=ZfMdNtVA c=1 sm=1 tr=0 ts=68c9a06e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BgkF6ddApZc5WCf5u_gA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_103751_542561_B70400C4 
X-CRM114-Status: GOOD (  19.66  )
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

On Sun, Aug 03, 2025 at 02:53:50PM +0300, Dmitry Baryshkov wrote:
> Use DRM HDMI audio helpers in order to implement HDMI audio support for
> Lontium LT9611UXC bridge.

It's been waiting a while, it got posted as a part of another series,
but I think I'd like to apply this by the end of the week if nobody
objects.

A note regarding OP_HDMI vs OP_HDMI_AUDIO: there is really no point in
going through the OP_HDMI other than bridging the HPD even to the HDMI
audio through the framework code. The bridge driver doesn't implement
atomic_check (on purpose), the mode_valid() check is also performed
against a fixed table of modes handled by the firmware.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (2):
>       drm/bridge: add connector argument to .hpd_notify callback
>       drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
> 
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
>  drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
>  include/drm/drm_bridge.h                       |   1 +
>  7 files changed, 57 insertions(+), 79 deletions(-)
> ---
> base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
> change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
