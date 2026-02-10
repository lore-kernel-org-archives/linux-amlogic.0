Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95504EA3F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Feb 2026 22:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc0voo6GB62V+hGlADhiEsCr/VGq+IrPGwr0ijcXJhM=; b=1FSXqsIWkIpEGV
	DU9EixOsSMmqMVHzx2WO2rgzT5kyrAOO2VGUnXb6lC8Z0+hSx2aIeQVoPtpCt65vDk9g2Bg4YAeUy
	2z9HveyGXYUYPRVSW9oGF73G4ZDmGWs6S36kpnlJsd7RD1AtT+LcUJRXAnc3b2sbKzAhkyPsaIWN0
	ApOZQ60omGwcKAE/ycN0DV9H+sLemZXFdN4z1Bz1yiILeygb8hACJY68/aj6IF9IDRjA/gtAqYt6A
	JmyW7EwM13oEMaeGg+cFdiXsmvGj4CBjTwogNXbqob643Cl6cZOIt2NKlLpN8l2eX1Dr5GecS19Qz
	I+j0Sx0BazX54I2gdqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvz2-0000000HYDj-3m3Q;
	Tue, 10 Feb 2026 22:13:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpvz0-0000000HYCE-0gyU
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Feb 2026 22:13:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AEUiFU2169132
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 22:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5nTCr+xuryPJ1HpVPDG/DVIr
	pdNtB8DMTFv7L6Sd+kc=; b=HdEnIsj/u9lznKcM+cVpa5eAlJjqKYDIdfXWleDx
	ILcEWqi3xNQPG1uqcdNJVKuH6RDVfPeA27IGCPyNzunTkj3rB0UhqAcxY4CHCpD4
	osOg2arsTz+URJlKTNL9WtjlzrDlp3XOhEyN1gjO1N0V/LIakS4+C7WPkkZr0l2G
	APeufA8GrK0do4Em2NyYow+uauEPvQFQ1yxVRmkfEmo3djaLnTLDVD7WxOLQhlVx
	IgOn/GWSYha1OJBPHRg3pPAkGLKxLapiu+khCOPei/UcpQkl2AGJgXtxW56eUsqG
	awmcAC9T8OxeFQHXdAtBuoYiLUXQLjYrGYx2WUDp356dXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drtw21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 22:13:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ae763d03so149613385a.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 14:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770761600; x=1771366400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=EeiPBfSHrDNRnByW7mkxoz9JSxlX75hmv+7JZI3Vrnl4hIX1epc3OMc8rVOqD+lEio
         LlHbypkoEVhMYQPBeLoeUUaHzGMRjCfCnW08RxkPmA/cWwIXNETjYmUINkXFoSUV91bP
         AVU+hYFioMQOPeM+lJtfiZxOtFAToNWYEbp0uwIEnTZvX4A4txSvaC9z1DCGsVW39wKB
         mqAoDjhYUN5lBDumomCljTEGCtg0EwWDq5SmMzXTgcIF7WZNUIDCutnxNqm/gYqDTsm4
         aTToHkqY1NXTNZ0EyxdtrfYci+sfE5l74/GT+YT6My24EIE3QiRZnu3W8ECqFd/3se9N
         z4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761600; x=1771366400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=CO/iMrhE7N2x51PkGL8JVZD8WD0pVz4peAlKOD5X9hUAnfh3YBk+hOACFE6A2quEmw
         tGf32AqywFLFO8M1QIYeEoZJj08ezevYH00vyvyzNinn/vlyyVzKgMDCDcr1VV19SzEp
         KgIyioncvaBBaiMgMuufTuSZGm6AobaD/27UHwd8qAPCB/mKXsfL3k5iOQEAXdfjibfz
         fzffGy3is8YWUyPVSi+FX7qznkaSIGVbJsI0Ejbo7UrUbvpcDdi+4UXpr1snXTRXDJ9f
         WXgviw9R5Uql7yPvptw+Y+JmqKKFwYc7m4j3NNcaUMbyUWaN6qt/DnNFXIkKayWw2nZI
         MlgA==
