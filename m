Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F8CC4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu1PgP8qVQ4w7eWw9sLeFQ3iJdg7iE/waIeIXH8xnxQ=; b=4IJ3Z75hDO0vPK
	j0seJKecJX2xN9clOaxhmT9OdUTm2ON7bba0vMbyuaFwtSPahw2eFBpN2dWYrrwHAcvNtuZz0DuSy
	Y0QRWvEVIaLlPbVvvOf6y6b751j6lEDtTLJsn6eeR8PffRE0wDbGZW9dqsLEHp7gV73xlNauRaDdf
	SyQjDO3NNjvxWf0drOT7mxHj0O00llBAW6CIfFvcwx0F6ZziMWwlI8VCMz0pCVadWRwq1npfqZyow
	pYttZ8Fh1midsMXFRrAeM8X/JkfnKLIdBph6tEfqOI6X9LfeXnGbt96NZdoDVgWrl8z/4OJuo5sL4
	T2TcRCZotV6IN5rKlQYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IYX-007yO0-1D;
	Wed, 29 Nov 2023 11:16:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IYU-007yIp-03;
	Wed, 29 Nov 2023 11:16:35 +0000
Received: from francesco-nb.int.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 5141020729;
	Wed, 29 Nov 2023 12:16:27 +0100 (CET)
Date: Wed, 29 Nov 2023 12:16:23 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
Message-ID: <ZWcdh1JNaPPnz36a@francesco-nb.int.toradex.com>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
 <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
 <46f30852-4824-45b3-bf01-4a4a5ff2cff7@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46f30852-4824-45b3-bf01-4a4a5ff2cff7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_031634_228884_163B053C 
X-CRM114-Status: GOOD (  15.38  )
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

On Wed, Nov 29, 2023 at 11:19:15AM +0100, Krzysztof Kozlowski wrote:
> On 29/11/2023 08:29, Francesco Dolcini wrote:
> > On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> >> ---
> >> +Following order of properties in device nodes is preferred:
> >> +
> >> +1. compatible
> >> +2. reg
> >> +3. ranges
> >> +4. Standard/common properties (defined by common bindings, e.g. without
> >> +   vendor-prefixes)
...
> > On point 4, do you have a more explicit way to define what is an actual
> > standard/common property? You mention the vendor-prefixes as an example,
> > is this just an example or this is the whole definition?
> 
> The actual definition is: defined by common bindings, which are:
> meta-schemas and schemas in dtschema, and common bindings per subsystem
> (e.g. leds/common.yaml).
> 
> Lack of vendor-prefix is I think 99% accurate in this matter, but there
> are some "linux," ones.

Got it, thanks! I would suggest to incorporate in some way this additional
explanation in v4.

Francesco

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
