Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C75BC369A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Apr 2025 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ima7irh3QZfNMtX2voJcU8hfX5IcNlO/18GJASuFddg=; b=sIPfcHBtRcsncj
	DnFUbKD+5twc/8Y79jwMpF7QidR+o5aKh2zVAPxxDDNFgrp1kEatkNMUMQw/fhbV5qFjQwflHIZRQ
	cU4zvi+J7P8ACCnBbp36GjRwFjK2PzJebyF13prlzcdz8dhZ3kuPbG6zsuSkoP8j+T+ja2irwRr0V
	VAN6bWOHEgtE0hvS4ocDqFntCaxpUCzSMZkF6Ifx2hzF+zOZ7skwHvDefQWxjCfgm3sQrvH4sp0A0
	5tcNuXNgKmD9xoDcbu+Q3ECyWBKNHeOXrjHqdd3qyHlg5/XATF02NAAyqOm6tzTE1NKwLkV5yEix9
	TYoHQwKAraUdXlktUQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LPX-0000000ErxO-0t7k;
	Fri, 11 Apr 2025 20:55:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3LPU-0000000Erwz-0hQn;
	Fri, 11 Apr 2025 20:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3E7849E17;
	Fri, 11 Apr 2025 20:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735BC4CEE2;
	Fri, 11 Apr 2025 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744404935;
	bh=0uf2xpXdJtaI564a4ykCW3oUVBo/655/Dm+Eb8aWhR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUv+stlKr4JKySBJKOaaWOV54eevoV3BK0DmjoM/JirEVLfWhjUT0zaPR5G2OcYwC
	 hOpGmOW2gBfpy3v19Vms4GWQqzGsEU76SzmuYLQgfU0a1aPjxTaFMq+ox9ywD01OMt
	 gZl08tAwIasKGsFTvRhrDLgTSd58IdBRfe8Lp+F4yhWL4Qj4Pr4Hs+YprvhejRGUMD
	 ZDM3AOv8xhXDyBkPTm7HEztZWDcqo/Y3fhBsYmfU8PKwi9bWBjT1j+YPMMzyD2F8fv
	 TUOTpi0Og5QZQ3ARsGbMTghfS5mkiG2B5Sgh+bUHTwkmd2ebIpxOj0WReIjExGwzG/
	 d0PaycTcwOVcw==
Date: Fri, 11 Apr 2025 15:55:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Message-ID: <174440493359.3986896.9405749578527326467.robh@kernel.org>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_135536_222914_F84979BF 
X-CRM114-Status: UNSURE (   8.14  )
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


On Fri, 11 Apr 2025 20:42:44 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
