Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE42FEA817
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2026 07:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RGKcQfoSm2l5yYVERRfEsrVorjqK61+R0f/5TwuaJI=; b=WjpL1d1CM5FDDH
	GJLDWL6OMy2wNWk/QPLKB4opSIXk9UYtecYLRfzD5IqMKSXpKZ0KqIElrGf+NtX5fGpIA9PuX1iBg
	+mB33fyWrkThOovxkcFHAhObNRnFkSw2WcW0IgpIF09Ymh4W6VosDE8YQUVPM0nlxY5fI/4tPc7iM
	SVvMCaFQfU/meHJoDo2/BuFB14TsWYo/6qo0KAvavOMvHz54QM4lvH6IQzC4Kk5H0MRsUCJIsr+A8
	915JApJP0Oxh0QEv3LyvenmajWRMWMtvgDjt8wf0Svvm9jeUANq+9WMtH1jPRoHsFlDPrt61d7HwT
	ce2+RBar35XPiZR0wRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IK9-00000002opf-0Fo9;
	Wed, 25 Mar 2026 07:06:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IK4-00000002ooE-2Rjj
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Mar 2026 07:06:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5gaxk2973524
	for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2026 07:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQsKwSTJPFyNadQFvKFExVIv
	rmCLGMcz0vINVo0Po1s=; b=L0m3F5brvM58NyDoxlUV5OVWo1Jmej53m0CksRk2
	d7xYJYzAzCTsf6dALVssxvAmBjHQ58BM0efr51a4SfNSYzgt934DCxQN6bfSehkS
	zINpH9s22Q12DVReWnso1p0P4pm9QZ1mgPuHg+cTIRsQ2TqHEYMVU2expcqGhNR6
	YkQlfy6Wqy3rd7+uTLNpsW9CNqAKnq069HlEYoZSD8TTVvFpnwQfiToUSxk59VaM
	oHufhv/vnZjJJcoqFhcPqzdMHeAv7cS12NIa+4MUdEL9j2yCCpm97X4wQ7QdRHqn
	gwFqff4iulnucegoIQrymBFi4cTG8n4irD1sPINtVw/6KQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4hxds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2026 07:06:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4661881eso18237181cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2026 00:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774422394; x=1775027194; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=ezyhRzthlN+VzLwpPy6dOWaUH3Y+Y3zwxq8xmhaxmSvPFbhq/9Lmfu4WuUVrFO/Kda
         03GwkkJ2lSMy7SmqV8Hj3xP6Ju3oe+ZRJhIauAcllExIwHeGxfG9YqK7RGahCbhp50IA
         hvAmue0GwsuUfE9LnDpfqaUfQLymfN0Rsg8FBJ9X0Wh/LuFT0GM/YAzbh9RA3q5f3eY6
         WJ4+VZHfPPvmxKnzGC1/7Ut+dmVFm99zkiG7cAI5PJuOp42CTZV4nMXmnRUEpGQMU3w1
         3e7GDiEe7dEVAU90wD3jTDAeXphfGHKcw8c0ZX2sF3pHIzsT6GN8jG9kX3bmiWpNZag9
         yr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422394; x=1775027194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rQsKwSTJPFyNadQFvKFExVIvrmCLGMcz0vINVo0Po1s=;
        b=GighW4WjkMOPSlqVZh8W0rKLlq7pl78xIqYx+y3e8IJIylwylIVkqx9WVsVbsj+bTJ
         1CT+085l4k8Gg/rO/056+k+ZPettG8RZ71IudD1EH/85nv4EmlqIGA/DKTN1qXgPH0KI
         gUmHLUSv81uqPq2wf68Vx2dr4EjTO4a8Khh1Q2Qzb5uJ0BHpQDKfAS4EP1D2CcI+yRpZ
         GnuP0Gx1VbcOIX5Od5EJQHL0j5ERS/VTsaci6HHFvbFGrkIH53uQZS9pMrJn+twDX68t
         1adYjAJ1qXtKFneDY7ebDJPR6+6UWWHQxjKky7Og0o4/rxAcSM+Wpfyj4qDGUZk688ml
         qpww==
X-Forwarded-Encrypted: i=1; AJvYcCXqZVVhtmIoLrIRDUR7pbumUco/g1mjRaJING19dAb1VBamUhMtsKKELhySU/5FtEqLppbgTDMIVsosXCWl@lists.infradead.org
X-Gm-Message-State: AOJu0YwFsKrGaabSzTMq5bHvrnJuncZTggTuYbQaJ5hgPb0Miuu5D8pg
	2czhK/O6DN0ruumDneFYc3H4SmjE5fHoXsrPqvE2eDIMwKnE/8MtrxXi2xZHyrsfkHtplACS5k+
	h8P5jx48wCTwt9hlM+Vl9jpgKQnDXQa+unHSRs0QP8QvEGUZnxQbes9dEJIOVjnvGu2nD0MJfhg
	==
