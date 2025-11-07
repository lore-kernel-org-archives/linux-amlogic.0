Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB222CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GvWKTLdSe1JBbq/zcWiibdhSTzuitYeUmxOodJ0X/Q=; b=jUtGVwEWp7NtP9
	AfWmQtr0vGgf7XA4SjG44SFpCPv0/qacRTotKyHvV9mLeJLV1K+CHLdhis8gCVQjujMTcFjlCJOOq
	5fS9sgoIW1O/FAQevUQ80ifbTsPJoBRJwMUgxZHuz4jWRtP2Dm/zHuVC2Rj3BMYSGchlYZi0Jdc0i
	j8QJahYxraJz3XRKfxDPmYS0KKiP2m5BfE2mMl5bBMcYCMQ+xU6lXUehHdud0VffxBEIdcHD5+ITK
	gvgUveY/NaAJyvTLc3NGCzrCbL2dmjSu+MtsbdwFfVnfw+iP8+oLvg402h20MW499Aquj24Rd+tUo
	blTsCHCan9cNZPT1POBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK7J-0000000H9Lr-0Huf;
	Fri, 07 Nov 2025 10:54:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK7H-0000000H9LI-0gh9
	for linux-amlogic@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=; b=WKIlRl/i3foYaau5dVBPa/Ih35
	CSlhFnhsmOlrwARiv9ylN3/fegUxbCA4v4LhPfzPRSEV1Vqq9ujp+Rq09wbPVHk+lmO1uhk5eBaBS
	/WisG3JbhRC9l7tYmquQFAyCVFzeEJpa9Vm53lYRmfp23JIWVgTMkPya3e1dme0X+egFEry2Chm1J
	Qy6LIh+Y6b/JC3WBiHw29eUS7RzWoyTCWs01jEekT5ynOsmMxIyS7ZYCGBo3NnKwn1ZoqkLUR8Kqd
	V/fj8vkoFZMtcZHhnmlvEfEvUao8p6JHr63T7dCyVwG7hxZqbqoaeJEBfgG3tqsBm44mTrPDju8Bo
	1qEUyCqw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJFV-00000006EiS-1kq7
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 09:59:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A78fUua4131381
	for <linux-amlogic@lists.infradead.org>; Fri, 7 Nov 2025 10:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=; b=D3ciq7sL0T/1mqDA
	KQOUvXh3Mhxuk859eyTuTtyDlTSts27cCw5jo0Qy/Kqfi0+9EEgGjO78tdJgcjiI
	/ZYPn7i8YLL/cNB3YOhXlcFlNRonkS1KARKEuwJrURUm79wZUJENvHCzLGPw3vJc
	sS2fL7+89HTzvn+w8+6DMz910/EXVZ1KhlcmAk6+G8RfEVGfOiJfWEu9s2rqXdfY
	npR/UpgRmaHsmNeiItvcsNJ4uFfteDzCHsTZdCMFaDW+0I45vW7sXMrAK0mQkULJ
	PcBbv6BEOI8XYuVJ4nEOxTArWjAXQf/S/5TbwBToT9e+cq273Msh3ToXZlizm4UK
	z0AxXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x3s78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 10:54:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b23452ec2bso14591885a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512883; x=1763117683; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=EOI9CQuQA36EoFBZmZ8f/IjuaQoK29BYHMSInNr0BbBGzJTDR2/d8E+Ko/g3iDD1pY
         RLTHbqs89h4c4r5ieKrpUCgCuiACC1bDqn0B/DVDDPtCSYn9B7CdKzWnd/Aon6GrjrFf
         HR+NRsHm0uQ/90+MoazRgv5p1CD3nYEqDIXMjDgHbVpEvaXq0XI62P/cYMp5W5TfWndr
         gstu+yJixu6VROqR2brBWy0tUHQ2lSnoXNnhihqen+a128eef0g6UeCen3QDutMKi1I4
         bsUufKemEYbv3/TbgjuJ3gIaJWe7uzD3hT1cdahWnaWwKXxbq9bSVBUy6OY6eRNThksa
         hdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512883; x=1763117683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=BTLX1VdHEDTIruKQ7pgYJy6SlTaIWJ9saafJQ/GUxTeeo+QrWgu3+bKPfoGU2ae00N
         9xgOSqucEizPbEES2xFc4OMORrNGz8Km5ut0JWAxXA8t7at23a7/okbUR5Fy9buuRiDQ
         9Yaki4V6LV2F9T8OU8nG7O5m3voW/uV38ErbSJJUHrp36wkBrCevW43/d38tP2kCJBzW
         Rkr62vRM+xb9UIzAMkb9JjF0CsLjZoO357OpaUZegCB6PUmCBphBCpYGaHEu02CyqBA3
         vvccl+pgG02LF5FgWIBE6rhJiZNM43Gjk5U6LWG6JWeMfxixBizIysWGxvehdCPKJIJV
         yavQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwsfnXmR2cBSN31c61j5lQ3Xe6cwTF06P9ewy34ykW15EiNrFw/2YbsIVJuR2sTQiPoQDuOQ+DvmsqSwag@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ZWVScxI8ZD7vzOlk0ovRAzFHtPM8y96kX30SMi+TUacabA7S
	b6PTwaqL/tshQg88Ow49wP2TKSLSQglAytvEMVGfo484vJAzbWF/xPf86XkA6P1PoBf3QWl8lBD
	DuEpfP1B+Zp7aoivKQFBktncvuMdHpz3J/SB2tZ9yDgazNbtQ9zXbq92tfjuaxWgPZU2sMFGONp
	VHhC29Aw==
