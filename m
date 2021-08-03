Return-Path: <SRS0=YX+9=M2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B527C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 20:45:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1FF60ED6
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Aug 2021 20:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F1FF60ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chAD33fG0Qrv5xtOjkHLoGgy7E/qcK4qvl45jLhZV0A=; b=s8RRn7weWsw2V1
	8hUtQ4Cawc6jS4dPG2F0wDP/zP0b8PkQeB7GG8/7CdNE66IuWZ2eZTr9lBMvLCR0TERF89DE4hXJb
	UTPe7l++D9SPZbXmjqqMMtTvcQSfRRLkeW5CDyplNA9SvXUVT76KGegDkkFknoui/QsCB7CMQekii
	AZjux6w20CjOCzzUDdz/szaW4SC4pL9TuG4hOIjFTeEot+e7iFHy88RVZ2b/JrMx0caT8r/hExtr8
	ZqBZM4a3cTIMCDDmRkDFpociI1628a3OOiv4/vDcJyQLDVQpp39rIE6SiBGbpz/eweM8/f7d9CK3e
	6p77XZmUyKBGPqJJpaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB1IE-004BqK-K1; Tue, 03 Aug 2021 20:45:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB1I1-004Bo4-AC; Tue, 03 Aug 2021 20:45:30 +0000
Received: by mail-ed1-x530.google.com with SMTP id y7so751077eda.5;
 Tue, 03 Aug 2021 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZbatCuwF0ejzY/254BQh4plkI8mltXs2twaQnckgMI=;
 b=p6BnMCoQVqlyPBcxlHpgLvhxDtbmUN84h5PkOllCD755g4MCf/UKkPDMAXladxB+fB
 ItXeBPNZU1eu9qpp2s5qRNf19y0GWfCc4yrZUM81hGss6a03DsR62OdzljQaK7beX4u2
 6O0AeUatpKRyCVLH5f1CDB73J/mah8Eangexn4iulbgM3QdMIK10G8SMlbKBxBPMIQV/
 H2hRARFM/WDnnDj9FIHnoiBbr7QTnZbd/iubtmfctpxrvCom9vD8ZBXQ2iDcgfyIqucm
 Y7GGg4o3zIqe8U26oZdecITIO1v8XS/OujFchRVeQHCvAUQFxXRFEueD3DvJ3VSMbqOG
 vt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZbatCuwF0ejzY/254BQh4plkI8mltXs2twaQnckgMI=;
 b=ol9zarN5I7FHFL/s1+cmUrHPupfAuTh7T6dJg3E16aUlXal8f85SBmYJjvGwHUJscH
 G2X5bpHWElVtX/BnZozFUO09hTWvw3qkZmLUrWGx9OES3WedpdEfT3a7rAU9oez1FnXH
 40tawTYaFH2wF5LxgX8zV/Pvt740cLJy+q5If0oc2l/v7eZNZbQiG9V0yeX1Zx1ozQqT
 SEETGVgeFl5Qy4C4rEkZNTf2qkkfVNxUtQAW1l9uFZIU9yy7ghsp5Jpd2lAx0xHIwijR
 68C9YaJ+10OO55cuNvyf9toNlhahCokKc6j371BHrl+W24vQNOi/lTBjWUQ/HMEMotKW
 jqWQ==
X-Gm-Message-State: AOAM531qd7aw2pGk+QDC+7SHQG/y44o9w7mEZkIpnXTUsjX/fsc0y5a7
 ew4HX1Z7mRktOuvQMegPueIcrV2+i/gbe8SWO/Y=
X-Google-Smtp-Source: ABdhPJxRXiJDPGTIfneS7YyQ40d3AXe1t8qEhKVPNz8CIijfGmO3fHXUd9wo1ewgVlv71M9TOcDpUS40b9+EssDoF4k=
X-Received: by 2002:a05:6402:54d:: with SMTP id
 i13mr27685680edx.179.1628023524096; 
 Tue, 03 Aug 2021 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-4-linux.amoon@gmail.com>
In-Reply-To: <20210729201100.3994-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Aug 2021 22:45:13 +0200
Message-ID: <CAFBinCAVaaXd+jXBtA9RETP5AavOfeUVZLkU1ohGT2Lmx+H1cw@mail.gmail.com>
Subject: Re: [PATCHv1 3/3] net: stmmac: dwmac-meson8b: Add reset controller
 for ethernet phy
To: Anand Moon <linux.amoon@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_134529_398444_50B3A51F 
X-CRM114-Status: GOOD (  12.64  )
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

Hi Anand,

On Thu, Jul 29, 2021 at 10:11 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add reset controller for Ethernet phy reset on every boot for
> Amlogic SoC.
I think this description does not match what's going on inside the SoC:
- for all SoCs earlier than GXL the PHY is external so the reset for
the PHY is a GPIO
- the reset line you are passing in the .dts belongs to the Ethernet
controller on SoCs earlier than GXL
- I *believe* that the rset line which you're passing in the .dts
belongs to the Ethernet controller AND the built-in MDIO mux on GXL
and newer, see also [0]
- from how the PRG_ETH registers work I doubt that these are connected
to a reset line (as they're managing mostly delays and protocol - so I
don't see what would be reset). This is speculation though.


Best regards,
Martin


[0] https://lore.kernel.org/linux-amlogic/553e127c-9839-d15b-d435-c01f18c7be48@gmail.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
