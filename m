Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B1BCF8548
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2024 23:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvVdtWCclMujEF4S4mQrPRGZrHlRne1mdPBr0d+CITM=; b=ygGKHYSFdhZsPU
	3vLQCs0YsCLtRBJeB78zEFZce/5JmaM5qUNBIJvhH/jyr87PrRUSCFQNUYpS+CkhLntXuGBbFXWn2
	6dQpd0wiBBCSSQwXDvDTDKx7YhFD/VaX7QXofcoGzEghgMk2tHBRWSsqph3u1e5Ym/o1KChSFfe8G
	HWuGYDn5o/FTr/84Ixv8bE/E2WKgg98mmxcoMUnHmgQ0NZhL8rea82sIYxnceQfuIieNRvjjjRg91
	l2A4j47x9nmYCXf8fSf/Im2X2eh2GbjBfooB7Bg/f+0AGb1DHMi3wBv2Vo/RUv/+oFZlkehqNxGNS
	7m4+Yg44txkKPK0KNUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8p0-00000007kws-0DX5;
	Wed, 02 Oct 2024 23:31:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw8lP-00000007kBs-2RJe;
	Wed, 02 Oct 2024 23:28:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8685BA41682;
	Wed,  2 Oct 2024 23:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF7BC4CEC2;
	Wed,  2 Oct 2024 23:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727911690;
	bh=W1lLp2pPTaIJzlX9xAi0bfcKDw6TZrgG4RIG2rCObS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Unr6w84d6DcYViY8Oq8lTRe5r+ynB+qwxQRrN0PXQ21hGMkiKtB4s+zuEuU7KgpYA
	 TSoyTy9NdgpoDmEXHgf4H9vD54L2mqioM8O8Q55Mz3xFJzmEwYrYIZksMHxmoQ+bx+
	 TRB6kRjWMye99RRcvujFvNaJjx4Y102A5IOydiG0jgasJ/IDIiNGsA5uq52FGncphq
	 oPdmA3iZznDTTA3cenmQBNg2ZemPEC8HPwC6hpNUD2Y3M+brqCWLe5wQkeEtzLI6gI
	 opZq4Y0GK67ARrTe7g6QsUfAFsvzu8szHL4p2v9CTrKgy99FpJHg39Wsbca4gqrL/U
	 KJ9AX2YFhxvpA==
Date: Wed, 2 Oct 2024 18:28:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-amlogic@lists.infradead.org,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	valentina.fernandezalanis@microchip.com,
	linux-kernel@vger.kernel.org, pierre-henry.moussay@microchip.com,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 03/11] dt-bindings: mfd: syscon document the non
 simple-mfd syscon on PolarFire SoC
Message-ID: <172791168896.1540364.4847195288763668574.robh@kernel.org>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-clambake-raider-a8cbb3a021a8@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241002-clambake-raider-a8cbb3a021a8@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_162811_702907_E96EC98F 
X-CRM114-Status: GOOD (  11.15  )
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


On Wed, 02 Oct 2024 11:48:01 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The "mss_top_scb" register region on PolarFire SoC contains many
> different functions, including controls for the AXI bus and other things
> mainly of interest to the bootloader. The interrupt register for the
> system controller's mailbox is also in here, which is needed by the
> operating system.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
