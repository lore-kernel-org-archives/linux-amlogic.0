Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF11CA9ED2
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 08:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zYcf/0fJzjrHw4X+yJJHxwhfPtA/vkxLv9hv2SDM0ak=; b=WUJQksbMbQLsQA
	U9zJguiiPiGhS34BSMgaLF2KSKe+b1/QXzqRWs6P4pjtvgdm8WLW5TVBaIbbl05VYMApbtvPJLwRa
	+NK5kZitRorHNd5p8DsqSg9CHIw2akTGXfmlu8ao1ABTZ4Qqqch5RAMDx+HpjoJN2SSec9hz+4C1u
	JrT5Bxkvw1wX48jrMRNNR2FPG83hrrEIavfYZi21383WB5cby/SyakxNuyiLZsIRKSXfFPzdt0skS
	bXgbf5pPBwrLerZxvDr6+0mSL81DQg8zOfvu+HYtZO+jfNZyvqFdXCj+JMExHQJ6cKSgQmV+ctg6Y
	ThQ2KfWf6YzAuD2jnzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAyC-00000009sqg-0Cak;
	Mon, 12 Oct 2026 08:01:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGAy3-00000009spQ-3lPQ
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 08:01:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y6oU1216046
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=; b=R/iGb5yh5gV+VzRZ
	yCFEkH4d4rDnR+vKoe15fRaCJi4R42/mdiB6NmcJrF5frK9CRi3rD8YYWU2pyb8v
	OUVigOu78zNtDxDGKQJmQjTq4oHP5b413jrhdmFsg0VBon054OMYK/KYZCZUia+q
	Nw1aiu3pupkVf7mrgTgolwvyR1DMps1/4jTDyCRPZMgbB4BjFAKcdfC0NYj/O9S5
	GZoMfYcCBDmj4obyPe7oZqTlMAl0VhU6mL/9baAWZyug+xKCnMO9Mny2Xel4px/W
	kWHFX2jSt5qEiCBmM6FQsUNLHaYw5hVsiW8VcRGvOzD6Xh1acjR/zrWWfkpAFXt3
	Zgfvvw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0mb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 08:01:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so6409885a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792066; x=1792396866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=N5RwTvWQ0lb1YzdGw8cLRo2iwYabqGtwdW4v4VYPk7pZPhzdaqHA0vbDbBd0AbfLLC
         b2VBmx45xrwIPloqLo07rH18kvrUzqUsIACZwRZF+8/TXyyv3HkFSd/gUbp+5wVJBkqR
         p8EgOR/Ga5SE3H9Bs0C/4WoEIz6GLge/BugCHG52TgTIUwbVTTvKjhnz+1Wee+F4JLab
         2xBgGjtF3uHMygTreHMRyVIov0yOdDPe9545EwbTXN443uwbCkcL4MurbNkozG3T+bzT
         ZSde/kpNqfpk/G4B6Ig99W5wyan90uYIIhQdbOCGe4SsRrojVeJXiuK3PjtNXwyfVAit
         YdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792066; x=1792396866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=HbsN4Os8Qbqy/eLCahw74z84pbBmMlTYAvaNz7/V3AjySf+kKpHvkv3ETKt8+H++aT
         wuBTTrmJe6IsdhRsd+xEWvIpTs7L8KMJG6q3Gm8OKJS1MqUGpiw16VTa1GfaZGY1/Ldc
         nX2rG1KW3k+mzWhnc00YQEskiY0bkxelt0V1bjD0N3DXpcyx0dBXBDSOQoG2YEBHwlw2
         ZEyb2pzxqUCS/9IjvjF64wQs6qyp4rJQzYF1jrDZlK3onYN9Fv8o0bHY/fpk7suJcj4a
         x4t3o9R3aBqrACPjvnmzqBYfmUYyRfo/VKReIAPtAPWoS3QQLtr4lnmESItaTXclWCeA
         MYjw==
X-Forwarded-Encrypted: i=1; AKwUvByQ35fu2w8/dUcnPCx8V/L/vCQsvWtwZfR50pqR6m9Kl6nRK2Ii8pf1Zwx4YE8t86mKwfZm+/e1D6QtK0SP@lists.infradead.org
X-Gm-Message-State: AFq9FYKCEA4AxHTqHqkGAAroJNsscfxcGjOtFQDymj19soY1ulSw3moy
	iRs4tGTiNBh/+d4MBKwHGMyieg6bD6WFQUH36Qkqj8jK4+pIOG8O41LBVIVuUMN1qyTI6kRj/0L
	ahE8nqDnHo9doe3z8tohgOiEfrov0jEvBusaMIsFrGm6iAjmo1LDqrM9IBM72nx0uz/VnUYFyPQ
	==
