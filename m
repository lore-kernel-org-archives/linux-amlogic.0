Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F11AC63797
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNGSiyJggjc+3msLXOwUmaT0DLNpp//rWMi35oKFct0=; b=MmyxWal6dTZwA/
	Pck37X+cqFHllOF0v0zNF3elB7JJan+INCbIeYpW+yONtgMCKjKdo0h7RzuKWCcStqdu3xVTK+amc
	gUm91iS5/S7/0IElRdb+9iVEIXSQ/l1uryzwTjTzQNSm/wn0wUnrgTlyUr4BNJcIo6pjn3A7boryD
	2Q6oK0EZEtcH8YMbvLoa9vvOyCI+H8gnCuQAz/WG+8gwnoLiDkaFaVPd/olctSm+33TKZTsU8RXhS
	eV/7OmRB0EpVkWX8efOMOLI7w91S/FXfXFIuqH7UGJYbIx20vCIzHZp6B1Au1Hq4PAbmGjH5AkdFv
	vTa6Dc4XmThND8ICH8qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH6Km-007h5f-K3; Sun, 15 Jan 2023 16:58:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH6Kb-007h3z-Vw; Sun, 15 Jan 2023 16:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IEF0Qvv1dJejX3FJqZ7ClcaaOMLVeaZoXIK0QOB2NJc=; b=rY9jXOhXJYB8QlnIQVAW4HgsS9
	b/EcScbj8xQpuMdL0xbky2+M+8Aj9ZEpnyXuaMzMFYL746cx5Nsy9zXcmvB+Uce9xCYJJ68F39qQu
	U3xoU44N2ZH6HiPvIDCanl2TjxMXJj73IqLCF6Uq7CSa8bxiaQAxkbcHyV66+pFGsHuQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pH6KR-0028uw-Vm; Sun, 15 Jan 2023 17:57:55 +0100
Date: Sun, 15 Jan 2023 17:57:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal
 PHY versions
Message-ID: <Y8Qwk5H8Yd7qiN0j@lunn.ch>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_085806_045426_EFAF474D 
X-CRM114-Status: GOOD (  13.69  )
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

On Sun, Jan 15, 2023 at 04:19:37PM +0100, Heiner Kallweit wrote:
> On my SC2-based system the genphy driver was used because the PHY
> identifies as 0x01803300. It works normal with the meson g12a
> driver after this change.
> Switch to PHY_ID_MATCH_MODEL to cover the different sub-versions.

Hi Heiner

Are there any datasheets for these devices? Anything which documents
the lower nibble really is a revision?

I'm just trying to avoid future problems where we find it is actually
a different PHY, needs its own MATCH_EXACT entry, and then we find we
break devices using 0x01803302 which we had no idea exists, but got
covered by this change.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
