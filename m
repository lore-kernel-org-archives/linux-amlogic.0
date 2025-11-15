Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCEECD4F48
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Nov 2025 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJ3ELudTcA5sWlLo3OU96QOGXe+6jsmghG17RdPoKTA=; b=RGO2+92dnMGtyZ
	rheOq7XyYQFgb7iyoR41MQHr0EfM5ffvlpBOpNJEwv78yOd6FWXfWCObjcAa2lHaPi0moof2muiKM
	ubGKMCkgpRWcbdmYcfJsYWOXuZ97hgxNLIXz1AQMxaxUntE9HKyXclNgpblPhqKwwuSpwkev8R+fv
	Lx8C207ydAt96mCJGkJu0O1ty4IOf+Boo2q3Og8wHSIVU0KFjBWtH4Fe8M0ogKQUMJHlmnP3p8pPM
	IGfi3F8yos/RW0iOrYGgSTxUqAuQ1ESoPO1e2n8hwtocoYcZzFt7WmAmPgKCP/C7F3nw6e9auBSeC
	SVNA7eGJKjt9ZAuDO1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7Np-0000000DRHV-2rPU;
	Sat, 15 Nov 2025 03:55:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK7Nl-0000000DRFr-3iY2
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Nov 2025 03:55:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF2q95C1502150
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 03:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kpUJE4SYKU9ynxkJ/T5JJhpa
	CqT/i8ZykNmysQrjF+s=; b=V9xyueey6blpzm/jfavsSbhlfoxZqh6ziY9GLiVo
	pRLERZ2MEX31+yuGsAhlfVnpx49LUnkivh7VOeVkX+iEZCpUszfAr6RWAvx/GoxG
	ZijhYK8E3mzyIqhG1hK2L5/w9DdedzrozrD9Lv3PvXEGCefrjA2nK2F6EPnJkN5Q
	59YLYTARTJ+Imk6JfdjaS45qa6wSMYck595UYohLzKOGwUnrjp4w0vmLrwRUpeB6
	SYq4g3sGHee1nq0e3QSLce0NkDu8LM1+cCMEAkTcfdWp6FkDpecyTGsY74vra0rZ
	jqFpR49ENgMSjHk8p1Xtfaa+aw5Hd9R3LM0WfZoyiVfmLQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeh3x834f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 03:55:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8824b00ee8bso41889816d6.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Nov 2025 19:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763178923; x=1763783723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=XeKPjhoHnUkU6kE49OaBA3vKXwMMbXzhzwjANN/WcgdkG/Z+3NEim+xTKTefTL7f2c
         hpEGuNFw9RzceZY7IhtHd03Mjs10NKPwmk4ZV/eMp0piuq2PZl5uZSfiPDTGTeqZh9hC
         M074ENAIfwKqGvKlLHTzoHWOlugql9p+iJY/fzKe/PHN9FsaP8vs8gHe/KP01+mhQBIT
         szMPrQJkij9AqpVuK5WjyF/yViaKbTJKmP6PYsj1yGZjoDd4Dxb0zTsYriD7DUMjWTZ/
         kYZaz698YT/WjJ16XGdSrA/QPUVyjiGr+9usisbrfuPcHjD4Icf8/DCZw5w4L9ZHIU4O
         k9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763178923; x=1763783723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpUJE4SYKU9ynxkJ/T5JJhpaCqT/i8ZykNmysQrjF+s=;
        b=ewslWKoV63XiPTRCoKXdF6fGhw4sJOKZThWnfAAPrSzIHH67ic10olPE0sfsEDLCkX
         u2u3S7F0V9vIU3UD76VF4bdSUZ6EVKEBHHBJG40eInjKYY4SToy8zoiz129/U0OYXif2
         9WEk0VFzUQyhmptVKeuYS41iYr+FNFH2jNIRUN2KE5TMm5e+Isnu/3gNhwpQ6UGvNXcM
         /Tf3k8iW/WGHRT3oFFNlM8Eav/RsYvvCnPCafOp9H9psWUyXTyDBKHtyktTNP99+GaOW
         hpzdMKJV6iAuA6VgWOBKRsMbB37xZeEVNN7OSS0DLOjrQIJ7Q7AkjZECz2rEo5YiZMLs
         U8vA==
X-Forwarded-Encrypted: i=1; AJvYcCXSdaqZzBCXYEmYxx/gH2lWA4jNWyduNNQyCG9VAxmLToj9baDQiPQUH46saJv3SmBAKsxPe6Lkb1Ox8yR6@lists.infradead.org
X-Gm-Message-State: AOJu0YzNn6o+b240A8fa/nUcTkgt1yCDlX2WD7W0JtRGmSy7rH2YG6p/
	vQ0aM3DPWdP7kAafdJnKSigJIsTyXp5TTNfyrpVAWKimEqGasTdzJz/8ue4DW/vOuwb49Xgha5W
	tfQbdLFWE3s7dNUFC97HiAQQCLqbKFaXDT5Af6a9H942rSXFiTuiVKoiL0IxZdgSjQ1TcTlNeJA
	==
