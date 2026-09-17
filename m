Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE52C88E72
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk4MYGBL8e/Z03WQybsos6e8TC1GKz9GtDXK5mqbtso=; b=r7uGvt6s7SqxS7
	NecOOD14x/YTJymHpiqrP5aYGI26k+XPJm+6NqS7OPm6TvvJ7JJkMZ3xL0ZD/pUKL6gt9RhsVxQ5w
	J0iGxzug3jew6ziB2o7ZgIn1pF/NQpjZ9be7xJa+3mrhrihBbPlr8V2CDPjiw+McNcvrWxmfgoZmv
	X5XzX4p72Fz+4WR6mkD6wuMS56vyatD3ovWChNHrAIGWxt6F785ox1gBTGmMZzfH73cNURnmOzKTH
	U+2acQx+Qk1ULNmh2ArT3bO3nBCLlN8oEeuCmAJiBoVLxUoUkKYPQqaRMRRqhhrh4iCIjCdTO7sGX
	JA287mr+T11Vg4+Asevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H9B-0000000CHAR-0gh9;
	Thu, 17 Sep 2026 18:47:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H99-0000000CH9m-4BlA;
	Thu, 17 Sep 2026 18:47:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BD39F416F0;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD311F000FF;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670867;
	bh=hoi8WX3DCZ2p1aQMAVpPAaAI5VyfQnIrXWk4MAN4EKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BB2+jnctfYN0AwSvguJMW3rc/+2ssfIsJZvSy9ONwsCf0EV6KMZIlUi14Q8y/oTn6
	 cQbVbup8QpNHZetMaqZK1ntYDnPH8p6SZ5L9fA8xMNwJLNjaapa0Rihzie4wzJu3+N
	 l1RMtwHSsfXpZ/hG9kjbl7WeXd5ajCL8cTPqnkTHcOiHQfst/lKK5dgj6FlLPC7lK8
	 dRa5CK/70BRBj5C4TbCdZ3q1bYp24DZeAFSb+nEIT2/mX1DvPCI5NPZWwKKMm83xEn
	 PDCeuR2/b+R+i731sZIjseF4AIo8N5vZwESY0xGf/EWDQ/9gqIzhEdvAYwt1Exav5m
	 VAzHXnneEdBCw==
Date: Thu, 17 Sep 2026 13:47:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl:
 Correctly restrict number of resets
Message-ID: <178967086592.3096341.16943496243275631637.robh@kernel.org>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
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


On Wed, 12 Aug 2026 15:44:57 +0200, Krzysztof Kozlowski wrote:
> Add missing upper bound of number of resets for Amlogic DWC3 wrapper
> node, because "minItems" alone does not imply one and any number of
> resets would be allowed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
