Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD396C54EBC
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 23:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i90Rd++CB++RUSm4zz9oR1/tH7DE9Q31zXt+cjWLTUA=; b=OGrDEUhtWl3amf
	dKBjr0CMv5etPEmDh7VRCi2aHEegHiLBp2aDzPgY/ItBbYCd50t2RAfQTwigFkcxlDP3TsDfmgOzK
	/wvZccZYUl3duQVs/eVzwZL0BeVP/UaKL/OEbJsPD2C+2MbGpejVt+ovNgWFeHCdVQ2N1GZSdEAMt
	lFOan2sxH87EaQl9NziVh414n5x2ZhCarZBwwG0ZJMI63tKHn5OIWHVKkxMMtBgBuOCWJyhr1zDep
	RUGY0J7IPrqZeKB4sAfMd1j1SK4SiGa7TLCkgiIjs3UD08QDKkda5K8Hgv+sz3ybfLv50aLRjgSPW
	ZYAOXh/3aByoe8uMaIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNxs-008u5O-1j; Tue, 10 Jan 2023 23:23:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNxo-008u4J-Eb; Tue, 10 Jan 2023 23:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28A976193E;
	Tue, 10 Jan 2023 23:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CCCC433D2;
	Tue, 10 Jan 2023 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673393006;
	bh=KfSPuN+1QhbNUv5tw8QDzbsOpJukhbxBa7/tiSZA6YE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kmBayYB9RkU0+wQl/9jgcDnUFJ81UiubfLDDvtLmip6svd0iZ81Ae9ZOhNuunaz53
	 3+YDBMo3PYZkUs7PS7dCJKYagCO/5yWpIhjev9LaLijR1Sld+WLcGE/RfYOl5Mg9KC
	 9HdifMep/S3Amhq3h+Ed2IrgxEZCaC4JyGgLR36CldJ60HpvOU0qa19/oPMYFerWIu
	 qpWJ0rtAbxpY18prh4Ut8fRWlNQAZ2ISvfPniM8XDKtdWjPfQEcG3YIpPnqKZj3PgB
	 +j7daBrq1rgokCJ3+YLhtG9BQIxFuvvvg1HEltXvh+5uRv8CBvthbrqKQ0wQxv9WPq
	 Si2fNdrIaT1dQ==
Date: Tue, 10 Jan 2023 15:23:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas
 <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-pci@vger.kernel.org, netdev@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 00/11] dt-bindings: first batch of dt-schema
 conversions for Amlogic Meson bindings
Message-ID: <20230110152324.1e19974d@kernel.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_152328_556166_62B9EDDF 
X-CRM114-Status: GOOD (  10.61  )
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

On Mon, 09 Jan 2023 13:53:25 +0100 Neil Armstrong wrote:
> - patch 12: added reviewed-by
> - Link to v1: https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org

I'm guessing patch 12 is patch 11 in this posting.
Should we take it via net-next? Looks acked & ready.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
