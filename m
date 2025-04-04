Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B85C3601E
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 20:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8OndnhYX0uh2CMXuq2UeKNDklII5tkP/pw5De7DbXM=; b=4E8M+qs6lfyO0r
	sCoBUsYx6osswuAXMAZP9gucv73TLqhXkS4l1f9R1A5LszpwJQK2c0f5SNMG1DRfQLZ8sUOTTfJcW
	VkGzkUophr7KFMdZ1wKqUaHsKTTSFXj4w9TM2QRIbgyCOAbJf+7DK8khC3T08bbwSIkI5S9MG3+1p
	z/TFegPUQD8GRYDiIejlhrnYZ2YxZUcP+6Q94W9dBxRDS79CAfhYMFcvKWognJyNJwN4GvpJkJHLz
	v46EWomyHEwrS2sX85chpyAOuTjPSDrDMYY4LYn/aAqZ0UlftdlNXN2VnZtEtoc60ommCyNgp+Yzz
	7N+REFAJClZyfvPCJ4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nib-0000000CnYc-3wiN;
	Fri, 04 Apr 2025 20:32:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0niZ-0000000CnWs-02aL
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 20:32:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEhj4013320
	for <linux-amlogic@lists.infradead.org>; Fri, 4 Apr 2025 20:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=; b=iz052oQgLnMJGQPP
	CErBkb5+kMai2wmrL1VN6aYCv2tNSjmEdIrfLe2CSQfXGDiEFb4OXZOEkTaYZbPR
	s2oHMwQzXNhmk6SUZYgDGSHI+F+YBm/87r/DJurVf0ZzFNC4ot67mrIvW7zyGbGr
	tZrwmJjCSh2aBcHFo9OGDPtXHHuXRis1nGLi6+/UB7OHXPrcGPX//U63Ls94UkLt
	dND0Ti+J34F+JtMUGdIBWvVSCJdsUwwGmSZ9Vhqq7H6+HJDbJf5Oev3LOX3sgkS9
	B71WuA92ekAKJCQDQ2Sp7sD/yQWdIFKTjhAd6eBWWM+UflUROy303DyuHyl4dUJb
	sT2VVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d72wem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 20:32:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54788bdf7so46971585a.2
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798765; x=1744403565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOAnLBAJdmL2Wb3sULNUowgzyt+Uj1UkgtRMWgKYGwY=;
        b=Uc1tN64261010BM8USnJh37IG3MdnATrHwiqgHyOT/dgs9jY47HAi8NGArdFvT38j2
         Ue3/Zd1KRbKrN2faKMFkE0TFd0cboFqdMurUVFuWWNOEgm+MA/JfDNMFn/WKQd0sIZhj
         +klCrdJmT2yZ3T1xJ6h2V0zj6zl5qw8AgBlpjWl98oJPz8c7ker1/1SnXquUUiEFdT3U
         t0mzuBtpISKjffhtwn5zS1fCttmUlbozrzWVFAb6GNzX/sjFYtqjsJfF67j8cBGn05Xd
         9srrOpe463tHEmIIoqA1UjBXHCjASnbKasrHzCQyrxsJEmKylQ0/8/Qf8ZMDJ90KzrEc
         Z75w==
X-Forwarded-Encrypted: i=1; AJvYcCWTEw3C5pzQLaXHNNWPYTwkwOqV7K+sLrlXwM8TowIO3axYxAu0gZTsnf9TPw61nDdxrkaC50c3Ttrih7m9@lists.infradead.org
X-Gm-Message-State: AOJu0YzeayAVZcyPQXte9b0w6uOVCP3fiwopw01EjF8x9lBLA2kt3Ema
	2+FwerY2AzqMmKZ3EllCGyFV+WpDtYZ48Fc1vJ6ptRFkIwBxq0RdWEF5loUfuDGPM6Xiu37zrLV
	vRmccThT6C5hu8MeBoAh7wZ7IXJmAxVPUrKPNOpbIkWUOxuk/cbIhd1x4YO9d0IS9hJA49Q==
X-Gm-Gg: ASbGncu0IhEYAMCPYP+EpJdrfnctHLw6b4yuwea8mGj1hHRsz+CBJu0Mao99/qqh8Rv
	16W4jPquOak9+RS0oiqpsJcmlah/cjt1CK1EgbcxqPWLvShbGUq+UfYSzfWhNyD5KUIOMpPd9s5
	gZXk77DX8hUpOmvkq849Xw9tDkFJZLcDfauO1vA3sj8Z47G2zooTKyL7yGnxxZcUmcORi3oaoFo
	lLSOPro9nydAq9fXlGj3rCPy7ZYxOCoC1Qezr/KsZBd/b8o4WbBIFLrn72jHw7UMCST1mIma4oN
	MBPsDHooXJL5/X0JDY+7CQm4VuT+PAGZ5JmwgRkLz05b7wKGC9p8finQ7UGyBYZGe5WYqw==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209776285a.10.1743798765333;
        Fri, 04 Apr 2025 13:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEszusUf9J+0IEkVjsuj8Y1FnlY8CMQ4G+oamdYonxr6PB4E4ScKqwKTkVXQqlueNvC6p0Aaw==
X-Received: by 2002:a05:620a:40c5:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7c774dc4185mr209772185a.10.1743798764979;
        Fri, 04 Apr 2025 13:32:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a405fsm2902483a12.75.2025.04.04.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:32:42 -0700 (PDT)
Message-ID: <d3592f32-e29c-4b40-b045-7267795a9617@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/19] arm64: dts: qcom: msm8992-lg-h815: Fix CPU node
 "enable-method" property dependencies
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rob Herring (Arm)" <robh@kernel.org>,
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
        linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Alexander Reimelt <alexander.reimelt@posteo.de>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-7-076be7171a85@kernel.org>
 <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <470e2155-7145-44ab-9d6d-117a2d98d7f8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CfwI5Krl c=1 sm=1 tr=0 ts=67f041ee cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=vHGDO5lFCXZzE5S5F1YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZTuzRvibV3SCFd6UoIlNeASOyi1SP6aW
X-Proofpoint-GUID: ZTuzRvibV3SCFd6UoIlNeASOyi1SP6aW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 mlxlogscore=738 suspectscore=0 clxscore=1011 spamscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_133247_183865_7C3145DD 
X-CRM114-Status: GOOD (  14.96  )
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

On 4/4/25 10:30 PM, Konrad Dybcio wrote:
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>> The "spin-table" enable-method requires "cpu-release-addr" property,
>> so add a dummy entry. It is assumed the bootloader will fill in the
>> correct values.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
> 
> This looks good to me without knowing any better about the specifics
> of this device..
> 
> +Alexander - does the bootloader you use take care of this? Otherwise
> we can just do what Sony devices do and stop on removing the psci node

I failed to add Alexander to Cc, second time's the charm..

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
