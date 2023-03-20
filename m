Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BEC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcuWk+SGDhIz1O1tgDnl3R3jWI/iAYXl+I5ZV9xwHBQ=; b=TrM8RJ9Uaz0xJO
	PY2QcNTijmjSh+5QXSnKx3q93JdnDO1iGVK3qLOTQ8W3N2GE/e2lMrV84RM7fQM7l7M2KAKmj6VpP
	/n7hQVyveQAcyK7uia3Rc9R2FGq1pKirlKOsglyCsb4AlDbDNBYA9FVVsAhnqyzI+Xrf7Mu6GuQB4
	Wzb2QWOFVeGBFSVzGFTv0m5Q8tjivLqblo/2ocJ6fLSU9XDN3tilVvlaKQufwHWE337M/jBrbmbB6
	jia9FfnkKgKkXvJPgVShxlBZ2iqcvC3iaYGnuH699KsOO1UgvRW89ZvP9ANOBWOl4lbXGJS8rPT9y
	7o2LbMPEjf7sFaOXJ0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peES2-008wtO-2f;
	Mon, 20 Mar 2023 12:17:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peES0-008wsp-0D;
	Mon, 20 Mar 2023 12:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8Gz4Uv6z3q+ekod9JwARBIf9Iowdc9Bs9NrdKjb7Bx4=; b=eb03rcgs3q3sfoeOfoGj3B9lJR
	Rpg96DF+hhPb9zMiKnFkEIzLi6/wenX5Cj+/uIBL0hgDCT9DxcrJHIQDsf/Nwf2sOCSEG5G7HfyGI
	d/6Wcis6E+/L6AnlOapN2TRLD4KtQaOYpyoTf8LV/SflN/IYYcBmh3p6kSvWOxrKiFO0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1peERl-007qDz-93; Mon, 20 Mar 2023 13:17:05 +0100
Date: Mon, 20 Mar 2023 13:17:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Healy <cphealy@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next 1/2] net: phy: smsc: export functions for use by
 meson-gxl PHY driver
Message-ID: <bee01edc-b49a-427a-9ea2-cc194488a0f8@lunn.ch>
References: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
 <192db694-5bda-513c-31c5-96ec3b2425d9@gmail.com>
 <CAFXsbZo-pdP+b3iWyQwPe4FA4Pdxr-HO5-4rHB-ZLJApZyJ3DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFXsbZo-pdP+b3iWyQwPe4FA4Pdxr-HO5-4rHB-ZLJApZyJ3DQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_051720_103151_A267F017 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

On Sun, Mar 19, 2023 at 05:39:51PM -0700, Chris Healy wrote:
> On a dev board with SMSC LAN8720, this change was tested and confirmed
> to still operate normally.
> 
> Signed-off-by: Chris Healy <healych@amazon.com>

Hi Chris

That should be Tested-By:

     Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
