Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A7CD342C
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2026 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7J6PNFxVELa1aKhjDykGmgTJ1ivFc5hCrBvamqC6GAY=; b=XZemQVVVRKdl+Q
	Y9HkEBeJZIsvKYVwfFGYbl88UPlddZQSiFrKdIA4NFQPkpBenoYdbBet/iHEsf466mB4rS1IecbAm
	pDTimS/qr62s8q0UGQ1bvfmH8bR6cmSDY+6XX6gaqd+519ZYVrCEyFoyp2CgUH8Vr4swef/zj5xCB
	U+PW9B/18hZnq8r52JxY7BLVEKfh0hlhBl6vAqZeF8VJJw5pMrAO2NnVR8z4irEdQLxi3Vp3u4M6I
	vH41rfX+mwpp7GA6C8jQTtwTMPDB2Vp6pzO2PPtSWqgWP1RcRUnhFFAPpi2oJvKcS/tCqK214x+nJ
	D7pLnTVp4CQCVebmVMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeRK-00000001Nxu-0nQ6;
	Wed, 06 May 2026 15:45:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeRI-00000001Nwd-3tB1
	for linux-amlogic@lists.infradead.org;
	Wed, 06 May 2026 15:45:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EG90r3309046
	for <linux-amlogic@lists.infradead.org>; Wed, 6 May 2026 15:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=; b=C3z4/vfsDyjTFiHD
	ZsGZY1tqAs6+zstnqi8VPB3L0comfh/8AmhhCk2hf8cdMH5ckJrKVAOE+PABkYou
	eKgDJ5Ac/fH9LriqF9eIge99JjYckYv5eqC77CbD9hxotOytvOb10MvyKZYnCfyE
	LhcEziYQcyVRB8yLHEtooq8QJi6nI2zs5UoLwbaB9QAqU28V6MTIAtm91jnUARAI
	wbwVhpIXidol08Jyrh5tqkZpNZeo93RMwJM3nAAzyt4jISLYwReVAzKo+QvPtR6a
	L/oJ2LfNVvBbjr2bm3v6b6+h3PCK37imXCUoYILowiO2aBX/8dhZZn90vjoJLebz
	3V1Vww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sgbvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2026 15:45:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e423a05c8so25894101cf.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778082331; x=1778687131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=;
        b=CFXx6zhIHNirO7aONpsfi1850FL3aXxaZWwpBB69IizNYwEa+cWQjrM8orw689w3XP
         SFAKEnV/fxyPc1HCowjKfybpugEOiaIvB0j4nY9Rj7da0nmS7xJ9owe+FWyFi6n8gd6f
         xb2yzmtEtJO3X2GtO/k9jKEdCg8HM0+tqlDyF2dfqPeSnknBoh++OLW9BTsHjhivQuD1
         10cah/5OtkRtR3t5UWAuQ8HeCJ8S3cUmkm5nEI2wM2LqW6FmaPxCqzSYiGxK/dCghSCV
         FzzeQCiz7/AS6TBAxgT3IwOguGTro84Pdwmheg4nvRtrSQBAZ3jSCEObxtzXKfUz2GXe
         7QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082331; x=1778687131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAWiO8jyWxuHFA9LI2PneskTKm60NIuJWI+rTsOF0sM=;
        b=MRme2AG/Z/9KAEaTBdUnA3v7PSDZ8TOht0K/muvcA1i2xUNDHBB5Mr3up05gDk7/NC
         wZgXIc7EvSCv1JZiVzxHs63ULxlM+fdHpSc1E0trgcKNq7SwU9oJbjdghYo+TS+zzy1a
         4De0ZwTLUCz8d0a0vVi+oLTiL+1Jtxa45Cr4YcxDoq4yXdaGIsd7Jg/fBp8FKsXR4tBs
         Sy2izZd7DIQ+FBM3TygwcMbwBg0MypOMAuvCHRlGcnV+VFy7PAQ42QwFXpvZjiGxRcP/
         k7NyPHTX+m4QZ4cVCL0dWZulMVA5p8lAGsUu+VXWNbgXSguehxWA0m/RHOrPPwveMu+O
         zQlg==
X-Forwarded-Encrypted: i=1; AFNElJ8nJX8AgzuIPbHA3dhpK5+Q4ah0mskZj/asNiOj53hKWQIuI/4n+ZgjZ2L2QkW7a6jLov0+RIsTYzSIWS+j@lists.infradead.org
X-Gm-Message-State: AOJu0YyiXtHDOzdueylgG2BUAxa8HmQCnFplzeYWhLUsY2L6cjt4DdHo
	WJy/dntnFrbQyFOJMmJ24OXZ7TknPDucNX9wX4rsoDz9oteVKWDXn/TVYNeebnypGVsWmCHWLJU
	4xUIyM4B1Di7bAQ8EWsEqFFeW8vomPeSv6TCXLxzvM19vnvE9NTJGjHQY07syTkZdL+fHAtczMQ
	==
