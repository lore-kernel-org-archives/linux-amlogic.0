Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4731C43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 15:13:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9591A20835
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 15:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K41LAi6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9591A20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mSdAs8QZ/DYk5XtpwSr837khD3i8CPuddM42Up5XNSk=; b=K41LAi6isLDv4v
	x3BUk9TW/+z/uFTjDACi/7dM7hf1JS4iB5KUyrMPOFfvaRUupGkpAOXhVOtdimQ4IzQZbyGCNT+h9
	ogmA76p0tF05ikrsfq46otgxCOq5+Xf1nyc2kFKRT8BntxGal6+DOw6lWZDDD2dwU16tj3zO1vjOB
	+XV1rzifjfYx90cw8qXDpCwXbAafKl5f4+5sAWJjQXgvvcq6/Br7WTOBUxCJdRS2LHGojJwjvNHZp
	YQgRYsjcS3RbrDyTm3esrtvqPwDPEO1aBy8LDGE8/ZTV5HKIjExVZRU3JfRWictxjBw5XNQ1V0OQo
	ZXkFDPmn6pXzl/NtH62g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLURD-0007qt-80; Tue, 30 Apr 2019 15:12:55 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLURA-0007pw-0Z
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 15:12:53 +0000
Received: by mail-oi1-f194.google.com with SMTP id l203so11547570oia.3
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Apr 2019 08:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7aahexJfH3+ZCWyzwJ4HVTibyUsm/U8CQ+avun/lb8w=;
 b=SFB15uj7SyaLg8fc5jmrZMzCasymGODPqgEdqrJkKLqHw25YAX4f0lgpmgepclwE2E
 8oTbP6UoNSIRdpYfgL8GKjR00L2vPw0Injqr2CONfA9yUx5Df6UILS2F/G+aq+ei7krM
 TgDn9kQ3nTbAFm2xcNtrItfiYpuEDFCIyt7Smd9KI3noAXjoP5dTdaJ3HMMERAYqphy9
 M6JOplDSkngwLgkjr5b+KEF9h0fGTX/ytN+hjL6vz++H6RpU3SlHAaGdqRedeuRmzO0Z
 BQaJldP/9V8LavEYiDIxwz5kRkK1xTrrMbz5upkcp02imFM4dpTQZNOlVWSgTygm1jPa
 VZ2g==
X-Gm-Message-State: APjAAAXRs1bADFbKsW4z8OMuoMcG9Cmrr10DUkU8ZTsl7DQ2yH9/4dOh
 3jKFng/hOmeAX2mdtfbcuw==
X-Google-Smtp-Source: APXvYqw+7CtQGpDl9egPhX/Ibog5Hs4VhoUaMkukQMspgHXvHnYdx7igDWd16RY8bjIjwyxtwGAzZQ==
X-Received: by 2002:aca:55c1:: with SMTP id j184mr3206627oib.119.1556637164785; 
 Tue, 30 Apr 2019 08:12:44 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o1sm16620919otj.11.2019.04.30.08.12.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 08:12:43 -0700 (PDT)
Date: Tue, 30 Apr 2019 10:12:43 -0500
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
Message-ID: <20190430151243.GA6879@bogus>
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190418124758.24022-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_081252_058149_8C29EAD5 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 02:47:55PM +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index cef2b5855d60..fc7018459aa2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
>  drive-open-drain	- drive with open drain
>  drive-open-source	- drive with open source
>  drive-strength		- sink or source at most X mA
> +drive-strength-uA	- sink or source at most X uA
>  input-enable		- enable input on pin (no effect on output, such as
>  			  enabling an input buffer)
>  input-disable		- disable input on pin (no effect on output, such as
> @@ -326,6 +327,8 @@ arguments are described below.
>  
>  - drive-strength takes as argument the target strength in mA.
>  
> +- drive-strength-uA takes as argument the target strength in uA.
> +

We have standard unit suffixes defined in bindings/property-units.txt. 
Use them please.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
