Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D05C98302
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2026 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M65VGpMpALZKBjv4Sj4ADjL2NDS+0fiN50b0F+B7DlI=; b=Bu+Cckw/OMrt5k
	eLrh9+6sLz/Y6/SSI2P9dVhPOa9fKKuFHsXXl+5JI75Qce8fBSje5/lwM8mQeR4uak/DR6IWRJNW0
	lRrPX1uudSMC2gFl3nkU/X46Y78ofZHNwizGWudADsWDgcY6k4YOZPi0it58vtBQn08qtoEqQsWiA
	wOolLyntC3jFP3h3ZgPpCWWgOcratWI+qYIlLUhauDS7YM0ZN69IdHbJbX29ADP3ko+JfsxcaCC0F
	RnHfFzXN8+rTzt9F4cb/sCCEKtACVItyJs+ilbW9EyuV2Yfw3PQ/wX5n4ljrbGfL0KRW4q1GtxkQI
	2nb+UmIT59gOZ5NURfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogg-00000008eK7-2Iio;
	Wed, 23 Sep 2026 15:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oge-00000008eIl-3Hwt
	for linux-amlogic@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=; b=Vaj01cls6Yfh4Xm02KPQxYtYV1
	vytriQgoVGjXrahu5y/+np8wpoE4KNgUDd+ix7bQDa/6kja9QQgs96LsWYhwjoylqVsSE+jqqG0J8
	lGrSxvDhk6tFG+tIWUaqBujlRasXWor7z/S4TtZSHZ1Us5YeIYF4qP9wFSc1tagnxaJ1HBnEbc5Oh
	SudlNEb5Z1yIzOuOYnQU3nwpQgeeW2SYvDFDLsc6WcSn+CrvCLAFjS/3Iol93xIPR9r6YO+tPElct
	EAdZHktSst5BURfQbQSTxI+fKIn2jeAus2BYonHiIKZe2sxk7D/hAtVfujor6b3VIrJkW0b2KQWRr
	zZv3omLw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9OgZ-0000000EuYu-2pXz
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDL4pP177284
	for <linux-amlogic@lists.infradead.org>; Wed, 23 Sep 2026 15:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=; b=N6R11wVDDRegxGy8
	zyMG7bN81RYwU3rXgmPicR8oDXcCtY8JyyUggDfZSfhdKPkwuVHhi/530+B9Ob0U
	oLDa4tcmSeYyDmcq91IqcbpQCsjvSltj1ZoTMtStLasx00kYxlvwdbmbd1JomxPB
	Od99UE67F8+vsgs27anJix93oASB79NCwRFmyUVxpiA2ltsY8Of6TeKECpTgGH2v
	DY3hqpHwgiR0Ea8jmJR9kb6PiGMaGvJNwtGuzUl5LjKX4jywoQ+K4KD7u1liSQVo
	PYCwDpBWituC8qt+AUwiKABucs2nPcIzVs6aPOEKwPFs3LK3xEUiNqhkKiMXLEK0
	UpLodg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjxrhbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 23 Sep 2026 15:15:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a532e31dadso1067558137.1
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Sep 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176501; x=1790781301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=hnSBIVEh/2eqgtQ+iIfcSjsMCGf9Sfeg+nb09EFrTGQAo+9D8W2Z/LSvDn2EMP1P5+
         tNVOd6m+x28KKGwU0xNk+xGvePVaeBjxDQ6P2qT0qwhGyuUINW/Oo1uxl8r26p09ksVT
         /VKG3PQ/ygJQtDt7K4NeLRrvt95b8nZtFwsdbYm7fZ7TEOqvPWmwb8HxrpAjoErYhRCk
         KJnAzJ85pv7PItZc4xboAPm0AderWw9pTp6WK2fWAJOiqS7aod0eS5m19njcA6CXxHLV
         N5rzOGBIWc6uvfXCVJsjDh4ozCk1SY1URNlg9MhJ4em/0l2RB2+ht/hQz2R0JYhXh82X
         wOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176501; x=1790781301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9UR2dTT1MgkrWsYz4e8MugIDq9vhO6USeCZW8zDLR4=;
        b=ehHvN/D3IUau7oub/HZrvFydiCSXzbMhUCadDbxmphkmXV5ilkivd6/qPQ/e+JTjxS
         sLybzKBI2/yA5z4i9GTW7ouso+rL/PkgepmRU2AhMNcjGD6DGq/o+rVRzQSEU72WQieY
         rf8GhTPJ0pThNyunnIOXagTN62UOBukWS81a3O6SdQOII1Q4yTpTD0WK3gjNP2IiSgXY
         urk3+Fw/TWBbYVtEsgVYn4axXpISe+zQO+MWlMmx8eX0Jz6EJK0tqjF2v2YwJ+bgX5dP
         V/7clkz80yO5nLGSFPyjreqTCRUST/78rWH0KMotgBYFWP1tNzPw15kIlJXU1CO75lXx
         l+jQ==
