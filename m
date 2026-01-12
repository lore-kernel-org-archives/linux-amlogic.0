Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D82D277CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jan 2026 10:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHg4ZXLvpssdyFwkSYbdMOzFySnr7xLE9q6ODQhVp/g=; b=lOSQHKEfIfDnM1
	EtbxTtjE6d6KNNvOFRoC08D0+tBM0UHtesk4jEOTzzk17R0BC+UsxxZBTrpdcSsWgr12T64vCtNlf
	wpklRCoHpB4cknEBWcc3uSc0PsUM/XbpBNC6N1E6So/zYq+Y2xQCFuaD8evIhwk4jqjdO6Bed8s0w
	az8gflGPxqOLZJRj9xAQ69CHw7LODfj1t+nrGo/BTtyksbbjMsGPC6Lp6kbwc/TlkpQYEbivs960J
	3svloD0usCZZ9QDAn4FvnL5VjoTXOKh17u6oiwqub3UJfwdEBt4HCTjfB/oaVZuBVPCS5cHGqrx20
	5YijsdyoqQNzUwr2lvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyX-000000058d6-0fmo;
	Mon, 12 Jan 2026 10:16:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEyT-000000058W8-0YDb
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jan 2026 10:16:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Ofu8555266
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=; b=J82g/RNVm849cx9V
	dFFyzABcKBNY+CiRsaA33Ps0scP/CMuZcqyfPxphl8zZh4KXw1EheKUhOLCLSELn
	fr73shiZALVUODPnid3Oxwt20bVRnDipcOwY3xUOqSkvUNu3g2BnarfxP3A3wi3v
	1USjRt/sjkTVynSi0LajUP0Pi7KgNpgUfpZPsiu8IVr8izPHvhL4yqL30yYC/FPb
	kPD1zWQEkIndjwmO7W76Q5fk1wRfeMnGHPSim1uq8gOZfDxkSlt1LJpFzSRiuLyx
	0wxtvVRJ1w7IiFKQ8hnC4kB1R1fWLCa44+kcs3unZN8H3p2vRbyYNeoxSltMV34Z
	3rUmBQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0kdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 10:16:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c2bcf21a58so1700929685a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212996; x=1768817796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=Do3gm/VfxYE2Csrk27zDfT5If/iQ8UWySrwwOvPEV54TwezyoMC24ubCWSb9wIfrgd
         3dkUCclAwX+q7QMCiG4mcFOPNoFEpPE53xVnR5TtroemN+rjdLXvEbu2Kyt+/zpQvfwX
         Ns4MNMiGg/4GGWyMqHtrF2s3pKCII50FtvoerWjbrV4nwgur+qF4BHHMSn+iQtPHkovD
         X9DkcsbXf/wxI9eXnDIBQm2ra7pWpHyAkiQlQ9WGVP7hctheY3nDPe0EtU00ihTrLmvo
         oQQTFAXeZq3AgQTCeyIxcFvtADEg68E641ZRELOPVCbMUfF6IEe0+RfuTMMBiyO3+FDW
         KVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212996; x=1768817796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=lcyIF3BHX5yroizxtwXGU30vpFu7VUyw6x6HFZSelH/U7BIkKEaURbS+68cKLMLkiF
         YcIB4JWafSesTLaInknbsYvjJoBhqqtuXhwexAlhy4ff9hnuWrkqToaOEhzLN9mPGQXN
         eWu5DZv9wcoqMrFFheR03mkn7e1mH8CrH5H75N+K4Ie0secSEw980D6nRgv9D6OTg/Q7
         mr5l9peqzzjq2mfahbhGCjJpqOGg5j2L/H27Ov6af6Eh7KHdwvLv8GXp9lXZaU2xlGgF
         r1IznMkNcaus84oHTkyRV8thxNXP7E4R4rn8OcWO6iDf6fXXrTxoqQtLscd3ao+8IpA3
         tgXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6vYA1Zqzu+GEiTM4mLZRZTpItHfwjzhelP5L6UbFLspjYi/rEOjRw/onPUw+qovgW7Y3rWopdqIopEfIe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4nFO9xO2JDDE/YvDTSzpD5ir8xxwrA4L497tS8eA3bXATDqZ1
	4VU4CWv26TrDL19L/uMw3el9f9gZmVPeF6+hRrrjJtsFIDYhQTu61+d2uD6bkChRGKVF2AvT5Fx
	91UJyPAkmwa8Xgdaf/Wt22r6k/H8ESR1HbduRkhHq2IGlj2G+b+SchnjIzRf4DZwC5CevOh1lPw
	==
