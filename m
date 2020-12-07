Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78283C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:17:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6BA2388E
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 19:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6BA2388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=amqN1JbLSAV0rWpVd2cgYdjPB/nIgPBryyoEUgQl+Kc=; b=nEhu7bbydM2Gq2DA+aE59p7Dx
	chF87/shx6rUMAS9BVJmj//9rx0CtOGVR3vN3wUXMDGah9aYBge8sfEtydG7Wm/D28C6r7EFlYGHA
	fNYLfYKfEAPWbqXXyCy+IR0g+0nElGPBcByexY9baU/9lHGlzHvuN0V5hNpvgadzrgMn+FeqS+P7m
	OY/lg0wageLGlaMDm+46ez3lLBwVQOwOkFhkp5AdSyWWdCSm7UwzKM9qjpQ/AjGOU2kkQQ8ayJX15
	O3dgkLS+kV1XZOhXiYO85HbPDvFWRvGfsnC4Wq8erh5Gj58zDczN/x68+1J524ktF820ftYsl7A2S
	WzpZEn/Ow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmM0f-00086x-P8; Mon, 07 Dec 2020 19:17:21 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmM0d-00085q-6m; Mon, 07 Dec 2020 19:17:19 +0000
Received: by mail-ot1-f68.google.com with SMTP id f16so13530501otl.11;
 Mon, 07 Dec 2020 11:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fCRZf27KCzHad5WZLnZkBV55sQARhbTu3t54+W99mFA=;
 b=j/NRFLRomfI2JRXS4eFbfLR1cizjNVZrmVunNx6ZBsq89TuaTCFJaPRYNhKxLNG2XV
 nOPhctLnaweGY/mREzUDIv6uCE5FXj898ubgPFQzK2KmXdJlNQURxsVDx/vL7NJm2nzp
 b71fguxwwlb2JjuqNXdvFOGxz8Xo39jDBip5mvXK4HUEayhtRqBJPYM2WwvtR6kLqZKu
 4Cs0In+q4Qn64cCDGGywxmlKfol0GiHU+0VwpIopMXipQiFAYx/m+AXr5KINpJW8aOBp
 MuvVF6z7l81nmq/G+y09fzK5p5cVoXY3cZ1WK61TcjYytxhbNaqet4oNBap23M9pK11e
 4THA==
X-Gm-Message-State: AOAM533uQ0nU5fOIYrIEHtMDSGYHTkaoJUoYsSekgiZaV6qJ99YPHGTE
 6nzQBkefvy91oO3afvsYEA==
X-Google-Smtp-Source: ABdhPJxOcM2rTcPsyK/KYZTCJtx3mitXqFETRnqOhCLb+UY5aC/5c20oRk/sXbC1WHrbkoN5evIjFg==
X-Received: by 2002:a9d:10d:: with SMTP id 13mr14224641otu.8.1607368638252;
 Mon, 07 Dec 2020 11:17:18 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k10sm3019614otb.81.2020.12.07.11.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 11:17:17 -0800 (PST)
Received: (nullmailer pid 650679 invoked by uid 1000);
 Mon, 07 Dec 2020 19:17:16 -0000
Date: Mon, 7 Dec 2020 13:17:16 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: net: dwmac-meson: use
 picoseconds for the RGMII RX delay
Message-ID: <20201207191716.GA647149@robh.at.kernel.org>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
 <20201115185210.573739-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201115185210.573739-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_141719_262666_D5E3FD21 
X-CRM114-Status: GOOD (  24.24  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch, khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Nov 15, 2020 at 07:52:06PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> delay register which allows picoseconds precision. Deprecate the old
> "amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
> property.
> 
> For older SoCs the only known supported values were 0ns and 2ns. The new
> SoCs have 200ps precision and support RGMII RX delays between 0ps and
> 3000ps.
> 
> While here, also update the description of the RX delay to indicate
> that:
> - with "rgmii" or "rgmii-id" the RX delay should be specified
> - with "rgmii-id" or "rgmii-rxid" the RX delay is added by the PHY so
>   any configuration on the MAC side is ignored
> - with "rmii" the RX delay is not applicable and any configuration is
>   ignored
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 61 +++++++++++++++++--
>  1 file changed, 56 insertions(+), 5 deletions(-)

Don't we have common properties for this now?

> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 6b057b117aa0..62a1e92a645c 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -74,17 +74,68 @@ allOf:
>              Any configuration is ignored when the phy-mode is set to "rmii".
>  
>          amlogic,rx-delay-ns:
> +          deprecated: true
>            enum:
>              - 0
>              - 2
>            default: 0
> +          description:
> +            The internal RGMII RX clock delay in nanoseconds. Deprecated, use
> +            amlogic,rgmii-rx-delay-ps instead.
> +
> +        amlogic,rgmii-rx-delay-ps:
> +          default: 0
>            description:
>              The internal RGMII RX clock delay (provided by this IP block) in
> -            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
> -            should be explicitly configured. When the phy-mode is set to
> -            either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
> -            provided by the PHY. Any configuration is ignored when the
> -            phy-mode is set to "rmii".
> +            picoseconds. When phy-mode is set to "rgmii" or "rgmii-id" then
> +            the RX delay should be explicitly configured. When the phy-mode
> +            is set to either "rgmii-id" or "rgmii-rxid" the RX clock delay
> +            is already provided by the PHY so any configuration here is
> +            ignored. Also any configuration is ignored when the phy-mode is
> +            set to "rmii".
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +    then:
> +      properties:
> +        amlogic,rgmii-rx-delay-ps:
> +          enum:
> +            - 0
> +            - 2000
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-g12a-dwmac
> +    then:
> +      properties:
> +        amlogic,rgmii-rx-delay-ps:
> +          enum:
> +            - 0
> +            - 200
> +            - 400
> +            - 600
> +            - 800
> +            - 1000
> +            - 1200
> +            - 1400
> +            - 1600
> +            - 1800
> +            - 2000
> +            - 2200
> +            - 2400
> +            - 2600
> +            - 2800
> +            - 3000
>  
>  properties:
>    compatible:
> -- 
> 2.29.2
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
