Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEA2FCB61B
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Mar 2026 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3e0yWdk+eFCESt/gbn7bWXJ775cKvwAtjp4rttqz3v0=; b=WeQCKk9y8bTlH4
	Qzh75SlLiuhbraOhNgG8/2HRNfPOMZvNLyV/bUksJkPO6HO89UvN+aCoCO/Nh/Ej5LY3DYzbPTqr+
	93EQltQBwhxvtG34J0vqjAvfX8O9CyAKmFNqNisnSBgR1q2KNX2x/72ShTir6UFhmoviDlJ0xEX27
	U3cZLjLTtKHqeCoS15Ki5KsvEzD1PK8cAH41vWTn1wmTEaN64t9WWDu5yHaZ2NzD17jqbZ2QciJnt
	S67phftWCyxC7mN7c+SAXuEIlyYNbPhx2ZRfW4Ksn0y6Rnj0ozO4SbglJ4/QnfAxdKLt3LS2nrILr
	Dq8w/OXbaL5gWOmGjf4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOk-000000044EX-45Ma;
	Fri, 06 Mar 2026 15:47:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyXOh-0000000448k-0XeH
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Mar 2026 15:47:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT6Bi2522589
	for <linux-amlogic@lists.infradead.org>; Fri, 6 Mar 2026 15:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=; b=Pln1BdJhqoaTMh64
	8pQgktMnqtuBs4y8ovD9LU1rU+wDekWELeUbFc10sB4twI+AgEj0024JrowAMC67
	iMP/frQMERvP1fLHEGWVgs5nETztkOZ36kX2l/lBJLvv4CH3SGRTF5UmmuVCKdjM
	j0HAcfJON4jXroD4ALm0lq6IrFC0MJALzPyEeHLcx0OaeGzqw2WOm1o7Vv0Fv0Tu
	NBh4zAmlNixvCm+wDi3MubHCgSeVx1xnKqUkaskHKlXy5kz47+eWYFefFSFdWr5r
	E8uaAP4PnFcV6F5d/tCpGFyTQcIzNlTsEmNu6d33k2sqz5Y1xXQiHe9Q2fPax8ig
	LuSklQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6brm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 15:47:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd722c1a69so140188185a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Mar 2026 07:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812045; x=1773416845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=;
        b=QIf34mwA4M1JCHU1wy0aNHKBiHeC8ilbdqi+s/jgOSH5RQTpGntE7uOXzcYuaKXco9
         QyV7u6rg1+u8nLj9Kt+gcwHWuVYxW8UmVmNLQKStB8UXW7HZGoXmlDsmErBrhnczKXvQ
         64HIRESM8IfB5l6xaFIkAnj2Kp6jo+mcwqS2B3hklKzqHOZ8Hmwy4K2qNBcuOQ1zlnY8
         +42jwmdpXll8UrZC4i2DQBW/SpkpLotXO/89n2BvIik75IXTySRCowwU+LYEGqoZ+zHC
         xyJ6Sea768ioC2528hqeo4kBZ/RwCyxmZRwB3gHYuBb/i7JNMu2PZGU9GMWMzQkJLXd8
         +nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812045; x=1773416845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eU24ZQ0ifgQhG9aJG91v67vTmeB3MWe3LblPU2fIXH0=;
        b=X7tMZqm0LMQB2k3Kg0cY0ktVpdJ5IdlBw6t5LD1nxrQMKszhAutnns05MLfcfUbjJG
         R4X1auH8g6uG3BaxBQLtO4yC50Jq41BZvBnsNvy40iSx0hcuayCQ2wIWPlQkhPzEhpbz
         yVO35Zd3jXR0444d3McyPh3kEKwt8p12hGVa3p2Gkl7+uqlH5+CaWppqTWz9UfBL3mV/
         0PqBz6SXNp7NDe6LKanL75NQpsnXqMZqe0s10uGDcp7lbZXG+wWLIEtXpG0R3z4CgjxQ
         N3sa3bDPNyVPcnE1kblZjvSfJwsrD30WxAiDzgeCwhDQiqxWO4GRfBgW72YUEQlUSkFf
         lbrg==
X-Forwarded-Encrypted: i=1; AJvYcCWpCZ1fLXSHI12hCivzS5YaneTFAs/6gWLJYBxfLVF15udkW29ymoxVNwE0YG5cDr4up2W4Mx57oLynrmYn@lists.infradead.org
X-Gm-Message-State: AOJu0YwS1Lpq5gD+kGQVCv/u+zn+ZvGRIw1HSoqlsFPucazdRgmelv12
	OQByUJseMWOpP5T/mGunCXv/hF+6A5pV+OnxI4vJwETRdSN2qyygQArLkeO04BXpADdusdz3/6O
	6z5hevO9HgVmBtgQXICyQVy7oBeOLLHkOXqO5ELeynFDJWWwsXUOY0bl4So4Tn3eTY/l08E2UOQ
	==