X-Gm-Gg: ASbGnct8uMoUehK8DpkqgzI1w4rb1M1MT1rSMzocXhs4eFd8TA1XB+/cGAmq1psjxfE
	1+bOMTxtVHwPlbtZGTffuQbIvWxELoAgS8x9XkTgkGOksMcfbTD+0gLh7U5FPkwUTunNjGaF+0R
	QBmqsQmRSNEicW3vkvhhyuEvSghv7EYriXsuqHf8eUbbILhbYoS4+gf0nrsVoPfSwKy46f1ggk+
	a7X03IKB5UcBhPYSpTbBgt5JigMfyadnJAcHU/UdmfP/wEldEKTy1a2NBxphObTqGQsDLnH4P77
	CEe3hzC2dFEmP/WTIV/R+/9XPTPgg3VwGzYvi7uhk8VzDEob+cG2aaRmIMXn8uZPQA1RY/iPwY+
	HsQrAOGDv3kfR9Gjnt7mAhumxFnbOdQzV/nUBSZe9bb2OkuWHe6amM3C9Z0qCWfKxdAQNZlMz1t
	fdmOZx0uHVtW00
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893286d6.26.1763178923085;
        Fri, 14 Nov 2025 19:55:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH21xNZD/1SaQbAJXQ9lzSs2ET/wK99qDySnRnPvmoMPz0h942r+lDos6cmgLn70aSgdH9ifQ==
X-Received: by 2002:a05:6214:c65:b0:882:4dec:42b9 with SMTP id 6a1803df08f44-882925f280amr79893116d6.26.1763178922595;
        Fri, 14 Nov 2025 19:55:22 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040c7ccsm1449901e87.100.2025.11.14.19.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 19:55:20 -0800 (PST)
Date: Sat, 15 Nov 2025 05:55:17 +0200
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
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
X-Authority-Analysis: v=2.4 cv=Fek6BZ+6 c=1 sm=1 tr=0 ts=6917f9ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=E-Vn-V3zxCEcjh91BPMA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: cZPU-SV_7JVBqxOTmiAyThArjbPlsraj
X-Proofpoint-ORIG-GUID: cZPU-SV_7JVBqxOTmiAyThArjbPlsraj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAyOCBTYWx0ZWRfXwufa1WpCFldf
 qi3yMBLdGodLXm1oyCbEIxaeRpuYsnCBahTUpZUb8+Ln4heRTiXRKjifR0L5QyZrBFL53wNanDR
 lp8Ta5CBXjdeJECDwxtfnFt0fD4SX//ZUodC/M+AMF0xvSZ8wiysp23N7WWZ1/4CtOOWi0xG3DH
 4L3PJJn20z8f6FA2cG34AYj+z2drMh9sUYjEIbPauu/8Xtt0K0XTQFrTI3kSsyerVqw5QAFbX1J
 pBmSQrrAQHwYIjCw4thrAHzCgWqw+rLTE/CPfjitm3lD3qPWMf2rbPgh6iU+E4tzRkYyHPOFzVi
 k72i9Qoaq5TZvmJCrvtzLjLj9EvCBCC1ddRtNHauYjOCtLf7JSaHQWJm3Q7QBydfxRW2ThcxSHW
 LE0sii5piSj9Dm6E1dDpZ9apos7EaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-15_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_195526_038241_FBCF8505 
X-CRM114-Status: GOOD (  20.70  )
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

On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > for firmware via LAVA overlays, removal of the python-artifacts job,
> > split container and build rules, use lava-job-submitter container,
> > and various misc fixes.
> > 
> > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> >  8 files changed, 186 insertions(+), 105 deletions(-)
> > 
> 
> Thanks a lot for taking care of it!
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hmm, this causes a lot of failures, see [1] (note, the run is not
finished yet):
- On some platforms (msm, rk3399, mt8173) the
  core_setmaster@master-drop-set-root test fails. On other it seems to
  work correctly
- sm8350 seems to have some issues with this uprev, it cant' finish the
  jobs at all
- mt8173 and rockchip:rk3399 seem to have other test failures too

Could you please update fails / flakes tor all the affected platforms?
Also I'm really interested in the master-drop-set tests. Why do they
fail on some of the platforms, but not on all? This seems to be some
infrastructure-related issue, since exactly the same kernel with the
same IGT passes those tests (at least on msm hardware).

[1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
