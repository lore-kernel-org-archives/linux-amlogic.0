Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E1EC3065A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCtFxVspgFSMnX+jWR7hDgZAt5AVi58adLDY/R6bjNM=; b=W/9ZnaTztZkae4
	2AnqVwB4KwpeYyt7jaPHUaQ7n8VHVvaee4tIIRjGdyXufIo+VKIREtmKlSkoPpd8qmDLUy6lW5ZYH
	dZdmT3gcinzMbvnmMflrN4TXJODen9PIctJ22K0qJQ02pminJ60AQrAC6g1AJYRoW6pTJyAm3K/dA
	FxpV7kAyD/MuhpfKJOoLgiTK1Pvp5ouRiEVfesgzj9WylJTzAa0BmOSZHvJbPmuZKvCySc1+Bohu1
	9fik8fD1D6n6VOUI/n61K5KtC/YfilH7+i+Ahk7o3skvR4wXL7GchTdEWxzz+cxnJTloKFq/4NyuO
	aVQsvnUfN4fIB0vMezIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLtD-00000004Txg-3uoS;
	Mon, 01 Jul 2024 18:36:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOLtB-00000004Twy-2v8X;
	Mon, 01 Jul 2024 18:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FF1B6172E;
	Mon,  1 Jul 2024 18:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2892AC116B1;
	Mon,  1 Jul 2024 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719858992;
	bh=PtmpIxW7QtZRZGSwCmMzSgdpUv310aGaJeYhAgzViwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1i8joHio0IzCMxKBhGEFgei3HHw7ygdeCR3CAglvJMsZFMYe6bgeaLT8w3eXH8uZ
	 0wnahBan1xLupL68xx3DPMJtL3CdwHHZNTXRfJM1Ys//jPd9y4PSzyaZtVrQ48aabu
	 dpaTvX3D18/ZGJc1HfXl3f6o2SHUNZBfBHaXSTLLW9L2VflxGGc96B7kXiLlHEyVSK
	 1amC0DpO7Yq2VTIiISBHuf52YjNgZaYJrDn5Gf5i8VjBP1ULbVqjKWThpJmNqeWJfj
	 FebHhcKrJDdGsVOgT1jMyStSml6H77i7COpyZHcWldp7RIAIHfTrmw7jdvAp6EKzSY
	 8B8fbD1hfXGsw==
Date: Mon, 1 Jul 2024 12:36:31 -0600
From: Rob Herring <robh@kernel.org>
To: George Stark <gnstark@salutedevices.com>
Cc: ukleinek@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	hkallweit1@gmail.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v2 2/3] dt-bindings: pwm: amlogic: Add optional
 power-domains
Message-ID: <20240701183631.GA349021-robh@kernel.org>
References: <20240701172016.523402-1-gnstark@salutedevices.com>
 <20240701172016.523402-3-gnstark@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701172016.523402-3-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_113633_822191_D7C27EC8 
X-CRM114-Status: GOOD (  15.46  )
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

On Mon, Jul 01, 2024 at 08:20:15PM +0300, George Stark wrote:
> On newer SoCs, the PWM can require a power-domain to operate so add it
> as optional.

If required, then how is it optional?

If the 'newer SoCs' means the one you just added, then this should be 
squashed into the prior patch with a conditional schema making it 
required for the new compatible.

> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index da22cb3ed878..c814d88748dd 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -60,6 +60,9 @@ properties:
>      minItems: 1
>      maxItems: 2
>  
> +  power-domains:
> +    maxItems: 1
> +
>    "#pwm-cells":
>      const: 3
>  
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
