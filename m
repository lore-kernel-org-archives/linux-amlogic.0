Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A364FC83F1A
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFd4HR+TmFNBSBLUKG3BbbkPKlfLUJwHT3FC8EhA5+U=; b=Q/JXScsleUmX+r
	ug5Fh3LFWfbNOyWbDg0+lMwYMCseCNYcMcZCMUmWEAWBDuNFUJRh6rMvIzjymrsuiAMpW6Luon5x4
	/8XZkvrTonZJsIqQzXfLm0N765+FBtKKzx7tc+tqEtkPu0Gz8Z3yQZMxJHpEtLaLpmotgNs7t4Xyq
	caeHhJzozRp3Zo+/x3D9R+5eN04bwZbT7dZaeWxZJa0yT7dWPHTxQ4jHUyF4qFH9BpKIEui7/JZCw
	tXIrFi9mySidEaozn/YEv+kLZYi6DWc467yCVnMbsLsxmMole976Uqm7MfcGwDVFafXsvYM+Gq1Ry
	ILdMJH1Uc2ktvP4yCV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckbk-0000000Ccww-27kx;
	Fri, 18 Jul 2025 12:54:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uckbi-0000000Ccvl-130U
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 12:54:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IBEOVG013301
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 12:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYv5+TMFsC7Y+uQecq8Wp1+t
	656E5JgsgS2DLSSChBk=; b=laAO2FfARndPJS57x45jBDT9UmQWhvee7N262jrY
	gde/QniBZLBK4+Duuoda3y8uN6QRPnkBY5LGLvNC3HEkFLI9btGkWAzvQ8yXFSer
	qCvHPht1JcuZDccnBfWNINrKMmXnPRJqu4kmj2lG8WIq8WQuYReEvZSiMP9jvnJF
	XqIDXsa18ez2XByo2DWWVbM+nfNcnudzwCMFbcyjvsBUBNHOLQWUsDJwXstQMKe0
	TkAngvl0wTBkG/pWTJznTb7Q1QEKnO3WG6M6q/ApXFtOFYQbyyZ3d4sVgC8F6F+3
	M1kS6akmyCp0HmeFR/EA3/5qP2Lcl0WU5qpqs86DdRLv+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8kby4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 12:54:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2c8137662so352512285a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Jul 2025 05:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843272; x=1753448072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYv5+TMFsC7Y+uQecq8Wp1+t656E5JgsgS2DLSSChBk=;
        b=Sm+pROUQIDQ7d/VYZsvo+o2d81uEZbA8DLwhybXa7aVIHeFgl8aCzmsPP8J4R4WG+Z
         3BY4oh8K+sZdAN8XUpOD01XlI8QTATw3rxokOuYawgieqNCoZCPlmbOECBgDPue6PaxD
         1Uu7KB3YjqFL+Uy0vNdkv2CPCz6zEYf4CauQR+mvQmkXeBxQ9Dzls0U1yrj29e3nh+uI
         df2uHZ/mEmQxMhIqF4ZBpqgBWFcBDSB3wBJVqHEmjWgJIa4nyGfChB7ua6fRzI7l5kIy
         6RDX9TRKzdBpJUO/IGwT8wVflXy7qoLrOYsYJnIZTbwbjhzGtAput5q8vZFRjQSms1Ad
         v6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXPtLKLh3VHa42JXeiacEhzbel2IiXbuLz/5zNkU270x12DZqZdnlV2tVlbpEe0ZyzeLKukUVKAQkI2mi7i@lists.infradead.org
X-Gm-Message-State: AOJu0YyfN6/+Zo1kPx/g9S88EHFjNPMRlzVknqOwmrBavjd9V4GWbY/t
	QmCnuHq8kdfAxR3JizFNxg7G18KyMdI8kzCvva0Ac5/zzM0q+45fIZiVxB9IvkcEP/Yqar3WjCb
	QianI+6+p2vRi67LbER24Y1MHl8E96GMqJJWsPZSp02bc9SMGZAurFjeDQW22c0avDuMcgORU/g
	==
X-Gm-Gg: ASbGncvDRq3n8jt0FYfXFuI3SsQDbjhnIT3CqT5MpXIs9ChCBkOY5kM+Biu+Hm6pmy/
	TcWO1RJ9O7Zm+FSDNC42kOIRM6oxqqYv/N4OqM3LHHqZra5dQ+jjlPlGlAerNnyepa6rlMrgaHF
	PmgHYYZ4RawXMDoBtL3chnRXYmlbRtSdZWSGyFVO6poHyw0a8BqZMUJknYB5PuLvae6nqw9Bia3
	2IBQj5jIn8n2D6TY5lBRGT5W616J5mMQAG4mVenkFgMgf7Fwb/nnhlsOHaqM37BJKPJe+tze0lY
	Rgz0LBbOUlhr9NX42AsuP/efDg9XXSz73NJZutuV/lluVCV74rhiKPy7EBC8GWt3mL/anAaZPjS
	CHGLWS2NO7R2XaGOFiCQFAfciHH530O0hydnufwAag4de4aSCA9uj