X-Gm-Gg: ATEYQzxn9ODNPp9hWwlB7f1RenUmmgDHXbbNfEq4jO+E2lysnapjvOfRUtWywMU6dmt
	RRRS1BNzJX9xuXtWhXaD3jUmpniqam4odvrs+yMFUmFvS0ixCRobDv0SQKnbLqac6vZ0iITWdNS
	JnD5Q1deteUieOvMCzYgj1J3idxCB1DBUBm1NbDyZJuoch+8kcrU6YuBQhpWY0tyV9CziYkMSXO
	51dDdtZbgYjJxUyr6ROKOwihIsDECF8aAPNUzBGjo7bYGKnQ65kjnwQbYr6ltsaa4cuKYh/xtZr
	2FiF+EEebJUNWbotek7FCrqAnxaZLbsOa30Ld7Ra+du4eFZ32xYSWD9GLOvFFjXKp9dfcDZw/RT
	gvws8p2+QT4PB3+juCvrZqXTi0097iWC2MMTe0NvRYwTHZPQ868d2
X-Received: by 2002:a05:620a:4481:b0:8ca:3175:cc67 with SMTP id af79cd13be357-8cd6d38622dmr324184285a.21.1772812045327;
        Fri, 06 Mar 2026 07:47:25 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8ca:3175:cc67 with SMTP id af79cd13be357-8cd6d38622dmr324174885a.21.1772812044636;
        Fri, 06 Mar 2026 07:47:24 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:43 +0100
Subject: [PATCH net-next v7 5/7] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
MIME-Version: 1.0
Message-Id: <20260306-qcom-sa8255p-emac-v7-5-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5268;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LDFkKLv5ARuhq8/x6VcnVxHsdoIAj567yL2jxG3u5d0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbudisJuUs+uzQuYM4kwbULpnT70fI+O6Ked
 MgQRpkYVrWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27gAKCRAFnS7L/zaE
 w6M5D/4tV9bjNIrL3KQS5L1RPY0/RnRpsXk/UL/QTV+vb9mlGIr7BCzakEYstEI9GDNBWC//pmB
 67b/OET8ZTz9SjGa3wQ99qew4tSaOVsJ9dH1Z+SKDcrCxx+sdhhQt4WybjsIUJY3yJKIQOeXcX3
 7AIj7lKbbQotXliu0sN38h8SzaxIGnbtiWUzLm23bYLzfymlzw8Y1BuLlqmPHDz0+qv4qOaqg68
 /tVJSXH9oBNQqTy8ifrZtdr+BeGUfbYM4cecQeEV+lsBitnHcNQkN6G79K89rtFAXqrvpTveXaT
 tvqk6EUif/YwW7WplcDUOBKkqeRilATWiOLcVKgSwvoHrcxT8flq9KIwOo38IRVirZkR/KMmzPw
 5Wa+oZ2AIrsR3+z4vxMfms2TrUi9oeYFqajTKjKw3juefjCdWvdu4GaVO+aWq4P4eRV7OXNwZIQ
 TZKq0JY3fNLDb59nA4vdbck+OmGWRvj416W8pHrNYLNL/xPku7O184pClqFQ+FKbDvHsE3rLxcS
 9oAUeasvbuAjCU+Jugw1wcX8JVhmiG0f0YbFHvIqVZ8N6qPokAL9I+SFF583aGhMbZZenoC4IDO
 yRhML39/OFBPiK8PDUJzZtSwujwF+oe4IfxTWDpcyAL7Jz8XRyAPhiqfY/RQedA5YfVsOhzX84l
 mYhh7X8Yw7HRvJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OTXUaEjrj6qy4wQxmNLcLQVy4UirAhZX
X-Proofpoint-ORIG-GUID: OTXUaEjrj6qy4wQxmNLcLQVy4UirAhZX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfXwq4RPLPZ8NAT
 ojOu8rP4accsijIaEUth+X3Qjt+5BD1CivO8h9RbAXX05MNZh5Dzxq2e28F2qz7sM0Xsj6C3Nce
 KB5nH1UPcsjKT6meHuvofBr3Vd0T6Iyx0ttmCIANcHBQzD9BNgAKa2nXG6Vm19fFLjXeUmhIZ5B
 XUX4nyFVY5GE/oFreS7quGl7vWCwmA96BO0X5N53X66fvnPS0g9NK6Utni10GfVW65GWRhfb1nE
 mFcg44tVpg/H5UTrKcdVewr0dm8qqcarHpNqK1HJQG3+rlE7rA1GDgeCZYhvqtlTtJQEGdTOdV+
 dnYnSaIpq+JK/rPCytxbNXeoKGsnT9kahBh0dryr6/VLig8Qfmdc1hlFBFMpU8iwGKBEMPqO/hZ
 9z3YWpfw6/8Lb5kNAnGpg/Wl+pNCCIJT0sCplw2tUAZS77pQkhz6GT7YWr4yA3dQCoyTw7Kli3g
 ScnEaAT4Had35MSxS1Q==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaf70e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=i9KiLjVrthbrk1TKfJAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_074727_279988_3F6E6512 
X-CRM114-Status: GOOD (  17.70  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 ++++++++++++----------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f9a3741b692665b5acce34487f7fc2aaf557f0cb..b88de56d372c370aaf4929d05138f3744c54b1f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,16 +105,20 @@ struct ethqos_emac_match_data {
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
@@ -192,9 +196,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -615,7 +619,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -682,20 +686,20 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret) {
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 		return ret;
 	}
 
-	ret = phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	ret = phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 	if (ret) {
-		phy_power_off(ethqos->serdes_phy);
-		phy_exit(ethqos->serdes_phy);
+		phy_power_off(ethqos->pm.serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 	}
 
 	return ret;
@@ -705,8 +709,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -715,7 +719,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -728,7 +732,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -821,9 +825,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -834,9 +838,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
@@ -858,7 +862,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
