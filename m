Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C38ECAAA3
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 20:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P8eGMDsPzF5A+IaovoqrMVuH0jzJxKmFi/r/4rVbgMY=; b=j4P8TbV2mcT7xt
	Ge7vaquvm/jl9LSVO7OhAbcaBEIoJ+KLIeIlhPHvIWU8e4pr/UR7fRXK3Ac8Ryg4m6KmwPJgURlMd
	TJYVgp2/nauopwj2duYGLprucHOCr8HbtcjQ6uzmX0B3GDYwEk4ePX+LcKv9m92HAf0k1KnpBOHzZ
	wg7UZTXf2he76BY7GPzstb0NhlVZOmfvWNpuzsZ7aXL2Ob1X7+uCcI+6zpCRxTY3OvlG3ysJD901I
	1lLLiB6ofWgXK+any/2XeBmZeuo/7HewoNJNdXu8MmvNvmmf/ia0SllXRSHK21TcXE/aQKAHswfdJ
	PEd7+aTmOqajSXEObzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg4c-00BwgD-1S; Fri, 26 Aug 2022 20:37:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg4Y-00BwUg-SK
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 20:37:00 +0000
Received: by mail-ej1-x62b.google.com with SMTP id y3so5243915ejc.1
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bX8L3lrsIgJTl5pJrpqAIImpOmq0BJmljpKdUfFQYh4=;
        b=UMYco4lTUNPQnPTzj++tXIwx7+FwA5ZiqDLTxXKopiXeaEb5rOaq2ZPgq8ESbphXlU
         N1ErYfRjqUac0LF7CACo7OYnzHU+fgfV0f8v087JUD03e14f1xjGxNGj7WpyJNZlElME
         onl+Ka2/HeAbgmBWyy07eLkpbj0cbprJLPXkxdYsnjp0u624efG/FORTdoj1o7PUjE8a
         d7F106UPXWWQVFZS+1uVOkgZM03xOqKGjCw5PXN4J+/V5gx0VeqS5GIzbtUwLCYL/7MT
         1MpPh7NNUdk/kcXmGQU9R1t2QqJCb/duzPRjRjRxS1st6NQ5eOuMdsJsk6ViWh2U13zZ
         B4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bX8L3lrsIgJTl5pJrpqAIImpOmq0BJmljpKdUfFQYh4=;
        b=7tr4DzSilGpeuZWOUAugOlazLfomFd38Bmp0Zow/i59yhD397354f6xnDF91e3jdaU
         FpKwO8Xa7utdQMmLSy2Xskp/c40PPg8xAOdVPfjzEESAvrKfvVJcLxvE1CLTHqRtZr0i
         Ml8IOjjiDm0MwaUuD0g3jm70SzTfps6Da8bmsl0pmxGQvusCd3K+jc1LnipK103PBtiD
         m9FBMpxhdQwK4tO7iH1uVpTUSKTkmLe1nZP07idcTKMDk1WtOqZkKDc19LlR4mdonm6N
         qGPiiwDg52Ob0cWn5TnJBMbmdOLi2NeYrrxFuJPQbyqLZT9mJrylD1M8eMHfCZ2FiAd/
         IPDA==
X-Gm-Message-State: ACgBeo3nRLm3tXxYo/I6V1Dju3CwJdgHUbNhWlXiuPCe2ItmsPuNblxQ
	SBSAeX3po3DXx7dxNobU/2A=
X-Google-Smtp-Source: AA6agR4PoijLty0DoRsbvLU7vqA7XHTTWBrAX3vLJ7odQhLEUGlC3Em5+DqZMQX+1rSCe08OSFjecw==
X-Received: by 2002:a17:907:1688:b0:730:b3ae:347 with SMTP id hc8-20020a170907168800b00730b3ae0347mr6476068ejc.756.1661546213189;
        Fri, 26 Aug 2022 13:36:53 -0700 (PDT)
Received: from ?IPV6:2a01:c22:77de:500:880e:dd7c:16c:c9fb? (dynamic-2a01-0c22-77de-0500-880e-dd7c-016c-c9fb.c22.pool.telefonica.de. [2a01:c22:77de:500:880e:dd7c:16c:c9fb])
        by smtp.googlemail.com with ESMTPSA id r21-20020a170906a21500b0073c74bee6eesm1248783ejy.201.2022.08.26.13.36.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 13:36:52 -0700 (PDT)
Message-ID: <5c8f4cc4-9807-cfe5-7e0a-7961aef5057f@gmail.com>
Date: Fri, 26 Aug 2022 22:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
Content-Language: en-US
To: Da Xue <da@lessconfused.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Erico Nunes <nunes.erico@gmail.com>,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>,
 Qi Duan <qi.duan@amlogic.com>
References: <20220707101423.90106-1-jbrunet@baylibre.com>
 <00f1e968-c140-29b9-dc82-a6f831171d6f@gmail.com>
 <CACdvmAiyFQTUgEzkva9j8xYJYYBRXg_sfB562f3F515AHmkUoA@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CACdvmAiyFQTUgEzkva9j8xYJYYBRXg_sfB562f3F515AHmkUoA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_133658_950266_2C0C6F7C 
X-CRM114-Status: GOOD (  31.81  )
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

On 26.08.2022 17:45, Da Xue wrote:
> Hi Heiner,
> 
> I have been running with the patch reverted for about two weeks now
> without issue but I have a modified u-boot with ethernet bringup
> disabled.
> 
> If u-boot brings up ethernet, all of the GXL boards with more than 1GB
> memory experience various bugs. I had to bring the PHY initialization
> patch into Linux proper:
> https://github.com/libre-computer-project/libretech-linux/commit/1a4004c11877d4239b57b182da1ce69a81c0150c
> 
Thanks for the follow-up. To be acceptable upstream I'm pretty sure that
the maintainer is going to request replacing magic number 0x10110181
with or'ing proper constants for the respective bits and fields.

