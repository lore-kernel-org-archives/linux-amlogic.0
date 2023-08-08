Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985C2C001DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1b532OE5fHY2i8NrF2coCRsHl2XiZGRV2DKfuZ1yk+Y=; b=aGNtlXZUzzLEY2
	hghP3d/bjSTJX1goLggVPPyRemQBojxKKUFkAh7p45Cin2CXvtfnDNJ/yFpeiiJ2HpGk30d/Q4By5
	82N7L6/NwoxSu0Xc/2vIXkJgFoWUc+CnpGCKWhX8jWnRB7upDzQioo2LW7IJLKT7mBEZLq2pFRUGG
	KC6IZfsK69IwdvOwqKIrTVcfK1d0mV8fI7IsMXKRyeUp3HnkMJorzP1I0zgdHZEQTIcOmxzHV0buP
	izRDYgwxbwj0muukhkBQwovF1l6rW5VtfpEK0l0TfqVx7gvJT788lfstRm0Mw18RSxMsK7Dumsrju
	UAXS3Jk4qjpsbzgtc3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTUhk-003XSd-1c;
	Tue, 08 Aug 2023 21:57:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTUhh-003XRN-0d;
	Tue, 08 Aug 2023 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Iw353CUGOaR9ntV/GhP6nXoYL9ZHZ1HVuitTAIcTyoA=; b=wQ6jQi1x24Y1QysBckKRqSeilr
	hExPc9tz1kVg313OrEORcp5T7arVJJ/0mnUea8bN4R5/meR8OQ6NyBWpXdLsxqP231KRTfbBAllB6
	fUT2mvCOXZRSLRY1LPidKNd2+orscVZV2i94XeNENT6L6eQMSdS9AEZO7CTGLbDa41hU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qTUhQ-003WUv-RA; Tue, 08 Aug 2023 23:57:08 +0200
Date: Tue, 8 Aug 2023 23:57:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Luke Lu <luke.lu@libre.computer>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Da Xue <da@libre.computer>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] net: phy: meson-gxl: implement meson_gxl_phy_resume()
Message-ID: <ef7000ae-721c-49ac-b0b3-b5d94fd82a4d@lunn.ch>
References: <20230808050016.1911447-1-da@libre.computer>
 <b8931b6c-5b35-8477-d50f-b7a43b13615f@gmail.com>
 <CAAzmgs75L6Y3PU1SF8Uvh1Z2cqt86HmaRKFn088yzRK73mfnLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAzmgs75L6Y3PU1SF8Uvh1Z2cqt86HmaRKFn088yzRK73mfnLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_145725_232387_C4F1D525 
X-CRM114-Status: UNSURE (   8.57  )
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

> > And a formal remark: Your patch misses the net / net-next annotation.
> >
> Not sure if we understand this correctly, do you mean the one line
> summary of this patch?
> or the content of the commit message that needs to improve to reflect this is an
> ethernet/net related fix?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#netdev-faq

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
