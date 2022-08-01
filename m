Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AC0C19F2A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 13:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOs0HlcBcQIUaqmo95bZuXnqfR3X9G/kfxRqJbRge60=; b=X2CfqeX1ejmhRC
	VeD3tLyuaCZpl9wLmZzsarcfyg+c1qd+y9TkKqYUEn3eMRM/cCKWjqm5qVe0StT6Brn87+JKcVyQZ
	13aJx4NLm3WTy/55J8lVvR13XDH6JiDe1Zxw4A3QvRvuRlWxbpM6TJumRK58UR8h9m28eXK7pHHuV
	RgGr0hHtWLKFzfWTP2FMHzg1BkkXD9LU689e95cWkDrtLXr10RIgQVcm0/S2Bp8gDuKIb9cj39cH7
	+f+zS7ia/3QpEUBOCiDNK8GtwWFe8f7/Ryat9cXpeQUC+dX6FYVc31a1dSZ5nIYtenBnjvzqZ2xdQ
	UPvLG15p2Q9LrPcNi0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIVKE-006ccZ-DV; Mon, 01 Aug 2022 13:19:14 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIVI9-006b6g-Qb; Mon, 01 Aug 2022 13:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iET4Gd+dzwI9Hl1ttIYQzHG3ExTzRi7Ugvbts3F/At0=; b=jBr9OH6XD43mkeRgCj0RGeawiX
	0RoayRMGyaq5SeKM6AbGpoEWYXJ5G8DNvk57EoYz8z1ois3KVrnJrCVwZYN7HRcpTrMb7LrC2E6Pf
	brmmZDqB2r8pf8jHH9VWKQQ/zNeXOin5+5t9FLFzPDPBod5Oc41Wcq6CucZz/+GL09yk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oIVHv-00C9m1-DF; Mon, 01 Aug 2022 15:16:51 +0200
Date: Mon, 1 Aug 2022 15:16:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Da Xue <da@lessconfused.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: Meson GXL and Rockchip PHY based on same IP?
Message-ID: <YufSQ7o1szPAhAfr@lunn.ch>
References: <ca9560eb-af9c-3cfa-c35e-388e7e71aab7@gmail.com>
 <CAFBinCCMinq1U2Pqn2LPjC9c+HqfHjvW81b1ENMxdoGmB6byEw@mail.gmail.com>
 <88d6ef05-f77a-57a2-f34a-e3998a8d70d4@gmail.com>
 <CACdvmAgSvsYj6zorYDrBaEUvZzPi_c0XpVzx3fz8nHp8+TXMuQ@mail.gmail.com>
 <1jzggowdo5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jzggowdo5.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_061705_909983_9DBCE3A7 
X-CRM114-Status: UNSURE (   8.88  )
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

> > Per Jerome, both are OmniPHY IP.
> >
> 
> I believe it to be the case, yes.
> 
> However, the version of the IP could be different.
> The integration the SoC vendor did is very likely to be different too.

It has been pointed out that they have different quirks. It would be
good to check if any of the quirks in one should be applied to the
other.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