X-Received: by 2002:a05:620a:8d83:b0:7e3:4415:8dfe with SMTP id af79cd13be357-7e344159862mr1014487385a.59.1752843271759;
        Fri, 18 Jul 2025 05:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlL7G+rWZtjez8FqYMyBmgx/fNiSJjpphmk7YNUHy7EXBZiFWEofOBfgRiW2FIEIVGsw0WNw==
X-Received: by 2002:a05:620a:8d83:b0:7e3:4415:8dfe with SMTP id af79cd13be357-7e344159862mr1014482685a.59.1752843271069;
        Fri, 18 Jul 2025 05:54:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c14acsm1926161fa.64.2025.07.18.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:54:30 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:54:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        robdclark@gmail.com, guilherme.gallo@collabora.com,
        sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
        lumag@kernel.org, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/7] drm/ci: uprev IGT
Message-ID: <7c6suvc6quwwxni2nsos65btzim2lbv7f2u6mz5qbupzpmpzgb@g46wg63ubr6l>
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
 <20250718105407.32878-6-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250718105407.32878-6-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OSBTYWx0ZWRfX85HRkJzR7+pv
 9Jcvjv5KczzloobxoeUqZz88HYZlC6J9NqKZ1EJ2GwZAvitBnlI+PRLEoeJhd7TSWvSaG/dcUcV
 vxSAkkqXLJk1hpwgpc0pfMo9mIeCY+FQx8U9Y2L8rqvky1bn0ZIutCM2Pdd+DC8/laMLOFOVbDm
 RWa1dSujj5smNM4hsenHyY8kLDTIWAFTRCHMkYZznLrzSntgUai8jXtgqs0pM3WqpPcx4KvbV4/
 XH8per6uIP5sQU5op8/3FiVNlajBimwUnnwJl9To5MTKlIhWVCRnskbs6FcLkK0ItVbU13d473W
 fI80yJZGsa3J+Iwj2uS42ivY036S1KexJYJsAONHq1yITcTYLDR/KGvbiZ/f5rFDrJzyk/qzfYf
 8BkR6FN1lfLWHf0EkBe3zujaDujQ/2qmi0NptXxFT4OoRIgmVgSE3VROF2aBE9cdz3VpFNop
X-Proofpoint-ORIG-GUID: wSMJ5lcxEcUZPIIUnO8X6-avoOYDgNCP
X-Proofpoint-GUID: wSMJ5lcxEcUZPIIUnO8X6-avoOYDgNCP
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a4408 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=W7FfGsJSNGCcAvtv9TIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_055434_410415_C4F3BED9 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Jul 18, 2025 at 04:23:57PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   2 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 ++
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  11 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   2 +
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  29 +----
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 ++
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  83 ++++++++++++
>  drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  10 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   3 +
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt |   6 +
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |   7 +-
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   5 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  | 119 ++++++++++++++++++
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   7 +-
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 +
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 +
>  .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   1 +
>  .../drm/ci/xfails/msm-sm8350-hdk-skips.txt    |  73 +++++++++++
>  .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
>  .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  12 +-
>  .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++++
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   9 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  35 ++++++
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   4 +
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   3 +
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |   3 +
>  31 files changed, 416 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-tgl-flakes.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index e4a8f8352cd6..9bf38c077f8e 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -15,3 +15,4 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> +core_setmaster@master-drop-set-user,Fail

Could you please point out the issue / failure log?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index e4a8f8352cd6..7441b363efae 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -1,3 +1,4 @@
> +core_setmaster@master-drop-set-user,Fail
>  kms_color@ctm-0-25,Fail
>  kms_color@ctm-0-50,Fail
>  kms_color@ctm-0-75,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> index 8d26b23133aa..f387c73193c6 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> @@ -1,3 +1,4 @@
> +core_setmaster@master-drop-set-user,Fail
>  kms_3d,Fail
>  kms_cursor_legacy@forked-bo,Fail
>  kms_cursor_legacy@forked-move,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> index 9450f2a002fd..84ffbe0981ea 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> @@ -210,3 +210,76 @@ msm/msm_mapping@ring
>  # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
>  # [  229.758095] Memory Limit: none
>  # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
> +
> +msm/msm_recovery@gpu-fault

Hmm. I thought this should have been fixed...

