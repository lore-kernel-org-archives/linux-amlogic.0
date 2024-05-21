Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E8C25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8WFJ4u+/Hl9kgqfJPRzD2aLyAcDRz9Dkl8++cjoCxQ=; b=HZ3rzdqHG4vPgi
	91R5EkxNNgT8cjcSuZ7uplSTaMg8HjcxKH7tzUTDfP9rYnEPsv2xxjoOYnJw3oxCIVL01PcPql9Ch
	Uw/rxdSYXKunvLwKQzz/+BLQu/Pqd55rRIdUfjtKZEhYYSVa9tKSotkzAHo8RyZt6KBXMcElvCQxZ
	dV3sy9xXvhTVTB6+YYndR7TZ5XfU26aFeMC+jtuzol9aPnYvuShxEd4+ZMYnpEF3nNdBpHnyeiOeY
	y4LPpfVjN4aOnmxyQ7eSRudPTbEtjXtG5L9IMkWzXGGRH58ShQjtMU+RR7j5bJa72+/7GBEiWIrK7
	/CsDwtD5heewz2tisV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UqM-00000000s2K-3bRM;
	Tue, 21 May 2024 19:08:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UqJ-00000000s13-1b6Q;
	Tue, 21 May 2024 19:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Aa0cLQv6EXqOfkPotmVcZhdZiy3itIGTrTeuDAF0fks=; b=JugbqVueUMPEOzD6J0OMO/9EUb
	HVQwA9KIYPYMQBLTwCMP3MfSLThC4zef/dXWPErhjdUyKOEoNvSM0TDt6f0GEJ3OPJV2j4vp9DjJ7
	DJOGnhcRqdyekj0IducRHiff0mImOKiA/wvJGV6qXI7kdd6uo86LRDtuWuRWdQ8YxBK0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s9Uq1-00FmSO-8x; Tue, 21 May 2024 21:07:53 +0200
Date: Tue, 21 May 2024 21:07:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Da Xue <da@libre.computer>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stable <stable@vger.kernel.org>
Subject: Re: [PATCH] net: mdio: meson-gxl set 28th bit in eth_reg2
Message-ID: <8593ae57-d5ec-4b89-899d-4619d7767f81@lunn.ch>
References: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_120811_440777_7DCA0C75 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, May 21, 2024 at 02:56:45PM -0400, Da Xue wrote:
> This bit is necessary to enable packets on the interface. Without this
> bit set, ethernet behaves as if it is working but no activity occurs.
> 
> The vendor SDK sets this bit along with the PHY_ID bits. u-boot will set
> this bit as well but if u-boot is not compiled with networking, the
> interface will not work.
> 
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> 
> Signed-off-by: Da Xue <da@libre.computer>

Please don't put blank lines between tags.

If you intend that this patch is backported to stable, please add

Cc: stable@vger.kernel.org

Also please read:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#netdev-faq

particularly the bit about indicating the tree in the Subject:

    Andrew

---
pw-bot: cr

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
