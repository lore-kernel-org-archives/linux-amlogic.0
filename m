Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F08C27C75
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2024 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bT0G0T1B5IPHfCorUpHqZm7SeqBhEOLlSQMWqS/zJys=; b=XiNY0fj6Lufmog
	8wk36RtFktWJb5t01dldhsySbJKSYFt5SRoxC0LBSLaIoME0k9dgI7GBQ2qcK0uWNEh0bJ1HSYPMb
	1EIIAq8uE7lg/QD61YB+OWSdxBq4H8kHMMq3MHJ2eIZ93aUSJstzITuiHDZAyy92/gPnGOz+oeD3u
	+V0DC4/ym4bePrTmB6RN+ZDtDX9Uqm6gO2Q5cyn4E6OInv2ZcvRyy12M1ieCkH6VdD86jSLLx/iFJ
	Yk31MMi3F8oD81om/0brN+hEChANYj0lILulVVP7KHhF1eM7mDpmZGNnEnpmWajG3uaKskB+DMBDo
	cIYX/OgQZgvOvXX4pi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHS8p-0000000DcpE-06an;
	Wed, 12 Jun 2024 17:52:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHS8l-0000000DcnM-1kK2;
	Wed, 12 Jun 2024 17:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D42D16150C;
	Wed, 12 Jun 2024 17:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BCFC116B1;
	Wed, 12 Jun 2024 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718214726;
	bh=dzTwtHi0xEpEXutLs5k+UvmqJUUkMc7f/shDQFFvq24=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GigXlW0h8BeV4E9uEsT0raJRSIaqbwtMR5g+WLO29AZIcKzPQshDUMlzxYNTU3skb
	 wvx+Nr5KMBYd4unSoOaTl2zg8faUHpaH+bmlKRP1EJ/5YDNfAhmtETAfVPa/DKIJtp
	 v44pZbKhzuXBr9MRgsop3yMCbjdW2Ct3RHWST7K4WsAZP12XXu4RzpwIHfJcZNetvt
	 DE+kxbTKWYi33kaV/RyhORCaTy/sBN5DffYulBzWllGnLiGUXwz+JYUqaXCXXVw/NQ
	 poDcrWCcDOgYpTpnbCPEgrqExlaGhr7u7Rno1YCsPMoj4Hvzlkk7Xdkr6AvWzOTP0t
	 D90/3+8npk+zw==
From: Vinod Koul <vkoul@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org>
Subject: Re: [PATCH] dt-bindings: phy: g12a-usb2-phy: add optional
 power-domains
Message-Id: <171821472227.586907.9102514939175576986.b4-ty@kernel.org>
Date: Wed, 12 Jun 2024 23:22:02 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_105207_591424_7657F738 
X-CRM114-Status: UNSURE (   4.49  )
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


On Wed, 05 Jun 2024 11:36:00 +0200, Neil Armstrong wrote:
> On newer SoCs, the USB2 PHY can require a power-domain to operate,
> add it as optional.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: g12a-usb2-phy: add optional power-domains
      commit: 8e97ddd586148fe8852c388eb7c9bba70223da5f

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
