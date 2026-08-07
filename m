Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65DAC5AC7A
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Aug 2026 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okZC70sC0TNE3YWDilAirJKFWNQtai/7bbsfv40JH3I=; b=hA4So1aG+L/i0D
	vHlQwiS1vpp9bBdVQX4Fo0LCTElOSLnrc7qUyn6tuhPrheegBV/H4havk9+QhTTBIlZsG5fAI1i4p
	7UKcatJfuke3nIZ4y7ur6M51TSAAGgcnxUYoMgHBDCxJa+CVkERFZJzAKuqePMV5zYyav3f6oM0WB
	4j9TUkQgGBGb0L6VS6RkcJ8dL/wTZA5Df3Wi0jcjIBZpkFuKjw16oXs1kcl0OEjXWO89LOh6fAlY8
	DRN0BEuPPr/f0KxDMs9StOJQj8uVVvcWmIZq5DkjHLZ5mBsX2JGmcCbuadBQiqIZupiC2l5T6med2
	vrlMK3/oOdWSfflEeIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAPl-00000006zSi-3bt6;
	Fri, 07 Aug 2026 02:34:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAPi-00000006zRF-1LLv
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Aug 2026 02:34:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GsHL3533965
	for <linux-amlogic@lists.infradead.org>; Fri, 7 Aug 2026 02:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=; b=AoVUPr/KMBCJWVge
	qjJSDEs1VQYikwckSmo7dfD9rW9exsurvTREmlIY/goqwA3EpvD6QjXkEEbNFLf+
	IVCkf62Zcl6gCQGgLwbivuGOQ6g+tUElaqeAt9H3ihgavJ8m1eu5eguyJTOyGBPC
	RIE7H2c8mDtuceV+a/Bqv26NgznSEsxSmsC5ngZwBZ92keCGplQfZwvXsL6k1ZBd
	gQ7KnvSjvFetFxuB7ulCTyFVfvFX8x/wyTgzT0J8zer/hWV3+VRxSmQM9RuuU1M9
	mSBWDF6Rjq9NsadiuAtO61EjskxftmFLDPBict7DeqZJb3OGRuwd2RTvPAXw2lkx
	hQILAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fswdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 07 Aug 2026 02:34:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so33986931cf.0
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Aug 2026 19:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786070065; x=1786674865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=JOYU5hchrPYV/7UvUOniWiNv/fpKHzezuEgDYqIn0MNP0g41q8GMyOeTwqw0Cw35dy
         GkEJ/gQoyERR4N2ixWzNpD6xyTOoxh+deS1DfCpio+YN1exYdMP6SAAbLc17wzysdV9z
         4Vm7qbxmkehtDIs2uqCWTZzdwLLTrIfsgxYb19do+pev7ZxfRe8tK2pRaOafwMOm02IH
         vP89xjy9gDi/sLvKvGx6uIwBrYYHOKOWmHubTOPSSUvnWnTQZyld2S2zYFR5qt/eDwh1
         /tXviRzdXXvKeEC4yD2MND/hlhZQpsRT1sfrr8E+SUuqnsT6TEAtDh+8ejH9vvUYNXH9
         GvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786070065; x=1786674865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ndFmLvtglCbgUdpFBjfySPC0n0eZtwY946Lp1MLj3Lo=;
        b=SezFaZm5wksFPeJWbdNEArTS9RvMftS9TXCAFfhivjSmq2IarDJ/GbjaVJn5UIQya1
         d9oEejMYtLmWetSAFt0+0zjnM+epS3H9CuclgsN9isLM3ofquo5Ozc9gAVJIZk3p7DeB
         jCa7Yp8qqG4RQq4faZV/wXi2r8vCtfMPTleDXh+OS6R+Cu3IYM93UBDqc8cKqqGv6slj
         NtGs7ASqPapjhrIp/RGTE3vZxWe9ujsFrsdRNYgMIwBzYOWgmnMPIrCsnFWApcGAHcBJ
         ng3N3At6A1s0VcXALZmFhrftNThLifVetdXALOYmCiZGZ9V9YStz0tTR6y4QW+ruXM9S
         CaqQ==
