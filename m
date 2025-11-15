Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DDFCEACEF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Nov 2025 00:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFHkLNcSp8G2PEizROMrQAizQTKtlbFlnxda4AYsQxs=; b=XAqUwiogUHV7VG
	WqfxTLfckSbKf8Glvmld/HyHTePweRmGBSmc4aBWurcDEwemCU0pSUa/MvHeHP0ZzeZIIksjpH3TF
	SuyHX4JHUUOKmVKiyF9y8qVds2ocbNp6p76tQCn0bqu9gdP7rBTTF89hY2u60nul4Wb3HtlXxuW9w
	7z7drHxvcGjd05ddVztbqaqDFiwK3r0Z1C6iyX5vDVJ8arA9E5j6Vt5uKzb5zIGzqEA98V3RlgN0a
	J+fGIocGEJOTMMHVFPJrAPOmH5QrllZ3tlABdBw9w5Ge3nrF0jFa9kFKN8N0HVKk+cuN8Yz0h7vzv
	gO4QiAVSfXXGN0SgMRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4PZ-0000000DILo-3G4d;
	Sat, 15 Nov 2025 00:45:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4PW-0000000DIKU-0MdE
	for linux-amlogic@lists.infradead.org;
	Sat, 15 Nov 2025 00:45:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AF0gji3837646
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 00:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kHSr3Uxb5gfTp8PMcc+9CNwl
	Vz3omOLQcZ4QTy5X+lE=; b=ODckJlfsAxbyXTtcs5Zm543nzNcWtRpWXJwR+uMn
	0BqB/hWSyd4H8OuVqMp+yys58KTOTAThFhwxlyoThmB8gRaCIJKPfVhkcmZd5Kxw
	lfcbla9wgB++EGDkSmbCH3068Oov13I5BCMuM6f94boSl5AY/bvN+c9GpsOuxyr7
	MycHmceYdsDFwWcDa2NG0gHfD8rcfCSOQmWn8NIYI/9uFIivvkXUR12lN1VBKjT5
	Y3HSvqZFPm2DH+IcfCemhPBe1GISzlubXCJjqLHl0l7FtUB6DIxhlggAx+QrR280
	zmVmdjj2viq6ssQ/HDura3pZoLrKjHWEt8PvJRHceOdXOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aef7f803x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 15 Nov 2025 00:45:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so5155031cf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Nov 2025 16:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763167500; x=1763772300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=QEOyB/3LiP8Trq2pYjR0LmTRAb7qR2XUE4NSm71dAI7KBoL0iFo9E0TnTVnTIh1q6Z
         nWLarVQBKxmBkhNFlo8Km2/t5SkBUKhdPqyYhaU1QK6zCMHgilv3DWtKUEiL4g95KYYF
         sLgT6Oro3lJbPOKjzwkwDmPLKkbHGa84mtbkCZ/RjEOWYeWZ+dfw4eJtUP0dfZYSZADG
         UvgEptogMf7jdEOn0TStiULFRaaF6EpR4vJVUXrL8ZBnCCbxbDzAJFFdl8zF3FL3XirA
         1BWuoYr5Mh2rULBKO7zzu6yd302a2/r+4dE/wrdCMmutVAvdX2wUd+oOuKADzpCF8tv1
         xBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763167500; x=1763772300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHSr3Uxb5gfTp8PMcc+9CNwlVz3omOLQcZ4QTy5X+lE=;
        b=OXZBVGVLzcnVfaRMId94e9ax1hC6FSlgBH3tQCbZXMU2zNnXJGsAm5l0y6+MzBTtnT
         feZEQcLL/E5zWNVTqO9fL1TE7SBv1jvY2lG+0GHAHa3rF/1McVV+qunRMPuttJM5RbDj
         rOJBrjHYUfFMAdPg0moTC6rH/dwAz+cxc0fYtWZevwV9gXbGcOlnbn5CSQp0LbBeetYB
         OAy9oAxBZKwnnMQ6UAZjTwmTAaa/kdiLLpvduOWCRND5/h0ir56U5dMNX+qvZd/iAj2i
         fXoaphdOgNa+XohCNmspZEAEgoBJmqOrXvjNRbtOfHSWF4TvGn98mt13yIjROlb5Hs+R
         WSlg==