X-Gm-Gg: AYBFou2ZyrTWQa3P7NIFNay+Tls5vg91hYLxYM3TCT86QVsIxNXf4sq5cgL1CmHLu3V
	CXrAgKjXw7FbLQt0y6nq6UF5Uz8pXwfvIqYk3+mrHES+ToBuNqsAgvIUjVB5kus8a/68hfgjY7Z
	JcRFUm+CNfNyDmYwDibhnkE5c/VFCHQskNxPPkDxDOf8Y26xBqGC3StE7WNo+4bjTLjwD2UlLg+
	HOuDPpc5NFKqIq2oBm2wtYKVE1Ej3TSoXqz1AcrVZU1DxORZtFt1UJ+8OWQELqEw/iyZl7N/LcX
	o2w+w34ELFy0ER1Ent+taXMM046PF+3iEbht+W9A49fckfz2mLhNWVaxl7kD7CbVgRcpZDDjMu+
	DygQcc+eyrz1kLU55sUXzQQ==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661417585a.4.1791792066186;
        Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661411885a.4.1791792065667;
        Mon, 12 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9af97sm27169731fa.14.2026.10.12.01.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:00:42 -0700 (PDT)
Message-ID: <d33eaab8-2933-45a9-a716-b3eebf3dd9d4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
To: Xilin Wu <sophon@radxa.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc93c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksxQWNrZAAAA:8 a=KLRTrxjsjmTHsxePAeEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX7CppyNWGQfPc
 NSO0lxwRpKQDX9ZPSXcV5hsmtRGMumhPflBoQUKj20W9uBeTMuD/Qg3jJK98XDvT51YFypkPmnh
 nyPKyyDAF19+O8Ymlba348IInVe4vvrAIgH3IiAtKzx4Zb44AP3iOQWCs0A/9R6l6DQvCnBC0G7
 +esXOwl790IM7EkEsL8i6wwmZV3ChKi76hJeoEjaWm4LO0R41kvlvYJsG0d04P7AHKe1ESG/EVl
 3Qqej928ARBtIutwdiJNerFQjJwx+Xs57CoZdBvNIyIe49VKyOmGEdw/z59cLtHHdbFvgJ9JAJg
 BsTQ7fnMZkmSdcUiBubX8OnS20Y6sIthUwnecVZpIA+V0f+k8mHD6UOYfbW6wOMm3gVuQKP8L3r
 rLhWpgDaf/sFpWz3hAE/BQ1rohtCRpI6QIxq1E+ypOaxIG1VzTDeFfgpACyIJPLJ4smN7m43aUP
 ELzAmXZx2VfVwjVDjoA==
X-Proofpoint-ORIG-GUID: QkZlnrySrUBimY7JmZ1YR2lcOPeKZX73
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX0+fMCODlMW/D
 0v3EFv7vBGw6h16ZuuljvRs1XK2n0VPLnpXhrMtq5i0SeBchg7ANQ+X7zXzDL5E4rr8fSH+hB/h
 OamYSnQv7IOQ35zVaXR4b3mM8rEcGFE=
X-Proofpoint-GUID: QkZlnrySrUBimY7JmZ1YR2lcOPeKZX73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_010113_247037_29B8CA6B 
X-CRM114-Status: GOOD (  16.58  )
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

On 10/9/26 5:16 AM, Xilin Wu wrote:
> The MISC0 update clears the bit-depth field but only ORs in the new
> colorimetry value. Bits from the previous stream can therefore survive
> when the new value clears them.
> 
> Clear the colorimetry field together with the bit-depth field before
> programming the new stream.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 791bb3af2cad..783cafb22374 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
>  
>  	/* clear bpp bits */
> -	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> +	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
> +		      GENMASK(4, 1));

The colorimetry field spans bits 7:1 AFAICU and bit 15 means
Y-only video

Furthermore, I believe this register holds the standard fields/
values defined in drm_dp.h near

"/* MSA (Main Stream Attribute) MISC bits (as MISC1<<8|MISC0) */"

so we can drop the local defines

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
