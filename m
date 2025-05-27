Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FAC5B543
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 May 2025 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81hsZdmSp5IP5wdV2k0tgVikHEVgGt0McqA+6aHJefM=; b=HjIDafIqAsgRZr
	i4u2dnrn8ZPNJa4oqCJOi9y6ixOhkKRQLmBajbl6QwVevxn8UoG54F7C7cRNTF3VELcuvDIjjJ68s
	beI7aiZ+P6tCs+KtC2m2118CESjrpdP62TVwHtWBULjfJ1PPv26dyPVUYOiAz6sSkbkyM1C9n1PKC
	69bG5gDET5Mw8IiFxT2z6FOy0hlBq/M5n4ruFOCQJnSlGAmNrmwNW3sYESA4vSelo0GbPcRsaBKg4
	JIkKMEVUTvtYAMK22QGEIYSHRXRMWfvfJkVodhOHOW1jFitubwG5/KzfxioBKdsg+708cuWX3BFSH
	ktVYgFuUL5gOVKlj3r4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxxi-0000000BFJv-09Xu;
	Tue, 27 May 2025 17:19:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxxf-0000000BFJZ-155k
	for linux-amlogic@lists.infradead.org;
	Tue, 27 May 2025 17:19:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0AE25C41F2;
	Tue, 27 May 2025 17:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2FFC4CEE9;
	Tue, 27 May 2025 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748366374;
	bh=V6KK0vrVjoBtSVpGsL9SgSz+BPgl+O2Qn3gy97fDWvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=emQtfev7SvvzNtoS/R1u/NMWoKOUxRsHtFCjo/IoBFEzGB7m66Ny8j4wWoR4CyelN
	 3jMGtjIHCbdjjq7UqeB3w0sZhlcawrHVOLxWyK0Jjw9ARsqZssaq0bXDALyIbK/H6f
	 2aY045Nj3cb0wQgPWo2LeLZykIY4ZZrc2cguydVuok5qtnrWBklpaUZ5/QPa/ZuAzB
	 eBI3rqjyRpkhgM6O8kavTGoQAAchBxSwCqUDUMQT/Ii9AdgUxLT8dWSStPepP/wTpO
	 zXDqsdQgeoNAn4xcHr4qvBWP75AU2ZTcJjDdmMQvMvM9JUna1iB0fevc+DrMk+SLBi
	 YWn9Oew/+zICQ==
Date: Tue, 27 May 2025 12:19:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties
Message-ID: <174836637161.720465.9706133884573063023.robh@kernel.org>
References: <20250507215852.2748420-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_101935_337764_6D29877D 
X-CRM114-Status: UNSURE (   8.20  )
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


On Wed, 07 May 2025 16:58:51 -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