X-Forwarded-Encrypted: i=1; AJvYcCX3rdBNMoM1Pg2uVhuuVi4uamp5Q3/BvhWHeQi10gHzGhRUp/nW+d6xsTKo2HGSZ9tVVf8E18D50BwWC0J6@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2p7PNN6jZAnu8b41vEmeH9J7Z+ODq17sbg7xcSNl9SxKu7s8S
	pge2r0eIDpuwzZKo9b7vGvuChmQDqt9ooH+gECxij+Zqepq7VIeH4CZzrshjVAMNEz0R/KzHihR
	rVtADNVbEHOB0SKIlbp5AO4GH3zFF8bhsDZ4HUAWC6J6bksXQAVJTEU6uOu6NmJkda3myovKiPA
	==
X-Gm-Gg: ASbGnctSNHrwEEo0jMGyeHIjJXbtWAWfeaPO9mblICvHwJRppD8H5xv5RrTeKVgpGCS
	s2eklT1JcdKsw3MuYFR7dyoiTnnTFboL9rKaSvLmlg+Hpq6QzlzySF6kcFc5wJjkSlBHwQWY5vX
	91vcrpSq2R09EhW9CeQYyi4MyCA5zukQurP3qIzDHwoNN+UUdAG6Eg5yOkHwNAR2IiYwtHS/z7G
	jO3O8cMziCWwz9t0ov6f1ACcWqCZTlPy2fdbhIok1L9JdWY7Ibx+9rFNgBZhFj2KrDrIF7hCEel
	ofPa3URlBFcfAHiGEjRQOyiJ4v+jcHEr+7OW25u/HqT1vknZILl+8mo0Tct45aARLp0SS43ywuX
	z+inVRBGZqgdoxbfWaQQC277J7/n7LktH/nRE0l1LhftbGhJEuCRd2b0kh44YjjqXe91/lun7S2
	dxYgpgSkgw2IKX
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106378071cf.26.1763167500267;
        Fri, 14 Nov 2025 16:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTsDRVIqLn1VpOlz5z6xTpaoGY3LMTcHDBpzhVsFe6h8FITQwTVx2wdmRWmkQbySXE0rNnig==
X-Received: by 2002:ac8:5dd0:0:b0:4ec:ee54:b141 with SMTP id d75a77b69052e-4ede70699a3mr106377841cf.26.1763167499760;
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9ce1577fsm12961501fa.17.2025.11.14.16.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:44:59 -0800 (PST)
Date: Sat, 15 Nov 2025 02:44:56 +0200
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
Message-ID: <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251114030056.1139570-2-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAwNCBTYWx0ZWRfX9A35z9HrOSC0
 mTpu8d4wb8E5PCYgXFQ1gIjAeN3BJQ1nC2XVCOG/nmiMWKS6QY/uwep1wW54g7Rai3EJEd4Ub1c
 L7OLLCzHIr1Lxhywkd7tPRXgZCJCU8uc/WINluFhmCqu09SmLDKPCr/XRGdjih0vDWZ2jg2TKAT
 eAF4LnFhIjvT3dE905qx65PKkaTDwD/y4bQKRNwtYIL03/SLNoGoAc08aq0RbsfSXpMs3Ez1cl4
 WQYfc3e6gLHn1m+zdNa3RPrCYKo3IzfAtHvd7bYxUEFDxHt9cJig2pHbNk5zm6PqL++2DZrdybL
 XreqA9KmBODTkcsOOI4FHR53QtJQ6HIrRNKph3KpEbPswVZo5o1kL3Xz9dvQV/BLZw1sAb+MGxV
 OQU4cRzy5F4fkw31EtsPjyrgO3ym2A==
X-Authority-Analysis: v=2.4 cv=OslCCi/t c=1 sm=1 tr=0 ts=6917cd0d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=H-B6EOQw763qFByNOf0A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: xcWT4_jU9MlA0ppisqj-jgmWZZnVsOxs
X-Proofpoint-ORIG-GUID: xcWT4_jU9MlA0ppisqj-jgmWZZnVsOxs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511150004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_164502_137192_CC3E54B4 
X-CRM114-Status: GOOD (  13.42  )
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

On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, including support
> for firmware via LAVA overlays, removal of the python-artifacts job,
> split container and build rules, use lava-job-submitter container,
> and various misc fixes.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  drivers/gpu/drm/ci/build.yml         |  22 +++---
>  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
>  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
>  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
>  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
>  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
>  drivers/gpu/drm/ci/static-checks.yml |   1 +
>  drivers/gpu/drm/ci/test.yml          |  18 +++--
>  8 files changed, 186 insertions(+), 105 deletions(-)
> 

Thanks a lot for taking care of it!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
