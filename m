Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5328C43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 12:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756CF20700
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 12:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FBomjZyk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756CF20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AW3AISfsJJOoT+oxxGXIyb+RCESDzyHOn/n0XNzfvcA=; b=FBomjZykXGVA4s
	bO/jcXFvtJWq5NiqmhKHTq2sIxeB+X/oUpiAJJvw6WsB0t/8b0X3ZjI0tKp90/NvFH6vV/7C/gkFv
	NWFmC2KBUuNi8lFaswO7vE+YKimUXe9A/ZI49xSG5wakD4TPnZv/rRtB2i+on0uJ3XvSLFvoPKHem
	aWydRrNEoK+sJu366o07VVJtNh2oDWmUVQTxHWWk8LYAGt/NyzSFdS687gFtkEoW6ReCFbwLWqoDA
	+ZWnu8EMXm2XBYFAA4NdAKJQE4bUE8aMlEsOOJztRRRyTMsj4rD75OxulCKiOSxEG0mue9fc6PQ5t
	6DlIUveqJZQO58588y6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h97q3-0000lc-G0; Wed, 27 Mar 2019 12:39:27 +0000
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h97pz-0000hi-CR; Wed, 27 Mar 2019 12:39:25 +0000
Received: from [IPv6:2001:420:44c1:2579:f45d:db5a:3412:ff5f]
 ([IPv6:2001:420:44c1:2579:f45d:db5a:3412:ff5f])
 by smtp-cloud8.xs4all.net with ESMTPA
 id 97pfhBF1xUjKf97pihotlY; Wed, 27 Mar 2019 13:39:09 +0100
Subject: Re: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
To: Neil Armstrong <narmstrong@baylibre.com>, mchehab@kernel.org,
 devicetree@vger.kernel.org
References: <20190325173501.22863-1-narmstrong@baylibre.com>
 <20190325173501.22863-2-narmstrong@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <518678c1-2e1d-ca27-55bd-0dd10965354f@xs4all.nl>
Date: Wed, 27 Mar 2019 13:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190325173501.22863-2-narmstrong@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBTTQbqkqOt2i3TAvKHYs0YrBgPt519lwHiUdXbVmreDq4Rkx0w29c7WAOi5zTfES1EftX1R5wYa88rpAwb602bMMCFdacP6S8JPzom+nRkUhqYhOKh6
 fO2eY2mwqE9jFHfxPeSCmAX52b3U/GwJEiD1S4Q8XbnFa55OV7mBZ8wlBkBH1O8/BwyaHJmL1fxnqGqVH7B2w8q8k6POz6qQuZqfUaC8IiJ3PJeg3vIhVSww
 yxd83kDUaowiBR4qCkq6MmFe+pahnn9IwI7HtqbPiiqv1+zCCbDHUEJWTPqUVm8oYNtBcYD/Igb0dw048IkcDd7pvDSu6avV8m3JFYbddlxZDs7ZpwonVpiI
 KN0AO5iizbQV4Odw+g4S+jJVu04ewh4PqkRxCMlYhjtbqxglkkkHLqvE2YmwiTfujIPBPgLQ0bqI5uoOuexahSSWGmaFFasBZovKnwYx1cNVzudDCEiWLw8o
 SvnybT4sF5wcmLIjjWvEaZYS4nbLQ3oKmtZty9haJtQpGy7H23L5fkjaJXIpfUDqISx/6p+gR1uQbs6+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_053923_584129_2D737138 
X-CRM114-Status: GOOD (  16.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 3/25/19 6:34 PM, Neil Armstrong wrote:
> The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
> the other one is AO-CEC-A described by the current bindings.
> 
> The registers interface is very close but the internal architecture

registers -> register

> is totally different.
> 
> The other difference is the closk source, the AO-CEC-B takes the

closk -> clock

> "oscin", the Always-On Oscillator clock, as input and embeds a
> dual-divider clock divider to provide the precise 32768Hz base
> clock for CEC communication.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/media/meson-ao-cec.txt    | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> index 8671bdb08080..d6e2f9cf0aaf 100644
> --- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> +++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> @@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
>  to handle communication between HDMI connected devices over the CEC bus.
>  
>  Required properties:
> -  - compatible : value should be following
> -	"amlogic,meson-gx-ao-cec"
> +  - compatible : value should be following depending on the SoC :
> +  	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
> +  	"amlogic,meson-gx-ao-cec"
> +	For G12A (AO_CEC_B module) :
> +	"amlogic,meson-g12a-ao-cec"

The driver uses "amlogic,meson-g12a-ao-cec-b", so there is a mismatch between
the bindings and the driver.

Please repost since it is important that the two correspond.

Thanks!

	Hans

>  
>    - reg : Physical base address of the IP registers and length of memory
>  	  mapped region.
>  
>    - interrupts : AO-CEC interrupt number to the CPU.
>    - clocks : from common clock binding: handle to AO-CEC clock.
> -  - clock-names : from common clock binding: must contain "core",
> -		  corresponding to entry in the clocks property.
> +  - clock-names : from common clock binding, must contain :
> +		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
> +		- "core"
> +		For G12A (AO_CEC_B module) :
> +		- "oscin"
> +		corresponding to entry in the clocks property.
>    - hdmi-phandle: phandle to the HDMI controller
>  
>  Example:
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
