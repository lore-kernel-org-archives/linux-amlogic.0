Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B19AC5321D
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 13:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZR9kD9WoNYFkxX2rytXOqyhrPu7S+okdmYacJMg1VY=; b=1tIC4fw6shzmfp
	n7a3tpMY6q3YKgMlivAtihNMOz00Vpl/4B6d1BId21yIPtAbkjL4TINV2nVqtAREwLBamQFH61jPQ
	5YP6rZ1rqYmd64axNqmP+kFS+dad7r7znsxnH9+2yL5wAeqoRkB17QEAjKozfYnDGQxbWzwbeeZUA
	199opNsLTz4SxNKPgwphnGCeuLqU8V/fyfxn+9B+29LTf8k1UhUvny8P3iQNmgJO3nh807c//X/G0
	h1D72KMIV2YUzz1lBsFYmnwJ467YPcW+k4IbAiNmjdtXjWvoKgNZGZK1pwc9S/jr4/do+ebuQwf2B
	whMbVPowOu4bvO/Q+PBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia7y-00000007Yfd-31Q1;
	Mon, 26 Aug 2024 13:51:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sia7P-00000007YW0-11Te;
	Mon, 26 Aug 2024 13:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A020A427F8;
	Mon, 26 Aug 2024 13:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3653C52FC7;
	Mon, 26 Aug 2024 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724680250;
	bh=3wcKQRoEo8FMvT0tRhB90fjTIKRp8q5ysFETw691w5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGcLDUmuNTlSpIq1qHQpIoPDJNNVelf4oqQrkK+t6xXt1kizdmDaEEkowCPaYli9P
	 Vgf2ciaBgChFiju1IlLBLSFR4TuPDrxM/BLsgg9iLXhJRuKFFKjqFYfAiJ5chYg5CE
	 YBwj7CGcQb0z6ZHmcqHstLB/7+dH5UMAi8XLl7t2Qoc1vUpknbDrpRvWc+0FDDwskF
	 CFXN+W/eDWd4Ec3stRW7oAl0ZJDx4HUMKUJJZtNP7CJRWgRUk2rXFNJK0chrHTIznF
	 onKo2fEFV3Pp/ANi3YNqrKcxtm4sAh5vpZL9xxXRvVooEEVd8QbRBV/y0wzsz0S9Fz
	 DgRdpS9QsUEag==
Date: Mon, 26 Aug 2024 08:50:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: robh+dt@kernel.org, linux-crypto@vger.kernel.org, clabbe@baylibre.com,
	neil.armstrong@linaro.org, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, vadim.fedorenko@linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com,
	krzysztof.kozlowski+dt@linaro.org, davem@davemloft.net,
	conor+dt@kernel.org, herbert@gondor.apana.org.au,
	devicetree@vger.kernel.org, khilman@baylibre.com
Subject: Re: [PATCH v9 17/23] dt-bindings: crypto: meson: correct clk and
 remove second interrupt line
Message-ID: <172468024695.61392.174903956615697419.robh@kernel.org>
References: <20240820145623.3500864-1-avromanov@salutedevices.com>
 <20240820145623.3500864-18-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240820145623.3500864-18-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_065051_621505_9C2C6093 
X-CRM114-Status: GOOD (  12.25  )
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


On Tue, 20 Aug 2024 17:56:17 +0300, Alexey Romanov wrote:
> GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
> Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
> engine is hard-wired to a clk81 (CLKID_CLK81). Drop clock-names
> field from schema: name "blkmv" is invalid and "clk81" is confusing
> and sounds like something global.
> 
> Also, GXL crypto IP isn't connected to the second interrupt line.
> This binding is useless, there are no users of this line.
> We must remove it from dt-bindings.
> 
> Fixes: 7f7d115dfb51 ("dt-bindings: crypto: Add DT bindings documentation for amlogic-crypto")
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>  .../bindings/crypto/amlogic,gxl-crypto.yaml           | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
