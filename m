Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CA8E71087
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Sep 2023 15:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJZUXl4D8TvnK30oFbhdUpOwSpkWHzUdfF0wmkCv1bs=; b=CjdKUpYNpD6mMW
	78qxgb0Uws9UaAmDmWabEaAAH11iPBdZ4mCeQSKS1zZR8GQzplcbMIY+97Jf0MdcSwTCmGgNgbyBJ
	f/iP1CUagHFwZs2iD+P7GeJxIFyf/PPzaezB/MYET7mzE26IATbKHzK0376YpwYt6eubtmWL46elM
	ij0Je7OBCzC2Mshoz35U9L2jdpgmpNTr4MNfqte02ibtZS/+cl8nifY2WGLwETePq5rAeF3uOaXzK
	HbKCGjC7hBAXt+AsCd82NzD8TT1XvNdP7uqfLWItPvS/65d4NOo9W8DOCOOwgSiXcBI6/zHHsCqMH
	/si8qjCLGvQzxwmIYC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLEi-006M98-20;
	Thu, 21 Sep 2023 15:05:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLEh-006M8E-1Z;
	Thu, 21 Sep 2023 15:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T/2pRs03YU00HvuleCqWvycXphp5/rEFDOdWAqaRo1Q=; b=V6at4S1pvlnzX3E5wi6YFthAFR
	t08n5MvP6FwAqSWrz34QKD1GL0kH2L5Rixs30fmehlDpkdMnoClLeb+es/FMETqHlgpZ94Kw5GOvH
	B+mmTZ0vcMRetxFhZSsoro5rXHsk2SAK65/wcHIhjgKyIdJXL1tI0OkLdCAEPUL9lnvlzuU2YWZm0
	8Y72JgNpch5r/ebr9EqNCnS9QOYH8Fpy2ZZmoRx6VGQ9j6h5g1yqk0dfvfNFSGFKAwtl7CLuAYfNR
	JT0CpR933ZWaHd+qJM4uwvIfCA5JO0X8K2rhzxETLlzV8fcOHpmlENX+sUYw1GUYGLNOnr3vkR0/m
	ton4ddyw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLEa-00FSQT-3A;
	Thu, 21 Sep 2023 15:04:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DD436182E;
	Thu, 21 Sep 2023 15:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3B8C4E75C;
	Thu, 21 Sep 2023 15:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695308682;
	bh=CRXh/3WmFeRF4emfkW9qLsHyIVF5cqNuXHQEj19Hprc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRFc4QkUGkD5iaifmciPjC/qPhzL5Fda2wpSBbplnNUw+9muYkK/UCS5rY3W09X3k
	 6Mhex3e99h178rgcD/c8lIHpx6f8UDvMOqwJ7s4qquxa0BkosppA196DBsKji6pW8U
	 ICHaf2YEiFfGDAQAPXuB/gUxu58lcIdUSbDfg8mlgOtXwewzEzysNjts856dkIWjuX
	 lKKzN4zav/7lETaDYOBLRM7x1RKlEWKeO4boz4lUe2uA8QhrR8wgTqwZa1JP8mqyul
	 B++L9eT+pTewygRfIxHuGqxwdYpE5WXGKlC4iWnAHVNA3lxMmoXy+K+hJmlVgo6Sw9
	 tRmj8qYiOKfBw==
Date: Thu, 21 Sep 2023 16:04:32 +0100
From: Simon Horman <horms@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH net-next 00/19] net: mdio: Convert to platform remove
 callback returning void
Message-ID: <20230921150432.GP224399@kernel.org>
References: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918195102.1302746-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_160454_665739_57C85468 
X-CRM114-Status: GOOD (  17.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMDk6NTA6NDNQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gdGhpcyBzZXJpZXMgY29udmVydCBhbGwgcGxhdGZvcm0g
ZHJpdmVycyBiZWxvdyBkcml2ZXJzL25ldC9tZGlvIHRvCj4gdXNlIHJlbW92ZV9uZXcuIFRoZSBt
b3RpdmF0aW9uIGlzIHRvIGdldCByaWQgb2YgYW4gaW50ZWdlciByZXR1cm4gY29kZQo+IHRoYXQg
aXMgKG1vc3RseSkgaWdub3JlZCBieSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgYW5kIGVycm9y
IHByb25lIG9uCj4gdGhlIGRyaXZlciBzaWRlLgo+IAo+IFNlZSBjb21taXQgNWM1YTc2ODBlNjdi
ICgicGxhdGZvcm06IFByb3ZpZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhhdAo+IHJldHVybnMgbm8g
dmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZSBldmVudHVhbCBnb2Fs
Lgo+IAo+IFRoZXJlIGFyZSBubyBpbnRlcmRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVz
LiBBcyB0aGVyZSBhcmUgc3RpbGwKPiBxdWl0ZSBhIGZldyBkcml2ZXJzIHRvIGNvbnZlcnQsIEkn
bSBoYXBweSBhYm91dCBldmVyeSBwYXRjaCB0aGF0IG1ha2VzCj4gaXQgaW4uIFNvIGV2ZW4gaWYg
dGhlcmUgaXMgYSBtZXJnZSBjb25mbGljdCB3aXRoIG9uZSBwYXRjaCB1bnRpbCB5b3UKPiBhcHBs
eSwgcGxlYXNlIGFwcGx5IHRoZSByZW1haW5kZXIgb2YgdGhpcyBzZXJpZXMgYW55aG93Lgo+IAo+
IEJlc3QgcmVnYXJkcwo+IFV3ZQoKRm9yIHNlcmllcywKClJldmlld2VkLWJ5OiBTaW1vbiBIb3Jt
YW4gPGhvcm1zQGtlcm5lbC5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
