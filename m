Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16DCE77188
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2025 07:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwflxzwYjS7xPEOczWrXKhqQ7kOGEHqZx70ePltoFT4=; b=KEOmEo/BceljYJ
	GE/PVzWfJ+e+00afJh9pyT8Pg4N7yWBX4C1bO1cAwl5jLXhZNmwmte30CZwmezzXiwcleuueLMnTB
	nUk5wJ18rZJF89gKExZHpe7L2SlkmXb0iQrxWbN7E/LAVryYtcjZuPgyu7CIbcwlUgLyX3pOiQPbn
	gr8GNVhzACdrkIT1gc5XAj5dw1EOL46vHbSJ8fSbypysG91AWzgkrcHTtyZo+6LGn1eQJl92QI1ty
	cTfT+h4viJ8y9aaSkGeFC9+k68fMHWsufbCsvKPDCg1cLCB8eXpUFXsnLMJkffEIiBAF0Nk4uxDNm
	bmLOsWO02O8UKwJABkMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG76-00000009tl7-3Kme;
	Thu, 02 Jan 2025 07:59:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTG6x-00000009tje-23Vm;
	Thu, 02 Jan 2025 07:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 773DFA40100;
	Thu,  2 Jan 2025 07:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B16BC4CED0;
	Thu,  2 Jan 2025 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735804758;
	bh=Wtds6vwJjBF4P/XZvYFiH00JqcJXxnLQHetnGMvlTUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTMfkafwdqE5Xtg30VWOi0HKrhX2KrG/HBucVTsuWPOgi/HepUzTyW6wm19DAJKgs
	 KvzXYINs5yYtWlkd5lZmg+gUOoFKINYa+otZWQY2OG/qtfq+C42aojIzPOIQ2FAO9s
	 Gien8iO5D+rNiFYkai3gJi0Ox+ISHOPVFD+081P+ZTo+j4tgiv5rQfa2OCdUfxMmVP
	 5LeVe/BBXGr/l54RIoKXPYLKKdkEmPIn0hsvv/icOXIkqi3qWsE2628XStkprVP0Ot
	 AwmfDm2eLuACKbLKiE1xvclC2yaroUHinrtBR63qQGA1bv572DAlRRztj0/4RYUcQl
	 nAF9LHNEC4f+w==
Date: Thu, 2 Jan 2025 08:59:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH v1 1/2] dt-bindings: iio: adc: amlogic,meson-saradc:
 Add GXLX SoC compatible
Message-ID: <akqtrf3yklgplxutne63fq4iz2cxw4gkzinjgxldjdabbsvusd@rfuofb3bcqmx>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
 <20241231194207.2772750-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241231194207.2772750-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_235919_610133_AB321A3E 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de, robh@kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org, gnstark@salutedevices.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 31, 2024 at 08:42:06PM +0100, Martin Blumenstingl wrote:
> Add a compatible string for the GXLX SoC. It's very similar to GXL but
> has three additional bits in MESON_SAR_ADC_REG12 for the three MPLL
> clocks.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