X-Gm-Gg: ASbGnct8XO31tqlz+ykA5rwpR7uBlM89z9+cOfm8CXht6e3T2uWXmfxk6GnsJyxXiha
	WnLkNaJS10/gY7KQ2HYoEUq3oqoaww7wMjLQzzRwvIkL5J0GWG3N08gvpRsIslVbWzuhoQT1i/6
	B0c+Mxn9ltYpYHLyL4iDD9/8s3ArP8K21+2YRx45J+uhSgzkJO4o5sWnT17Lvov8VFiNEAydAIy
	fJc+qYx2hultxOPmEjHuPBPh62vA/fYTlZuVbZ0H0YxUVFshtfjpA7Xq06ezLoX3UQy2d/sXuXz
	MwNddn2sIU9CDMmRFe6VBxz/z8NZ0OFNLKhDlyW0FqB7dm5Bsh/HRtrWjNlSDd2ZQBR91cwz933
	rHw0hFpe2EzcgrPrcJBev+h2qRiRHEi1XlW/7JCGaKN2QuRVU8STT0yW7
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216401585a.6.1762512882617;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7mPq0na085cioUOvqXq74YCfsRc6NxnJgSblNj9scHFLGnEvxVACu852vb4CayQn6idLew==
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216399685a.6.1762512882057;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11367sm205508166b.68.2025.11.07.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:54:41 -0800 (PST)
Message-ID: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:54:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfXyXqr1gi22ynn
 FF0zSWHMw29Bl7ioqnUdZrujzp2hg5G3R3K/nEQJOdFR8kp8PfoK2kvZX0eWBaAbkLJl7KMCFRN
 0cE5ovMl+5dlDhvOfeRHi+OoebQSeU2hyfpOl+E1LQdqNk56YP3pOCPQYdExxso8UpXs61q4bqW
 PBwQeFq4Tx8A7edBxL64NKz52qSM+HAojM2e7ZuYfYQodYpmKd904eIrtZkb5uwmmqCEVHnJfXc
 5EA1IwxrxJC000rVQnWK7VRgpWFKBw/BC7IT7Vn3SI3nHE55UCalicOmZMyTp6FiccZ3zW9P00g
 QGYrCXVJl/hsZRJ0uELOsOPHB1Jeg9knSUJTWIU0Vs7AbuOWGFdnXgu13RoiJETHeFFyn1n6R0T
 T3qBMQD+LMtYrjcNjbe6LJZL2zPCnw==
X-Proofpoint-ORIG-GUID: dYygrLIzhXJmstne8NM4vbsZV2VzoR03
X-Proofpoint-GUID: dYygrLIzhXJmstne8NM4vbsZV2VzoR03
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690dcff3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4r4FsD-561SDv7fJwu0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095918_128526_BA070213 
X-CRM114-Status: GOOD (  16.99  )
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

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As the first step in enabling power domain support in the driver, we'll
> split the device match data and runtime data structures into their
> general and power-management-specific parts. To allow that: first wrap
> the emac driver data in another layer which will later be expanded.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
> -	const struct ethqos_emac_driver_data *data;
> +	const struct ethqos_emac_driver_data *drv_data;
> +	const struct ethqos_emac_match_data *data;>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = device_get_match_data(dev);

This change could be made much smaller if you kept a drv_data
pointer named 'data' and called the new one match_data

but I don't really care either way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
