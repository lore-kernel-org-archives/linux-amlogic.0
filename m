Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150FFE77188
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jan 2025 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfBlxOyvs7iIqAlcL0R99B5zaCIHV8GoIsfa3vbErBY=; b=Zw+HMfGbW1JZ/R
	wsO3jElRc2Be8K5zIb9lPtEWo8c7Md1UxwhIGCMjVdbA/oYTRViiVpsoro3sHGv5DbcS1XgCorAg9
	YIQ2pkxMxxMLFIstK3JOCHM3/6XaE9cEl1bqQ2Llcxus/MkSAppKhSIgw/YBHS3ymaoRBtEZfmUOX
	MoBe0Rl8t6beq6L9xkP0jqMX4tL17mFuf/LtDYj2XgrL8m0CL6yzb3VwH1+OTUiowWeLwMrKxxhIa
	QCkG937zV3bz0kCMvwPHkaZEoK/o1SmS2OFnrVZ7d3mHrZwVYybkQe7uHd/kWCsxSTtoSL+p3OXIN
	7mjhsPn/kiDw+EeNFDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmyp-0000000DnI9-2s13;
	Fri, 03 Jan 2025 19:05:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmxY-0000000Dn5R-4AtG;
	Fri, 03 Jan 2025 19:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 231A2A4109D;
	Fri,  3 Jan 2025 19:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC49DC4CECE;
	Fri,  3 Jan 2025 19:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931027;
	bh=nYCCUOzh0NUnGVSzltg9x7aYnSuqSSKJyBYNWshTqgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIfc+PgaKw27/OT2xpjfQo4xQfcrSl70OdbWGYZW/tV5GswHgE/5ZZi8MBWKWKgH7
	 VZGKyqXY9ZvyNlwXxFZnCVYpXXXa7aCTmLmVO5v0w/JvrCJcF0r9pRL7vNLLiNO7dr
	 r4Ch73VefRfXzN9vZo4k+64kuMwlAYatPo+sXrjeRtB8XPhGFlNUsyyEWVqwmZu0/i
	 hQ5B2EOC3nQJR38vZOX/ikBuZoNJzcNKpAhVkUURLU2UeXDkwQ087TwG30oS9afosQ
	 PoOM9SZNxDYTDu/egLhoOJo+VA8YI1gWsHyzyOhoZFrlzMb01ZI7pz8DbX1yRHi3KY
	 WMyMSsKbfGo8Q==
Date: Fri, 3 Jan 2025 13:03:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>, robh+dt <robh+dt@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-clk <linux-clk@vger.kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 3/5] dt-bindings: clock: add Amlogic T7 peripherals clock
 controller
Message-ID: <173593102550.2572043.16817852344252694801.robh@kernel.org>
References: <20241231060047.2298871-1-jian.hu@amlogic.com>
 <20241231060047.2298871-4-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231060047.2298871-4-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110349_098828_D462FD02 
X-CRM114-Status: UNSURE (   7.89  )
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


On Tue, 31 Dec 2024 14:00:45 +0800, Jian Hu wrote:
> Add DT bindings for the peripheral clock controller of the Amlogic T7
> SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../clock/amlogic,t7-peripherals-clkc.yaml    | 111 +++++++++
>  .../clock/amlogic,t7-peripherals-clkc.h       | 231 ++++++++++++++++++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