> +# DEBUG - Begin test msm/msm_recovery@gpu-fault
> +# [  153.288652] [IGT] msm_recovery: executing
> +# [  153.295317] [IGT] msm_recovery: starting subtest gpu-fault
> +# [  153.317588] adreno 3d00000.gpu: CP | opcode error | possible opcode=0xDEADDEAD
> +# [  153.367412] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
> +# [  153.383449] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
> +# [  153.393296] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
> +# [  153.436085] revision: 660 (6.6.0.1)
> +# [  153.439702] rb 0: fence:    2063/2068
> +# [  153.443659] rptr:     360
> +# [  153.446389] rb wptr:  533
> +# [  153.449103] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
> +# [  153.455746] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
> +# [  153.462387] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 2062
> +# [  153.469293] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
> +# [  153.475680] adreno 3d00000.gpu: [drm:a6xx_irq] *ERROR* gpu fault ring 0 fence 814 status 00800005 rb 016b/0215 ib1 000000010000B000/0000 ib2 0000000000000000/0000
> +# [  153.475919] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
> +# [  153.475925] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
> +# [  153.475928] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
> +# [  153.475930] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 1
> +# [  153.529587] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  153.539837] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: hangcheck recover!
> +# [  153.549597] msm_dpu ae01000.display-controller: [drm:recover_worker] *ERROR* 6.6.0.1: offending task: msm_recovery (/igt/libexec/igt-gpu-tools/msm/msm_recovery --run-subtest gpu-fault)
> +# [  153.566489] revision: 660 (6.6.0.1)
> +# [  153.570099] rb 0: fence:    2064/2068
> +# [  153.573878] rptr:     0
> +# [  153.576411] rb wptr:  688
> +# [  153.579134] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG0: 0
> +# [  153.585775] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG1: 0
> +# [  153.592410] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG2: 0
> +# [  153.597308] [IGT] msm_recovery: finished subtest gpu-fault, FAIL
> +# [  153.599039] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG3: 0
> +# [  153.611856] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG4: 0
> +# [  153.618498] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG5: 0
> +# [  153.625132] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG6: 0
> +# [  153.631766] adreno 3d00000.gpu: [drm:a6xx_recover] CP_SCRATCH_REG7: 0
> +# [  153.639162] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
> +# [  153.648502] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  153.650144] *** gpu fault: ttbr0=00000001042fc000 iova=0000000000000020 dir=READ type=TRANSLATION source=CP (0,0,0,0)
> +# [  153.650241] adreno 3d00000.gpu: CP illegal instruction error
> +# [  153.671006] platform 3d6a000.gmu: [drm:a6xx_rpmh_start] *ERROR* Unable to power on the GPU RSC
> +# [  153.687278] platform 3d6a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
> +# [  363.495437] INFO: task msm_recovery:876 blocked for more than 120 seconds.
> +# [  363.503070]       Not tainted 6.16.0-rc2-g0594d0b01a7c #1
> +# [  363.508838] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> +# [  363.517142] task:msm_recovery    state:D stack:0     pid:876   tgid:876   ppid:274    task_flags:0x400100 flags:0x00000009
> +# [  363.528876] Call trace:
> +# [  363.531554]  __switch_to+0xf8/0x1a8 (T)
> +# [  363.535703]  __schedule+0x418/0xee0
> +# [  363.539486]  schedule+0x4c/0x164
> +# [  363.542986]  schedule_timeout+0x11c/0x128
> +# [  363.547281]  dma_fence_default_wait+0x13c/0x234
> +# [  363.552123]  dma_fence_wait_timeout+0x160/0x45c
> +# [  363.556947]  dma_resv_wait_timeout+0x70/0x11c
> +# [  363.561582]  msm_gem_close+0xac/0xe4
> +# [  363.565405]  drm_gem_handle_delete+0x74/0xe8
> +# [  363.569951]  drm_gem_close_ioctl+0x38/0x44
> +# [  363.574297]  drm_ioctl_kernel+0xc4/0x134
> +# [  363.578442]  drm_ioctl+0x224/0x4f0
> +# [  363.582050]  __arm64_sys_ioctl+0xac/0x104
> +# [  363.586292]  invoke_syscall+0x48/0x110
> +# [  363.590254]  el0_svc_common.constprop.0+0x40/0xe0
> +# [  363.595197]  do_el0_svc+0x1c/0x28
> +# [  363.598705]  el0_svc+0x4c/0x158
> +# [  363.602035]  el0t_64_sync_handler+0x10c/0x138
> +# [  363.606601]  el0t_64_sync+0x198/0x19c
> +# [  363.610465] Showing all locks held in the system:
> +# [  363.620406]  #0: ffff0000840200a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x18/0x24
> +# [  363.629412]  #1: ffff800080d7c2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x15c/0x57c
> +# [  363.643169]  #0: ffffbd9c0475d920 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x18/0x1c0
> +# [  363.654158] =============================================

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
