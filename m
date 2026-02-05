Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D59EC1EB2
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Feb 2026 13:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZFEINSp7vaNBUcOGV/JghbTMx/AHUBT7WrSKIWi8MY=; b=D0xHKNhKkNgcbw
	2VnfHaBjF84bsfY4VzzEO/TceJpslGwYQD6vQ9osB8NdK/snfW0ZQ482ldbSQSmR0HlVLwpqywn4j
	bRnaoMRbXJmcVRdN/hizWmZKNCV8Vw1LRJoHdEi9E4ioMsjs/hixaqGa+GsaTURgrqhmecwilqZ8o
	JN/7BArU9H4/1JOyWcVy7uUirvx78x+wlfga4phXL024J1/achhIJwSazYToTglr+vIm7ptNzbxil
	mFd24fZoUPdWh2UQv/Mzanp/OGUE61gIqxgwtmtutQHF7KzK63n5UL6mH9nlM+Rtmlpaw11/wI3vg
	G2ZE68aqHEmxcur/1R9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzhk-00000009yMI-1wOQ;
	Thu, 05 Feb 2026 13:47:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzhh-00000009yLv-399o;
	Thu, 05 Feb 2026 13:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45D3243782;
	Thu,  5 Feb 2026 13:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEED1C4CEF7;
	Thu,  5 Feb 2026 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770299249;
	bh=f1VmjMIB7snwfl7qkcG4KNiuu0lWm3fFNIf4487CBqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5Vd3hPmoa/aDR70XoioB2qXWJ08CjYHZrIhL88ALfeiZHhQomBJ+M8yZ+DWNyTq7
	 FjY7OnCZExAfpd1L5MU6R+rkYUx6nM1/oNRCf5WKNDuoX8TLGmL+DDp6GgswijwBjP
	 Va1aBJxxLeHv5AyuimWWW+/Tscs6MGNPIgoEi9jt3I8UEhm9D8pbWWeB4QOOV6Vdm9
	 Pl2RghhjaSkOwbFHquNQgeOoq6OVX4YTNNNgp5utBTM9hs77ASEBBpqDiqXmQPcdSe
	 Z94TVYHqsn69c94TPBTwP7TeMcEBE+alhcHt2gyIH8I6v1zuwXQGeKndXvWO232lSn
	 tC1DY1YTV+jHQ==
Date: Thu, 5 Feb 2026 14:47:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for A9
Message-ID: <20260205-bouncy-squid-of-acceptance-ee9f80@quoll>
References: <20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com>
 <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205-a9-baisc-dts-v1-2-1212b46f95a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_054729_829148_98F2788F 
X-CRM114-Status: UNSURE (   9.62  )
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

On Thu, Feb 05, 2026 at 06:04:03AM +0000, Xianwei Zhao wrote:
> Amlogic A9 SoCs uses the same UART controller as S4 SoCs.
> There is no need for an extra compatible line in the driver,
> but add A9 compatible line for documentation.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1 +

Don't combine independent subsystems which prefer to receive separate
patchsets. There is no reason why this serial patch should be included here...

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
