Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B81FCFB45D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rj2WS8Fdi0Elil6qd2TZKBABvc3w5sTzhepIntDTXzU=; b=VXC3UKTPNlqcRI
	chrFEX+qjAo5Np/m/X4oiyt77o5XyvqyScGmcz3b7pOasKQH/duMj2BzqgM1rf9J9eewcxnp+OyTr
	nX79RNHhq7Kym06uqVyQ/y5tL/rmUNCg1iPR5ZpxnMrWpxduDQrKMo2b/UARjgZ9cr1YWWqxUlYSp
	5YDE96mKK76BMnEPHsw2yq+TChxeOyI5DFle+rHUejAObT1JwJRrBOO7ADP3d+hxpCfk9g77quyYK
	qYsSdgWkoMG1ExuJh8f24s/M1RbUk1clmsGKahuKl5yyK62PW+WAFxzBKjhUj56J2yylopvSKko20
	aVhv7oNcP8Ddlg7teEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtuo-00000003gPF-2v49;
	Mon, 07 Oct 2024 20:01:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxttE-00000003g4A-3RNy;
	Mon, 07 Oct 2024 19:59:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D04F85C5DD3;
	Mon,  7 Oct 2024 19:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF4FC4CEC6;
	Mon,  7 Oct 2024 19:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331171;
	bh=kuatBlysKSTgiUPXupQbaL2UIbwsfXdXsP0rFDt7UPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTEJZphuxmsydfB+jMpN/fSoDqJ/sGcLd+qex+rn6BZS2me2A2pDhGbkC87gXuBUG
	 GafHKW9rLKRH3GHjUllfm5iZe32b6SZDGT2OuFlTnoWyYaTvfm7FTbdnOkkkhp1WMn
	 pEvrZxeuBeH1Wtuo5a7owTVyUQV9HcjsSlHn89JZPJhLvMc7Pr8qUL9YTJ+oKYaXGT
	 +uTC0kiIGdMFzR1Z7nyaq5bVl1pzFSy5paRtHhKJ9k2Tc2Ly28/OcPIvhOid/Yu5of
	 5LkfqcrWx6zr7k0VAoECHqpiCeV63CfGUKfTCZrUYSHr4SBZitTkaYy539SQxd9Pb/
	 BhlyESjJp6DiQ==
Date: Mon, 7 Oct 2024 14:59:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: mmc: document mmc-slot
Message-ID: <172833117019.2301548.16704641563450010551.robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-2-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-2-ad4eb22c2a8d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_125933_341350_00D8116E 
X-CRM114-Status: UNSURE (   8.49  )
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


On Mon, 07 Oct 2024 16:03:38 +0200, Neil Armstrong wrote:
> Document the mmc-slot, which is a subnode of a multi-slot
> MMC controller, each slot is represented as a full MMC controller,
> the top node handling all the shared resources and slot mux.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/mmc/mmc-slot.yaml          | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