X-Forwarded-Encrypted: i=1; AJvYcCXRgEDLL2/E+hV8EGRHxgbeTSCGzuii2DW+fRZHzMWThud1RAY0h2Ce6veacFAWDzbi2TuH80dJ+KuOr/oi@lists.infradead.org
X-Gm-Message-State: AOJu0YwLMBMF6m4PA1P0j9ewbqPtn9q8GSr8x8E+6jcHMWEYlUoYEDy8
	p9F2rbIawegGrngYZN/ARP4ATMeOs5YIJ1ojhccDtxqdCzLm6DhsOoHzh9L3t7iJi15ISSIDz8o
	ZdXNgpJJ0mmCfDXTsMuCSOw5GZdWsjMWeLPKKsw9q9B7pGW3Kj+XyO4hf2yqpbSToziA8C0EcaQ
	==
X-Gm-Gg: AZuq6aK/woXzmUm6MXpi8P6Z5AwD34QTEuiex4BJ5tH2q6OJN8gkkomQ5660Eq2KNL0
	zvz7Onf0Z0KTQw+pHY3Wz19C5YDYf9tQ++EGr9NVDHDvG4uoBCNwJNUtv4OmIk0YFPIPKKjug3o
	1/0pBXacxUOzblgdpcgVonxW9Zpc2lAVmeo6KOhcFpfKGsLw1PhQ5dB2Zb4CizbZG3qtecdP/ZK
	snrhDRZESqL+QogXQBC107r0Wp1IU/aksGkry49uCwPyEZSpHdFmRXGMoOIrXOUvf2Q0FVoYw7t
	UDMV2vp7fQfQoTvLgXGhE2//j66BGAtdDq9gxHltggE6PQGtSE5g8IeS3tpNe0ahGmXrfSQVu2a
	euLS7dVeLniU3KkxFOoJVpc32EMBSHRL90cfN5i5k0K+hW9JrPaMMYZ8yJ8ITuWIdMjYiFo1VE9
	9gvO8PekOnyRG+ja8y17enBYWL03hLiy85Bbs=
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257941085a.70.1770761600399;
        Tue, 10 Feb 2026 14:13:20 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257938385a.70.1770761599898;
        Tue, 10 Feb 2026 14:13:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f72sm3521414e87.2.2026.02.10.14.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 14:13:17 -0800 (PST)
Date: Wed, 11 Feb 2026 00:13:14 +0200
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
Subject: Re: [PATCH v2 4/5] drm/ci: move qualcomm baremetal jobs to lava
Message-ID: <55cjkwps5sfd766uxab5viu36tez77rnrlnabocqb3o7t5hhr6@nydrmwbimnzj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-5-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-5-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE4NCBTYWx0ZWRfX7UbcmFWZNuY4
 EJeMO0DGux/U5QHIz9kIzgItzPZjqSGwxL7XUK/+4rYD8H2fDOFyn3CXsfi5FxnCdrwf8PuJOc8
 DdIT7S3hFmWXj5J5QULfldambsw/mKL1sbJgt6gcxYPMZHC4NRJIYxLr1ra3c+AI3dd4pWTJKc5
 wmJQOWrfFbtw7fgPciJUwVivRrExbjuyERaZcwCgZ3RSJ1wJnfmNmG/St7w8JTzY9pxHsEQc5m0
 AmgFjWINZn6M2KwsczZH5/4DNmHieQsN2u0LMOhA5/dYjTVBWo2oMMAw59NWZoi2MPWywUV1PPV
 S5pI6pOjfX2baifx+M8KqIhK4gIC8nIBovjIQWXrf0eLzUJi65Ek3jMRU0t1tEs/WzTFeHPrwTj
 Ux0g87KfjN915RSAluYGfWG89cvkzejuR44WGp1Epwf/YBWqTmkRbFYIXZZmDlE86FwkHMZQAxX
 QZrrpzqmJWwtnl6/o6Q==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698bad81 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=9K-sheTcyn_FmZRYi04A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: r621Mr6D4gpr7LMn7-7uFdVeafmJEU1k
X-Proofpoint-GUID: r621Mr6D4gpr7LMn7-7uFdVeafmJEU1k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_141322_217448_2F915431 
X-CRM114-Status: GOOD (  13.50  )
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

On Tue, Feb 10, 2026 at 12:41:33PM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 41 +++++++++++--------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 31 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
