Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40073ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rCcAFK+Zzv0cC+3B3dwGeChxcn/8VDaWwUH8Acy0P2A=; b=eAI603iathEm5U
	MYtUpfubGSmDHY3M06bC0hFp8YwOnLXrrkluoa8eVRZfbPnIxps9EmptS9K5NhCRXUyqX3nfQfHjr
	5kua6ep2nzRHn0aqRGQu9Zlwq5T620rkYypDswnue6QikoiRqNVpDrL+Y899zV2iWsquW8fzv/kk6
	PWejFok19hEgvDmrftwn9S0cYkgosOgGcE5OiNTfACajH/6OW1n9TtQ9EF6sO2xGk5BCQlUi1FBrM
	9MFwHtmE4LA1QcMGw64OTb+UKuYEozwRim/RgZ6XoIQJTCO4pYmBGHAoPMvAhUtrv/UTBy36fPw3h
	0oOnyeMamOxs79+auQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRW02-000xkz-PU; Fri, 26 Aug 2022 09:51:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVzz-000xa7-N1
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 09:51:37 +0000
Received: by mail-ed1-x52b.google.com with SMTP id b16so1452429edd.4
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc;
        bh=M6AWl1HTGvLPHmRBSbB/QbSSEbP2+S+I+PGiAIbFVmQ=;
        b=ICxQgIIVfPsbBPEEY19A/aF/IHXFAMI8lGUB2j8xHhZ185IVB+BAx/bKYiUmNe001b
         uhpHw/9pzDlX4GoteCDI/o/MIjta1sCnAe91zB1VstLtY4V02CHtVzEqLZpf96Pv2TOh
         6j6XJiA0KgtSNk4GRWcoGKzZj0Jkoyrg29sVRx9vMwZbyMsCfgw5lBYMb+zu1WA0gmMF
         HClv49DEXmQFpPtfqBhmvuWV+FyNuHAdHn4uM1xsz3kyZqA1kLenvrlYKh+nn+63qyPC
         INfj+QW/Z2MGtzxe9GXU8UQd4luBOUwklipquiSScZB0DWD6Qv7XNfsOEAHHp3C3jxgu
         Tw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=M6AWl1HTGvLPHmRBSbB/QbSSEbP2+S+I+PGiAIbFVmQ=;
        b=4iu91wz6Aoe+o55hk2nFmsgDLF4+ugGT/o+KqiOyxTPuTHKH34KCAjnwa5FSZyuFpp
         nCcHcNYyrKPf2y6xX8wvX4iQGZII6Hr+UUTUkkYZVo+qi7NPdwTcuyg2lI/t/Jg289AO
         KveJTi0CVhkXRZVVlMkrPH0jbjpQzxZRg1wcrVfgFXkESh6d8Gvty19j3ixKnEwaV2Tg
         /lXR4vm/TM/8qkZ7dqR04ei8IvR8jjPdxwx88TgyWvmPhNU25wyAPr1VNypbLNmJJHWh
         GEVPprqLmhL+AW3eEKlBl3RgfSoZbjAa7+BAsQFax5+F4FOBHG+n3NWRI9yoTnlVhY/1
         R+Lg==
X-Gm-Message-State: ACgBeo06dbMQEB0vJNrJ0jno7k7Y1NYEJjgqzCmkxYhXfNz1xb/Pv4NJ
	SQ7oBcKcAA+8v3sYydOk8SJspa3CavM=
X-Google-Smtp-Source: AA6agR5z5Od5QlyGlCtzDkRLxGIPKczHUd6MyXKTu8N7GWPtgPz9FBSO8L1a2mCf+dHjFfiaqR2j3g==
X-Received: by 2002:aa7:df82:0:b0:447:89da:483a with SMTP id b2-20020aa7df82000000b0044789da483amr6173376edy.418.1661507492763;
        Fri, 26 Aug 2022 02:51:32 -0700 (PDT)
Received: from ?IPV6:2a01:c22:77de:500:9f5:ce1b:f3e2:f268? (dynamic-2a01-0c22-77de-0500-09f5-ce1b-f3e2-f268.c22.pool.telefonica.de. [2a01:c22:77de:500:9f5:ce1b:f3e2:f268])
        by smtp.googlemail.com with ESMTPSA id c10-20020aa7c98a000000b00447dc591874sm1036274edt.37.2022.08.26.02.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:51:32 -0700 (PDT)
