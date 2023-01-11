Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13006C5479D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KRtfAVOBx2uuPNbYoI5jCe1EILaqN/PqgmSoU/ABwM=; b=p9KPEnS/ycbdC6
	S0dZdSUzizpAOC+OEsaM83G21IULSIUa3BkdUM3mRw7tpfLIHr/Wpp3q3cMUoQeMSzsP7aBhZKCX2
	+zSyhJjLZSog/liPXxe9lcsk32/3W1Q47YV6W2JUCFVrdfT7L/N+o4LqdLc2eq98Rx34csD5Qb9Mc
	UA3yP1QL3riYEXMLWtZRFptg3NxrnIXv8b0T/Q3YSWZYnaZPBTqZBHglxnG6zHcxsfNCxSCumSStT
	cfmG/SmOWviA9Hj06J+LETyzIqE5qPo6aW9QNaC+Ipn72D5fRPIxEQ8rxqIxfvvkW0PWd8AjeTH/g
	NRDkRNo7V7fZp+X74T7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFg1Q-00Cepq-Ue; Wed, 11 Jan 2023 18:40:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFg1N-00Ceow-HB; Wed, 11 Jan 2023 18:40:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06543B81CA2;
	Wed, 11 Jan 2023 18:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92F2BC433EF;
	Wed, 11 Jan 2023 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673462418;
	bh=ZEmryboLk5mj+5TUuTuCS6naNIRPhdyWhLOCWdpU+D0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iSyIQ2yyoC3B0GBCDQJdd/AjVnQhPtqHCRIbEkSrrHdUq7RF962QX/zB0ITIfYfSA
	 3/D81YsFoplAuk07q+rs1ROy+hGaHCuTObSwnYmfwqifrJljRKGWDsoz836weNNaBo
	 GLiDiGuqi20c1B+V3/gbU/jYToaZNaxVHsO2SJoqO/g+pt2hlJVfs4yRYd7BquKLHK
	 W8sVu6wNviooo9e/w3eIH25eRm9LQVQdVsIfozC5UJQ6yZtvHf7HBHp7sWyPjsPLkg
	 drRe9DoPTVOOD655oQch1MEgH31f/rE7CuAFGxVIDiUEFzzr0TtWcqwswEQUzSoFCV
	 dpRICWt9nlOEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6DDAFE4D025;
	Wed, 11 Jan 2023 18:40:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/11] dt-bindings: first batch of dt-schema conversions
 for Amlogic Meson bindings
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167346241843.19883.15310921170918729898.git-patchwork-notify@kernel.org>
Date: Wed, 11 Jan 2023 18:40:18 +0000
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, srinivas.kandagatla@linaro.org,
 wim@linux-watchdog.org, linux@roeck-us.net, mchehab@kernel.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, ulf.hansson@linaro.org, bhelgaas@google.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_104021_861133_9AC973A1 
X-CRM114-Status: UNSURE (   8.38  )
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

Hello:

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 09 Jan 2023 13:53:25 +0100 you wrote:
> Batch conversion of the following bindings:
> - meson_sm.txt
> - amlogic-efuse.txt
> - amlogic-meson-mx-efuse.txt
> - meson-wdt.txt
> - meson-ir.txt
> - rtc-meson.txt
> - amlogic,meson6-timer.txt
> - meson-gxl-usb2-phy.txt
> - amlogic,meson-gx.txt
> - amlogic,meson-pcie.txt
> - mdio-mux-meson-g12a.txt
> 
> [...]

Here is the summary with links:
  - [v2,01/11] dt-bindings: firmware: convert meson_sm.txt to dt-schema
    (no matching commit)
  - [v2,02/11] dt-bindings: nvmem: convert amlogic-efuse.txt to dt-schema
    (no matching commit)
  - [v2,03/11] dt-bindings: nvmem: convert amlogic-meson-mx-efuse.txt to dt-schema
    (no matching commit)
  - [v2,04/11] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
    (no matching commit)
  - [v2,05/11] dt-bindings: media: convert meson-ir.txt to dt-schema
    (no matching commit)
  - [v2,06/11] dt-bindings: power: amlogic,meson-gx-pwrc: mark bindings as deprecated
    (no matching commit)
  - [v2,07/11] dt-bindings: timer: convert timer/amlogic,meson6-timer.txt to dt-schema
    (no matching commit)
  - [v2,08/11] dt-bindings: phy: convert meson-gxl-usb2-phy.txt to dt-schema
    (no matching commit)
  - [v2,09/11] dt-bindings: mmc: convert amlogic,meson-gx.txt to dt-schema
    (no matching commit)
  - [v2,10/11] dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema
    (no matching commit)
  - [v2,11/11] dt-bindings: net: convert mdio-mux-meson-g12a.txt to dt-schema
    https://git.kernel.org/netdev/net-next/c/82fc0f87cd2c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
