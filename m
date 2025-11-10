Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35241CCF9E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jocCXcC9ph1Leu+nnlHNB7KxO+D/w2ggHgZ1oyYpNk=; b=T+ovJEi/F81Bae
	sbw9Cubq4VPa/+/sjcq+jWmcj+cINzaRwOaUOM9x7zwC7VdmegQB4FuefEZ4uynngw2PUNqrO9Qbt
	KYoyq8tHixe6Y6v+hrI68f19ExZjZa3UOybvwVmuFJ/I8KWOxEvidD6RkxklPNA9crOfB4Gbzspld
	F2ezDKenaN7JcPh8ToUpbluk+5/2GXyQa+ZcSm+aG5QYODN04/BI8CMTW2n57pd+d4vylteGVCu3R
	R0kPD7EAi16Wf2pY9hmXpmNZI38fVL6v8Dsqaa+4FWvdlF10zkhpBYvGJz7hjGsdqkrQNC7qkEVFw
	upptbt9WtiquEAHy+RTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6V-00000005c2L-0xxU;
	Mon, 10 Nov 2025 14:42:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6R-00000005c1K-3t7M;
	Mon, 10 Nov 2025 14:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pTHTnt47dLnvjBSkUPSimpdVNbseAt9gYfCc7cGjwZM=; b=Bg7eIF/nhX4f25nLvWrbk05hXu
	19ZiIrw2v7uwrhAks3/yHKlyo4RfB5fVVRH5snm1fNTylSIqs32z1Q1PzQy1ED4RdFgyuftQScOjR
	Wv8McRxhFq7arVI56mIh1XPaiMOnSMZ68dyPivUOo7jvsNZzgMva9PeT0qq6+41kNS/wSZ0lWI6q3
	lg9KQn7EqjUKzfEk5YIODMbWh2RTJNPh0UTe4mAG7kVu1JlLAr1Jv1JrlD+i8dT08UlVdRRHCrRH/
	ktUJjjJ3/jaDmas8otejsFlS3sWqFkCab2tW2JNXdQb+AqsYk5Lxum9+M4PR5PRmZxy2/7G/8G8Uj
	Aw3Kplrg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55342)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vIT6F-000000001Dg-1Zxp;
	Mon, 10 Nov 2025 14:42:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vIT6A-0000000023w-4AxZ;
	Mon, 10 Nov 2025 14:42:27 +0000
Date: Mon, 10 Nov 2025 14:42:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/3] net: stmmac: convert meson8b to use
 stmmac_get_phy_intf_sel()
Message-ID: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064244_230265_D5BE83A3 
X-CRM114-Status: UNSURE (   8.56  )
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

This series splits out meson8b from the previous 16 patch series
as that now has r-b tags.

This series converts meson8b to use stmmac_get_phy_intf_sel(). This
driver is not converted to the set_phy_intf_sel() method as it is
unclear whether there are ordering dependencies that would prevent
it. I would appreciate the driver author looking in to whether this
conversion is possible.

Technically v2, since these changes were posted as part of the 16
patch series. No changes other than r-b tags added.

 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 30 ++++++++--------------
 1 file changed, 10 insertions(+), 20 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
