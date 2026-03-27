Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C610F286D
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2026 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aa6hJTXPxf/HMqPvScEawbuCRNVM6HbzArs7qXguyDY=; b=wB/v1y/y/7axir
	UXLMD/U3aPaA3UZI/JDW7Jkx4ZgdvvySQoTbHuq7XecBeI3kjNDzInDfqFPFAYsSad4eb/gZhbMul
	DyBCKGwY/Vq5OO1Pdlo8p8oh4gKUjQ2OnGsNO1Ziq5EBS7acXuAd3fR1mGmiNYIaREkON61pMeWwL
	ILggauUqIUKE9jhHH3koOdJ8PEUoPVWSH7fZrIomB8VMX5BCgnyJ0LaSwYDzC7rJM+s82rmzH/06C
	K9wOmKMaVzUG63Bo+8nzSca+gWSYCAHCjvShSIs5SELgTvbi1SBRB/Sdphkw7TKr39eUy5PDGp9TW
	fzN6ajS6jI2FwA8ihNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9r-000000087hL-3Bwa;
	Fri, 27 Mar 2026 19:47:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9q-000000087hD-2LG1
	for linux-amlogic@bombadil.infradead.org;
	Fri, 27 Mar 2026 19:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=dDaslA/h3Afj9hDuKKm7dKDhPB
	q3L+W877BRDtNU9rU7/9inDNpwL2xukuJ+gp4r7cfwXr7sGbu1cCIdcS6o1wbw9c/QXgiJSf0Ur8Q
	0W3k8NWrveh4HJVOq/8wpI7mJEWn2uL+NgNpNreyl8S3M7P4ZsbUtGAmpY+AnCadNDySsmo8/wdTt
	Qr4NW0DKOXvJOmdT9EY9R1bBtjiJSbqvNmlPed2TSSLBuif2Y4caUUttg9NcgZZIZj2Yy2tswkG7L
	iGHf6+REwO2N02gnXLwbNlnPgIEgzx7v3FZxcXYpn6keLcRhB26fUrHBpdpUUXRinABkoQhdWVJwW
	nWGx/WvA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6D9n-0000000BAE0-0jCJ
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Mar 2026 19:47:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2YZL3658996
	for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 19:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=; b=SLJ1XQ9AUQtF+mV1
	C+LyFCxHX37K4YVqKudiM9weqXdcz1X9S5iKJr6SpWiGbun4XhyzS1YpPrnMZcPc
	a4uvhMKKdJYq4LEluqfWrHoUEtUxNpFJnd9GPsdrdxEv0965ePL1/raXo2hGrgnY
	ICI/Rtp41aHnuLZI7WfCTj4I5pKTE+WO+WJwBEZG22YNYS8BGGm57AW6iolHJGKC
	iDUMl5QGggfhTNu5VQTXwSxMj5t+pIgrh+mI4hyXHQlxDbhqIPFmQ6m2HKWDQiK8
	jj1jJHWn1VlxRSHnBDICXGuwp31kefUJZxqCevOKVy9bMaTxahZN8bMSoo9hglCw
	A7tvZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12rce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 19:47:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso116511481cf.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 12:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640863; x=1775245663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=Mq8ZAdZKA8Ni0UHC6IDP7/rzUa/8ov2X3JDIvrSh8xYrQBviL6tJUNNnnKkq1/hzko
         rJuczsOwdO4KkBZ6Uzz1h55Y4slzHKmD46ZlmDGLc9Kj5yFnj5rZE+5iVB9MalttkkQ8
         /tuqUOFqV3VDbRJH/JgcY4UXTP6b42nMrwgvH7l6U+5i7B3o8PKkftswZjYFqXBerMU9
         b/ZC+uACAUTShbPBtzdiR/RgKEhJOvrM6XeRXAe9LlYXPskP0RC4FKSLlWyZf78gEku7
         j/ZXYp0YaKu0HV3XX3K8aC7u+g0KovY4w++TlDSY7v2berkV77d7UE7dfyzhFrLiJ5Jg
         ge1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640863; x=1775245663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=teVHKGkb5tER6UyOM8vX2vU3CT20tkmDTGularD2JzA=;
        b=dJhXDhXoEcqkBzMEwMCOKQ6l/KvZTXAbl1qBQND597hMiXUYsNZwWpX5CEDCziIvl2
         sRRj5t86V9fQhg1DRB+s1Ry43Ahe7K5xMBXOKAmwMbBMI4TJXNvwnzpYaJAmb5nsj+oN
         FabCDgUSUviV8qm4h6Rc6IHVowE4bF4/kN9siqiBk/tvU9uJE9ALHkFmIFKCD5D/d6qF
         U578gZrzW663uQ0Z17CoQO+Ze57UMCFs4NGOTAnop2YdE13J4gyQMZE5tcGISoLBsPwc
         XlU15tsPWdx5YCXFQmr0Mizm/ds9wPDeghgnKUJSyHYMS/jEzNs1oLWRxTUvRz0aptan
         y3ug==
