Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5396C021AA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2025 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6e5UK5OeHW/EL06jdFvdOZptKBeZb9RXjFr37EZOE6k=; b=dxj0a8fVI6+ppp
	oxF1Mhrw5nKALpEzwXyERHdcyCddUX1Lwr8VItt1h0n/fBieNtLmxJ/suSf5FHygtUOeDiFK3GWAU
	dLpDYoHKUVWWXwLyBzPHsT/HtjsKAuzyXM9vSwzuZQfSoggcDDXQ61dk0eGyHqKOgbwNB93IA7TFL
	9fjMDCw9sBausQjUTRKFPEHGDE50NMsm41OrBmGlqSpKMxQI0QRIPMQCsoo9z1kTnzZ+Ip7TgkUfN
	D2l/mL94+/28ONu2mJNd74U6fzxGgK0pbl/MLiIylYhVH8aEe1XpWjmp7DkQN/WCNaYEFIW+q3EHk
	dxig3Q+Jo1UyxiBOi0qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrx9-0000000FHyL-3sV4;
	Wed, 19 Feb 2025 21:49:59 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrx7-0000000FHxU-1Yr6;
	Wed, 19 Feb 2025 21:49:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA99611D4;
	Wed, 19 Feb 2025 21:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A79EC4CEE6;
	Wed, 19 Feb 2025 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740001796;
	bh=V1p1tT7UNLn3zJwu+41I707JUQAwN9RLXALKhZOBi0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSwWSClUsLcb50H6wcw8uNxRz4rkMZZ7OBldjZF6ML75IG6C4tywp6GErrMbtAl46
	 yzRrDVY0v2WqoYCpEpicEw6QkYa7Lu7gbSIX0Is6cqSJSAkfEGvdEc1g4So+PjNm+b
	 pTADXkCwNmoRm7Y1qGn2AxsxIKxD4V9pv9Y6uDZmTq6WulZMyKUrDj0VDjYo0zGwA4
	 P8KLsiBrGvobF2g4LZP8mjqO5JhzeQVm3RTid+v+xbTgjaM2+6ek2UCfJHpfK/i/55
	 zKPVWsQ7+8W9GeXj9Zr2I3xG2d7DNmASWyAkIFH9wenBhfe47IqR02i0uLT2sTmMSo
	 qrw2tmgYHvCAQ==
Date: Wed, 19 Feb 2025 15:49:55 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: mmc-slot: Make compatible
 property optional
Message-ID: <174000172538.3013190.16324788737757814573.robh@kernel.org>
References: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
 <20250212-mmc-slot-v3-1-2bf288207040@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212-mmc-slot-v3-1-2bf288207040@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_134957_471667_A98B0F83 
X-CRM114-Status: GOOD (  11.31  )
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


On Wed, 12 Feb 2025 14:52:10 +0530, Dharma Balasubiramani wrote:
> The compatible property is required for some vendor-specific device trees, such
> as Amlogic's meson-mx-sdio, but is unnecessary for others, like Microchip's
> DTS. To resolve unintended warnings for configurations that do not require it,
> remove compatible from the required properties in mmc-slot.yaml.

Please rewrap your commit message at the right length. checkpatch.pl 
will tell you this so I don't have to.

> 
> Since meson-mx-sdio still requires compatible, explicitly add it to its
> required list in amlogic,meson-mx-sdio.yaml.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml | 3 +++
>  Documentation/devicetree/bindings/mmc/mmc-slot.yaml              | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
