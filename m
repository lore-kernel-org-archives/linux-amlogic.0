Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5677C369AA
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Apr 2025 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMjIdw/G6aKjk0CgbGt9Xl/8f2JxjkotS1eXYly+eLk=; b=pM2EuJwn4PZxVb
	9Sl5/Sd6MMnS7xIB0UsRUb+fb/VI2Ic5gjC8969yu3r+aSEqAt7CQTe6RBvRvfzZx6GdKsRSZWCPv
	+w9B7XOPgasJ++syA6Zfut0RVbweqU+Cdijx63G5qeciYf9gElrpP763dRHwsgBqoj5lJO1CRPTPJ
	i0pSy9bdMIXx4cZmeBhveqYdczT61xOrc6sg536vixKAaOhCmh6lscenrjnnhrBhro8BhMiNVUIHc
	oWxvqZ3eUVTqZkFLreqDwK+PWJnv32SjRLgApMf/+jICtuMhfgPpIeNFAcloFoB6tqfjYJhTnSkHd
	w0FHHyqRHcIfjSrvpS0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vUS-0000000BLEh-3XIw;
	Thu, 10 Apr 2025 17:15:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uiP-0000000BBOc-1HGQ
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Apr 2025 16:25:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFoUg8019634
	for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 16:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zR4+XiWiYcCAIsEskE+Pa3uKadOj7H5b8EyZw08afF4=; b=DRKNXxAb/WCjQgrY
	hz9jTbcUmyc+6kpdmMafLPwR+le4Cq1jMeyTjCxsCejceOyQfmi7oALTlTQNZWmt
	HZ6ObdJEu2UlNJkxKLh981hjfDcheQK0YO0wpLYTB3oAE0bD7z6wPJkf39uMqmv3
	CuXvn7AHdYvhyvsQsOt9vExk3T9+laF7gO/oW+l2c7/SeICL+lhWMeaeZjtfRw2b
	SiKNTFqzXURqsJ0+m/R/jLELMHOJ18HrzMql88kcjtfnQ+hgcZkTDD8CVSedDpi7
	E+HHxl/0WDpxjk88guiiXC047QSHSRPQvoSO7HNYuo0vrP/LcMl7CKsMAUYEQ12n
	hZULkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrqq1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 16:25:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c555d4ad75so21278285a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744302319; x=1744907119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zR4+XiWiYcCAIsEskE+Pa3uKadOj7H5b8EyZw08afF4=;
        b=jM3X3TR3L8LIrb10NKT2f69yTDlRyGBgNgoh9MCP0OLOzch8b3HIhadOKhCuTlDhfJ
         DH+EUwIUdkSQMvLhn//5hQGM2XNA2qEhx9AQBpO2ZIGVSFgwrksyXPHFfF9qP5zmtyq5
         7biPGhugUle8iuBls+pu8fhwXcfYOgeZWUjPHilxke5LkFYPky1k2v5tmTeVwxYbhvYz
         FGJj27rUqIY6KLvoPBIvc9UX75vy7d2dcWUrFB3l/NBTqoOqD36eWlf+jTh2WIpZiZNh
         R+8QxmXoAzyVuHGxJNBiuBPtmkenbHcTkcamNrHXPFt+zUEMwPPBDuFdz/ElN3W2IrqI
         RFog==
X-Forwarded-Encrypted: i=1; AJvYcCWpDMbRFPx82sMpvF6iL4u/12QVJ0V3P8c52prHVnjS/0Pqo/ZIha4LlTyp781SRV7l3donfiT5t74oOXk+@lists.infradead.org
X-Gm-Message-State: AOJu0YztUJ8bQ9uFBfqxiu9NxwpL24y2LIJbk96thqPpqyGwHOePcElq
	xWdzBUhMkyufeLMYZyQ0jUdio/CLvCx/iIRgiIBg1zhy0AZimsZpEYQXgqOyrWEF3h/hx3KyEy/
	rFtfNUDBLztDvfHCju/WJg27cb+oKE266EUB9wj8OTwjLDbaZ6K0DmJyqNqLsRYWyo1uhFw==
