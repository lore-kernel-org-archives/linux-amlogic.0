Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ED8C36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myYVCaftysT3RTT77TSXVsE9hQymgXwbH9iGPy2ec9Y=; b=r4IF9bB9t3/DaW
	nw+gUUIhPGNc+C62/MTwOZHqCiloLGdzcoUuHmFfR5OJUYeeiwsYzkqK+BmAZDkI99iCwqJpkQAbd
	rE2DgL/PyaP39+VZ2qYyz16RJ8TklSTWZy3uVtAsPl5G1yCAMJErXvB7l1SN/UnpV9haom9Rz6Gvi
	LtmGnrTTr8TRWdqKOhNx+2KJdKlyy4WEnMSIb1GAa46nyAUp5GEDEfeDjnWibjPmeuq+BaIz1eO5z
	fUP5WlvjUhVyx51MbjijlBHly7iBkGx+AFSeZaz+9LZBp5yKeUKYSsPTC4yynl+Sy0TM1W/FWHa2B
	K8umPclikAqsBqPhsPWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nrv-0000000CovP-181G;
	Fri, 04 Apr 2025 20:42:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nrr-0000000Cotg-34oK
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 20:42:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEZor000540
	for <linux-amlogic@lists.infradead.org>; Fri, 4 Apr 2025 20:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dvhmq4YEot5WzH3QxroXInz9L/fpcl+l6rHMMX3PtHk=; b=UsllvDr7X0dVrVbg
	KZrNk15XTlIpsHlSLRUHo1Rjd3mfVeLUdGKHjVPPT5oOtoD+m/7gYsxr82zV892q
	b7DDA2z8RHrrKZPaefDEmcOzeLnzA/lFvL5E+X69QLvc+QhNryoD3SpGeyVat7A0
	l7g8KWHIdbS8b8uQKBh4BbQqAUDVJHYqq5HvXdC6gjCVWJ9VCosCJBQDi43vBsmH
	GoBGnTtv+L6v4/5iXkHEKdSOpElOzwzfnUz/k8AoMoGiD4+1akr5kALv4pZKHFDM
	PDQPTTo607hZqu+RzrP4NeG19lbnkHE5lUaymOg4HAIwKg/Z1ceaJG4sp9s4dZoX
	29V1lQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8av69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 20:42:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so4208641cf.0
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 13:42:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743799342; x=1744404142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvhmq4YEot5WzH3QxroXInz9L/fpcl+l6rHMMX3PtHk=;
        b=cAM3qQyhwc9sWDoF2NbJib+jgYW492TfZY4WN9E1yRPAIYSIj1LybT2cs+T/Aus4ba
         s26bqezaNemuwU9amjOPCdt1M0o6wzo+X50dyPfJmAh/IdxkNQ6Vu8C7T72LLDUWCACs
         x7tVqgULVt/XGX68TVibHwJcM4MeI/IRWGj1V/wpgE+Nv9DS/WYiZ7nCQK0IK6van2V1
         6xCc78tZvHVdG11ORdMxtM57IBfX4nYKmU1jjWLeTekhXB55ckgqbDRRTSFwLGIhPWwj
         Bv3TZSbFh+CB/4bFh4FL4CNHTJc2NhEztfTVggrZP+0KdY0gmvoJs6y0llcDo6o0DLC8
         E2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbUlwOkQTXQdJOuLiklGe8U+mFImAvs3NyRU9g5Eau8MxGhlaOEDZFFo5+yfXWxLYsGXSXZQIrWJs6VmId@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+/5AmFvf2NJmlhtYiA7pun4BIa1ATsKC+YZPmEjLeuGUdtRU6
	FDGcwWqrB2bk0TAJnFYw6DbYZMl2ojYzUOooE3mCDMMR5xhtGWw5pojGxPWSGJ9lqapWGsh4jzl
	gLrLQdL9LXu1JDnCCfCYY4Lhz0I+GHQvD+6kwuzwcBMCHa7bmv9N5nycrO764AY1+VOU9GA==
X-Gm-Gg: ASbGncu/Loo00mF/GyOt0JaWpqWwO77Z0fYdwnfi7BZEku4qCI2IB1FFLoaOMLHTkdg
	nnFFbhATvyeO8nHf0LVqnxXSrBs5LIUSRkuOwJqlOFqCkHnS/X+098W5R53wDumKXmVgfE13Ngh
	E91nxIYlOMSnxZ6XYb+1I0G+GuowCeet5Y8eCWNoBcau+jq5xchwcxO1UeJ3qNkkA60j8/NRwaC
	19Vi4g24d2bP93ipC77nd21uj2NXxirkApEwel7A2YlbcolDLHkE+cqfMr9Rw2DPg/D0vfqAsWR
	BXaG0PvFK+LiQZsZZmUkgY2vbyOjstyK1w0WJztHjJ0AJQ5uujFfEFUKbCmNm0+QjVkcbg==
X-Received: by 2002:a05:620a:2890:b0:7c5:c5cd:7599 with SMTP id af79cd13be357-7c774d0f248mr242296785a.3.1743799341852;
        Fri, 04 Apr 2025 13:42:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+SWzK4xJTznItCy4yyRIatUgCtVJCf8ZO8c+GM8oZYtvMasi6TSfEl5lIgHq+ml10q5QRWA==
X-Received: by 2002:a05:620a:2890:b0:7c5:c5cd:7599 with SMTP id af79cd13be357-7c774d0f248mr242292385a.3.1743799341449;
        Fri, 04 Apr 2025 13:42:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d442sm310126866b.26.2025.04.04.13.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:42:20 -0700 (PDT)
Message-ID: <beb1e6a1-8fdf-451c-9c48-bb3abff89226@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:42:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] arm: dts: qcom: ipq4019: Drop redundant CPU
 "clock-latency"
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Conor Dooley <conor@kernel.org>,
        Nicolas Ferre
 <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-11-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-11-076be7171a85@kernel.org>
X-Authority-Analysis: v=2.4 cv=PqmTbxM3 c=1 sm=1 tr=0 ts=67f0442f cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EKXQiu_l0foPX_vtw34A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: guLfTKe5xJ8BtdFblxJnv3xml9AA9aZr
X-Proofpoint-GUID: guLfTKe5xJ8BtdFblxJnv3xml9AA9aZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=803 mlxscore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_134223_770663_14BCEAEA 
X-CRM114-Status: GOOD (  11.30  )
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

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". The OPP table has values of 256000, so it can be
> removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