X-Gm-Message-State: AOJu0YyIElZ6Qiot0janMmirf2LeULE7QkU81noOF8Olm85t6bdrlvMA
	fWw8RG/Yt497eXssap2D20Y3oZ5NYsVldTcOr6u2i1wHkes+po3K15amU+AqN2Scr+qfieJOHqB
	p1lMnqQ3WnMruD4+0jjIG5dZ2gbTyHj6S7oE3WxDc9Mfr1RzUETrn6clw6Jesz4c3qVhfRTDowQ
	==
X-Gm-Gg: AR+sD103DfUR92BsfflrsS3fNU+zLbnxZ40dCSrbESgY3v3VCDtzlHHqRx9DgI41qsk
	/CnzvyI3TRy00f//VLCNtKdyCaTk5m5YhYouJvwD136jTNXa2nBdKS4FPO+1sVdqyUrwF1PJdjg
	3HaKVGpiC4EyiUxC8OF22ngRMhN9EoJX5oyHs9QssWkamDc0FVuqqnd4yc4kVPRFVFxv3F1Sapi
	ZuA+AH1L17c2+nDpQNNchkjDtvAq4MmV4eTKkixLhTAHVuVLyhKUaje6dEwZ8Xc+YxORM7iFoRU
	/ukfsyNWuxEx1SiHdsxdqCMMh18MTBOda76FZ8T7/JIv1mU6zKCN6vnlljm6uxat23jrRdLwaSB
	JKW6lB25NXatCGAW4W2zYWEkVC9/n+W16vOVsjGUZgpuvpw==
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913581cf.3.1786070064610;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
X-Received: by 2002:ac8:5c8b:0:b0:51c:1f97:e860 with SMTP id d75a77b69052e-52d18e1a675mr1913241cf.3.1786070064134;
        Thu, 06 Aug 2026 19:34:24 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a4dcsm113421675e9.11.2026.08.06.19.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 19:34:21 -0700 (PDT)
Message-ID: <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 04:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfX+/WSgSkOdEXT
 QRz5G4Xvj/FEHMKywgplaqbWkKza/hOGRB5emkNvTzBravkNGgnsPtqOszRToRVcQ7AUZLx5dW7
 fAY1p1uixJPHSJPf9PsGAqPrT6qyLJL+1Q2UqxNh/3Bj30Safo3N5WL6+zJGgaP8A4+USJYwbfB
 68PfSsVslVjxHYPoFrsqxIYVXXx0DnRWrHBYLyXMnVhIoHqrarPY8AcCsy4zr9K8qk/bhHkuPnM
 FQcQ+33QO15hFD16TNlaA20k6pWb7TZ6piOCdmCLzZjVmBQOqCfK8QKqayVuZiS6brIi0ebagId
 yAGzwkpVS0PUbshI6tEpkHMXrZlOEg2wbra+ThPf2nwDGd+nudO4O/c8q7scwWGrS+KpZ3iCoyP
 Vsr7HK/3WWoz4syN4cG/fRVDX216LCE79j9b67ISQhz/ObNhJKo4os+UJLfTwmUIIOwYo+N185s
 HnTSwDNeRFPK5ywvxiA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a754431 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UhorWaulgIN9a46JsL7pga8STtpZYlFL
X-Proofpoint-GUID: UhorWaulgIN9a46JsL7pga8STtpZYlFL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAxNSBTYWx0ZWRfX9dt1IPpggpWj
 3Ju5Dr7YNaDYyr6hyYp7pLL4pTjB7adiTdOk3LRqAabzJdmyglydMra2RoXK11MhLQfWQoySSHT
 X7uz45lNIrw0VunoWWd9F8QkxhByBpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_193426_476913_BB7B0748 
X-CRM114-Status: GOOD (  10.97  )
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

On 8/5/26 10:06, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, levels[] and nlevels),
> as new MCUs need different values.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

  * Through which tree this patch should go ? (assuming there is a 
dependency on other patches)

  * How this will behave with 100 levels with the step wise governor ? 
For a 100ms passive delay and 100 states, it will take 10s before 
reaching the full speed

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
