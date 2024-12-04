Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D7AE7716B
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2024 14:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4qpGoJC43AAb9F0lxjLCTwV+aDZJbcbZVldjW3+UiE=; b=21xbn3+o0O+FjA
	wZ/P0nMT9br9vKF9YfWNBDR7/7LXqJ5lNgqiMVYOWiy/BijgwdRmXCzOreQlq8XXfi0ya0xXLR4OF
	TLz3pPV7D369+XiHWctHEqhj9rhi9OfoZL0pX0n/wkU4PQDn+AN+1TnhmrbD0ZkAKWe4UGoOVzzJS
	1W8x7EmhixTgc9wvhVtDLty9JYx6jKcGQMxYWxKGu9eypfo7Z0QbBxVoJ46L4JAx8cOAyGl5m8PXT
	NN1z2gU2VE5RdG5gSTPFn2Q+0Xcx2tIX6A0fCC2tYRgZqaauLq8G/HMBL/1EP4b/L/skYYzXx5/0/
	Bd0gQq5JED+8XtYv/YeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqB8-0000000CnkS-04rm;
	Wed, 04 Dec 2024 14:16:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqAG-0000000CnaF-0IUH;
	Wed, 04 Dec 2024 14:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BA105C6D4C;
	Wed,  4 Dec 2024 14:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EEAC4CECD;
	Wed,  4 Dec 2024 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733321739;
	bh=dkmyXph1LZLtubmC+Y3gSWPwY6XxfO8QFNuBW9+XxDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g+zJ5Drg3iDsdHi1dyoEx3Gj47WWJNUMH1/tSQdHxH2wJ5ilJeW81PK0917pSkpng
	 jKbllMC7sTZRpYu9Ss86d0dz38y4qKFvzEID45Tt8TQL3jtE0Xe3zVNFqmYS4SW/L+
	 uuYaDcrY0mS7QqpDmpU+cwd6CJJpBoL5ITmT7wyAaDtAGlnl+tyDlEmSHQJULB4Fyl
	 gB6a0Q+eni1l934lXTKsFTSpXVuWpjEkE7Z8qobKhiRSFV5biMmUKKWUOI/kBa7qsr
	 6S6OT9viflvMwzEjCJyfoa/FPKpg8l+5b/ZzxYVaXYs1fR9d2s8hZj7J2mDj1ZrFgu
	 g4ajx28u8d9XQ==
Date: Wed, 4 Dec 2024 08:15:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: mmc: controller: remove '|' when not
 needed
Message-ID: <173332173692.169425.77201239393030979.robh@kernel.org>
References: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
 <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-3-11d9f9200a59@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-3-11d9f9200a59@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_061540_151723_9FD4C1C1 
X-CRM114-Status: GOOD (  10.54  )
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


On Thu, 28 Nov 2024 16:16:43 +0100, Neil Armstrong wrote:
> Adding "|" is used to keep the description format, remove it when
> not needed after the split into mmc-controller.yaml and
> mmc-controller-common.yaml files.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml | 6 +++---
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml        | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
