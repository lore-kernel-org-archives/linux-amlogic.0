Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A78E7716B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2024 14:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVmtZ6sGxaZ0THye8RH2gzEdnaTeFidwfToWiCPJzpo=; b=L8TidE6NiZ3shO
	wpK8RuAeUgNi585yiToZETnuD0HUnWR0X3KZJQIb9iOp7Q9fv1Uf0Bl6DXH5GscsEHpl0idT5lRhI
	wLAUMlLBHePofATlvk5Z6vQZKAKwHDBd2PX6x8r2xKQIbmNw4Q0ZVG0ek8QPW7yblSeTTRi36729k
	Se9QriY5QyWZ1Aa0C8QvE4qIrFFr7yhz+U7xyT50TyILIvYw5phGlEeloRpaPoIk3QFGqUkTfaUyb
	AjYxMnE6m3obIiMO23u6b9Q2mXSAS3nuzHffvPd5HDUvekxBNWeYmHAdPtpq19zrSMcxse6811VaP
	s81MT9PIgFNKCuonbU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqA9-0000000CnZB-0NrC;
	Wed, 04 Dec 2024 14:15:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqA6-0000000CnYj-3hDC;
	Wed, 04 Dec 2024 14:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 791CE5C6EBA;
	Wed,  4 Dec 2024 14:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DADEBC4CECD;
	Wed,  4 Dec 2024 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733321730;
	bh=fJGcZcCvocrYYD5ARLmU36d5qyxLWZqmfekPOwaJlFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xaje4v2LAo8DiuFogqnwp0IxwdRAJSvcAF4Wqr6Nl27/WXwqHyhLjcZoZFQLFZQgv
	 nhjO6vDUgg4YxbLx4d1gGM8prSl/a6VeIPjqirl5LO86NR7//gBFH9NUUvHuCgo7iy
	 4jv6yQOrkKrruEIthtgtxI0MmBf/ZfZLJnVft9XIKPl87097OCFBBNVnlMVPVRCHMc
	 MhmTiwa6tNhJQcAHSRmIQUGsleSQqjzCFMWDhuS/JtqIJXylgbmhRfOed42ws5YmlF
	 UIrf1CFqsqVScW7V8ObteDN+t1Tudkac15fKjBQ1JhxiRNqLxtlg/eLRHJlKYgSCxk
	 LSr5AXQ2QTPYg==
Date: Wed, 4 Dec 2024 08:15:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 1/5] dt-bindings: mmc: controller: clarify the
 address-cells description
Message-ID: <173332172731.169103.7423360262255147051.robh@kernel.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
 <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-1-11d9f9200a59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_061530_957907_FB67E741 
X-CRM114-Status: GOOD (  12.02  )
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


On Thu, 28 Nov 2024 16:16:41 +0100, Neil Armstrong wrote:
> The term "slot ID" has nothing to do with the SDIO function number
> which is specified in the reg property of the subnodes, rephrase
> the description to be more accurate.
> 
> Fixes: f9b7989859dd ("dt-bindings: mmc: Add YAML schemas for the generic MMC options")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
