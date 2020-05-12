Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F979C54E8D
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 14:51:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EADE206D6
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 14:51:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BW6t4o3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EADE206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhE75w6+tJQiLs2+GCZCNWzKOHG5UK1khxgR1xlZN7k=; b=BW6t4o3hbH54k3
	Ybvh35L514fwSMudQkthVJiRk+OFovS2e9nUxu29L9hg9GaaySiKnfpxQZbYh9+NvCAcOZPY1SyHI
	geVLal64x4C9+Bp68tzPrYqLSoTwK6sQ7MBF4JHJU35ctk7nR6NrzWMmw1XZbO2XUFpa1slXIqmhF
	3vPsrQ6a8lnpqbRStIDdEDyvpyubcftC+KFmyplRvpr5P4DoT42XQjiRX6j2NsyVkP28zBPeyE/6C
	FzA9rFBCEXDv38OVsVHiy6QztdgFq4J4jDPXU0+1+1NUV//ORfK1QA6esr5jA5zNwRf3bpFNcT8NI
	9rVuvUVT+u7a2yQa4FvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYWFx-0001Ir-ON; Tue, 12 May 2020 14:51:41 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYWFv-0001IC-7j; Tue, 12 May 2020 14:51:40 +0000
Received: by mail-ot1-f67.google.com with SMTP id 72so10726788otu.1;
 Tue, 12 May 2020 07:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+FFTVIdRJUiPRt6W0nlVnf55I2F6cDb0ZOrP06HUV2I=;
 b=ocFgPUTf3Y7AvynEvdUlB0qvTm0NgDO+l2bsEEiKPvH8uIn/kSxWfWfwSUPb/LRYXY
 0FM2NysipkNDvdMxmRFCAPWL/a/USrW4MR9p+wuwriI/ORrEAxq0Yqs6Oa2LDmOg0RTQ
 Q4govN7pnCTjHqiveCOuLhAY2Az41zu/eiZtMXNfYd+lUGPr2v8GiHno8GsuJCH70hDM
 S812wvvr/zO2LZbnCR8ZGc28xYrTAjFDN3FHo/wqkAwPuBzF452RObnTTWFd5wOxtTZp
 +q94PUaM2ZMuZGwiR7KvzCFJdFJLiE0uTx/LZR/+ngqNexgxIAdGOH+ASVV5kKhjI6gp
 pQ/w==
X-Gm-Message-State: AGi0PuZmM2iiUmM2WNuT4N3PsWP1/JqztFWRQVbo2c+CQZtP0duY/R5x
 mrsXr2yjowEQ6tEUck41tw==
X-Google-Smtp-Source: APiQypIMtahsMEYjmV8Fru5Ib4Vy3CKGcEFvaBi79VV4D8sXUnBPZwpbYCnBV8pQAm5P8MdHfaaPBA==
X-Received: by 2002:a9d:2605:: with SMTP id a5mr16527573otb.259.1589295097601; 
 Tue, 12 May 2020 07:51:37 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d64sm296494oig.53.2020.05.12.07.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 07:51:36 -0700 (PDT)
Received: (nullmailer pid 21890 invoked by uid 1000);
 Tue, 12 May 2020 14:51:35 -0000
Date: Tue, 12 May 2020 09:51:35 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 01/11] dt-bindings: net: meson-dwmac: Add the
 amlogic,rx-delay-ns property
Message-ID: <20200512145135.GA16551@bogus>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429201644.1144546-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_075139_275905_D0825D8F 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 29, 2020 at 10:16:34PM +0200, Martin Blumenstingl wrote:
> The PRG_ETHERNET registers on Meson8b and newer SoCs can add an RX
> delay. Add a property with the known supported values so it can be
> configured according to the board layout.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index ae91aa9d8616..8d851f59d9f2 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -67,6 +67,19 @@ allOf:
>              PHY and MAC are adding a delay).
>              Any configuration is ignored when the phy-mode is set to "rmii".
>  
> +        amlogic,rx-delay-ns:
> +          $ref: /schemas/types.yaml#definitions/uint32

Don't need to define the type when in standard units.

> +          enum:
> +            - 0
> +            - 2
> +          description:
> +            The internal RGMII RX clock delay (provided by this IP block) in
> +            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
> +            should be explicitly configured. When not configured a fallback of
> +            0ns is used. When the phy-mode is set to either "rgmii-id" or

'default: 0' expresses this.

> +            "rgmii-rxid" the RX clock delay is already provided by the PHY.
> +            Any configuration is ignored when the phy-mode is set to "rmii".
> +
>  properties:
>    compatible:
>      additionalItems: true
> -- 
> 2.26.2
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