> Hope this helps someone.
> 
> Best,
> 
> Da
> 
> On Fri, Aug 26, 2022 at 5:51 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On 07.07.2022 12:14, Jerome Brunet wrote:
>>> For some reason, poking MAC_CTRL_REG a second time, even with the same
>>> value, causes problem on a dwmac 3.70a.
>>>
>>> This problem happens on all the Amlogic SoCs, on link up, when the RMII
>>> 10/100 internal interface is used. The problem does not happen on boards
>>> using the external RGMII 10/100/1000 interface. Initially we suspected the
>>> PHY to be the problem but after a lot of testing, the problem seems to be
>>> coming from the MAC controller.
>>>
>>>> meson8b-dwmac c9410000.ethernet: IRQ eth_wake_irq not found
>>>> meson8b-dwmac c9410000.ethernet: IRQ eth_lpi not found
>>>> meson8b-dwmac c9410000.ethernet: PTP uses main clock
>>>> meson8b-dwmac c9410000.ethernet: User ID: 0x11, Synopsys ID: 0x37
>>>> meson8b-dwmac c9410000.ethernet:     DWMAC1000
>>>> meson8b-dwmac c9410000.ethernet: DMA HW capability register supported
>>>> meson8b-dwmac c9410000.ethernet: RX Checksum Offload Engine supported
>>>> meson8b-dwmac c9410000.ethernet: COE Type 2
>>>> meson8b-dwmac c9410000.ethernet: TX Checksum insertion supported
>>>> meson8b-dwmac c9410000.ethernet: Wake-Up On Lan supported
>>>> meson8b-dwmac c9410000.ethernet: Normal descriptors
>>>> meson8b-dwmac c9410000.ethernet: Ring mode enabled
>>>> meson8b-dwmac c9410000.ethernet: Enable RX Mitigation via HW Watchdog Timer
>>>
>>> The problem is not systematic. Its occurence is very random from 1/50 to
>>> 1/2. It is fairly easy to detect by setting the kernel to boot over NFS and
>>> possibly setting it to reboot automatically when reaching the prompt.
>>>
>>> When problem happens, the link is reported up by the PHY but no packet are
>>> actually going out. DHCP requests eventually times out and the kernel reset
>>> the interface. It may take several attempts but it will eventually work.
>>>
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>>>> Sending DHCP requests ...... timed out!
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>>>> IP-Config: Retrying forever (NFS root)...
>>>> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>>>> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
>>>> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
>>>> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>>>> Sending DHCP requests ...... timed out!
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>>>> IP-Config: Retrying forever (NFS root)...
>>>> [...] 5 retries ...
>>>> IP-Config: Retrying forever (NFS root)...
>>>> meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.1:08] driver [Meson G12A Internal PHY] (irq=POLL)
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
>>>> meson8b-dwmac ff3f0000.ethernet eth0: No Safety Features support found
>>>> meson8b-dwmac ff3f0000.ethernet eth0: PTP not supported by HW
>>>> meson8b-dwmac ff3f0000.ethernet eth0: configuring for phy/rmii link mode
>>>> meson8b-dwmac ff3f0000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx
>>>> Sending DHCP requests ., OK
>>>> IP-Config: Got DHCP answer from 10.1.1.1, my address is 10.1.3.229
>>>
>>> Of course the same problem happens when not using NFS and it fairly
>>> difficult for IoT products to detect this situation and recover.
>>>
>>> The call to stmmac_mac_set() should be no-op in our case, the bits it sets
>>> have already been set by an earlier call to stmmac_mac_set(). However
>>> removing this call solves the problem. We have no idea why or what is the
>>> actual problem.
>>>
>>> Even weirder, keeping the call to stmmac_mac_set() but inserting a
>>> udelay(1) between writel() and stmmac_mac_set() solves the problem too.
>>>
>>> Suggested-by: Qi Duan <qi.duan@amlogic.com>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>
>>>  Hi,
>>>
>>>  There is no intention to get this patch merged as it is.
>>>  It is sent with the hope to get a better understanding of the issue
>>>  and more testing.
>>>
>>>  The discussion on this issue initially started on this thread
>>>  https://lore.kernel.org/all/CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com/
>>>
>>>  The patches previously proposed in this thread have not solved the
>>>  problem.
>>>
>>>  The line removed in this patch should be a no-op when it comes to the
>>>  value of MAC_CTRL_REG. So the change should make not a difference but
>>>  it does. Testing result have been very good so far so there must be an
>>>  unexpected consequence on the HW. I hope that someone with more
>>>  knowledge on this controller will be able to shine some light on this.
>>>
>>>  Cheers
>>>  Jerome
>>>
>>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 -
>>>  1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> index d1a7cf4567bc..3dca3cc61f39 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>>> @@ -1072,7 +1072,6 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>>>
>>>       writel(ctrl, priv->ioaddr + MAC_CTRL_REG);
>>>
>>> -     stmmac_mac_set(priv, priv->ioaddr, true);
>>>       if (phy && priv->dma_cap.eee) {
>>>               priv->eee_active = phy_init_eee(phy, 1) >= 0;
>>>               priv->eee_enabled = stmmac_eee_init(priv);
>>
>> Now that we have a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
>> in linux-next and scheduled for stable:
>>
>> Jerome, can you confirm that after this commit the following is no longer needed?
>> 2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")
>>
>> Then I'd revert it, referencing the successor workaround / fix in stmmac.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
