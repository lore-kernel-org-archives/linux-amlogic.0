Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823F7F30924
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSKGGbq2TYUEepevgtQuuFv0IYnSdYz+Eb++RW0LH6I=; b=RgDxFAKml8Ow++
	h3bae80pNcvhTzCS2+7i9qPh3iJL5A6fgVpnJDQV4xBATVGUFMhm1nmbHgEDKNF5Wz1ft2V33cfOH
	73RvPL9W4ymSkciE2wpx6p4oHpa0M/m6QrHS4jloFW2sML2bNXhh5hXzTyJl9FcDGaKCW6kO7T5lh
	R2VdxV+9ny+VQD54qlOAsS3slQMDnbpq5zkOJjOwr4fIfjP94gRRBEVRJ+icGHksmSjuOjdAZaowW
	vbODAKDcXoohYHO3nrFf+MY/0K8vAIwUBjrBInXV4rjERk1mwWtDMAfN0eGEipETd4TI2kGc+y/9R
	5hRQpU+i1GEnhlI7/VCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy55U-00000001Owp-399W;
	Thu, 05 Mar 2026 09:33:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy55R-00000001Ovz-2qPX
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 09:33:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62597Y1V3473621
	for <linux-amlogic@lists.infradead.org>; Thu, 5 Mar 2026 09:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj18458w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 09:33:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso579500385a.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=BAeay3WAs7az61rcHsuTdtHPoCc7E4GT8hViJ2SpRUeAfUCGwn2bTu7OkJ5/Wbcsw+
         H5DnPOT4bLCNxqiDqdOLvNJwKdpvAx1Xr1BmztW7yiLyow3fwjc9xWY2DfeOITrPGf6A
         xA/DCJspsqde4/0wBVqH+YaYfdC8a2QcMKgKdAAe5CrMXzVCJ67zmZ43ABoU73wmdYZs
         FXohNSdnw5xBZkG/eVFr1MGbJJgO+H+DuKnApgoykI8AcAR2rCmI3Kmsrsv0yVl2goFG
         YiZ3yj0Q99qNwNVx60T2i/PyZYNndvvQHYEFnG4MnZhlW0J4B2pIYnjyeIsV/j7MLNwC
         b4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=KnkukE0vzpAB8lkJUHknhDP2etNqqMb9a8E5PDhtQBP7LkuYqmB8r+92ux5IeN25EG
         PkOz1FHDlFajvovEGqHT1H0zBTAZoFA9iml0CQ1tfBnkczvzr7zISp0Cgx1ErRMq9sWP
         lMtcWzmEWcLaSTv1dIb9ZvSaG9FbR1MBoI9nT8fgeg+sz6vTN/P8ac0LD12vo7K+FUm/
         G/Bxnp8w4i2G+CtuuxO+2xKV27e1GMOEBBQ5Fh0cvKR/61kVUpBOJMUggm63muZk+wR+
         JudeB1cVsf4vKSfkUPxNK7vDcumHmQLra1Fx7/0NfW1oQa6nZWLQRgfmFs98jOIlvEK6
         /Kgg==
X-Forwarded-Encrypted: i=1; AJvYcCViHDI9H/Sjrg6Z0TkOfH0N3fvbEScLxOaXyXr7BY24/sylYleCcb5JPo+Jj3aAG6A7fSEGWm9jDauuszsk@lists.infradead.org
X-Gm-Message-State: AOJu0YzciB0EjcWBYAkohQTePkBKlACXaJ1p7JylQ7XjFpzkn22Sosc1
	x3WkAtw3bTiaPxNB19Lh7XlFbZj2BM74Dz5zdC45Co1TD2d0gZIuDXG86eI+tcOrupOMIZU5/Z4
	FVQJyLmdWHIZRakgrUfLbHAO4FW16Hzjw7OeYZyLqC0q2PjxRuZEcIVsrw4UfttYy3ehBiyT5lg
	==
X-Gm-Gg: ATEYQzxGVLccAse7UqJ8/C3DlCEsxzJ873+o2tePzeRtNXWOGo0CW1gU32438YVq4xU
	UDR1xdW3R+rj4EqAj2rVZ17d6FUx0NTV0rTckV56Oi8U22aBBChih7B7WqkPnX9a5VRQVjuz04E
	TiNSyXxya04I4VtcT/QFscsy5svQA7WJ2H25Z9L01sDq2494VSu4KGeCOVPzYEET5VnJ2ZwvOPG
	aHHOtYBZsSB5iJ6jy9wfq0Uv8naIsJrxQU1AUhRfil2dfK4uhZuVRYkGZeijWQTYB+3rg+r+3S7
	f/YpJbi7iQ7QstnzzHSdKmDkbCjtbnMAwvz/uDtyGJFUig/x/2Koer5kgX7ofjz+ZFDJW8f4Dvw
	+uafhFPaaM7OuGq591PqEh59NcHxDTGvBnB0f58SbjL4Beg73nOPwzMvlJ5sjpkmR/Ws/PnE9eJ
	yue0g=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462861985a.10.1772703220091;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
X-Proofpoint-GUID: QgFBvnNktK8X3-kcnf0ldiAFUNQw7Pwx
X-Proofpoint-ORIG-GUID: QgFBvnNktK8X3-kcnf0ldiAFUNQw7Pwx
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a94df4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfX8H6dlhej2+0h
 c5fJ9UsnsCtpHkHfwWy/ksm8coKAycKJ5CeCWtJKTq4m0XA9b/rBQ1CUKwDWsxliUMYMHcrpMAD
 cK6elfWRaNQ2fG518SKMOY5Q53S20NrmnHxt/xEJF1HPaT4t6Yju8kiFiAWmlH8j1SEcrJS7/XU
 JgEfCbZ4P4wJLoKVUNUlk4PnfKrvVQG+FTSk7fcUhIcgzfT+qF0R+LtR7AQjQFDu/RjyyuJL4MK
 BNIt6bDej1pFa6nFnrfksbi+Gsh5kqiXb8NkaogRprlzOm+QeSuMpwrUHVR2wcqXZ18MaT9b7gm
 PWMIbHobaM/sChF9i6UCXcycVr81HapAbnRbNxOvAgM9Btm6Jwe9yMnnVxAInU+6EbscitTQk4u
 nWUNW7OIcgVVrOcxTfdEbb7+S9hkvb8yGzMgwcDebe4X5s0RGRO0vq7nbeZYXptA38KXEK0FPHp
 Nvdugu+o0xJ4ipFXnCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_013341_840777_B0890EAE 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
