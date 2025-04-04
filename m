Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB6C36010
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Apr 2025 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtrmcUj0VqPI5vOjN5VCO3Qv107ecPBGz7SdyoEtjm0=; b=A3Ep4qxMjgG6Is
	n41oZpCVkv7k6Lj8b3kOjV/CgIrhIro7scW2NkuvV7zuk9Y4R8dZ8llCRJYjEk3WJVCYnRViufIvF
	CwhbgwB2PTxcL4EnxuEcSvZ4nfxr/NqF4MC/3JRibZWauCH8NwFgLKfJwJOzWDDsykKmquDD31wVW
	hnMHFWfYmTwXtKTtN0BLQ9dXly5sqyzEwwWc0T9TWpUpvbSXQTl1P9b17TLTeYyomAWGlHaMBYz5Y
	NPEO3LSMJz2W5r2+g1rRkR2nkKBEnXSi402XYXL4X4I7cAU9jOmtVNLbHumRAsLZ257EU1VeQjmoO
	JPiay1EwDnwyC/uiWnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0neH-0000000Cmu7-4ATx;
	Fri, 04 Apr 2025 20:28:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0neF-0000000CmsY-2MPJ
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Apr 2025 20:28:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEZOl029136
	for <linux-amlogic@lists.infradead.org>; Fri, 4 Apr 2025 20:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GHRYAy9VYazkChkIxg8YtCXwmpRsQX0Tl5KM+EPPgvU=; b=pJVvUSiHwqmvo86h
	Mqz4Q/WnqANpbfqZlCaDSPUWlkMubqtdXp/NaRc9naRXuxP0prRMEmBbAV49djOi
	UK+On9tkJ5vdP0DhZ1mRJXRhJXZ5vwWRG8XadPvXFA7XtnAQtQQrfaKi999ImzN9
	BbLTI7PMR2ayw1pjmyL2JNIMFBjOIa/UvqdlknD7EToePBBBl2wQv0qZI1bqeDL5
	xPLtEJAugYwpzUGlPHz+tngdqJ9Ss8wnwxuAxNHJOyJ4KtmGPSbkZ7v9QzqrdQkU
	2hdWTedgIQq3DFuV39YYB9DewaZ+Y+vxeInHLQfMyWokX4IGTGB57SrId8+LNDot
	T7f62Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45tbnkssxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 20:28:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso4410446d6.3
        for <linux-amlogic@lists.infradead.org>; Fri, 04 Apr 2025 13:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743798497; x=1744403297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHRYAy9VYazkChkIxg8YtCXwmpRsQX0Tl5KM+EPPgvU=;
        b=S8CcL1DE8eQpHpR8YhYV6gE6gk94ptrYp/H83Y+H0OXTrdvjIHKtnkF8Ge94JHtzJX
         qFqwVxWRC6deMkO2WXcjHHRzQJgqUi0leCfjpBkN7xLf7DOxx2WlHZzy+NqJOTibLYC5
         eeepMH5tB8oGAiuNNDuLJPY+GQQd7rOUcGV/8jEPU+5J9eWB1o15k0o7cor24ppEIHfR
         4ECl2esjwQjBa5bfaJlX1iqMKXhrOQfoVIp10z1z4DpkGJNuH6k6AJvQEpiS/Rv/rzQU
         oBoYbiNHkWyCdo7BqoFaD0zKDkqQhSyFf5Dc67acb3cuWVQR90fAvSKWE+qYL7hdpQMD
         6Inw==
X-Forwarded-Encrypted: i=1; AJvYcCW1q1zOyvS/q0qz8zo1a2Ll26NChMDg2rx7/CryPNyNKY4jOyKvGbdWzMAfEmzlqGFnZYxMc9tQb32mjsP7@lists.infradead.org
X-Gm-Message-State: AOJu0YzbdYZix6Xv0G0EjkpfnxEZKNmf7Beil2LmPWh0+HAnm7b54EtU
	vHZwumGUQuPHw3MN+7xfsoakDJVsyUfuzuTWNtxXhXVciq+QT+VTW1gyYtzRRvg8W4Y3Q2ARGPs
	sNW17zZadJkVlMzx15NigwiZiVo2LCyxEQR+TzhwLHbXN+AOTy77PqBIuK2rF3S9ORPpkdg==
X-Gm-Gg: ASbGnctlIrK255M7t+E+NdbZ/ger0It9JEmBwRXUhjri4FPt051pCPkTo6UN2N9oSQ/
	HGBJHUfLJIVnO++H1LoJqB6vnPYPGvJpaenYEvjeamCvYIFvHiPX6RaFvyXKSVidy3a7VFADgnw
	hZIEatNF5Jl3Pm+k9ZPWB0fT7HkbsCwRUE5mOQbU9vB0tT1KfIdpbBZAsl6tUMJax6uWLKm9NQy
	KpqTuJjsJHQJ25ih08yK19AbfKff2mm7idV6HpEfNZ+X62Io9A2bsWVxtjqbzOxuG/ujPFMgGjZ
	IH3HtC1lNiwHRa9GbJQxUzDAmg9qlqkzWyLadTHDCjsWs2SM2atCz37XLODWqEu8zuGKpQ==
X-Received: by 2002:ad4:4eee:0:b0:6e8:fbaf:fad8 with SMTP id 6a1803df08f44-6f00deb2207mr23905206d6.5.1743798497034;
        Fri, 04 Apr 2025 13:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoIVAXrUTfJsMNH3k0XqfcfQJdY+GOn1kP1o4noSEmw/2wsl4BJad6Is0Sd5MjPz2dbgObFw==
X-Received: by 2002:ad4:4eee:0:b0:6e8:fbaf:fad8 with SMTP id 6a1803df08f44-6f00deb2207mr23904146d6.5.1743798494647;
        Fri, 04 Apr 2025 13:28:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d420sm309414066b.2.2025.04.04.13.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 13:28:14 -0700 (PDT)
Message-ID: <69da0db9-8f32-476a-a8fb-ddb5e6e185e7@oss.qualcomm.com>
Date: Fri, 4 Apr 2025 22:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/19] arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
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
 <20250403-dt-cpu-schema-v1-5-076be7171a85@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-dt-cpu-schema-v1-5-076be7171a85@kernel.org>
X-Proofpoint-ORIG-GUID: A0MOQSsnvHuMn0j_0dmEo8t5m6OGXg6k
X-Proofpoint-GUID: A0MOQSsnvHuMn0j_0dmEo8t5m6OGXg6k
X-Authority-Analysis: v=2.4 cv=X9xSKHTe c=1 sm=1 tr=0 ts=67f040e1 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=nTi4DTMcPcBUEvcNss0A:9 a=QEXdDO2ut3YA:10
 a=3T6Gmkx0uuYA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=978 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_132819_755536_841F03A0 
X-CRM114-Status: UNSURE (   9.45  )
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

On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> The correct property name is 'qcom,freq-domain', not
> 'qcom,freq-domains'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Thanks for spotting this!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
