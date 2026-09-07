Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9DDC79F89
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2026 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5u9BYiXz6UJAFe1kX+sHIXN/h841SiKBxkGMQ7wRtjE=; b=B3ycB9lB9DE6t5
	FKLgUcRzUK06K6FyL+uzCjlGFJccCqpI1rETWlKDNBETuAhoddgvPJZb/A3Ushdbp4DjT70VRu+u3
	aa7RxDFqb7KJ379dXAHmnZWZsmZDaxlNTo6TJyP68kxa0blH21lndBOT2Vy5hUiwjFnrAAScD3NKr
	EMZ/dVBkboxDWkzf2PSjehLTu5IGGkINANaNSWtF7rDxHKVxEZKv1nc/Q/FXMomIh2+AP2TNYfKoI
	i0jaQBoXPo9WgnQaEEdgzucXzoqwy1HtZt3doOCC/7UdSdCrqQPIltNLW4qREJ/AYOeiHUie8BITh
	DM1v/KxRmKxKEyFTcnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VAG-00000006KLV-3c17;
	Mon, 07 Sep 2026 08:57:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3VAG-00000006KL4-0epr;
	Mon, 07 Sep 2026 08:57:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 772F260052;
	Mon,  7 Sep 2026 08:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034561F00A3A;
	Mon,  7 Sep 2026 08:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771439;
	bh=AMPM1yZHFzG6EjCvtkpbe8MOIkMaHAfMvIR2rnpmnj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dHqj+Zb2MdJPMi8/84owM3B/yAt995hHE7xSLXucrHYa5Zry6ir0GbW4jQ+V3ccNx
	 PGKsuQJvh0uv715A39YqibiAclKYa/YPe52LYY5BQTVbjFMjW0qhZ0KDzsTZsApzvD
	 A4+D8sfi3TQ8BRmxH3n6LReBf7yl8Uu94DHVt29HpAcTPYDHj498O6pYfXeOx3eEHI
	 v55dHO9sEwmdKTQzsGDnALgYGSTKVI2PC0zxskrmQ15vTAxilhjdBC6Kd+O0AUQVWt
	 q96UWj88Xeo2pylPsBNpNNc7lPhYZs1kurBVLTSVILSowtm071fj34dXLjDFpXYVZO
	 73mVqczxILYIw==
Date: Mon, 7 Sep 2026 10:57:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi Box 4
Message-ID: <20260907-cryptic-macho-pronghorn-b6ac16@quoll>
References: <20260903-mibox4-dt-v3-0-1a8e395d923c@stu.hqu.edu.cn>
 <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260903-mibox4-dt-v3-1-1a8e395d923c@stu.hqu.edu.cn>
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

On Thu, Sep 03, 2026 at 06:18:45PM +0800, YuChia-Kan wrote:
> Add the Xiaomi Mi Box 4 (MDZ-21-AA), based on the Amlogic S905L
> SoC, to the list of supported Amlogic boards.
> 
> Signed-off-by: YuChia-Kan <raspberrykan@stu.hqu.edu.cn>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
