Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB1CC41513
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 13:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXun0YDFG+LUcU9WO9BSrcVLYHAMdtOCbe/rzX79Gjo=; b=zUJS4mQuuWQ97B
	iT1pqb2/+FH2NCPJDwTcpunQHVcKB5C59cWLlzXYHGtnwQdi6OMU+lJO8Fyv8NF6LJnhI1VE8KPZA
	ewSlUPdoM8p2wrErSBKyB9iioxnDZUI13OfwXnMREUCMxSq1hs4NytZnOlgZRkxqSDv04QUje+3NZ
	SjsW9XjHco9Tdx83qg9Y1EnHdyyJsIl7ftlQQ+1jLhpWrPqIdsYvs1k0wDWMGOSFvKk0cRpDOhoPm
	eyf+3oXT6lmL4eGrk8PR7zhoNW9fc7iBHHcHE+P62TyLfTxFlcKm6mzremSOcTbQsRmdsEQV6avJ/
	ERjXjBP+gk9qgBea6yvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VzF-0000000D366-0IRK;
	Mon, 13 May 2024 13:45:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6VzD-0000000D34j-0VeB;
	Mon, 13 May 2024 13:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hXM0sVWup9YdkURx0BPGiywKWy51MZ0a1/FHOhFw1K4=; b=U4efElPved0BbuAnt8kymY+fQm
	Hr/pNbFIGhqtLpbj0ChneMp5s0xB2X6w4fVVjODrjHpm5q5b8mauzP69F6o2SA5XiDcUUp+7ZNrJT
	/VeqZ0iNqytXv0afmLJphFa+sQ2Y+eRgeqhP/F5WxHc30SWSrAC85aTMQ/izx52dhltatVlM9k+75
	vv4NtxWE20Z4d+HO5xtOVOmMGZKBAaI6ThyFLX4A/QNGUfKvrRqs9Qk+iip1JECoVnHd8FRQNNyC8
	cUbPzOsfmlzS9e36/F0UxkF9rn7tmu3ovYDIL5pTXH31ZmLUDcgDdAIu/F/Dm47MHoUJ3y2y8H0VZ
	tMWQ66QA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Vz9-00000004Vpt-20YU;
	Mon, 13 May 2024 13:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B57C60DDE;
	Mon, 13 May 2024 13:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F040C113CC;
	Mon, 13 May 2024 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715607895;
	bh=n87KKV+BF5dZ/93FCjBaWdbxZVC6KFuXqnr7dqwfO9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AryBU4ocAifL7bA09c9DHou1/vDq9KNXExgVjrCdQTBHE76Yqe9jo0zhooKH8ybNV
	 1v413UT50CSml6IumZti56rDdVYLr8PzKNRuca+lEdqUuoSwKV0BohLTOFEzvp1uiU
	 IW8sGbo/FuicuNtqJ8sG1rL2UAnnCuUIgNZVP3FO31Nalpk/BxvXqQxsN36QYm5F1E
	 sDtRcosdnmSFjD1Ajtq9f/GBTRoVCJaXhTmzw6f7wd+hwHRNi0qW5dDKgiDOs7iOUL
	 16hFYqCg8lUoJQ/1wpWrOKNUsQUclYiwMlgzOaPN15AYBLD6LhzGVnxcqHeS5glEy8
	 qn+H3fHdZmWyQ==
Date: Mon, 13 May 2024 08:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [APPROACH 2 1/2] arm64: dts: amlogic: list all slave clocks for
 audio clock controller
Message-ID: <20240513134453.GA2482519-robh@kernel.org>
References: <20240508144259.191843-1-jan.dakinevich@salutedevices.com>
 <20240508144259.191843-3-jan.dakinevich@salutedevices.com>
 <20240508175013.GA2244257-robh@kernel.org>
 <3fa610c2-1f69-41d4-b06a-035980483b3c@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fa610c2-1f69-41d4-b06a-035980483b3c@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_144500_051906_55D2D1D4 
X-CRM114-Status: GOOD (  18.01  )
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

On Sun, May 12, 2024 at 10:06:23PM +0300, Jan Dakinevich wrote:
> 
> 
> On 5/8/24 20:50, Rob Herring wrote:
> > On Wed, May 08, 2024 at 05:42:58PM +0300, Jan Dakinevich wrote:
> >> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> >> ---
> >>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 27 ++++++++++++++++++++--
> >>  arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 26 +++++++++++++++++++--
> >>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 26 +++++++++++++++++++--
> >>  3 files changed, 73 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> >> index 6d12b760b90f..28f4ec5f39b0 100644
> >> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> >> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> >> @@ -1342,7 +1342,9 @@ clkc_audio: clock-controller@0 {
> >>  					 <&clkc CLKID_HIFI_PLL>,
> >>  					 <&clkc CLKID_FCLK_DIV3>,
> >>  					 <&clkc CLKID_FCLK_DIV4>,
> >> -					 <&clkc CLKID_GP0_PLL>;
> >> +					 <&clkc CLKID_GP0_PLL>,
> >> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
> >> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>;
> > 
> > All 3 cases are just unused clocks on the end. I suppose that's not 
> > always the case. You could just set 'minItems' in the binding to 
> > avoid needing to pad the end and the dts changes.
> > 
> 
> You are right. I mistakenly thought that 'minItems' can not be
> redefined. But not, it is allowed to redefine it and it works. Thus,
> this patch is not needed for this approach.
> 
> Anyway, what do you think about first approach? As for me, it is more
> simple and readable.

I prefer this one as it enforces the order.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
