Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704BBCCFA05
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 10:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02kamaZeB8oRc1Wkf4rSF04pWH2iym0F2e2iQUBN5gU=; b=Eh3iLmDyAezMih
	XExWg8Ic7QqAON10ABJPFYlVfPXvBBiKAWrbYDidg2J5PvTMcB/6fdIPo0AWK/I9ZwBhSfQbsRems
	chRZ5pkBuaO7mwcRMUHvk1+aOIzQhSTGd/2FcSRxRNhDInNavUAfq5+pIixpRjN5SgzZf1HqaeMIt
	L5/85gcaI2IULdetT56cxD1SGleOsrNzahMsl61CEgF/+A0xqeyneG3cOp8TkARde1LGRoZFotp7X
	xs3dV6OzP3LwrBCP5DtbNSAlzroIuZUAUSsWKOlQVBjAxIGj8LTrULc0HDgyuaWaQIr2S1RlsB18J
	5sU9gSRfbXOqysmwuPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK3G-0000000H8uh-3hBc;
	Fri, 07 Nov 2025 10:50:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK3D-0000000H8sn-3seR
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 10:50:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A744lIs2085451
	for <linux-amlogic@lists.infradead.org>; Fri, 7 Nov 2025 10:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=; b=B1EYSsnG47lGPxvn
	zAiOxrAmz/Wz/9UGbFmZFaJUsrfmtRJdHGCRNLO8nK188PAywHZCZ/Czv8tlM8ve
	CGTbIUMThDuTRN2SNFnJdG0FxRGnW+6oQLaE1SUNcHDxkH1p3qM+XKbF6+ZvwhuC
	2xSpWB1caS7pSkxWxhHPfYew/g/o0fF2xf0FwgXZJ9fl/vku5K0YWUR2Bzn1GvAJ
	SLreBdufu7mVgG3gE+Go0RhRFhZFyzFhMp9WBxMVB5AfBt5uh9btC4+Yx9NldHxh
	YgAVAW7chm0tTXTd4tmqkRL7pByvT7vcNlH8wK7Ctms8y6dh9igwU/62YLoua5H6
	vkifZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a99e7951t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 10:50:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-883618130f5so25994085a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 02:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512638; x=1763117438; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=LTR4QW50NxYd3N4Z3ZCkecHncDm/Dc9Ag4maK3nj2Vk414j80WzKqgoHI4QE1YX8om
         JbbpgFo6hQcg+NU4jm7omnIPxdJDPOVRIIbG+cAv58TloQZ068SI6GBK5JKlz+aY4CbO
         GW65f8RurGPVtE5TKjN3YuDl6X0VMW8rcwjQ9IVBeuHZqgDpI886wBdbDX7kK+01skKk
         lbBDzGwxAUQ/QwbdO/bRYuaAMkgHpJ3/1lHLOHWkYPy/+L17vIAGKle4VQ8xZFZ9JvzY
         VyEK/hkQPqVRQ4NlODMzrDJDN4ndqF+tB3crUYeLOKqDK/aJS01wH963pSJcZEW+PaLz
         rI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512638; x=1763117438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=Djdx2U0QOubIa2y/GwoZf/JAr1VnxMh+PXAk3dqnufb+a+vzhpiD76tsZ0dh8rljBH
         r5MYHKfGuJDV4uk01HRYFVtWeUUBHbP6Ya9XGfk5yV3h2whK8yx/OO/KsN7ZMlWv0H1X
         Oy4R2fobvsbssE+6sTTB0byPeS5E0ApaZO6rN2AbJjB/dUVWvu3EjEQZB5HXsqSRIcDM
         0aoDre11msotYbmskYrAeNxQDg9xk7JZZRXCFPoclKLn3jsqMc+7nwIyDv7K6qzsdNZC
         bX2EKYYeBX4x79KDP58FRob/sBP+Nsi/SLmAVUKt6cgtgDfjtXf9gXj4Mf0ySghDbCTx
         djSA==
