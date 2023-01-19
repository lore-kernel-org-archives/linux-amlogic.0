Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490FFC00A5A
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Jan 2023 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T43aBg8Z/kb6B8TQ0KFV0GlbMMVAfzSAianlX0CsFxk=; b=cVa/nfesGzRmxF
	sQMaX6e1BTVNdCpVv7nmWtEGPe0pUO6CD1mdp2RPKJUrnZXJhYubmlsC0fA6jpvif5lCDliXjnJfj
	XqwlreOlbY3kbKbil3AWJqYMjW2TcFtzFUdqzmdF7Plwpsb/3NFR64vN0O2ODAw8A5pO0Kig1L3Cs
	yhBTHlFHe9d6DAEQVtdZztZYBEghTMItQc2WK/DNiySaaMzuj/9JleOHCm3yCWugzdJs52/M7D5vL
	rNOLu9QuqN5mYoeZHa9iaNa0NiyZDqVIhrBBOq2tNsWMsUlBDE0xrcp0FrICiXqP+na7RvoqY3fGx
	m3GyALDpytIquHtZCAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYbz-006F1k-Q2; Thu, 19 Jan 2023 17:22:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIYbu-006F05-2I
	for linux-amlogic@lists.infradead.org; Thu, 19 Jan 2023 17:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cqG1MRAXLPrHaT+eAcJye0uuBLqSJFewuZYbSXYEZvo=; b=Tz5pVxX1z7Y3PKklioNj4Bdv+a
	lKq0NRHt9xkawqp2p35oH+WxcKLOX4kbAKNFCeCazSgl8RH4codmTFH5O50dWAtK6ml20dbiw7FDY
	wNqYUBRBj2I0LBJt2Hb8WNMo4SRjg3C4K3y5QnAhPWuHlOfEWNX169BgrAghaR6dd8Ic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pIYbs-002c3x-Pa; Thu, 19 Jan 2023 18:21:56 +0100
Date: Thu, 19 Jan 2023 18:21:56 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: mdio: add amlogic gxl mdio mux support
Message-ID: <Y8l8NJdulOTX4GpI@lunn.ch>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <Y8dimCI7ybeL09j0@lunn.ch>
 <1jr0vqyet1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jr0vqyet1.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_092159_028677_5ED3B626 
X-CRM114-Status: GOOD (  12.86  )
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

> I usually avoid doing this since the DT part is intended for another
> maintainer. The idea is make life easy for them and let them pick the
> entire series (or not). I don't mind sending the DT update along if it
> is the perferred way with netdev.
> 
> FYI, the DT update would look like this :
> https://gitlab.com/jbrunet/linux/-/commit/1d38ccf1b9f264111b1c56f18cfb4804227d3894.patch
> 
> >
> >> This has been tested on the aml-s905x-cc (LePotato) for the internal path
> >> and the aml-s912-pc (Tartiflette) for the external path.
> >
> > So these exist in mainline, which is enough for me.
> 
> Yes the boards exists in mainline, there are still using the mdio-mux-mmioreg driver
> ATM

The point of posting the actual users is sometimes we get vendor crap
with no actual in tree users. We want to avoid that. It can be enough
to mention in the cover letter than a future patchset will change the
DT files X, Y and Z, making it clear there are in tree users.

   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