X-Forwarded-Encrypted: i=1; AJvYcCVXHVt4maplAZdT87TAFizVSwSVVU9sxf4VsbOH/5eg+Ka3N6A7PlnNiDfcZiuYmz0ilTZyuNccOXdd9fw8@lists.infradead.org
X-Gm-Message-State: AOJu0YyxklmnhZ9q5Oz1lJXt+abPywoTt7HGd7Ki7z5eOImoro2/ipNb
	ZI10rgvX6Qk4ILvzMok0/JGu5BoJOYsaYSF/ct9S9JVv7+LujHbfj6vjZqfH2/Q8VGpXpCfre0K
	1OvJM2BHwJk+KiWziuY52S5ORxZWf78B4BE8joMa4YI/2XjMrxmn3kI4IPNU7qTj1W6iVbACj0Q
	==
X-Gm-Gg: ATEYQzziS7qbHl0s7GUZu8gusM5zn4Hwnl+m4wUu8MZ+3w/D4mt6TU0augtLEBEOxli
	7DtfSGr+m4pr3kqFMrtbyEbCWavl4pdnAu7swVUMJl+bcozA97JhvM5LtNkhYJ6GjSHfsQFrLoK
	jGcaxv1xfIDWjKgX0MIHqPReZYZd/ijwXoacBJsA/4toIShxkOovrLEIbBR2smZVeyqquJnwRlw
	IugL24oqCSX8b0V9eEJuvSLk5EIofKWifaC/CXbNjMuxaKkq7lPUJHSQK8C5OqFx55JdD2DQnZs
	I9BzN7CAHZp93ITXBYOZIoZqXD5uMvx8WQswBAuoCpfKhxqY8L7bgO4ziYhdXjGKE8UKrGoO2dk
	FP0/+U80azv+vwZSzKEaaRgwU6vs8Szj7Jl0194QfkDllUNvqP31xg1yHjkoM1t74tWYHIMjL1c
	NNvw9bipo/h/vO592nm7bwjrQAtpJ0iQI2
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634481cf.5.1774640862841;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
X-Received: by 2002:a05:622a:4188:b0:509:238f:ad8f with SMTP id d75a77b69052e-50ba37d196emr56634101cf.5.1774640862390;
        Fri, 27 Mar 2026 12:47:42 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:47:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] drm/msm: add RGB101010 pixel format
Date: Fri, 27 Mar 2026 21:47:37 +0200
Message-ID: <177463970769.3488980.9125473167622953389.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX2D8qfA9163GX
 FmlMAISqpm/JHYj1ZUIztu40COUSbPFDCk4/pJongtoi7/66OQTyNYRxTEuebguC6/lwoFdPZYf
 a7HyZpuPxCshmDmX4tnQdfXQpmaa61VcbzB4p8hoXpp/zjffbg9UGdGgWJG56sw6R579sygQgaL
 sgXJoJPHP4tPmnXzGI7kBXhhD5Q+1E0iSXVZJMIJVIlto/uv8pw5SG8SY7t5z4cfSosDmXQ4boU
 yXErGZ6ksSo5UmzE7WNlaEgH+u/VJqw25ngvX60AZGsCYMUbkMsZwt4VGMILC7hqYdwgjwTzb3D
 FP5dW+DuSvWNgQlj6pe1gidascbSCDpv1j72mRk4D2CMYMC4l2WNwO4eNgECYGRCR1ZLSTfR8ma
 a/pDFS1ETlWONxqOztWs0pKCTIFW2a1HLeLd2voqMiak9g/GCiiKjgo5V/5ZrMzwpDD3+qcJ6AN
 TxgPKOibRPT8IOfg4xA==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6dedf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=Q2NTn6QYng6VSU78D54A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: PM3sNISdfEhedz34Hy3Wbw3wLqZli91f
X-Proofpoint-GUID: PM3sNISdfEhedz34Hy3Wbw3wLqZli91f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_194747_480848_0AC0F6A5 
X-CRM114-Status: GOOD (  10.93  )
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

On Tue, 24 Mar 2026 11:47:56 +0000, Alexander Koskovich wrote:
> This series adds support for the RGB101010 (30bpp) pixel format used by some
> newer panels.
> 
> Tested on the BOE BF068MWM-TD0 panel (10 bit DSC) on the Nothing Phone (3a).

Applied to msm-next, thanks!

[1/5] drm/mipi-dsi: add RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b50dc1e54750
[2/5] drm/meson: use default case for unsupported DSI pixel formats
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a780b7f6c8e5
[3/5] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/913a709dea0e
[4/5] drm/msm/dsi: add DSI version >= comparison helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a65c4d30988e
[5/5] drm/msm/dsi: Add support for RGB101010 pixel format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cebf747abeeb

Best regards,
-- 
With best wishes
Dmitry



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