X-Forwarded-Encrypted: i=1; AKwUvByLrR5JNmMJZECglnom/4TbbshoVhIPlg0w7p1yRPWB2lFQ5IpS7kM/vrZfI/xCLjrhUcRgFOsDPmG2UHNG@lists.infradead.org
X-Gm-Message-State: AFuF++lHFtPFR3xhruuyHMNZONGEvmh3FOiQHO9i7ttvXTVsFc4Y+W7B
	uGIgrCNALoiwS5OYuZ1uZTfiFUhuUVwUsaaUgEHcK5OjvOeuNQTPdGrN51oL3pqnAS4Cf7uHx0L
	aO4V1qjXmPkF7lWVbY+uHpfHvBrleudvvCS6MJwv58lCtZtbhytnk2uEfcxzyT53RqdFtywIOMA
	==
X-Gm-Gg: AYBFou03aBMuWnZMBqZ1rvRaXPPAJ8W9OZJx6e4zFyemma/IdedQtH8508dZVnvZFUz
	VbR7c89TL0iELXJPOwEkC2YyTUuUDncEVGST3y0IlHCQZZ8hoQCRatx+nJIr7BS2L2f6a2ju5kV
	bqvina1ikcI7JJTGbXrfv+9As2WrKTyef9Vqb3n4MOD2gTXj0drgnGYv2VEWVeIQh5kXFdBm8Df
	0e3ii0Vgvk2+PlowvDn9qMVxvcg/Hbx/OK2Khp9M4MgTYKJolfbzDIB58clKQAr+s11Ji+yI2b+
	Stz2ptoFSmyDJvr6v1F7qkNnL+nFzgu+iUQjIjhU37DE44zyEqy4Vt8bwltG6/Eck+eQvE+mEo6
	+GaTcNw8hZhorjsdXqpMJcOHlqdn+
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861441137.32.1790176500569;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4188:b0:7a7:198b:674b with SMTP id ada2fe7eead31-7ac1e24f078mr2861406137.32.1790176500070;
        Wed, 23 Sep 2026 08:15:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:14:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:35 +0200
Subject: [PATCH net-next v15 1/9] net: phy: aquantia: fix system interface
 type not updated in forced mode
