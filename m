Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030D6CCF2CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2026 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1XJ6uT8GBVpk9dPDRSMdagvjtL7qlpPkOV7QP70kNY=; b=fbTP51B9tt51dK
	GlY8B2PulKTN3MZpE3ggxoNO7GEk3bk54JDdkBPEpS5B06q+M9YRZDByqTC91/aMSnAUL/DlDRqiX
	ub3oivb3mkBt7MkWGjWXCssKpSerrNl3qBwKlYuFfg04D1dKH1ZxcCIykeLGcOxj8T1zK4/uiuq4Q
	aoJ6XG8btPM54j7/tm9bNHy6NL4p1B7rgMw0S/it0VS25HuK7EZ/pAlVwahC6tvLO7RjXJ383vXE/
	aHoqT/ufPn7a3yoBg79mrwW60NqQyq/mtPd1M10MbkOuINaAsQsvOB62XD/E1f1NUMNP5DzvcCud4
	YOHZzGwMMo/WI2EDTsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7NB-00000004vpR-2ml9;
	Sat, 17 Oct 2026 16:35:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7N7-00000004vno-28Yy
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Oct 2026 16:35:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9mTc2533968
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M8Exf5uWUb9cZkvT1EFUDPQ1
	TTQV69aXO+M/fGf49Pw=; b=SvbhEerpHza+8SdmQLIHmI2tzCGBloUXBXclwzhH
	3zvmJVOB8xwyS3hhxJYTNNiBUKV0XY8PSqCFVNpgzc6CSSWCLvfPtkFeAkh9XIK1
	xP0T0+G1nwM3GWS7HSfRWAo/8PcMnsmd7shqnuEJ3rpDIoglzHyWZguFMOBASYUQ
	xSZvhnsNiP058el1npRPaibWiTLs12fbApd83r4HIqKT8fCMA72QZOq1uwE3l8N7
	UFCDy0DUt44epTi+3yVj932X9a0ROrwhjoNKlti0uhJoGJp9p+GEAT/QwlAJKX30
	ztQqKDxqmquratQ7dPnl35V6MTTEyo6UTZRB8hrvMHd/Fg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbyys1fuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:35:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so3333365c88.0
        for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 09:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792254900; x=1792859700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=joxoQ+w115Ag++LsrGnwW9GgIp7ViMgAFIfQISUIslGla1nScZUjZe3i5eBw19DzKc
         lo30PapsGh++LhMhd27bSKIqFEkX53paxKTiczCYikfDr6BDPLQgFWhTHBuvKwA9xknk
         seEm7rLV+zbP8JnPwK7mMUCLchaI5sNVNqinJFVwJbaw7aLfRUC7S3UiJFaEB4b3a8Tw
         LZo8oDwxj83F+tmtEsuH0rS4ITUcarRyyhi6Wk4d53JTORduj0LrsNB3HreprsYQo3IB
         42Dz/OKlio1ATKrejxF9A5ef5PKJGazKHD5wIlgtKDmO0Hzk60xe7zSsF3n7GPVd5liL
         Jc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792254900; x=1792859700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8Exf5uWUb9cZkvT1EFUDPQ1TTQV69aXO+M/fGf49Pw=;
        b=LrjJnQWarefRb8hjl9k8xTqmKoCLgvxvW02emW4YiiDuK+LdbmSn7vpd8CrOhUNc1D
         C7dbKDYK/mfeYvgqb53u26RxbgiYT+OfKBKNh0uLmplttf7//s5t/D6tknk/X93kbM+g
         +e5n9NHNUn9sIJezsiBh1NoLPpXc9EurgdaqCbPKv2CJosImtZL4MRPHAQp7wzCED43z
         +ke1ofoDz1ujHR540rHVqJZcEMCn42Ly5XxS3/Mlb25yVsNU2ShpkrcIVev0xfwSeHhk
         FK2FMULkFcY1xEHQyPG4SF93YJ9+eNeTYcguJJbNvGwRtgqvG+ujWuK7xtC19MmEr7c6
         PyHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI4SOS7Hfzho1+HSgeYrENDYCgIIDNUX35P2JmxlJv4aAnUNi0aDS309BMcV40gAvu4YyS5JtpclL3L99o@lists.infradead.org
