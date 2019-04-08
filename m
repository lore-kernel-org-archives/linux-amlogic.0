Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E7B1C10F13
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 18:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A2872084C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 18:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cmkwOD7E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="VzpWfig9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A2872084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttwv9ubFKiiesDq2ze6iml9sHU+2N8mukLIeN5m7Znc=; b=cmkwOD7Ezc9I76
	LhNdJUEQs2xHc+KyVR4xICBVV68gWPwPpkNq2gNonFHBcm80wEMZID79VJjwVaAm/DQpRx8Ie0EN/
	OVQdsfXYa/c5qY4uM869cafkKYT5RicI4YUmBB392PC+n6+U32VnADzEyMAbPchsYygtjFnBDv75y
	IQaQSvPj05iygRXrVYrXvcmFfhUwbS2wHtBe46ukBNfP9jFb/Fj25oHcCdHC20wF0M9zmTpKmbl9W
	kVcM1+4jMSQAOfdjOSzkkbzyNSb8ZMBaS5eQTIknK1UD3b6mNw0b9TsPdoA+KvRK6AEI8pihY1Ukh
	QHCGX+9BI3HIPC6ohPLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDYlU-0002iZ-U6; Mon, 08 Apr 2019 18:13:04 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDYlN-0002be-0I; Mon, 08 Apr 2019 18:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjpqCKHDfyMKqSdQW+yIeGx2QfCsW6wLANBgpUr3/7o=; b=VzpWfig9YOXhL81yTzA/xoVElI
 JMRiu4bS5cQw+1/Y+nJwOD4aPo+U/ra8+ruLm9DUkth/g2Yt0ei1M4JK3/Z1sZWb5Q1v+UMv4vElq
 SH3kR+7mFZuQuUgWWTtEBBE+rJd4qOtQPsrSvMGOLQuLxG2VZihushomc2MpQCfXtPlw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hDYlF-0005Af-LU; Mon, 08 Apr 2019 20:12:49 +0200
Date: Mon, 8 Apr 2019 20:12:49 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
Message-ID: <20190408181249.GH15267@lunn.ch>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
 <20190407221312.GA14347@lunn.ch>
 <bc5c192e-78ce-89b1-eeae-541836f5f0fb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc5c192e-78ce-89b1-eeae-541836f5f0fb@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_111257_193927_7D75A55A 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> Splitting the series and waiting for a Tested-by, as proposed by Richard,
> may be problematic because most PHY drivers don't have a dedicated
> maintainer, and we lack the hardware to test.

Well, we could split out those we know are likely to get tested.  I
have a number of boards with Marvell devices i can test. Florian has
Broadcom boards. I also have a couple of boards with Micrel KSZ8041,
which would be interesting because they are Fast Ethernet. Bootlin can
test some of the mscc PHYs.

We also might want to get some targeted testing. The microchip_t1.c
could be interesting, since it is a T1 device. There was another T1
added in the last year, but i forget which.

Just doing this testing might give us an idea if we really should
expect problems.

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