X-Forwarded-Encrypted: i=1; AJvYcCXZGcxZm0w9ft6EOquaxFNnGPbFqMa8QG7QEwqThc5+za4Nb8R2z/fyjI6OZ3WdpohoBLhV6AT46YIcJ5Iz@lists.infradead.org
X-Gm-Message-State: AOJu0YyonKS9wdb0lVNoMdEwbIeJhMHsRAyZUk1x3tfecIKbSPOfEPer
	mhBgIyOlDgQ0j0qEoDQhBnLxuVE4iOFTYCXnjfd8brdGOx41PAW43aYlNpwkO0pAayyAwtcINaz
	5+c18N4BTzt2rp/J1UncZxGY73765xTvo7V6ALB6WpO58aIrQKM8vAKS2v3BWNWBdOzhqkFaPQw
	==
X-Gm-Gg: ASbGncuYB7+t2EqbD/fm2nWLqdTcZMu+clxSN+UDCF9r1gmcNdrCDJvp6G432jJk6o8
	UF5UDGEEYlVtNip82GtYq99mpZZqmoXyjuMYbcY1hRpsgyQP0CzHgq+Le+JfTPXxebBrVkhhDp7
	l9zvGBypSsBfPFcg9dRf63pww/K0MS4/MB1KQZXjmdWU4vPBDgv3OO+b5Fr5lLZ0+45ONXB1jHU
	KURnwu91T4cUH+jYRZ7jTWdMultK1L1Ip1yTRtVfOke1ziMdaHww9StnQ3IJgkPXfjauBrwxDFT
	U8Yl+5aE9IQ6ko9EKrJkJu3cxzkzSVgQRPTQbZAMR+DXVuBgcAyCFKHEmoBdzlPqjgrtUvr8j3i
	fVHEevq0K1hkXENe7/riA8Fj34M6sgyR6JJ+4ofae8S/cdasx0Gk6PhCY
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484771cf.13.1762512637973;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQ+rghHeVgkMsgvUMsj4lxwZEJlBOwE/naarHWq7nH8xBHgoJZQqQzG8SkQO4ghE/Xbce/w==
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484181cf.13.1762512637527;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcaeaasm219104466b.1.2025.11.07.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:50:36 -0800 (PST)
Message-ID: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
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
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfXyQWzBzxFd6Pj
 OzyXRyes2URsdPuERcLsYNSs8o9xxYg7veb0DXyaK9jdc75oKNWttKG6KBkgYAZMG69hVjgcyME
 fpSFRkcngclN+qRVPXmAIYsBUhWy5roSExWJTqigyLovRuBBHSGG//BR/laTZGQAz45pZpEIIX6
 yaUCWjPYaKIwy/hjv8peyK4Ts/cs6VWDK/XFF/zf/HTKWzP/sNKmnaM1WI853ITQTmzLjEqDSf6
 3IsDTMQHbBlA4MvxgKcGICX0zcH6Zb3UmlxZsaqgjV6IyOYMmK3Okh4R5SB1xCE6cXAM5I1iZ8w
 BMFuzPu/pMHuLSrCiEJFQObrADlgwXsOsAYxEcZZpLHjGbshMLXwvCYhhdV+nzrkzgrHOJ6Ogya
 jLCz70B6GhzYx1TjXn+4VNrPH7cNOQ==
X-Proofpoint-ORIG-GUID: Mlk6jwhABSg-JGInGdfnOGROUEoZkgry
X-Authority-Analysis: v=2.4 cv=A+hh/qWG c=1 sm=1 tr=0 ts=690dcefe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=Xr3OHDAqYAD4YnyFvXYA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Mlk6jwhABSg-JGInGdfnOGROUEoZkgry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_025040_116198_0393742D 
X-CRM114-Status: GOOD (  16.98  )
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
> It's bad practice to just directly pass void pointers to functions which
> expect concrete types. Make it more clear what type ethqos_clks_config()
> expects.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  
>  static void ethqos_clks_disable(void *data)
>  {
> -	ethqos_clks_config(data, false);
> +	struct qcom_ethqos *ethqos = data;
> +
> +	ethqos_clks_config(ethqos, false);

ethqos_clks_config() takes a voidptr too

Konrad

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
