Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A06C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Jul 2022 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/S7EuFzVpoOwge5DVVKRZFq3SSx1YynTKOjsKuWrzLE=; b=sasSUThOQWorEK
	3gBLG1JMvBi63C2WyBUeEpwC84DYrw45+yjfVBfDlzCodZY2Y6MJUfTTAkohbpzyibGC84M3v83uZ
	7fvZnJy0GH8gQc2CrR1XV+UM4GiTfxTZOFQwE8TGKagAX0EQYX6w0vRhJRkUphl9SBRpteW7TA5pb
	cR0AXxkaGctnPbJhcoaZrEpNDJNCyE8dUIxU6taTogsQE5xX3KGngzSjW9QbVRTPO2vbMAH4sv+p0
	yBY+X4flXRzzu0XE0fNAvs5X8z2Iui6Qzqd1eEFtWmopKZimfEahsD8WePbNSNS/wjCTrQNtFnTvK
	oqNkr6t/ynoiWroW3hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OXA-00FXbt-2K; Thu, 07 Jul 2022 10:14:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OX4-00FXYg-Pg
	for linux-amlogic@lists.infradead.org; Thu, 07 Jul 2022 10:14:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id a5so10919141wrx.12
        for <linux-amlogic@lists.infradead.org>; Thu, 07 Jul 2022 03:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SSgNLLbJ50VCDaH8BIYRHOpcuQy4PBpSnIZTiijPY+s=;
        b=mTlAPtr3tyQGyLNzZ3lqfSOw9kmdd7anPumzfF1AwyqOX9zE52Mq0GMSuMmTsyhb85
         br7YVPkr8y2e+rnVa7QKMXsFSmfacAooylGAOi/U+jZMf5kLPJ6RgqQuymt/+Cs8dslJ
         9Snl19ou0HABvluTo1izSofvxSMYSzLspGb8cTvAmUqPR8+2Lzih9SmFakd5PffVV1EA
         PghirMQt3EeQvBy0YV6MfTHQcuB2vtgz1851PSW9pHvowear4RNUYPsCGTNOvHfLTS/6
         VgRIO3H7l2f0mQyG/dCFlGyRa7X3gVNTcM4vRDSBk2OVxGgVznu8ZQhjFOBIvzupQLKU
         5rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SSgNLLbJ50VCDaH8BIYRHOpcuQy4PBpSnIZTiijPY+s=;
        b=Lkkb/Y/ebWo5Jw7cQzvk3aMX+h3YfIjKh9QEk2MpNyP4SxcV3UfgRr5LFVMru4CkAA
         WjeA9ZCfP5WEAiy0xQ2w4wZn6/fiyBDygjCauS9GWM8wbc6XZg4UBUf0RIChhXpJzIlr
         ua6poePjaPc127IREoVgUnTAaTEiFOl1RisVdLvOEIJk6iuSPpZ5URRexYe/nU/WsWxy
         m+ZBY8/8mS0VRTR6DryD929XeWnqi2jqzK5qWzBeCn5l7Vbe2hT/iQXJdiL+jTMTFBjm
         kZlFvAeDN7VBKNOvdHJrqnweaAf/tti5TnW325Q4VYgu9/0Iu/Z1zv1sDxbT/xQckK2U
         Do/A==
X-Gm-Message-State: AJIora9Cd9fJ0TYtPmde6PhcCMN5M868IWFfvjyqH8dlSiEklVoty4qz
	CSzknaFKa3yDPMCDLxyEi8j5sQ==
X-Google-Smtp-Source: AGRyM1t7A2+WyXOf/CUDW4Xy+uzMrWN9QYBNI+mVq/LrxwYs5i6OKcl4oc5hBVKSq152h68H7xHeMg==
X-Received: by 2002:a5d:6d0a:0:b0:21d:6f28:5ead with SMTP id e10-20020a5d6d0a000000b0021d6f285eadmr14593631wrq.95.1657188886653;
        Thu, 07 Jul 2022 03:14:46 -0700 (PDT)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id z21-20020a1c4c15000000b0039c871d3191sm29370749wmf.3.2022.07.07.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:14:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Erico Nunes <nunes.erico@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	netdev@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Vyacheslav <adeep@lexina.in>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Da Xue <da@lessconfused.com>,
	Qi Duan <qi.duan@amlogic.com>
Subject: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on link up
Date: Thu,  7 Jul 2022 12:14:23 +0200
Message-Id: <20220707101423.90106-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_031451_136722_1E91F324 
X-CRM114-Status: GOOD (  25.48  )
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

For some reason, poking MAC_CTRL_REG a second time, even with the same
value, causes problem on a dwmac 3.70a.

This problem happens on all the Amlogic SoCs, on link up, when the RMII
10/100 internal interface is used. The problem does not happen on boards
using the external RGMII 10/100/1000 interface. Initially we suspected the
PHY to be the problem but after a lot of testing, the problem seems to be
coming from the MAC controller.

> meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
> meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
> meson8b-dwmac c9410000.ethernet: PTP uses main clock
> meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
> meson8b-dwmac c9410000.ethernet: 	DWMAC1000
> meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
> meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
> meson8b-dwmac c9410000.ethernet: COE Type 2
> meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
> meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
> meson8b-dwmac c9410000.ethernet: Normal descriptors
> meson8b-dwmac c9410000.ethernet: Ring mode enabled
> meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer

The problem is not systematic. Its occurence is very random from 1/50 to
1/2. It is fairly easy to detect by setting the kernel to boot over NFS and
possibly setting it to reboot automatically when reaching the prompt.

When problem happens, the link is reported up by the PHY but no packet are
actually going out. DHCP requests eventually times out and the kernel reset
the interface. It may take several attempts but it will eventually work.

> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> Sending DHCP requests ...... timed out!
> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
> IP-Config: Retrying forever (NFS root)...
> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> Sending DHCP requests ...... timed out!
> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
> IP-Config: Retrying forever (NFS root)...
> [...] 5 retries ...
> IP-Config: Retrying forever (NFS root)...
> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
> Sending DHCP requests ., OK
> IP-Config: Got DHCP answer from 10.1.1.1, my address is 10.1.3.229

Of course the same problem happens when not using NFS and it fairly
difficult for IoT products to detect this situation and recover.

The call to stmmac_mac_set() should be no-op in our case, the bits it sets
have already been set by an earlier call to stmmac_mac_set(). However
removing this call solves the problem. We have no idea why or what is the
actual problem.

Even weirder, keeping the call to stmmac_mac_set() but inserting a
udelay(1) between writel() and stmmac_mac_set() solves the problem too.

Suggested-by: Qi Duan <qi.duan@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Hi,

 There is no intention to get this patch merged as it is.
 It is sent with the hope to get a better understanding of the issue
 and more testing.

 The discussion on this issue initially started on this thread
 https://lore.kernel.org/all/CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com/

 The patches previously proposed in this thread have not solved the
 problem.

 The line removed in this patch should be a no-op when it comes to the
 value of MAC_CTRL_REG. So the change should make not a difference but
 it does. Testing result have been very good so far so there must be an
 unexpected consequence on the HW. I hope that someone with more
 knowledge on this controller will be able to shine some light on this.

 Cheers
 Jerome

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d1a7cf4567bc..3dca3cc61f39 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1072,7 +1072,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
 
 	writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
 
-	stmmac_mac_set(priv, priv->ioaddr, true);
 	if (phy && priv->dma_cap.eee) {
 		priv->eee_active = phy_init_eee(phy, 1) >= 0;
 		priv->eee_enabled = stmmac_eee_init(priv);
-- 
2.36.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