X-Gm-Message-State: AFq9FYIEi7hGjX3UCq9aUvNlUh3qI1bqUW9QljfUpN3/M40cpYEA7uLl
	Fux5O0DGVOaXJVpc6WIpBJIvbP55KB5QYi/CNfIC46drnwAuEVPb8MfWayxlYj9CTs5wJWxy4Ud
	/KdNTBbcMobezcwnXUoDdgi5yq/VFoGLXMhsTjBeG0a1KVTj6/3bhrALewlvb0f6bGA8duYgTVg
	==
X-Gm-Gg: AYBFou1NZN98UfyjBB9QimDdlv1h1byUI0bqbfz2hUctceOz+UkakvXgAtj6TXm8dVF
	jQpEqVaYYAMRsSlHzLu+WZEpUGoOSJyUX9x9Qi9EJz9FhyQpc25PP634IO38KXxOyVnoP0Gf3Sg
	TTGkNZ8e/p+aeSwfJm6vSUsMz6gZQYmzvwOLi5sbNqQcysITPSTUvWfk2kp1MfwGdrXeZbTg4Cc
	MN1zp0LcsA4tal717IXyw+aYrDQ9xoF0zLZp/gSQpW0Un89dPtJKD3cN1vSNHK8qRN/62ysNGxl
	eHrW4/8tsNd43pRNm5qgaSLuAdE8qY+VfWc9ZgGaM/8w+rEuinaXY3fX3qewfM/c12763SPvH8f
	ItIlPGK2DTtAw
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814796c88.29.1792254899714;
        Sat, 17 Oct 2026 09:34:59 -0700 (PDT)
X-Received: by 2002:a05:701b:205b:10b0:184:d593:2897 with SMTP id a92af1059eb24-185138b5855mr4814714c88.29.1792254898926;
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm21415852eec.20.2026.10.17.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:34:58 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:04:43 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 3/7] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Message-ID: <atOjo+X7y3WniiT3@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-3-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXy2IP9ye9vVgg
 iM8VzLTu+nsOgUOwLH2VmmPiTl7JtE8aEpnmh5V/wfbOQwDfgFAzGX+k1nl3ltAc38STCClbK7x
 utf3ZhVMRXTYqDDAbiZp/LmwsghdQ9IdsiSW4b/wYEUiI3Ro5JvPo7m71FWDEkcpKYgZD28UIbH
 KEXZzlb0sfjXGCqxdq+HEn0ZyjPC17b7SM85cd0G8uWjoQ+xvc3VMpEJig3WONggktnHFY90dTT
 Z2IarZjD/ESN0RGLgmZVc2W5t6JVT1nU2btLLa8CIMWCION/RYJl8BLZgnMOfOdmUnINW5/bugq
 ahdjkO7llHNdJTRMr5jZda4ib1kIr98FfsJIcSpQUt0xSHLCwIKyXyEptGYavcMdMFhK547DnAt
 A7htQB8oYigRi6fjCG5SEdQFOGPKVeS+AyDfjiKggz0oEsAur1W5z3YYgZsv+acvkRb8Op7oVB3
 wiOF1gi/DTAm57BthHg==
X-Authority-Analysis: v=2.4 cv=W4WtxhWk c=1 sm=1 tr=0 ts=6ad3a3b4 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6xCJM4BY7YgkIKmfACwA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: CjTPRj7LUz_3Ww9fSTY7tEpvtnQJo46O
X-Proofpoint-GUID: CjTPRj7LUz_3Ww9fSTY7tEpvtnQJo46O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX/mHTFAm4wIZq
 UmkK1o3lHHokS8UiIeikVKtbwj+nQUpR0CR21IKGB+rLn7QDwvjx9nAlNYz6P3hsXPhjed74pnd
 kRi5sYbAed3A6xZVdIWyg1HOaLajV64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093501_555874_8CE327EA 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, Oct 14, 2026 at 02:36:42PM +0200, Bartosz Golaszewski wrote:
> Call phy_set_mode_ext() before phy_power_on() in
> qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
> SCMI systems this is required for the PHY driver to select the right
> performance level - which translates to the link speed. This is done
> ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

As mentioned in the commit message, this should be harmless for existing
non-SCMI systems and I did not see any issues while testing this series on
IQ 9075 EVK, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
