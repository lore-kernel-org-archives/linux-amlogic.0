Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BDDC531F9
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEn+5+ftkU5QjNQJTbD+pjDnkqcejiWz/4RvQ+2EH/Q=; b=ipyE3U0uRavlSd
	5/BXkB6n1REuqJe0V8laK4P1pxFKXTX4SpfuN+IhsCmjnC6I/eWytBfUnT6GTRPf52iIQ9wdlrHa3
	d/arfzSD2LuIKCeqRwbJ0hj+vIp0DFyZ++h5u/ifPAdFKf9nO/jsf7F0zhBzfcgvlTbapZOYeq2du
	X055v//4jtC6CJSXw9XvBmQgb7sLlMnH+oxKQ37RMjT0MplbAXmdP+Gz91jfyNEZaD0SwZpZxRM13
	jGjlngwIEDnTnykvy5pcNn9UXb4EfI/5T+aesR9dRBFI66eeaj6I7WXVcpe4N8aulSuFl51yCOAsW
	M+QNnSeSJmh/CG6qP+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBLB-0000000FpI8-2Ho1;
	Fri, 24 Jul 2026 08:33:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBL9-0000000FpHn-3Ep2
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 08:33:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 289E543929;
	Fri, 24 Jul 2026 08:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2701F000E9;
	Fri, 24 Jul 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881987;
	bh=LN6epFAXj94W01ANju+cx76s5A6fmu89df6SvpZHcAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ampYFdQnT6olqGCEhZo/RwVQU+4bGJTM8lKFvk2088Qss5oDlvM/v+jZdn8xHTmqY
	 I8hhh2I9F4Ze3Akq+Qm1nvAHfLeOOCenl5Lqs8S4otbUwSm+mv/YlAO6gc4Ab4NV8o
	 yCyQfIqGokYYApoiQOou3A3kNuuoP+cq6TZYKMoDep8SA23alTBSC+CYlDNhPzO+nv
	 Q7dutGmeuVS3FIvjMZItw3buknaCbRv+Eo5su2K/KmgBsA/w8A3C2f2WjwsjmbBwJ/
	 htulQkMYpqi6Bsql653D1aqpT35+P+kS8Qms79+zgWtO/dL0tybECjMhypwvtT/JEy
	 sFm0G2pucN8pA==
Date: Fri, 24 Jul 2026 10:33:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
Message-ID: <20260724-whale-of-fabulous-saturation-df4d9f@quoll>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
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

On Thu, Jul 23, 2026 at 06:43:42AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 SPISG controller and its additional
> Device Tree properties.
> 
> Add the "amlogic,a9-spisg" compatible string and define the
> A9-specific "amlogic,mo-idle-output" and "amlogic,word-gap"
> properties, which configure the MOSI idle output level and
> the inter-word gap, respectively.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  | 38 +++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)

If you are going to send a new version, please re-wrap commit msg to
match Linux coding style.
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
