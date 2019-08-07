Return-Path: <SRS0=W+6h=WD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187F3C433FF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 17:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7C2C22305
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2019 17:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIQJsXqq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJUT3jDP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7C2C22305
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSiTWHFws6XwhK7FNrletPbN+uWn+WRX0hMoJQtqfGA=; b=PIQJsXqqzzY66c
	KfJ/JRo+I5MYS0BGInV7o9cULSsy3LZ5WPSW2jQYrBcLb+v26ANtEaM9JNy8XqTyGeG0qzplRIxSg
	VLTwCHFTjfhC7CAKkQ9pXGTOTjs4OHtNiieFN4h7gzM9Dqm8YVzW5heKtNEWbC67hRQWc56l3443e
	c7uNRxoOIzcHVuMXhM4rBXkjbOtC0invFMujeyi5cltc/t6pqTDnP5GIjZNLFI2mov8DG+GKSx5LN
	riB8uk4kOiUNes3cMysienR44X9nw9Wmfyw0fQ0h23ssJeODK5aAlGHbfZDQYRfiLYB/u+cdIA6ZF
	2ItzQqTMwZp/POx5t3Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvQE1-0001SA-Is; Wed, 07 Aug 2019 17:59:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvQDx-0001R7-EW; Wed, 07 Aug 2019 17:59:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id b7so41984256pls.6;
 Wed, 07 Aug 2019 10:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ng6xzoejdEmB6bEu6I8V9VsO/8EgPH3m7FsrYidIs9U=;
 b=PJUT3jDPkZBHoMReYOZ90wqru2WmbuqSeaiKUYBfJSzLLddji9y1+lo7MG3H/v3MHI
 X64701CtrJr9jGEFNXdJWD6zxWrrM6m77kSRt9xQhxI3AdzSCTpXE/ImRE8vUrmfDaTt
 vJmtJaMljNtGdVXtpratOJdIcUIhYbNJuziKN0R7Gp94W4Bk9Qqs96oPoR4/zgBP5/G3
 W4moh+AeYd1yecIbW5ZYxLsgYcdxqcvvELrdP6I/e/+LE6kw4+8j3SPcaOyl/b4mzYKD
 oNcm58YoLsd6gx+vD1Q64Pot5N5mYpeT3wTySLEGmSNvxaShEtaKCd3aTiUaNGKipee/
 mKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ng6xzoejdEmB6bEu6I8V9VsO/8EgPH3m7FsrYidIs9U=;
 b=BaXg/H51TASvvd2/tQ9K6k++KIKDzW9FBFbbD/i7AY0HqTfVpING0bNR5rWLJEM6ZG
 oIGsqg2jTbK6+l3L1/T3edS8rUpm1ViDiRTTLJQCJokUhLvXUOzITkbM61PVkSYWUU2t
 TmPqMNR/9nM4OHOGuZ59wnop2ntBriCDr4Zao6lL7iBGGQ2OO/TDoCre9wv7TJw9SpRP
 gubAbAp5kw2/yENKnZwpS9hmxGfwc7xT9wInj810aQrenuN1quvnc8b5XphB8Slk24cF
 okCAubNU9di+91Ey57c48T6AJjMjqqLkT6TSAeKOu8WyV1H9hZ9AAv//7fKZABUOi0af
 VFvw==
X-Gm-Message-State: APjAAAV0yaXJUbXuwwRJvH5nkWCuZjudpLFi8Tpe9G1b/xCCJ85oBBrx
 88HduIR2B9ztq+2bUPYaEZs=
X-Google-Smtp-Source: APXvYqw+aPcdft4eNHEsQckq4s+4Z5jgKpCx7EjtIxho9e8VbTKoeh7Lgrtix37xUJEpn6vv3crhWA==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr8765206pgv.358.1565200784513; 
 Wed, 07 Aug 2019 10:59:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id w18sm120988761pfj.37.2019.08.07.10.59.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:59:43 -0700 (PDT)
Date: Wed, 7 Aug 2019 10:59:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFCv2 9/9] dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml
Message-ID: <20190807175942.GA26331@roeck-us.net>
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-10-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805120320.32282-10-narmstrong@baylibre.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_105945_487985_C206640A 
X-CRM114-Status: GOOD (  17.25  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2019 at 02:03:20PM +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic GXBB Watchdog timer over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 +++++++++++++++++++
>  .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 --------
>  2 files changed, 37 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> new file mode 100644
> index 000000000000..d7352f709b37
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/watchdog/amlogic,meson-gxbb-wdt.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Meson GXBB SoCs Watchdog timer
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gxbb-wdt
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      A phandle to the clock of this PHY
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    watchdog@98d0 {
> +          compatible = "amlogic,meson-gxbb-wdt";
> +          reg = <0x98d0 0x10>;
> +          clocks = <&xtal>;
> +    };
> diff --git a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt b/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> deleted file mode 100644
> index c7fe36fa739c..000000000000
> --- a/Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Meson GXBB SoCs Watchdog timer
> -
> -Required properties:
> -
> -- compatible : should be "amlogic,meson-gxbb-wdt"
> -- reg : Specifies base physical address and size of the registers.
> -- clocks : Should be a phandle to the Watchdog clock source, for GXBB the xtal
> -	   is the default clock source.
> -
> -Example:
> -
> -wdt: watchdog@98d0 {
> -	compatible = "amlogic,meson-gxbb-wdt";
> -	reg = <0 0x98d0 0x0 0x10>;
> -	clocks = <&xtal>;
> -};

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
