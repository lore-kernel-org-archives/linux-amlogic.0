Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32889C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 18:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 059FF20679
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 18:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8m8yf6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 059FF20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gM7soxtq2gOJMSWQyqYYzqzMUKD9SI22fcLP4iG70o8=; b=P8m8yf6p+i5F0n
	294livC3eD+znuMQZ++sTWlFFwymo/WHmPJ08Qc866Prf+Ksa4lODRIe6UCPr8U6iT4/gweIwWxW8
	sSWbui2BzF/6oC0JIMZV3QvXSGw/l5+oHNYXdt1aCVxDxrFRfHgAcsBygI/Acx1GP93mw1HDla8A7
	gS7ckmbcxCuZTrywQRs2O6k0bcNMvY18ibOKp4lS+rfi9cdZfRjiYEOLFmODEbFPHRcnaYbG75v6i
	OeGS8oqieROlGvjYFsO3nxNmVa5DXb2/XIEbNcUxsbJmwSo9BC1wMl3d3m5geu+Q0xYYiFE4XqU85
	J4WCGfQZ+4mUt5aSr9lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0V8c-0005pS-JZ; Wed, 21 Aug 2019 18:15:14 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0V8O-0004UE-RJ; Wed, 21 Aug 2019 18:15:02 +0000
Received: by mail-oi1-f193.google.com with SMTP id 16so2323899oiq.6;
 Wed, 21 Aug 2019 11:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m5nuLuMsfkxZNIzHnYqhL4fj6+pQ1WScxNpfqvSjJaI=;
 b=PZoJcz3NSw2yZ1kc/xY9u4yw6X4wkR1XuJ30qpOLy+JXvPxIAI6BozihNrMvXYk26q
 XyDOTRvSjyRE12+CeZ715sno3Wiye9YciH7rx65SedsWYckjDAOg34R/UO9SjJcHpaW9
 S2F+UmItb/ROmhf7v9dHi7L3Qjf8rx1ZzV3CROJXwdcLc00H5+cVcS89iUrUQ/Wcmh4T
 BvGuQdMhJRmXh13gYzLC8IJ0KByCZ4mRWK63v3ZMBBxqjtuTW+7otd62IejXkeO/l3JN
 5TVVStkLuu7Pf355kMDB213gu63Of4oVViYNzq/RUQjNWE7McDNXLyhkbQ8Z3JZqv18M
 4jbw==
X-Gm-Message-State: APjAAAULKdGhS+YpaI3CrNICrY8lh21qgfpk7K3hWy7Wjbin3y1LBBOc
 yyGtK4Jh476Mkxr4ba6dFQ==
X-Google-Smtp-Source: APXvYqzwhKlJjpqtFevAij5ECQaAFh8CyzecW1FB3eA+DYuuqoWkt1MaKqYsC9EIdtIdbe4Chhf4HQ==
X-Received: by 2002:aca:b989:: with SMTP id j131mr951663oif.147.1566411299295; 
 Wed, 21 Aug 2019 11:14:59 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p11sm7874311oto.4.2019.08.21.11.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 11:14:58 -0700 (PDT)
Date: Wed, 21 Aug 2019 13:14:58 -0500
From: Rob Herring <robh@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
Message-ID: <20190821181458.GA2886@bogus>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731082339.20163-3-ccaione@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_111500_885892_AF9E7BF9 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 09:23:37AM +0100, Carlo Caione wrote:
> Add a new property to link the nvmem driver to the secure-monitor. The
> nvmem driver needs to access the secure-monitor to be able to access the
> fuses.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> index 2e0723ab3384..f7b3ed74db54 100644
> --- a/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: should be "amlogic,meson-gxbb-efuse"
>  - clocks: phandle to the efuse peripheral clock provided by the
>  	  clock controller.
> +- secure-monitor: phandle to the secure-monitor node
>  
>  = Data cells =
>  Are child nodes of eFuse, bindings of which as described in
> @@ -16,6 +17,7 @@ Example:
>  		clocks = <&clkc CLKID_EFUSE>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> +		secure-monitor = <&sm>;
>  
>  		sn: sn@14 {
>  			reg = <0x14 0x10>;
> @@ -30,6 +32,10 @@ Example:
>  		};
>  	};
>  
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +	};

I guess I acked this a while back, but I'm not sure I would today. It 
seems incomplete and a node with only a compatible string and no 
resources doesn't need to be in DT. But that's already done...

There's no need for 'secure-monitor' anyways. Just do 
'of_find_compatible_node(NULL, NULL, "amlogic,meson-gxbb-sm")' or search 
for the driver directly. It's not like there's more than one secure 
monitor...

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