Message-ID: <00f1e968-c140-29b9-dc82-a6f831171d6f@gmail.com>
Date: Fri, 26 Aug 2022 11:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Erico Nunes <nunes.erico@gmail.com>
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>,
 Da Xue <da@lessconfused.com>, Qi Duan <qi.duan@amlogic.com>
References: <20220707101423.90106-1-jbrunet@baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
In-Reply-To: <20220707101423.90106-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_025135_801378_F5494E7F 
X-CRM114-Status: GOOD (  36.87  )
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

On 07.07.2022 12:14, Jerome Brunet wrote:
> For some reason, poking MAC_CTRL_REG a second time, even with the same
> value, causes problem on a dwmac 3.70a.
> 
> This problem happens on all the Amlogic SoCs, on link up, when the RMII
> 10/100 internal interface is used. The problem does not happen on boards
> using the external RGMII 10/100/1000 interface. Initially we suspected the
> PHY to be the problem but after a lot of testing, the problem seems to be
> coming from the MAC controller.
> 
>> meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
>> meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
>> meson8b-dwmac c9410000.ethernet: PTP uses main clock
>> meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
>> meson8b-dwmac c9410000.ethernet: 	DWMAC1000
>> meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
>> meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
>> meson8b-dwmac c9410000.ethernet: COE Type 2
>> meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
>> meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
>> meson8b-dwmac c9410000.ethernet: Normal descriptors
>> meson8b-dwmac c9410000.ethernet: Ring mode enabled
>> meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> 
> The problem is not systematic. Its occurence is very random from 1/50 to
> 1/2. It is fairly easy to detect by setting the kernel to boot over NFS and
> possibly setting it to reboot automatically when reaching the prompt.
> 
> When problem happens, the link is reported up by the PHY but no packet are
> actually going out. DHCP requests eventually times out and the kernel reset
> the interface. It may take several attempts but it will eventually work.
> 
>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>> Sending DHCP requests ...... timed out!
>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>> IP-Config: Retrying forever (NFS root)...
>> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
>> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
>> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
>> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>> Sending DHCP requests ...... timed out!
>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>> IP-Config: Retrying forever (NFS root)...
>> [...] 5 retries ...
>> IP-Config: Retrying forever (NFS root)...
>> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
>> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
>> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
>> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>> Sending DHCP requests ., OK
>> IP-Config: Got DHCP answer from 10.1.1.1, my address is 10.1.3.229
> 
> Of course the same problem happens when not using NFS and it fairly
> difficult for IoT products to detect this situation and recover.
> 
> The call to stmmac_mac_set() should be no-op in our case, the bits it sets
> have already been set by an earlier call to stmmac_mac_set(). However
> removing this call solves the problem. We have no idea why or what is the
> actual problem.
> 
> Even weirder, keeping the call to stmmac_mac_set() but inserting a
> udelay(1) between writel() and stmmac_mac_set() solves the problem too.
> 
> Suggested-by: Qi Duan <qi.duan@amlogic.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
>  Hi,
> 
>  There is no intention to get this patch merged as it is.
>  It is sent with the hope to get a better understanding of the issue
>  and more testing.
> 
>  The discussion on this issue initially started on this thread
>  https://lore.kernel.org/all/CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com/
> 
>  The patches previously proposed in this thread have not solved the
>  problem.
> 
>  The line removed in this patch should be a no-op when it comes to the
>  value of MAC_CTRL_REG. So the change should make not a difference but
>  it does. Testing result have been very good so far so there must be an
>  unexpected consequence on the HW. I hope that someone with more
>  knowledge on this controller will be able to shine some light on this.
> 
>  Cheers
>  Jerome
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d1a7cf4567bc..3dca3cc61f39 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1072,7 +1072,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  
>  	writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
>  
> -	stmmac_mac_set(priv, priv->ioaddr, true);
>  	if (phy && priv->dma_cap.eee) {
>  		priv->eee_active = phy_init_eee(phy, 1) >= 0;
>  		priv->eee_enabled = stmmac_eee_init(priv);

Now that we have a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
in linux-next and scheduled for stable:

Jerome, can you confirm that after this commit the following is no longer needed?
2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")

Then I'd revert it, referencing the successor workaround / fix in stmmac.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
