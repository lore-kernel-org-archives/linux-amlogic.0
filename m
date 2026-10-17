Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C68CCF2C1
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2026 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWpmoUJrz3t9BdrNjHTMb4+PYKHjscL0FPn1zRivoCA=; b=tJu1bqiKQul9wh
	zddbbvAYQq15xdshFFGu889jKfsK9Q+k32YK9V/d68RHkfiLOhS6wTdXq4bo76xfgDREYeQ0pr9ct
	nud3v/m6dZIS9R1ySsIMIUmRL3NDsPwW7tFMf/skfSFBq7auOEZa95xIdtFtdPuhTkhymYFkOwd11
	g6iRAmT2/j7S74R0WDfHruUKBWeoKQyyALGDrmOc4Hyj+NRV7vmqVLN+Ov0ifXuYfQPkqDR7G63UG
	8/ODnd4EFbhgEDaa7IIoHh4gTVksnok8UPanz9tShXyQcv71pvjOgdwRMvzYg4D7E+BCzCppqnVU8
	29mkiToFsUj/cSHk0dEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RU-00000004wL6-1zT3;
	Sat, 17 Oct 2026 16:39:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RR-00000004wJX-2EJP
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Oct 2026 16:39:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA1rA1480415
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13usata-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:39:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35d4538fd74so2935979eec.1
        for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255167; x=1792859967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=Adqoyl3VEdi+elyTpQ55ybVsDo+2i6wiVEQAeUf0qjeq3771rQH33PjCHsTycFNnUS
         70XUj3JoPgJr3iBJk9KnT/9Qb0UGNpBVjm2BkxX/1B+Joc7fOymUQ2wRfRUU/a4q1iy7
         noBnMJjmkI2pmlQ5t713cKrupHyMNvEptpK549Ho4R/l4gDQOzYsBtU7/4E4qfiH44Pp
         MqOcfTr5n32anVnS7RoOmLlx8T+2bycei36uXOcwJHGaMT2RLQHGEQaRhabN8jFnLdUs
         jmUq5WquyZaew5G9u+B3d82UZw3kQXZdQBs6BIAW2H47tAaFPvEE1Fr1zRBlKXJpLkrZ
         KNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255167; x=1792859967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=2v6C6bP+NjE5I5TC4NMqE/RRXoKzEI7OD9J2QQ0MjpX5P5wPr0/Hn6frWNhJqTj7/F
         rpsTkadU9q4aXbag61TkZefk8Z8mHgtBP8Ixed4w4ZwFgFBx61SzVBxdDWJ8rQbNFzRY
         0XKkJchPzP8ghwSzTYaQw8cxsjVVSm5NGzQjXy+8TCD+61SW1yT6mh243GdhWuXrj+9M
         f01DZ7GWBbgk7Ie/VGYwDOJ/Eppsrvq6y7187ROvyNckFD3qF9XTTH7kZRhzcQ6O0moJ
         WnV1lTyqJDYUqGLFUt6iM+8gqHcm9sX9ctR9LfRRx3S83fEbkE3z6t58p/9TZJMkFa0e
         FzrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1TtrxaGWQ8LdsGT3sr+RLQPxDQnQa9pp9UnrcGIblp7yK15JhSa18Osv4CPHib2ISBY7CDNQGu4wGLkHX@lists.infradead.org
X-Gm-Message-State: AFq9FYLg7mQdpHFnpM5bKVqzzqh/SPMr3YniRcNXhxBx0f3oZP/VkGbj
	0DCpNhDDArJtXwrX+pbkLV5+yIBciEzRMcPxXS2m0oUm6eLqB1lEKEPnR7dtSNX1WHjfpxte+OW
	I3wYNYtJTk/5iwPbb22fgQJXnWVFVLVjaW+b+KK3vWIbJZjr3MqweIXXeola2MI0E0TJFnda8TQ
	==
X-Gm-Gg: AYBFou2MOgI1tzDndlq2BZw40zwbuf4QIvrelcFIHaWeDxioblYDZW9JM+GDA4FSobw
	iioDsb65oaB66EOzJ6AT7l6P2t8kmLUiO1RT1vjh+5Rf+iiQzbowuKqPt6pC+cjynvVB88dSXu5
	mH/OJqQD/rCYc7pzR5pAgNiANsVO5I9FHAEEwEvxPg8jtbDyuefPzFqrYmAKCPeB+aPiclIVEO6
	Pe1AyqGm4PToIv2Mrirm03SXFRXu+NGXt/42wWO0QcN8HIJoVFlA18/oAn2YUMjP6I2CFy2aCrm
	3yP2zfvcCgpZE9SDASPZDC2DQ5kE5GlPRAtxxe+7h4ZljOxWo0fpHIu4RYCaV+e4/Qfj7R/6qIE
	hQuSuVq77A65V
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629938eec.32.1792255167277;
        Sat, 17 Oct 2026 09:39:27 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
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
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-GUID: CExeHwYe8mkGssIgaCNwHDAtzd1tFaK1
X-Proofpoint-ORIG-GUID: CExeHwYe8mkGssIgaCNwHDAtzd1tFaK1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX2kqBLzhF+Eci
 Jb3Kj5h9AjhfObuOz67ocTsQuPUAgo90ED2gBa5SpFtXeLeReNplXFT+e7NNvII2lm570xr+YT8
 uxWwlj/w6ZLD8KzbbMVjiUJEl7p/9mo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXxUIuvD1QF1As
 0sl/MvFFhe7i8rCmEY3Yr51qwEq2AVKPYTOeZb8wGeh7KF22lyavYFFnoYGHXUJxM2fe0XcD92G
 EVyQXSD87fCQiFdRwYt3Xw/nDvColOhQ9+470Znlh8qJUHVb1XwkdXrYTAwDZplor4kgyjLYu6G
 gGRP237kSCuHC39dBxLF0nMSy0Ja8fmcJofdnyGCkkXWGMknMoJQhEm1l0LuOv22+27hCE2eW7P
 g5FVXi6GTnsAW7DdyG2gBIbNYwikltTn4jpOKgnLdf9AncMV+43SXRo14t3IAECyb48aGBifhal
 kZMUSI+s2e5VzZCK5cbIQG8zjIN9fye8KWcD0LYdHbdBui0YG2/E0cz6LdWPe9dIFsBlqKfAnqX
 y+SJeOtqX1tkO9LEJpR3tkHvOqbCOFemvgLyQTTnqMHcoUj4D89HJ+FI16DIYkAJiYU0xJzGYGE
 psPIgeENXL2IuF9XLBw==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad3a4c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093929_678075_CD3FB25C 
X-CRM114-Status: GOOD (  19.48  )
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

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