X-Gm-Gg: AY/fxX7ZviPp/P94uFxp7wT8uKXILrgBVMYmzOy6XXKhPk9Rk3RQW/OrBzbjFWdLogb
	oZW+lHKGnngRva2OUa4HeaZI3zCXkTKmqlQ20h7jP8pG66mxHnllAtyvqxk7TUBPHpjvo0uH96a
	antRE+CpABTrQdX8sOU5I/5bVhjupfoKnTPsOkBsNRqU5J3nPp1KRciWCFzjbdz8cst1LGLM2IY
	PvG+vxWw/GbeUOgKpjNhJEcUPuGhBUIvBs9sjZBJi/Ug8PC4g7Wb7mmibbadwW7tMsDHh7wI23n
	aUxNGr2oYGBPqOM++yoTuLkNGdAyHajPvmbas757GNzwZTYGtr9po+pRfHihxg42npq4KyUpGIk
	A7IkVrIuXPuHMzD03BFigpuSIJJFMgyuCLzODCwAu
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171262285a.71.1768212995566;
        Mon, 12 Jan 2026 02:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYulo3AW2dpzYmOgTmnb00p8XDyYkP6yaVRp/tr3YHxen6aKzZ4A66moQru8K3ffeDVCDlWg==
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171257585a.71.1768212994897;
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:44 +0100
Subject: [PATCH RESEND net-next v6 5/7] net: stmmac: qcom-ethqos: split
 power management context into a separate struct
MIME-Version: 1.0
Message-Id: <20260112-qcom-sa8255p-emac-v6-5-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
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
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ai4l3jd1/eF4m0deghb1F0cSTBLoK0XWRQHcHMJ+W4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnq1poFeCZEhGAbmOEx862guge+htaF08CAU
 WRid/G2CfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6gAKCRAFnS7L/zaE
 wxWZD/sEntiOzbImdwRltcgIShIGvZC8ukrcaFjCojiYxd1Oqi2LNK2fbi6NwZ+LBIG2uTaHk+2
 QOuSh+pM9mO0GJdCbAR7vqrseDjB0+3EGZS9euka4b2fv3kXZKn5o5BIz5sZ/WbRN7HIHNh3qOE
 PVeScp8uwCfAECOHVWZElnAW3RjMQ1uK+FRRIZ2afYqUI52Iv50UV5tIiaK6sY9MWFVbin0HTZZ
 hqiD5ZNwZ02jnplOZIKlMbFAFQ54bBjNwYZphy7CJZAkzLMYSnPHLAKVS3VpPFLDo5XxE2qbSUc
 ZjDZnPK1pT/Sv33lf5NOSCHOxnV+GUYj2LGWrcshhqNAjW+K0K8Ygfx2tQjWSK2EbfSg8sUrZXG
 qAAH8nyRkDVFQXrOjnJTW9Ecw8BlKjqsEQeMd+7C8u0cc9jszvdkNCNevRfCBJejdjFdEftST01
 jqUBVr04XNwxNNZkI8Cty2A42/DA8aDLr20cKzUo+aWrnCOY+WFZoKDOfy6T1WkzMqNrPUBEzpZ
 PJ4HJHtWgOVVmHf1/K7B6skUMKINuR6aDPl1t5cOI9Eai8MF2SnrmZ8iUmhuXKP7dE1A+dVy6fM
 y3EtIhGtRmd3ecY/vKJ7eHH69ZrXeiV4qiOdAYbaLuMRGglazNI7nuxNC7nuUa9bhF4JAVyC6Pz
 xBXljylIoPiCmPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX2Y8DKtauBSe3
 hJAUOLuwQ8lJr5wnYW/Zbs9QC1h4LIJ1sWUvM2caSFioW6AsgKi5BeugJ7/sTHSFISbVPthdhsy
 FoNG7PA17DNEPqmvumSO+ZHpy/klEQI8D1VmDgkefBuBdgzdHETPBfQ/bbht9KjXlOnCz77GiYn
 LwPJ8Cat8TBn5/uhBYb94/Iju4yZBGDx2qEuYy+0nvnrl6bF/ylKWXOBHaxfvtHGE+pUoHObEXW
 y644X+7nLvvf9O1PHoNuEfiw1BjFU7XkX5x7Lq0JOYiYQfr9CeEQyHRgoXQOcyR1pjvaCMsgFcS
 fol35x9o1O0dIao7umJEGZHYxu3wc9ounGjxMgKt+fnsBqoKNLjz6P/HpHgAuQ4XC7X+pme88Zn
 IqiA7PiAJ+m8q1F9yYyQTLcmR9exo7agQPObG7yrY7hYLCB3aY0OIxpeAZ65+thn5k0wZOtrpl6
 GYbDnHtYqZD0HAIBO9w==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964ca04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X-TyB6MtGS_gwYDveGAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fjiiLUD6rwdP4hmvqPfySQkipqs4k1Om
X-Proofpoint-ORIG-GUID: fjiiLUD6rwdP4hmvqPfySQkipqs4k1Om
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_021637_202944_0F519EFD 
X-CRM114-Status: GOOD (  17.97  )
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

From: Bartosz Golaszewski <brgl@kernel.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 54458ff5c9108a6255b38677f4de973511b5176d..856fa2c7c896ea3068ac38d9ee71b4173edce80b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -193,9 +197,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -616,7 +620,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -683,23 +687,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -708,7 +712,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -721,7 +725,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -816,9 +820,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -829,9 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -853,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
