Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7826C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:43:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8902021841
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 14:43:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQbkPIAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8902021841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MyjkJpxSejNAOnpitbJ+9j6xMXXcXuvavwu45aje6LE=; b=nQbkPIAVgyh6YX
	VhfWsQ33uLg81E1vMA+tTIXOjmBwN8aK1WTSjEONMYEg4FD9lAHD7vT7cmMEt9NjUZNyOHqCi9c/S
	vWrx2Au7hKI5UC8PJCJMjthl4m7JmRtGDl4eue/n4KAnZWw2Uk/e8UzUqEFfzHmTKm+PdNJUsXExS
	Im3UUDyLiCjwnoeyNRPR1Cp6wYL3MIfaRgBcovqW0vX3DqXh9SrvzJvORoNEkqVFoyOyAIcnsrsHx
	3YNYYhbitvGbaARi77rp2xwoRbp+Wu1+G6rmcq7GmLgMGM6QDvwRb/wtc+r54TFA7rchimXZtYbFJ
	nFRsTO9wUKTviHq+YocQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghy23-0005Mq-OZ; Fri, 11 Jan 2019 14:43:35 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghy21-0005MB-C2
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 14:43:34 +0000
Received: by mail-oi1-f195.google.com with SMTP id w13so12331796oiw.9
 for <linux-amlogic@lists.infradead.org>; Fri, 11 Jan 2019 06:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VmNMexEJZpklasIyqDSBw44e61uRs3mXmalNyuff3vo=;
 b=Na8dHnmUEG8mKtb9CQ19lYf5TeHJG5KAqnCqiqjxbuLcNeSyUSi1oujLDRDKHZ84H7
 L9FfapNAf80qUOrMK6e8exZIIaO7rFI0PTAbpKw+H6Now3SbTZA7+xxsTjDmeVoxAnCG
 i1vqKoXAi71t1x802IEwjeOBetvb3ALurcYzzKkYhfxRlTxr/W+JmHuERvSEe1cLUWWx
 yx1CvHMtPRMMRyiRQiW/1a7eq07oQr1rVaRQij9K8+MZ2dw5ZeP1zkisD+1kh4vf/KTz
 BLTLq5ARAturm7rjDjAnR9/Y7OthwqlfEA5qngsyp0ay6B36FP77q7BG7f660Ae2hBMu
 QV5A==
X-Gm-Message-State: AJcUukfGMtv6SUntRj4ASv8zp71FrPodDah+a2RN68GKy0DydWZuj+hS
 0iZBd/znkJBvBIrB+XRrVpKB/IY=
X-Google-Smtp-Source: ALg8bN6tSMtWxAF1mjQgAFaZaC6mw+66Xfx5YOQNm99ZApmdtMc673DuJ48emHIV93cDl24Wychb4g==
X-Received: by 2002:aca:b642:: with SMTP id g63mr8797361oif.195.1547217811969; 
 Fri, 11 Jan 2019 06:43:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i12sm33665709otr.74.2019.01.11.06.43.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 06:43:31 -0800 (PST)
Date: Fri, 11 Jan 2019 08:43:30 -0600
From: Rob Herring <robh@kernel.org>
To: Loys Ollivier <lollivier@baylibre.com>
Subject: Re: [PATCH 2/4] dt-bindings: gnss: add gtop binding
Message-ID: <20190111144330.GA30111@bogus>
References: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
 <1545994235-8309-3-git-send-email-lollivier@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1545994235-8309-3-git-send-email-lollivier@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_064333_416447_A99334FC 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Dec 28, 2018 at 11:50:33AM +0100, Loys Ollivier wrote:
> Add binding for GlobalTop GNSS receivers.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
>  Documentation/devicetree/bindings/gnss/gtop.txt | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
> 
> diff --git a/Documentation/devicetree/bindings/gnss/gtop.txt b/Documentation/devicetree/bindings/gnss/gtop.txt
> new file mode 100644
> index 000000000000..24c86703aa46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gnss/gtop.txt
> @@ -0,0 +1,33 @@
> +GlobalTop GNSS Receiver DT binding
> +
> +The GlobalTop GNSS receivers uses UART interfaces.
> +
> +Please see Documentation/devicetree/bindings/gnss/gnss.txt for generic
> +properties.
> +
> +Required properties:
> +
> +- compatible	: Must be
> +
> +			"globaltop,pa6h"
> +
> +- vcc-supply	: Main voltage regulator
> +
> +Optional properties:
> +
> +- timepulse-gpios	: Time pulse GPIO
> +- v-bckp-supply	: Backup voltage regulator
> +
> +Example:
> +
> +&uart_A {
> +	status = "okay";

Don't show status in examples.

> +	pinctrl-0 = <&uart_a_pins>;
> +	pinctrl-names = "default";
> +
> +	gnss {
> +		compatible = "globaltop,pa6h";
> +		vcc-supply = <&vcc_3v3>;
> +		current-speed = <9600>;

Shouldn't the driver know what speed the device operates at?

If you do use this, then it needs to be documented as to when it is 
needed.

> +	};
> +};
> -- 
> 2.7.4
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
