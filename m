Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CEBCEACF9
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Nov 2025 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFtvv619v4yUnV8qRypNgOYrQHBgz5Ijwh1xYI73aW8=; b=wo9WLS3zh1Xkew
	GwbjbuVxT+8TmqbTT7RBJ0aT/0gLVVlRf5MYuns6ab3r6hYJWwxzGXn9Mjb5sqkyQCaPEKxSJkZ3g
	dgL5IgUzggM0QnP7wY6mxaGP0OI3UEnM3hrz6TrUPrWtHcCczZ/DJbv/JIJP8Y+RUN6DE90S2Lqb+
	UNPib7/fQQL7OlFzRubLw8PtLWIUXzG9ba2JyusA6rsfsK9Dl9G9ZSAV/oZbWFy5g9gmswqUQTYXx
	dFZ7akxA8r3dhZy3bi/3wkIlYPiCiLWVonpk6ORcf316YoEfoAvKnVa3SglLDFnxhI735vpf+OvdV
	9YfJw7POqvID3qDGZPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4UZ-0000000DIlS-00N3;
	Sat, 15 Nov 2025 00:50:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4UV-0000000DIjj-1wES
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Nov 2025 00:50:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF0JoxT1136448
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 00:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qs9XNl6C5ygh9qZUkoG6dSnI
	2cAtbM33aIVEqpZU3HM=; b=LxUYZC8H3vZCJgDMaslziF+/Q+DGDpgidTjmxz91
	36M9bXPQASL0FtjnxYfrUVa1RxfX/6Gx0QRblsZWir9/aZGk9+AO/Bx7/lK6htOu
	Kld39VgMAHM2tQvShW6rixT4ooi/0ZDEkCQl+CHmcUqd7XlYKDhy9nIkb/l1G30P
	8MUMR014eDXOtxX+gjWzx34mcc9JA6nEV5BeVunCkD+NB3z6IefYWUeHupCjzzTd
	AzfeiCztR72AYwahKrSIIHEMhcWT5EQsRTFBaSGjKloFPxSK9SPAbPxvOhpNAzVX
	fLJMN8YRUPS0S07zPbKtVfvjn6QEYSfcvTnlirAT3vmhkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeevpr1r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 00:50:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823acf4db3so73274886d6.3
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Nov 2025 16:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167810; x=1763772610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=EBDrYjBSuS2mXLaq/wIXjr6kDLPONQONu+w3oydwcBsI0gRKDb/L1alXYPhBnq98Uc
         3NVR7++BNrXppR10flgUEQDc14WRppnr6Wv04SafQbTGVLwSk6e+KWh5UIdlQD7AP4Cf
         aHaIh42+QinsmCL2zTzS7XuzUuwByMSeL4Eq1AjaEzwfziKLiMmQVmpF8GXnf5Vpv/K7
         CoJEDr9CHQ29iacARH6nGb15z86YYR/E/0L8qJqKpALdUtircHOesfL1aEZO6CwI3JQn
         zMeneqYC4a7+f39RDoH6eqlhgK5EsPjy+5kowY3mZcw9Lg++qt3bCgDyWVbppQTCbRvk
         fYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167810; x=1763772610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs9XNl6C5ygh9qZUkoG6dSnI2cAtbM33aIVEqpZU3HM=;
        b=VMfMGMwa2p2z/ao+1DBh88UhEFPnQVk1mP42CWSPGZuZIw3R4i0tLRQWdQhU7HsNJg
         4yYoo9PiN3oK9CWqLegEjMwtFNyluAJfzxeLn7zYJkWhbSKqVUNOB+zgqpMMmP6VxLIH
         FCykJXNREUfRlsGj8EyN9s4R6dYRDG+DA9YJ9GYiErEkKgXgVFSc8yJ4EfzYRDQhT/wt
         B83HGLhcUtnvwG3gxs/jrsY+Y1mHA9/EAu+a/Uno9wQkBrLF4qkUSS0sWgkHkTUZHaMg
         92dN5zo2F5DXpx/bp/2os3NPVosY4+qVunhKyWvzZa75qv0YROkDCdgM3Es9pZxotY9d
         eR+g==
