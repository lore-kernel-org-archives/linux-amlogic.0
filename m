Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2B1C43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8ocv5AtYDrWusJOzeYcx9rkozTqW57oO4rA9kIyVVQ=; b=BGDiAhD8MvXarE
	093vYxqXb6biAa9u1/M4ryVVy7HJCp61PY7ar5obuGtK7HLURJzutwcf00lBnifqWspTHulrTdwBz
	KXxUQaoi8yEeWdPRvNyvnXLuRlKIri0hpAQ+FKZdhzMvdPwz26ZBUz2ytDkZKCqyjysRQRyUe8cBV
	efgS4Bjf+MYLFaOtI44gUfdNhCJMvAf2/uk45I9MMFa8B9+VcyjJgFdYZeOPW1kn0sks2m5qXZlhc
	NmeJKw5JAIEsQMEeeAY7rG1FSEHBebrVl53exSP3petwg99qSXfvKaVz6RcsUrmec4SmyECudA6kk
	lp8kJABKNwTcnNq8AZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdIW-0000000BgBS-3BHO;
	Mon, 06 Jul 2026 06:59:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdIV-0000000BgBH-2N6f;
	Mon, 06 Jul 2026 06:59:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BEE61832;
	Mon,  6 Jul 2026 06:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4BA1F000E9;
	Mon,  6 Jul 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783321158;
	bh=y+lATJnRQ7o/rbZhmJ9nDyBRy1H+M8W2CRQDVnlKZxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oL0ztYX+YNmtoYG/oyXLUbewaxBWatkFUwLtGfQ86IxklFQhTfIx26NBKNAS+OrrX
	 JP1c2umXnXGYQFDiE4fl9s5alDIRS0YuDD+GO/Op/k+MOoWQswTLgAvYD/vCkCkPri
	 oB3nLJmWKBMxGBqVmUObu9kNh/r1AHQJD5g2quRDfhhjJEU5mzVr2a9rlj//nto0Eh
	 RMxhojNjZ+hNQ1Wmo0lkcDxVIi3V7b/KxQUJmsE729kB8D98CCqJFwAf/Z1uiFXFB3
	 9vRX7wE8ZxPWVIy/vvABsFwe1jBDjqMLDIWpygLllZzlfrfHK0k1eX4sUuUZwOhCV2
	 97XS0lIkljExg==
Date: Mon, 6 Jul 2026 08:59:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: meson6-ir: Add Amlogic A9 IR
 compatible
Message-ID: <20260706-quantum-celadon-tench-c2f28d@quoll>
References: <20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com>
 <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706-a9-ir-v1-1-4f082ca8aaf1@amlogic.com>
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

On Mon, Jul 06, 2026 at 02:43:27AM +0000, Xianwei Zhao wrote:
> Document the Amlogic A9 IR controller compatible string. The A9 IR
> controller shares the same implementation as the Meson S4 IR block,
> so add "amlogic,a9-ir" with "amlogic,meson-s4-ir" as the fallback
> compatible.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
