Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AAA9C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 21:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z50ghv+UNQZLfBnhNHBolBKZDzyQyhd7Fn0IsFe7Zso=; b=ehM/EZ6Chbcgll
	8J0luq3hiWfgRd5+8WG65L60Tlldn6VVGaXF5OACUccQSZhKKRKgc2W2nN0mhQUHyak5r9ich9Rc1
	wZCqvWSBZzTrF2WlbDMVK9vPEjj+HfVrETI3P4eD/FNsmB3aas8iB8rIvdR/4S5uYx3SnN22UPkLX
	LCsI+BvH5Ms+mPw5+ozZq9hYmjCMCgUKUJaojGAQjtAhxHSh7q8uSUTrP0S8aOyJsIPQPkidvmuNu
	uPdgn6ocS6At7iYs4Cw+NQd+3nrNaWy8yk1AMBYc58S7xLr/cZx7JIDtFC7HuSarNm16/VFdetVPc
	yVm6/IdtUREQVyoKKn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhuY-00ABKn-I7; Tue, 07 Dec 2021 21:22:06 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhuK-00ABFp-MC; Tue, 07 Dec 2021 21:21:53 +0000
Received: by mail-oi1-f177.google.com with SMTP id be32so973123oib.11;
 Tue, 07 Dec 2021 13:21:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YHFDCx8cz0OBlLogJ/xFHdL4cUOdiVDHhIchnRBaE9Q=;
 b=DAV/AYuwRP/8XVw2I35sKHiJehgh4GgORb4O+u7GhTgShE7umBN9C5N6/B+QNAJOqb
 evzoZwtjTu0+t5b1mhghLdhAj1nC+Bg8qRYSspClYiogzcPhWXfGN+0/ycttxUO2VdMt
 un0JuIHsJuXpuz1BiMlid6ftfnk+KzP+i7Y6Fg932PsbQctscWwWr9gmnBnAS1XsjAqB
 +tqJ2Il1oxswBIUBj5iiD9+ax1cihY31uC1aBvX0jHgzw3/Yf0gnuKAzmzkpB5GtIlox
 +fZY5D/Ig5iFHw5V5zwnYx+de6vA1pDMq/5LGdIXtx7zLApWZPu1iM5967ZyrjCdLFWq
 cYxg==
X-Gm-Message-State: AOAM533fm41hF6roPv/V7e2ZHTnQeBw1GPgLsT5+KLTOj6lV/04cLB/b
 rh9OfS8IxsVcAki8IheWWA==
X-Google-Smtp-Source: ABdhPJzA4YcDlmXoSGBF16wJC5CXRfHtRRFgKj56o15+uWhHftO8cS/FG3AQ4zcnAI4JBgHR1AfAXA==
X-Received: by 2002:aca:1115:: with SMTP id 21mr7495706oir.137.1638912108077; 
 Tue, 07 Dec 2021 13:21:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w24sm133958ots.10.2021.12.07.13.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:21:47 -0800 (PST)
Received: (nullmailer pid 853594 invoked by uid 1000);
 Tue, 07 Dec 2021 21:21:46 -0000
Date: Tue, 7 Dec 2021 15:21:46 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Benoit Masson <yahoo@perenite.com>
Subject: Re: [RFC PATCH 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
Message-ID: <Ya/Qask7Fpb6mTxb@robh.at.kernel.org>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130060523.19161-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_132152_761335_21767580 
X-CRM114-Status: GOOD (  15.87  )
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

On Tue, Nov 30, 2021 at 06:05:16AM +0000, Christian Hewitt wrote:
> Add board bindings for the Amediatech X96-AIR STB which ships with
> model variants distiguished by Ethernet configuration: models using
> internal 10/100 PHY have a -100 suffix, while models using external
> Gigabit PHY have a -1000 suffix.

Isn't the phy described in DT? Why do you need to describe this 1 
difference at the top level?

> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 36081734f720..e9ab0ffe8be7 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -170,6 +170,8 @@ properties:
>        - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
>          items:
>            - enum:
> +              - amediatech,x96-air-100
> +              - amediatech,x96-air-1000
>                - bananapi,bpi-m5
>                - hardkernel,odroid-c4
>                - hardkernel,odroid-hc4
> -- 
> 2.17.1
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
