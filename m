Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AD9C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Mar 2022 05:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9QjspJ0Lp24xTnXbBtkLNc3BtUZjg75+PuUK/R4QG0=; b=gJ4yo0tntio4xR
	cV7DFDa1TIHGbw30B9QUGLuAyoBGvt++9Yr1BBuKe48JxZwArUvhZD7Dn/o2/efI55NgblGQ0HFs2
	Q+IzkCkw8ezrGhNXTIKsHE4TdMs8fWJJ8GV0XcUyA57MpMgV1HQp0sePalev5Iu6u7181u1E1oaYA
	GyJL7DPf2aOcb+mP3qagdORvKy8wOyXVSV+0lJWELARuFfQVGNkF2pVeMzeJS09zAAWhh58J294q0
	aIjMnTsM1Gj4IVZpGArLqTziMrFdFB4AW7IHJHgfyNhTt+vBlsdnJVwVz33KwAbvY9lq/ZRnm1Zzx
	C5ZgNA7eRbQeUpCWB37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQMdS-00Ckuk-VU; Sat, 05 Mar 2022 05:07:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQMdP-00CkuL-FA; Sat, 05 Mar 2022 05:07:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8F61ECE2F46;
 Sat,  5 Mar 2022 05:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580D1C004E1;
 Sat,  5 Mar 2022 05:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646456831;
 bh=StxylLJZndmfaoBm49hP8e4rvDchvwoXbyMB3UxCkc8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uy/3Kf+17XYlpyOyAOpCdl193ZOhkdpevjoIT96KWtNH4KqGLrTgWRZN9kf9QLkHg
 hcTgHJhWVpj9mVOBvsJFuiofnxylp7pSm99tZ4bcomVqwZsFRszOHM7QVi4roaOpGt
 I9KOLo4jhIpXVezAyJb9OWSEY6RMyyuooS0bZwtublyNi5abRi6ReSOM26Ji2m50L1
 m23bSITaXE5TMNoMd4v9kFIIF0t1Q+pH4hPZkhgHtPVq8wNb9XYTs9tOMABM5X/+5x
 J2osxm70uxWf3eQGb6XAtRXZ2AQMhr7tHHA/eXUahBxU97htANiOP5GABl6fKQ0ZA9
 RHn/8ye5fLrPw==
Date: Fri, 4 Mar 2022 21:07:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vyacheslav <adeep@lexina.in>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller
 <davem@davemloft.net>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: phy: meson-gxl: fix interrupt handling in
 forced mode
Message-ID: <20220304210710.0d2cea8b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <962ae330-b2aa-c52d-5888-83b4fff74c44@lexina.in>
References: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
 <962ae330-b2aa-c52d-5888-83b4fff74c44@lexina.in>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_210715_745722_16528F45 
X-CRM114-Status: UNSURE (   7.43  )
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

On Fri, 4 Mar 2022 22:52:48 +0300 Vyacheslav wrote:
> Seems works for JetHub H1 (S905W with internal phy)

Thanks for testing! For future reference if you use the standard tag
i.e.:

Tested-by: Your Name <email@domain.tld> # JetHub H1 (S905W internal phy)

the credit to your testing will be preserved in git history.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
