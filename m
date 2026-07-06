Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBB4C44500
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbw7dBHm6+kgmhWrZmyPHJ2te4LR8kosO1msqBPgNqc=; b=etMKU1dj7i8xUd
	v47bMHnjDUmfMgJZNxEri5U0C6hJ6u0i5meUUwjYCLnjXnXiE3w83VqvPV9aDJbaBdgVGL6qdbCAZ
	RlBro9GvSETa6V9fcPy5I03xEbEl8YZq4sTXfIC43t44ZIjdXZlR2BT/W1J85okCMBRNBtMZwrEnw
	gNg5+SfPNQNqdUXBoftQTW8bHyioDpiulz8jyTIHDQpXXvlMyoCeWQY0ULI6inTVFmk3wkquawvP5
	kmyxpwcdrkvAFkf+UJNRP1fB1gkNTVhEEhQkLhbvOhPSRvVeNJQ2FkJN3UEQtbLKruSHxWshjeY32
	DSoJAZ11Pf4oy/6dZZgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFm-0000000CYmM-2nfU;
	Mon, 06 Jul 2026 13:20:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjFd-0000000CYcT-2GTw
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 13:20:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxV67219072
	for <linux-amlogic@lists.infradead.org>; Mon, 6 Jul 2026 13:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=; b=Bx6/5iA8yJdpooEK
	R2A+v9gulHZ0/xkiPZwpFWlwTCFG/s9Hpm1m8cPKBU5weMyM3ELRPL/80Q5Stnrx
	iMwvKi2tOtMu0gDZ8Jxt1DODBXblbCH6zbaXbl011l19fyRsvuCS308SV4KZ1vCL
	wiW8KzLanfWIPHYVTZrusFNdQdTaK54hkqDFTid3Ra5yu3FCJ46T6FWvzhZlTJhW
	CU87NG3zJ7ozueEYfJ4/gAI+3b4MK/VCd1h/6fSPzvNVOxKDbulHBkPyNi3tzaIK
	FMtZ8NewXu3R6g2Zl5hOL+oA+3+SEWa54HnCIvLSJJz1+E0+k5/92rkh9cmMxMo9
	DzIB5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs985c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 13:20:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so221037485a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344044; x=1783948844; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=;
        b=XaG+W1/eILVcKTQi8B9NcuxxebwvbOpmy6KfovezNA828PVV+3Lku+OJwQ/4j7YuRO
         O4Hjq3F6IUqvaNyZdvTbqI76jJqbmYRjKG0YkVJw7h1veL8VOtTykbHeJG1HOjux0kgO
         DzVFRB5cIPKp6UQi0QHJGzN7VJWSwodwvtcBt2HcVN+vpLVi4a3hvoeSoKJiK9k2reSN
         KtgS2ICGN8k5JR/skoFDCjaqZtRR4SxVmwwsQDoTsyduUQLa41Ecfmy1PkA47GRGImgs
         17a32nK5XMaV85GwRQVKKL8oHwwVF1K/zhkLFPiBsjugzOIQzDZrf/Skam3x07HnRyA/
         ZpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344044; x=1783948844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgfh2/38B3WhwVMaRw3DoRNAiK5OOTw4W1PNnpwazmU=;
        b=XemM3KEfjrjCfwia0Mg7egKt20UJR07sxmbap4AujnEYdcMco9iG5YNt6kGAh2ebhB
         v/SnXliB33psl/3WzYON6aWhuXBz4paeR41Gl39zuR7lsmClpo7qjzzUUgElh/zvnfxV
         TY35J8/UAnbP2NHoKHDrBuaJ1yiMUG4SBEtbnbKH//f2Iy+gbeqhfocDwBtKejzoH8Yt
         xW+M/kxXFEZ+R3TM2Nlx/o64uqG3Sl6HZ9PbdT1My/gX7yb/bbpr8BevEQ025HEoja0y
         bAh0i5oq2EmXK1MlgR25/IPUMgH0DYeaUxy4txDywaYY+rYeGZ4FVMOJv4qlRTbF33we
         qsbw==
X-Forwarded-Encrypted: i=1; AHgh+RqWGtYc1SvEyV3jPS4ZcTHC9pdHiUXGYh+vq6EWPgcUf5GYyY2mgLFA7YcobTyL/DXxbT4E4pNrJOGdkvhL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9Mda5DzfGImPhp6JQ2iQ1yqibVhLuLmDL7+Tc6aJK7RTJTag7
	idw1wydumpfAUNBr1QhbwiQ9T6dDH2FbPJZ0rOB7NlMuTNzUkwn4g47Br+8zWl0z8sz1fUm8tRq
	auP+QUk8Yelt+B0S3cMPcayP5dNNtg9puBzgjbhwm8BiobM+p/wnadG0j6j78IK8nFFkrZRIddQ
	==
