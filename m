Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7465CA5FC5
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	References:MIME-Version:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GKXMypgVE7/4b6cG5EbJ2JTF1N/oE2JscGK+g2yMJG0=; b=1jPVyqLmLYL3nx/b4KvKZa7pS3
	1jM/d+eo4W+CdEAkcXPhIog+2PEP98Sg6fEv8TiPfSqEPuYYbMcH84G7uMIpMWHwv6cMKTBadUZFC
	lWuqNJL1eYfx/2JDT53xC7Ad0Hgjbh2wcXZ8qqIojH+T8E1Vn+k7zvhL17B+NzqtClEYGUwJ/bL3S
	PW4Eetc0pgNfwjNv+9taWYd61zuSIaPnvvgab9o1dI7pVHE7HQ2mz1kimHfgH+7M++PkJSb1vvTZG
	pdKbdrAIPSrWic3wf7mUuQYXA/lNxiGa3Pl2w7KjwSy3H/YvNB+S5h1gQGw7G45I2jBW/Pe7xkjex
	JAiS+EuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBH2-000000080DM-3UA6;
	Thu, 01 Oct 2026 07:32:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBH1-000000080CZ-25yf
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 07:32:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3AAA4479A
	for <linux-amlogic@lists.infradead.org>; Thu,  1 Oct 2026 07:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA731F0092B
	for <linux-amlogic@lists.infradead.org>; Thu,  1 Oct 2026 07:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839930;
	bh=ELdBCMU5f7/O4ZMIta9o4UVKjIIZnw/X5SSJeT3GM90=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=m9ED6XoyFU6f6NSxPdVX7ZgGtbARjsD/CvfZD8tuhOkiZ6dKnPRKSRSktb3gLidmc
	 VPbCeYi2IKHwWOv9a94mqT6hb1QyGGIuQBER4nXjiOTZRozsX037c2spwbLmYAMdft
	 hSocy81uy0QFI/ZtDOvX28+07QuujnXHssLX3bpIUqE7ULrFoS3pV03E333y7RCNzK
	 HsH5YwqLVDE8Ag8eULAvrQkln7YBVbnRdOZn5XnVa80W1ViRxENJZnXfTYVrjFagcy
	 G3vUUO2AFJbwfAf2/N1XRAUG8lpRgJF09f4ryfCh5u+wg5DjSHuu95Tq7PJHOpKRZi
	 qrKAsvE+hguKQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d90ac37so1785367e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 00:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzq0kVcJmzW1r1QG71/qkL8GhCJ2JIHSwIeeA1mX5+hxIplhAq5diUlyihjWuuC3LTT3Lgz5OeZ3vAF/LfC@lists.infradead.org
X-Gm-Message-State: AFq9FYIm6EkW2VZwVZTa8db08sTbq4wx3oNv8wKcWz9ljiNuWj4D3itc
	MPNGbOl5O/01z2UyGTQUDNgR7O/JMt7ppnUR76DC7LrIb3s649qklxgdfyO80hrUe3jSYV5JahZ
	9mFgKHeXFeq29/H/0x/6hvsvMAUVFGPeHo8BRXmlINw==
X-Received: by 2002:ac2:42d0:0:b0:5b8:f97f:7a22 with SMTP id
 2adb3069b0e04-5ba405ec7a1mr1161789e87.54.1790839929167; Thu, 01 Oct 2026
 00:32:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:32:07 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 10:32:07 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930163334.60b4a88c@kernel.org>
MIME-Version: 1.0
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-1-e82f33720737@oss.qualcomm.com> <20260930163334.60b4a88c@kernel.org>
Date: Thu, 1 Oct 2026 10:32:07 +0300
X-Gmail-Original-Message-ID: <CAMRc=MeUx2iHf8-d9yjZZ=n7VaG_GROvO2dW-bxavAS+XbGMFg@mail.gmail.com>
X-Gm-Features: AclHuK8P_ZwjJ__3SNp9LNTCdpGSDaQAP4RQWoM4JsBj1lq1vbQDeX8sSTrNEMU
Message-ID: <CAMRc=MeUx2iHf8-d9yjZZ=n7VaG_GROvO2dW-bxavAS+XbGMFg@mail.gmail.com>
Subject: Re: [PATCH net-next v15 1/9] net: phy: aquantia: fix system interface
 type not updated in forced mode
To: Jakub Kicinski <kuba@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Christophe Roullier <christophe.roullier@foss.st.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Thu, 1 Oct 2026 01:33:34 +0200, Jakub Kicinski <kuba@kernel.org> said:
> On Wed, 23 Sep 2026 17:14:35 +0200 Bartosz Golaszewski wrote:
>> aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
>> to determine which SerDes interface the PHY is currently using on its
>> system side and stores the result in phydev->interface. phylink relies
>> on this value to configure the MAC.
>>
>> The autoneg == AUTONEG_DISABLE check is not correct:
>> MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
>> negotiated link speed, not based on whether autoneg was used to reach
>> it. When the link comes up at 1G in forced mode, the register correctly
>> reads SGMII, but the early return prevents phydev->interface from being
>> updated. It stays at whatever value it held before (typically 2500BASE-X
>> from the initial autoneg run), so phylink configures the MAC for the
>> wrong interface and the link cannot come up.
>>
>> Remove the autoneg guard so that the system interface type is always
>> decoded when the link is up.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
> Sounds like a real regression, is it? Should we ship it to Linus
> tomorrow so that it makes 7.3? stable + next does not compute for me
>

Yes, this is independent from the rest of the series and a small fix. It sounds
good to send it upstream ASAP.

Bart

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
