Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954F7C433C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:00:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DCA61A11
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22DCA61A11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lq6QeQiCZwhCWU5T4nYRhtow5QFOQqrmRjuWirFjz9k=; b=cgNtBd61DqHfjZsHEE2NaTi5a
	soXTC1nfQnIBkss35e//FOHiI9VUKSkjHHuo5zdKn/Zcwsux9NJm7mffj4qbjqBWRuxdjhZENbvhS
	B13MlVBg4aR0pvF+h1wz8e105m2hJTTCL9r14AOhScobVy9nWgJsxYnlvtkSoum2jm6p/d15LFZB6
	6m1cM5IF/7L5PfSWxDRIvvAZGBQT2h0r/MDaTW6LFziPbcXg7SUvc72QyRJkcRcqGfn39Eawflu1b
	sf8FgIrwAFGOAljIssqbEdVUoniVmG85GhVww5CliCuD2qDPw+AouzEJJViNWPEGOcTLYK0uOUebo
	s7Jrxpaxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPac-001SW0-Vf; Thu, 25 Mar 2021 12:59:55 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPYU-001SOf-N1; Thu, 25 Mar 2021 12:59:46 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lPPYN-00CxB2-I4; Thu, 25 Mar 2021 13:57:35 +0100
Date: Thu, 25 Mar 2021 13:57:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv1 1/6] dt-bindings: net: ethernet-phy: Fix the parsing of
 ethernet-phy compatible string
Message-ID: <YFyIvxOHwIs3R/IT@lunn.ch>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
 <20210325124225.2760-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325124225.2760-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_125944_448248_96B123EC 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, Mar 25, 2021 at 12:42:20PM +0000, Anand Moon wrote:
> Fix the parsing of check of pattern ethernet-phy-ieee802.3 used
> by the device tree to initialize the mdio phy.
> 
> As per the of_mdio below 2 are valid compatible string
> 	"ethernet-phy-ieee802.3-c22"
> 	"ethernet-phy-ieee802.3-c45"

Nope, this is not the full story. Yes, you can have these compatible
strings. But you can also use the PHY ID,
e.g. ethernet-phy-idAAAA.BBBB, where AAAA and BBBB are what you find in
registers 2 and 3 of the PHY.

> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index 2766fe45bb98..cfc7909d3e56 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -33,7 +33,7 @@ properties:
>          description: PHYs that implement IEEE802.3 clause 22
>        - const: ethernet-phy-ieee802.3-c45
>          description: PHYs that implement IEEE802.3 clause 45
> -      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> +      - pattern: "^ethernet-phy-ieee[0-9]{3}\\.[0-9][-][a-f0-9]{4}$"

So here you need, in addition to, not instead of.

Please test you change on for example imx6ul-14x14-evk.dtsi

   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