X-Gm-Gg: ASbGnctCQdkrB3mFiOqSBlRzCllYOyKPhcBKEugTwQHzKSMKOsUFe/IdLeVNjfu71G/
	6vPv2asu04DrEzMPkwjZJ+0OKapRWoxa+QU8ao9oHwVXEE7FjN3vhfB8Lfd4nK9yG1oPWsUiWGs
	d4WR9eEQE0uv+XbomKVYVDt4DR7U4oomKyU1rw78dIt9z2coTpojf7l7Mi2xf5rqL1S405ncxpu
	zxf6hKDj3NjOBOPwu12eSdy+KyaAOh+MMlsUxaApJQvJlY5yXsmuU+dVOVUgptAyuXdkDfZgPxC
	JRvFmpUJytdqdXTmiBRiCuv8jrfLrmXBCyNYczpJvVVpsbkrRsBmF0JMMg0UBlJ/3A==
X-Received: by 2002:a05:620a:f11:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c79cbed7e5mr390017285a.9.1744302319222;
        Thu, 10 Apr 2025 09:25:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGh0TA+XXGeyGhF/XKIz0cXHA6zoUdAUUcHCD76IoGVEG3eLbl5iKlo88Yqsik48pUsXmHeg==
X-Received: by 2002:a05:620a:f11:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c79cbed7e5mr390015185a.9.1744302318810;
        Thu, 10 Apr 2025 09:25:18 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce818bsm297826166b.182.2025.04.10.09.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:25:18 -0700 (PDT)
Message-ID: <898bebc3-e2b1-4819-9869-05b783509146@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        "Rob Herring (Arm)"
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
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
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org>
 <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
 <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
 <66f8d957-f7a5-4aec-b8e7-5bcc7ff7f569@oss.qualcomm.com>
 <Z_dvAT7LdR7xbH45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z_dvAT7LdR7xbH45@linaro.org>
X-Proofpoint-ORIG-GUID: OQrzCbDvLcFMrMYyyQlnxYwaumkRQh6P
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f7f0f0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LizfDJ_PtI4Zq51CQE4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OQrzCbDvLcFMrMYyyQlnxYwaumkRQh6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_092521_484738_1C22612D 
X-CRM114-Status: GOOD (  21.79  )
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

On 4/10/25 9:10 AM, Stephan Gerhold wrote:
> On Wed, Apr 09, 2025 at 08:35:29PM +0200, Konrad Dybcio wrote:
>> On 4/7/25 6:27 PM, Ulf Hansson wrote:
>>> On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
>>>>> "rpmhpd" is not documented nor used anywhere. As the enable-method is
>>>>> "psci" use "psci" for the power-domain name.
>>>>>
>>>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>>>> ---
>>>>
>>>> "psci" is what we want here, but these platforms require some more
>>>> massaging..
>>>
>>> So this isn't for CPU performance scaling?
>>
>> Nope!
>>
> 
> Huh, this is definitely "perf" (= cpufreq) and not "psci" (= cpuidle).
> If you run blame on this line you get to:
> 
> commit 0ec7bde7b590f8efa5823df3b52b32dd373060ff
> Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Date:   Thu Apr 8 22:34:45 2021 +0530
> 
>     ARM: dts: qcom: sdx55: Add CPUFreq support
> 
>     Add CPUFreq support to SDX55 platform using the cpufreq-dt driver.
>     There is no dedicated hardware block available on this platform to
>     carry on the CPUFreq duties. Hence, it is accomplished using the CPU
>     clock and regulators tied together by the operating points table.
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ec7bde7b590f8efa5823df3b52b32dd373060ff
> 
> The OPP table looks like it's supposed to set SDX55_CX performance
> states according to the chosen CPU frequency. MSM8909 has a similar
> setup where the CPU is supplied directly by VDDCX and we describe that
> with "perf" too [1].

Ohh right I was under the impression that qcom,cpufreq-hw is used on
those too, but apparently not..

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
