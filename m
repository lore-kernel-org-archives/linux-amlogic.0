Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3A3C2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:04:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B250320575
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:04:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R0JnB1TZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B250320575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vh7oMebuyX8fGv9/OH6OlJOMBFPnc9WlmvnD0/2Bgpw=; b=R0JnB1TZl8IimS
	zUMypBfZ6Flj0Jt5Sb9ejlc20hp9vQmMAdaQ0K9dhLhRQMB1PhFXALN6BkX3f6Q5X5OxaKPIvSEJ1
	zSG11uXe6wxiCIUSK9Y/XuZsFEEacxUkYumgPVLxJjPb+JiLMCbKv+yA7CMYwWgqONHkd8qDk+gna
	Uv3sK5BRti0JwSaO+n9cMLHm9nEK0BPqclY9lLoS7f4UDusMhAsg9n5r+PP8FSttDEPXFfe6VmAPS
	2jcn/e3iS7B16IYgYSaUth63g4Z2a5ClZHfkaPHrW6o05BH3YdvCOvD5/PyaWX8eu5zrUgwt03YIW
	KS31+AptdyDcBwsmTUhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYd0Q-00078K-DE; Tue, 12 May 2020 22:04:06 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYd04-0006qo-J0; Tue, 12 May 2020 22:03:45 +0000
Received: by mail-oo1-f67.google.com with SMTP id p67so3048991ooa.11;
 Tue, 12 May 2020 15:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jsnWB/RZuG/6JISv3zODzhF3cX24dCFlPTbEBhn7oxU=;
 b=ZImuKfYeki61lLbG6hyab4nIn4Xd92XGpVIGyYqql/WhPXwYyWqwnJA1peyBlZs+kd
 PuQa58xuVshuhVsfUsZrA8DI3kuxr8Xcv2PJrNowVCPUWBfQUwYcYSCYy8TrUXs1s9gg
 cpW4dUkEYfNGwq8Ohy2kglHc7WGqAsn6n06t5hfoUnrNmuzb2XDjD5/x0fYMkwrL5jS7
 m8Nf+lMGJe67ci06XY61u3YXC0J+fIadNrQ0bcyPfQ9/V92XFhM62HWfcLQuZXzpYJBR
 oFrUHZmqpWeSZB1HfDSxwkJ5cPgKFeZU31VSITbDx0GZrgRNF83uWjFL1QkJ93bBbftB
 6PXg==
X-Gm-Message-State: AGi0PubS1dL3JlMH3JiwSEdiRyAoJeLV31ysLAXAKicesRnKahw+sZ5K
 z2pVbt7ArMRvxD6RpejLuw==
X-Google-Smtp-Source: APiQypLQGiX0rauKDDSSe0EY7yJ93FyTpXKE0zOptqWqXNeKHsfI9Bzl2DiMfh+5vOQd4k68p6Km5Q==
X-Received: by 2002:a4a:6441:: with SMTP id d1mr19963201oof.10.1589321023626; 
 Tue, 12 May 2020 15:03:43 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm5659962oia.31.2020.05.12.15.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:03:43 -0700 (PDT)
Received: (nullmailer pid 14161 invoked by uid 1000);
 Tue, 12 May 2020 22:03:42 -0000
Date: Tue, 12 May 2020 17:03:42 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/6] dt-bindings: phy: meson8b-usb2: Add compatible
 string for Meson8m2
Message-ID: <20200512220341.GA14126@bogus>
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
 <20200502114752.1048500-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502114752.1048500-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_150344_624253_8202F9DE 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat,  2 May 2020 13:47:48 +0200, Martin Blumenstingl wrote:
> The USB2 PHY on Meson8m2 is identical to the one on Meson8b but
> different to the one on Meson8. The only known difference is that Meson8
> does not set the ACA_ENABLE bit while Meson8b and Meson8m2 do.
> Add an explicit compatible string for Meson8m2 so those differences can
> be taken care of.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
