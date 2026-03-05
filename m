Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F194F3092B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1I+mWRaw2jMmgtySrx3cJM9OrTbcioi/J3ZbLq53HS4=; b=wTNt0GuOnpSgxS
	35kckphRsWP2dJdBOcrujzfJuXReNiXqxcnqLL/0UPHD/DADuHKwjvYmcvO6WYnV2MUnrk1tIlKVS
	GdhQ6Egsa4b165LZKPT7IA1e5f+mdV7v5jlLi3aOdPWvf8q1zk9WnSPqRejX1Olqln4j3nhlzndbY
	o+6x/LoYB0SYy0dNfuKuDcrXtR00NBLrkWDkbjgJ9x4WfJxcDNhaDRIIYTEn6Lu3ezUbQwq8JGSut
	x5ugTm4cMYlAJLkVe5CjzYYimw4UJZISSd4PieH1o7si/TTtsIZUvpfeuWi4+nY/7Pq8w4xP0sd8L
	qun+Dv4ACd9SVpbQVX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X9-00000001UXk-3kXx;
	Thu, 05 Mar 2026 10:02:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X7-00000001URf-25Vs
	for linux-amlogic@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=HxS3rd0pJgiTurIc2bbKHf2aLK
	mw+prmojSNbhoCyjcUoGup2U7AxpFAxWYbXpPNuXvM0TUvBOFyVsBUQX98jTZZt+1nqT34vRfWX+c
	+P9QIhQ3IUSa5Zk4F9zFCWSb8vjR4WvZfb7wl7ZG+DI4RcXU50YE5bhSwKrfNPIc73XNgHvEBDxCy
	SUjZCmMR0ye1PUtm8zXoLTbHIrqwQ61GYaUsXkCa9iMYBpspmstkPcjGnjA/bsIroU9tvKtfgdsmI
	Z8AzNIRuVUcM31x55isxCcanVxtHbrYAWMAnzYQr0M4tVF/063/T8WFLbNLdhMtAYTumrAVs6nDvD
	Ux1zf+Pg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X4-00000006QIN-1WYo
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6259AIgA3604169
	for <linux-amlogic@lists.infradead.org>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0waskg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso580009585a.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704932; x=1773309732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=cwh4lATZrKQY1qa/kT4TV+v3pt1qh2ViwmZIJnUJ7D7TtM/++6qlREXlzlQHCvgOkP
         bdU6VDD0qCgV2iDhr6UiiAbyvt8+1TtgHBrMM44dMJsSzGpBmrqRayOU7aSChOAWPwBr
         SBkr7B2q+S9OPsMUUJz3zA9REyQdAN+YHMIGNeM9BbvVBlDw1bzc2WlT/CRSaoEM4d/Y
         sjUoJ+xcJLx31KXjRk/K4B0rLz6uIFG9I5Nk322xPK+nXTy7YMyCm3CsKkgc+E0+88Kf
         +u+BZlKivc/UscPJN1MZuGQdlS+6kTJRjn+5vxBC8PAc52qnnPzMJ13d6ZXRsZMMPdw8
         bLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704932; x=1773309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=r4lJQqz6aozlJ6tNAjIgcSjfwAOuVgIC5FjsvXSIAoEKAC+In8Br3uCFD/ngO3P78h
         8RB1sF2GXqx4CK3kr5I9rtitJKWrKB3B49IKP5RAswINP0U8T5VOXI0xMjh9mAzB3rM1
         qMtr307foTy2b0BqMU1OCQDRTaWP/ojdeobPiaDnfulTIL5mOOW78uWRIqyuetIs86MU
         bn2ZviyjtRuFwEPdsBBCuVw6uLknAxIboK8N2S93PEYQBUyzp2VT6ayjpKVN0+lvFZmA
         6MwfYZ3n5+HBB+qv/jHmRwsyVBCg7bf/HtpHYtKvtBTADO/s98W2TrQQlzpveNQO78mq
         NjAA==
X-Forwarded-Encrypted: i=1; AJvYcCW+pFCbmQ309kCBYfv61Xu4b5FEJ+wg9Luimvm1ESpaM/1/Otinn/mdqSRIKPUEcTg9au21KxgrgRh+0cJC@lists.infradead.org
X-Gm-Message-State: AOJu0YxdPSSz51sEqd4ETEW+ZHTvJrrQA40MDHl++mMRkFdll6VFr8rx
	X4RGRu/XkpIaHipQ0zwjPTph85TOx6nCAR5wjj+O6ZsPg6oHAmaPwoto7u3wRkONpK+2iXeXlYR
	ucRaCCqUgbS4GzTZKU0SrTWBitSgUi/SUvsnJO9qMOXeoyq0huVo4Fcd+DHVtxo1IuUszCbe/KQ
	==
X-Gm-Gg: ATEYQzylUIQKn4Jwwvcy/FH/vRUJiN0hPNUPODpfgfwA2tK6Y0a5hHq19ktRqYTcMqx
	sLwYECUplAa4tO75fx4aEoFd3fM7VjAtT1+ybMRnhBKa7broF1CZzaMzBGUUTITuxlksunBqycL
	VAR43qUzT3KdNMtTcSyF25AS+nfTw7XWXXCS2X1v2VP8XKvVxPygJ4MMSqnsdQrOS8ijHMjY7NP
	r01CrScsTKIaSCUHxHyXFRg7cXH3+IvEZWreyU3jFHFYzGCSC+TfIjZkH+8jgq8dhSQLT96hPPy
	ZMG4BUF5J7kFKyRd/2PHITf5CyZBsvha6qMTNp23HW8oVkgBhKRiGYrvoBGaZRbvgWEcya2K8za
	kOdgYsfjqYVA1hH1HwBo3eUdrsb0eVlZaWsxyIPjHoUk4sTOO41Rtyj00GP++iWa6LCWWKMtpsG
	rAE6k=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443240085a.8.1772704931614;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
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
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
X-Proofpoint-GUID: CcmI89aj38CGJ79UqNCnHIztwlJVNB2l
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfXx9Ie2bxiwOjk
 g17xcen7G2uduS5UmCXuWXOh99pqSyhPdwFZUTYcsXMdmAEGJmCLh31uUbEjGyCguXU5pJLkoMX
 PKAIpAKvOqaIpDAnCLpHO4jdURkQRxmknE5deq80NKR67bbpTNc3w90xKCpyTFJ12Vd4bO+Pftl
 DlEJhYZGtsLwSYa5tvEo6SQA+38b1sC7w9G720Et2DccZvLeYq522pdRXdKrSrxa835zDjv4YvQ
 2bKnlj98AOM9NMx5RiMMqd1uR7vGMMTr9IcYz+S1/QBjDGRn12AQQhZlhvwTxWoroZsEtlf4vdb
 gOVpalKSXdnD3Rytf9ogmNMPzy0ipO0dunPfCnb9s+0noOAxXmZjzef/lAPdTAzOB2i+CkRq+iN
 6LgcVenehFlwbg5NbMoYsnnlWddmKhzbP9Q/eJmEFMrY+mgWvfoBVFSXzHPARMOGuc67A5r3jx/
 zrcrElCUANg1C6NQoBw==
X-Proofpoint-ORIG-GUID: CcmI89aj38CGJ79UqNCnHIztwlJVNB2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100214_875661_1625000A 
X-CRM114-Status: UNSURE (   8.68  )
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

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