X-Gm-Gg: AfdE7cn8Vhwn3iIE6BjI46XM7JdMVoIzP0flei/aVFM35hB7J+WfHcUNF17kRPSF+ID
	O8dNkWXolUqaamNPOYxAubgWfIoJTo2em9eczXHY0dsX38BUSSZjnzvR5S7x3z+gMwGPAKmiX3N
	GjUf94s4aeqyo0njf1E8Yr394rKsWurVv4Zlm6R5qAXKdkYjHu6AsxvJ2VedHvmStjc06iuJNDh
	wGUYBcMnggZ+NA05cgNnF5ALacDZGwwQNFo68rUME2QQBrytITk5pqx8noWz/MmxE2VqWc1cS0l
	/luhHs5Ztegl4hXfKu3dhtJCeToZAVgbSqUvPGUjt9GlCWRqisXuEjLZ+bsnvBsDj68yrVzh7Df
	4R1uSqjDTSb8uWHe1nHu7yE+cL6X9mQXouwt1wmqK
X-Received: by 2002:a05:620a:27cd:b0:92a:c203:471e with SMTP id af79cd13be357-92ebb4c940emr65801485a.9.1783344043680;
        Mon, 06 Jul 2026 06:20:43 -0700 (PDT)
X-Received: by 2002:a05:620a:27cd:b0:92a:c203:471e with SMTP id af79cd13be357-92ebb4c940emr65795885a.9.1783344043148;
        Mon, 06 Jul 2026 06:20:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:17 +0200
Subject: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0
Message-Id: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6726;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=px3gFNalJW0myw4JO8FxOi8xC4WUF57/BsmFQdIQdYc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uchS4csS4YIcS0mi1Ifm+LIJhbGgTUvShSf
 ydPuYJXWmaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurnAAKCRAFnS7L/zaE
 w0zzD/9SCsUE9nshAQyInqJLWoFIM8/bv54ACwjrQ2SLcq5ghDCutaXpCzCQFH79QU3gcsV7hid
 9WRL1B3pvXCNlRmZMDmiPdmHymy+1cCQ2nz0kzyELvhGm19aaJyIVRajtt2qkCdUFa9rJTnrL1L
 EHSieziZDKkw0UCo1GTEJZl4oq9Fb08FdSsJBMFI0aRlr8DrhYRVVE1Nj2qjHPRV+RWbNqmSf0K
 69XA2gEVSIYqykcHzGIi1V6hIoxhbwdoJsPv9KoAhoJqv7McGTZkRu2VpR31aH7rAWw1La5PFeH
 KU96pFcBkSvy8a+lh5eJ9ES5FPv/hth4mNWQtUdjugM9b0o1GGTOXkyId2OwBA6IqbaAz4dzKtl
 3u/I28s1UVntXT33yfliBNrV0d3ZVUYOqNXWhDx0yRCv70fP6LJiP8fitPovwynNOlTNHdOHSVH
 3Q+emhc9KPvwGauW5lipa3RqCqGmcwZQsMpyqNQh66czQKWB4V+HFkls+Ao55bX83NRZHK67g4W
 ur9Dokj/KleRMu3g2FU4zm3nR6sdWnRNacQS4MyBnxzSpdDxICRxC6udFodF0Xtw4Wk+jVZvqwX
 ZYoqv4ylO5Kal6ukUy3bUMkLTbCdLXdXPjNekUOOOkss7LcURiWU073B59r/QQSY/BGGwersAeW
 gWBpQTcQFWqJsaA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: U2c_XZzJATpSKzt10zlSaZnwLPyz3wUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX7xkzz5kYJU5o
 gTzah5K8n7WUFk+EO+TwsMykgeRusapgBHAvS+msLQ9QxjYcJvkkd0SM+g/92igxOiYPkuLuuH9
 8KcDG8RAavgKaQv8FN4zBJ9pMWKW7veiMRiLPrpVlo1Uvgnekc/mpJCK2i7WCxOlAq1lRRCvjqC
 uJnCh9ixcKudn2XdpxuKjF/l+xg1x02Sp3wcMYdfzvwzS3Oam2KLv0asUO1m4jUdF0TmmEh7QWp
 jnfbMWnIfX0WRFVgeJ1faD59o4wJwXcGDPpPNjcyKbQXSIRDukgkaKj33TzuiHiYP7d2NUZzEgC
 j+VvqLodMKXwrq8BNY8lmGTo+ybcfaFqogrvuatXZ7t39j2lrHLmVfPRZ9tfzPeuL1+WCPyhvTg
 XWoyv5+yQggRU4KeVVJqUOELGna6aCCZaddjT81QaF9AisDyrezYyDqio6HrDI0Kbq4JwZs3/hR
 3zVlvNgmNMUnvOShKfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX0gBfdZpvJmSg
 lS+Fq4lH8XFV7UDdz0dBc6WBR3GEOGMZ9PWxKypY//+y0v+844JH+YjaX8XgwDx0pobX3FIAtO3
 tFZ0XjRrnkcvYaNA5SgYfJzOg9QZrcU=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4babac cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZvYg6ySBQLmwDIutsxAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: U2c_XZzJATpSKzt10zlSaZnwLPyz3wUZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_062045_702919_B5A39D0D 
X-CRM114-Status: GOOD (  21.18  )
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

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 161 +++++++++++++++++++++++++
 3 files changed, 173 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..a7cf348f6a7aa18e8b3f39f109b02ea672ae4177 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ee62189556fe4ff0d8aa2f8b105175e08000b7c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/ethtool.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
