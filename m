Return-Path: <SRS0=MLNV=7G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDF4C433E0
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2020 21:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2805A20776
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2020 21:29:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAb3LW8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2805A20776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+sEV4qNV+NtCC49JAcvrQI+McdPog6D1PuPwic1sqE=; b=MAb3LW8WYOEYH0
	E6qHjbxqelE1lksXErApI/ZcTrAPidOy9PmREQz40MIjbSgXkGhQ4hZD5Zol5NevZMHUlL0EK9ai1
	7zgMk9GU5OsJ+IG7/4eGu7JYDuF5rxAb/pi5ocf1X2TnT3vNFpcSFC4h/WF98m2suHibTYiqTiJp6
	YgxwaWNKEExm4rqDg01j/+iEKkcL36yYEq7gLEytINlF7KG1u2VJSptrryPHVkEzQVAuCApYAR3lf
	EJ443TQXNqZiLZK02CZ3kbXT31yESp178ZuJ5ueFMT2UZWGH3SjvCWXpkT76roFGKCwbqP1wa6Jv0
	vZi7oXEhM5u0mB0moQxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcyB2-00088X-Vm; Sun, 24 May 2020 21:29:00 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcyB0-00085T-5I; Sun, 24 May 2020 21:28:59 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B5BA51C02AB; Sun, 24 May 2020 23:28:44 +0200 (CEST)
Date: Sun, 24 May 2020 23:28:43 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: meson-dwmac: Add the
 amlogic,rx-delay-ns property
Message-ID: <20200524212843.GF1192@bug>
References: <20200512211103.530674-1-martin.blumenstingl@googlemail.com>
 <20200512211103.530674-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512211103.530674-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_142858_356329_FB44C448 
X-CRM114-Status: GOOD (  12.76  )
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 2020-05-12 23:10:56, Martin Blumenstingl wrote:
> The PRG_ETHERNET registers on Meson8b and newer SoCs can add an RX
> delay. Add a property with the known supported values so it can be
> configured according to the board layout.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml           | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index ae91aa9d8616..66074314e57a 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -67,6 +67,19 @@ allOf:
>              PHY and MAC are adding a delay).
>              Any configuration is ignored when the phy-mode is set to "rmii".
>  
> +        amlogic,rx-delay-ns:
> +          enum:

Is it likely other MACs will need rx-delay property, too? Should we get rid of the amlogic,
prefix?
										Pavel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