X-Forwarded-Encrypted: i=1; AJvYcCUQgeOZcovsaTJcta+N8+oNPGI9FiIV2Z/euPTL5ya3O55ZS+LhvdbTql+bWqlUIRBdxOfGgh64Pi0lDfVA@lists.infradead.org
X-Gm-Message-State: AOJu0YyinEWZm8X1bJRNHaOFtfn4ts6DmyxDfwcotEg6H31lMgQ+9a4c
	WE64q6BVBna+HL5EmjBb/vCbwYPQU7PAM01hyfkzIkNdfV8/T82onf+BLDNazFtX2PxvW3+aDuf
	1P9nMvd0lXWqAIkl+eiVH5KXKcuQmoXkf9HpLYWpM5OVX+3HJIL/uuxEEac9Ip0MwjfULUGa0Ng
	==
X-Gm-Gg: ASbGncum1TlY+FW7TPpcXyuHbsB04SMh6iLAzLSWmSgDe+ZcrcVmNd4MMVFVNiZO3U+
	7SDmNo3X/f64Yj2mIqkSpsLuW0gjNsvG+csoRqX2k0ERsaucsJfbsnkZdyC/5KpzW3I4zROt3J7
	UUu3bGdeUm59UYppstJjEYYvhBuf9NPGH/eN9fPyzpJ/4TWD6sLWKkREwAT6fDMVKVzZqe18yOk
	VEbsKPkdriR+uPG64v4B3PyiQpflowP22lq8+EYci6lBd2Wy05I2n27alNHJ1hxa1r0Q2qNSsm/
	u0Aqw1EkV7KrmVVmHYbJjI1RBT5vthG2nttfNfDizvjHNEUmuRIUQcwCfq85v1G5C+sLDfNu+Xf
	gfJZe9LOWXN/BFIP7P/wjzjEKtXnE0Ta720hL8TBkE+SyjxUeNaiycDq4UK+BwonI3UiPsmAPxN
	RHlvnqCEYXqjsO
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113396d6.49.1763167809710;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjIFGATfZLfaUZaE3KWR5c8p1sYfBsOVpYyQEawnaMA0DTE16Ifr+U3lmX3Y+76mKypsKpog==
X-Received: by 2002:ad4:5dce:0:b0:87c:1d89:a245 with SMTP id 6a1803df08f44-88292699d47mr77113096d6.49.1763167809268;
        Fri, 14 Nov 2025 16:50:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce0822csm12716841fa.10.2025.11.14.16.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:50:07 -0800 (PST)
Date: Sat, 15 Nov 2025 02:50:04 +0200
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
Subject: Re: [PATCH v1 2/2] drm/ci: Move qualcomm baremetal jobs to lava
Message-ID: <ursdbkco5n734zhfqceztib4b6vxb2juq5jfllzcjeuctd6lvn@dbdbkbr4csws>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-3-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-3-vignesh.raman@collabora.com>
X-Proofpoint-ORIG-GUID: efXgSHVwxRnGMcpgqINYGF1dMqqrfy6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfXyI7iRGngbEjs
 OvpS6q2AIT8yxUDh57RlnYhxOTBBokaxAVGDiflIV38ZB+UMvPmAt20S7o7g1sLThT5hBa8SzKG
 UPEyC2ClafLeS541d3W7DGdUHWX/yGufnP2bH4GK2evFYIa5o2nb3TJXFaPYCeHSwJJrJPUGUBw
 NzcUOvpW+kMzrBsO3kK6Eqtq8xm1W9yVtwjahQrAzVuIfuGBDaRBxxgZPmLEnbU3Teie/k/1eiC
 GWoHssxvSzKcJg12zBHL5C6FqIaSOtZcCXfKF2k12Y+pKVxq4mUO1wT5AQfdU1G5o7tf/N6jFEv
 xK61jVBNsLaoxdZe4UoF74IOYEtdpMtMxsc5rcZoDdyOEGXgluh6Th9G4MSt+mB3BfAmjAcYPSh
 iynhVUTT5g1neZxqpyYvH/4ok+4cCg==
X-Authority-Analysis: v=2.4 cv=NLfYOk6g c=1 sm=1 tr=0 ts=6917ce42 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=Oc5gQ_T1tCqBBtY5fQkA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: efXgSHVwxRnGMcpgqINYGF1dMqqrfy6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_165013_068405_3A57659A 
X-CRM114-Status: GOOD (  13.41  )
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

On Fri, Nov 14, 2025 at 08:30:51AM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 62 ++++++-------------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 27 insertions(+), 42 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I'll try picking up these patches through the drm/msm tree, if noone
objects.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