MIME-Version: 1.0
Message-Id: <20260923-qcom-sa8255p-emac-v15-1-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=48a0yspdUEk3xwkcjvTbhXXEU17F+t29neQdikkIdcE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGqz7OOgV0gtRJkZHGdKpH+X0k8DmAZYc5XdGUyaVggrvqRmy
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqs+zjAAoJEAWdLsv/NoTDSakQAI45
 3c0nVh4x3AoEXSUEJkG/9yLxn5l3sftmcI8RwXGnLRW7g3FvPfHVO9kgDsV92QuJB8z+HB7Svuf
 BufupGZa5X5CpNX48nD/7QUdcAxHO8pp/F9l7m+W24YDimBlfYxS7IUrHAn55TRybzGJwMaZvJS
 kNOamqPyyzWoCKj0QQiV5TOeYkS1ydw4mUcyMsZY5tDnfUpwE/xFc3RB8ftI9QSKUMPx61J55qq
 2f1vmvyLtyvoVt6WImg9Ii7cBTL3SWVdKumUjIb19euVf3KEJDZOY0g9vSH+nYxpfFJ7jwkM7Bq
 7VequVxgJEIRnfSGF7VPVqefK0pHsTGZ+wms5ctzDQao6OVgGur58IYfJAcebTZnweW0IyIRnj7
 W6vpWiDjXMrvSApv/PAGnGyY2j2Z4zXMYHLInNarwItTlDdAAKCDdI/EAnbNbGDkTja2obpkHru
 XBK8uqCJwXJKsK9VIyy8GQlls0chF7VQmhzqo6T6pco5dR/9F6AqP4a2qOUi11LEgijlqi5OXkQ
 noSRzO1UbVDQuLaUO4HFNbbALAnXh+ADClkQSikfRUvZLJvgAsNUDo4WvXBP0NvHljJHC35xgfI
 wEf/Kh+whGvzFIwbrXorqRhgdglnrJ+Q4wTs3wmd5jXRaNVp22VJRxAbFtbwXebc/xKKUuuMQgR
 SXihp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: dkK-K7Ix9a6K6BtKlJNekIjz03884BX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX9b6MjHxY+jFx
 6OeSXhp65mjRBH9yeC8RO/D0ZowtSU5WWkMlmCc4ztkUL89zLkxUGCbTofc8d4ZzJP2732lmfW4
 CDigYV+xIAG4bJOQ7RZqDt6RK9XKEXXqywpGsfRV3WjUiqibsIUcNiee1wP2LnvBfxBCi6fRGck
 TVZx0yVkxi7ElPeZRyirNvp6RYIlnx5dMCm9V0JWc/Kt4cxASYwxgn1AJCW81YUV/C4kp8W6Jms
 eJgoCkpFBL26k+0NhwDXwi3P+95IzwNvAITmrUmBeb/ItG658keIq8WsDwqhdiM3F8R6YC8x9tX
 mLjvvuvOu4Ic4qecnTxF2CY7tfrtTBRSp+jQBkf1L6bWgTM2wCvs4iFy5qUfAKjl18kcPvBF78N
 +2IqeBT/MVn7KmXor+93xZH9bBNu8A5ak4YZCTe7A+haPsuEmdXFuGWaCFwgd1vWlqGZphnytsQ
 Qovan07vd1KPc6r/E4Q==
X-Proofpoint-GUID: dkK-K7Ix9a6K6BtKlJNekIjz03884BX1
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ab3ecf5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX9xxPsVobVAnx
 XzhkHg7Aq3frkn8L/bPBcGHKUg/3jtHadw/v+OUqMicKN2NUdiLDvxbEWjlJ67EM1Jwel6xq+h5
 H8N9Liqo7/3qNl9m52WuK5ConCkvCA8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_161504_122302_1BCE221B 
X-CRM114-Status: GOOD (  18.49  )
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

aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
to determine which SerDes interface the PHY is currently using on its
system side and stores the result in phydev->interface. phylink relies
on this value to configure the MAC.

The autoneg == AUTONEG_DISABLE check is not correct:
MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
negotiated link speed, not based on whether autoneg was used to reach
it. When the link comes up at 1G in forced mode, the register correctly
reads SGMII, but the early return prevents phydev->interface from being
updated. It stays at whatever value it held before (typically 2500BASE-X
from the initial autoneg run), so phylink configures the MAC for the
wrong interface and the link cannot come up.

Remove the autoneg guard so that the system interface type is always
decoded when the link is up.

Cc: stable@vger.kernel.org
Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..096407bebd52a8e644084c3e286fb5dbcfa3f598 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.
@@ -594,6 +594,9 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 
 	phydev->interface = aqr_translate_interface(phydev, interface);
 
+	if (phydev->autoneg == AUTONEG_DISABLE)
+		return 0;
+
 	/* Read rate from vendor register */
 	return aqr_gen1_read_rate(phydev);
 }

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
