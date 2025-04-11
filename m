Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A7EC369A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOZtD9hX1a+bbk0K4t5IIbx4xwrRpYFrawKMZv8jXX8=; b=XRe+g5CxHu5wfS
	epIJivQcWOd/dxNwk90Eq+pqczpqCsFxRwNbjTGxXS9uyCKFzgciPUdkOzc5EuNpig6dybgUzdD8M
	LzAhPtZ6lgp09sqaBaZvBUvRACwncfBWQXIjLSRZEpD4wSmtSs0rJLZMmoaX1K2O7iBzNTkFXNC6d
	XgqTldE6gti8ztu87+QsaTsiq76vbKNU3fDpKoMUyBofT0ddPtOtXhTJwYoj1C7uyOvIM/o9k2IWQ
	xyiYMiu76nhSBdmmVEh+YSkgslvWswl7hYDpnK/cAzvcMZbtfzkaGNClYxy7jPklgz8a2jL8QbJQu
	tBDqieBST6SlAly4ohdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AYB-0000000DBEN-3Mvq;
	Fri, 11 Apr 2025 09:19:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AV5-0000000DAGv-1p6G
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Apr 2025 09:16:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1EwNJ006985
	for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 09:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=; b=MfRWrUpWHKOXgxYd
	tlO/p2GZIa8GpGmxViFMmae42WC/Sm1LQQSfsr1NCsUoMXDIaJcLbGKAHmC/vmO9
	mGCfteziXR1g/s5n4OXVCfBnlE+djitVvKKVaO0PNb1yjIvOk4sXsZyteZl/MXRU
	0u74+JzCVDzaGwOwQK7IzLVuZqj2WT82Y6ZZdVDBWMoTUSpTGWgMQ5JlvvhiEuf2
	Dn04zgeuEvj9ASmeFiha/ItVQzLRwcsdtbbXHHOkdsh+X6zRW5qmMas5wY2VLWDj
	jMR8zbMd2spdPqvT3hrO77tyq2fJSup339513IQbyZBJVJJou3eIdlBUHZjZCLEV
	8A6aGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3jw5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 09:16:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso42620685a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Apr 2025 02:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362997; x=1744967797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufhmds+kkSlO2rSMDq46DFe1lGxthqem6KM44BdOhnI=;
        b=dPGwzsdzvujhKid/OoqNY0qOFWJzvP058HfUe1graG0Az/6fMVaI1UsTVVEno/rzzx
         1m0PMXJNrroH02Ri9XbWYOxeHkAlP1PI02QFIqdveFLP89F+GSaiNbICyBWeT0oHGwq/
         5ChmN0AGlNet7NS9d0zgG2L7+hap+ptlzPeoIElSdIzaCdUX675EV0HKcHC2pK/gvObf
         wXk2VG+WL1hGf6ZoqjSMpI3LML479+5o9pnqbqsbnEuzRXuWrLOn3TXPOD1VrsGQbZzr
         4fJetgnIp53JWydrePs0UH1OlLkrhbIoaMmJ17HtFTks/Ubf5wvSAEhgeOInUSVdaaIX
         FOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVnFuPl1jn/bRUHe3GLSPgiT3Hu62QmG6ugozywo+/wlrPbmBeGOy+Wu76d4rRpe67BDeRWCZRY2W9qnSn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywuo61V/I+y/aFP5X0DFg9d5Hpa3tA0fJP5/QR8m8P7+NGZY+t5
	FAgnKN3OCJ4hV6Nt+lPIp36g6eeixmTu1uVqIISpZj8uN1xyhZ8GJrlHQ4z7TPJOOS9WZD2xCBk
	tk1NZqYWyfJ8HddOv2visb6PMKtwGNMBQyl3mBvhwUdzod1RG1o+FL5tRgGkqacg/ip4n5Q==
X-Gm-Gg: ASbGncuOk1HBjGhSgxLVohNwS1S9aYErClj8o815yOAVguxuF9aBZG3bfa80TPb/zqn
	b7Nw4MHa01agnvWOFxd7wEJLjFYHI4FD476L724NrCoUvd4OrsqsvuCZCrdaNSokuEcRpDHnrsg
	BBhZM0LRdadyVH+9jlR2MmTea6+MUtkH/L+nt6HvMyJYC4ngBOqbNodadnxnoWfmIFxjIPq8Wxg
	1w5NnFBRKmr8toW4AHJeBO9C03W+TVdmCcHIvxIHJZu7GLo77LYUdJQcNvOGmEvqb2qqME9hhEt
	lV3mCgPr51g6HVL8jGgL5DG1c0NrGUGznvgfCV0Sxdf3ZaX50d54TfYuWT9PEvW65w==
X-Received: by 2002:a05:620a:24d3:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7b1af7826mr48640785a.14.1744362997422;
        Fri, 11 Apr 2025 02:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk9dXYbzUf6tHquMMviOk/dVPcbI1gX6P3/o7uHdR9WHzJEGAa5g8BLBffgulwxemVb9V1bw==
X-Received: by 2002:a05:620a:24d3:b0:7c3:c340:70bf with SMTP id af79cd13be357-7c7b1af7826mr48635885a.14.1744362997070;
        Fri, 11 Apr 2025 02:16:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9632sm424190666b.66.2025.04.11.02.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:16:36 -0700 (PDT)
Message-ID: <d4f29833-a9c3-4942-a333-8ca4e7a8bd97@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] arm: dts: qcom: sdx55/sdx65: Fix CPU
 power-domain-names
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-7-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410-dt-cpu-schema-v2-7-63d7dc9ddd0a@kernel.org>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8ddf6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yZJRhKYQK8xzFtgzSFMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5kf1-Zm8EoItIr4AYm3oKQl3FvhA9WcK
X-Proofpoint-ORIG-GUID: 5kf1-Zm8EoItIr4AYm3oKQl3FvhA9WcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=958 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_021639_596226_38433E9C 
X-CRM114-Status: GOOD (  10.10  )
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

On 4/10/25 5:47 PM, Rob Herring (Arm) wrote:
> "rpmhpd" is not documented nor used anywhere. The power-domain is used
> for performance scaling (cpufreq), so "perf" is the correct name to use.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