X-Gm-Gg: AeBDiev6hDT7NEL5X8VZsrLh1zojuDjUJB193VVYGKe/cjA9naFhoetsyGr5MDQuRTa
	WBY18lI3Y+nG+b2D1NtGjKmC08qDTnSho1//f+NU9W4p71xy2Qvdt14W6JUbKEpdD3D4fGvg8EK
	Ao6bOWWrEdR94ul5ZUeDWdyJHj42bLdlCBWPsMb6R1dgSNg7wOpQxvZz5uMfFUgRmPEfLz6v/Pn
	ShPggC12YGUJt8ZmhJNWi/h4+59jpZNaoDHKkC3T94hKqavd1YszdhRwMDSpVZ3VhzxdeXmuEsx
	nRwsqs4w77eAstzvnZGgMSmt0UtF5Wq+I0Psa2jImlFQYznse103nmcXs/6YttMLgAHg91KDmdK
	6HLH0vkjsTOEwcULZLenHA/FMfiysYORSsEZc3195UY9hqH+LSlrBJiE8xDaRtT1giq8PquklyX
	laql4EkyiWw0ZvF4dB/3Y=
X-Received: by 2002:ac8:5a11:0:b0:50d:815e:7977 with SMTP id d75a77b69052e-513053313e4mr105266901cf.34.1778082331320;
        Wed, 06 May 2026 08:45:31 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:50d:815e:7977 with SMTP id d75a77b69052e-513053313e4mr105266011cf.34.1778082330603;
        Wed, 06 May 2026 08:45:30 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a? ([2a05:6e02:1041:c10:41ef:7b80:b3e8:2c1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895cb5sm51330525e9.1.2026.05.06.08.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:45:29 -0700 (PDT)
Message-ID: <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
Date: Wed, 6 May 2026 17:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb621c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=Gq1lbteDWWDUjDXoEKoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE1NSBTYWx0ZWRfX21JenXypoEiK
 86d6uDjus8/CBY+8G7taLZBP4eC2d4aS401vlzr1H0aq5CPyCwooqm6yskSHjwjVDYMBH9YwsMA
 KIbH/R9W2ICMnRBrTYX2zuNPZnSL0eFS+yg6nj2NXkq/3fSRUQ7xumfb26mAYIiSLuFVGhCQBJe
 ybiXCNdlv0RmGTMIOXiHZCa1KwDgh1oEdTE0aJNeLZHt4n7L6w+aMQhvzD6OLG51hjW99jd5Iut
 Ygwlcwo/L8eyXcv6Whf85TeF/qkFXDda5bWO8vc3ZPMSYbujs3SopRR216wKWH1m2L7XHiE45RR
 zGfUUiJ7ytWuNXD7FdoBIVtugVupYvT2mJAsnbmZPtu4tdMtxSKYAhzKI2C5op8a1fRYGBsG1bg
 1NZVPYORh9wIt977ncmLBgcGzc0kkmNoRJckxfnslA+8q46gi5PsrqVLHjSvnW5eLQH0HlyqOg7
 xDuWQxbiDtyxKme98jQ==
X-Proofpoint-ORIG-GUID: U27xxCluB1D3f99F4Oi46jlEGJFU0554
X-Proofpoint-GUID: U27xxCluB1D3f99F4Oi46jlEGJFU0554
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_084532_962410_A7C5A16C 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/24/26 17:45, Ronald Claveau via B4 Relay wrote:

[ ... ]

> +static int amlogic_thermal_probe_sm(struct platform_device *pdev,
> +				    struct amlogic_thermal *pdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args ph_args;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "amlogic,secure-monitor",
> +					       1, 0, &ph_args);
> +	if (ret)
> +		return ret;
> +
> +	if (!ph_args.np) {
> +		dev_err(dev, "Failed to parse secure monitor phandle\n");
> +		return -ENODEV;
> +	}
> +
> +	pdata->sm_fw = meson_sm_get(ph_args.np);
> +	of_node_put(ph_args.np);
> +	if (!pdata->sm_fw) {
> +		dev_err(dev, "Failed to get secure monitor firmware\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	pdata->tsensor_id = ph_args.args[0];
> +
> +	return meson_sm_get_thermal_calib(pdata->sm_fw,
> +					  &pdata->trim_info,
> +					  pdata->tsensor_id);

This driver has a dependency on patch 2 and 3. Shall those being merged 
through the thermal tree ?


> +}


[ ... ]


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