X-Gm-Gg: ATEYQzwTu/RKNBlpjQTD6PKwZ9+d0RZzvc13BSVOdEqDavCxjy2EkiZUPEdXETFw1u6
	VPWG71Vw649cRT6s+qjYplcZOgZJ1Z1z+GLHBnDOjL6VsGWuQ/H2NYhaw7bCJtNU4tkLnBSvlO4
	0+7avLQTwXPDHJK/CIltsoWP4FIvMyYU7FN3B+Ih6rf5LXCgWFLnPx//VDyBCV1/jVIvde0hJUa
	vzuI6PFdlmnGKcvxh1VAqniihsDflvQuxZKbPBYYP0nMozDq4+qjaMDZeYbPc0NQsOOJ2WLxpgc
	shCThncnl/waUvqm9Pjksqrx3+4des4QwpmvXc1Qr+BTiQ7i3mI0P5se7UPxLxzcyNALv1kT7JO
	NJf1W+c3LLhRuQtdERV6ObYdOhcLvAZxHlwQS+3tICkd8ukyZmfp12K5gw7aTeJo9jRl6sdKwp1
	8N3JpdI/ptEzy9M+ZnNmA9c/uaHn7oj73J/+Y=
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059481cf.67.1774422394492;
        Wed, 25 Mar 2026 00:06:34 -0700 (PDT)
X-Received: by 2002:ac8:5cd0:0:b0:50b:3be7:b04 with SMTP id d75a77b69052e-50b80f01b6emr35059231cf.67.1774422393873;
        Wed, 25 Mar 2026 00:06:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2852071edsm3641505e87.49.2026.03.25.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:06:32 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:06:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/ci: add new jobs, uprev IGT and mesa
Message-ID: <pqa5xua2shwqpkmwbu2jitz2ogpbmgcd4wizb4nt6qtxstubse@4ltbfdvfpqxj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-1-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0OSBTYWx0ZWRfXyre29NqMUB2o
 gt5uiI/jDIvjW1OonzvlPUmMyRdIc5/jw4+lpujnTM1W2k5gfCt850tbwL0u+rKz/WJY6P+NApt
 66BibvwIScC0bFSn4H6bKrk2DSYuCni/3aYs7WkPCEDMnt5X4EDzaLjJpAiYsgFju/ZKUDMRW6Y
 VsAw/oy6DnDDsMv2cqOmR7RBDwsq6itzv24FLAZltAMhRq837LOyz1QxHLwVCq76hREOMpO7EhZ
 mrOVF9XSkppmt3/l83t1Kn20v7VeEVRYW3HMK72S20/fWKe909R4lTxiJE66Y51P6EjYFJ5Qz0W
 Jjut9ZTwF9PdfXbGHiJCbWItTW15M2NW/R/JM/NW0hOu4/GuPFp+dYPthxzf4rn4AxLMwZMElAq
 FqxN3zw9MyiB7h7Cv+zcEyOY5En3PQNlbf1Zr0Gm0DqdWTbuEtvrMc5woxNl1ErGYOt/IKea1mm
 vdSGRXInEAjXCNasLnQ==
X-Proofpoint-ORIG-GUID: vxyRuIS5mIWxD4HhAF14tEn_e0UYl9p0
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3897b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=LmRgrdqyE-cJMQzL5zkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: vxyRuIS5mIWxD4HhAF14tEn_e0UYl9p0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_000636_731516_7AC0CCC5 
X-CRM114-Status: GOOD (  15.37  )
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

On Tue, Feb 10, 2026 at 12:41:29PM +0530, Vignesh Raman wrote:
> This series introduces new job to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> 
> Other updates include:
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use lava-job-submitter container to submit jobs
>    - Use of the Alpine container for LAVA jobs
>    - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>      as these have been migrated to the Collabora LAVA farm
>    - Fix issues with rebase with external fixes branch
>    - Update expectation files  
>    - Various other CI improvements
> - Move bare-metal jobs for apq8016 and apq8096 to LAVA, as these devices
>   are migrated to Collabora LAVA farm.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.
> 
> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1601024
> MR: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/213
> 
> mediatek:mt8183 fails and it is reported upstream - https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ_XoqXUpB=cuJ_7e3-H11zKd5Q@mail.gmail.com/#r
> Few intel jobs fails, this will be investigated and a seperate patch to update xfails will be sent.
> 
> Link to v1: https://lore.kernel.org/dri-devel/20260127104406.200505-1-vignesh.raman@collabora.com/T/#t

Picked it into msm-next, thank you!

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
