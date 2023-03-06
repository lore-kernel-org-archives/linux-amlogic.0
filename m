Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59992C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfsm2jfC/PGYrHgWmZ3wkBUJvHX/4iqGouHo67hKz9E=; b=JxAOv2UFO25vMj
	iRt681rTxQPZBmeVyJmz17/nSaGAj8Pyc5VyPTtcE/rR383PwKN1l6dS/QunsNZrNRyGlOnWeKuRA
	kCfuiWGhiwuDgDPMlEK9twH22mev4Ls3dBhwJDqc00Itx+7saQPQi67rjU/Uu+QXpJJ46J2yhN2q0
	+DnfqQf9JPQFleDctHnaf7NG56giYj9F07sowhy2oyBbjBY9iPAaEa869pP5zvKZi7inJULG9rk6J
	ka6f4RVdShpVZsyVyx0DmgbBjO1qbCPuU01ILol5tuCee1cxEjzBv03ipcILkAXsjAAwq4PKn/dCd
	Vo33LScq1CdNi5y3f7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8I6-00CMgx-HI; Mon, 06 Mar 2023 10:42:02 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8I3-00CMfr-My
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 10:42:01 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 10F4F200385;
	Mon,  6 Mar 2023 11:41:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678099318;
	bh=YxoZwXxfPHJkwtwOK3O1ZHXxIHHrXn5BcsTKXsclbcU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=DGhEdtcemsd0XaJppOdYWQ2p8ksVJ1PKKr2tcQ3SLgLDiRQWgFNTty4NglLJwINog
	 iuPCHcAoR4fqdyJ0D95Myb3yTSYvl23NMdqTpJKdYb7hASWmmIGc8XfKk/y9zqNawn
	 xFP/NXN1rIwKb4lpGOe0HWVWAO3DXe+dyob6G11jZf7Cv1kfb/VbRak8NauAMiAvW+
	 JnMtN+gDZzf0UzdsuhWQU8mvgu92sGA3gp4xTbEbWunurEYGnT3Mfg0PAAo15RveCN
	 nddY+NwmjWU6QOMwiRty4nv0kn91lKCHGUM8HsZ349nvLY3A5kFQ5G0f04z+h/U5OQ
	 UrAUsA2NiMT2w==
Message-ID: <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
Date: Mon, 6 Mar 2023 11:41:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>
Cc: linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
In-Reply-To: <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_024159_920528_678BA10C 
X-CRM114-Status: GOOD (  12.24  )
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

On 06/03/2023 11:24, Marc Gonzalez wrote:

> OF_NAME=wifi
> OF_FULLNAME=/soc/sd@ffe03000/wifi@1
> OF_COMPATIBLE_0=brcm,bcm4329-fmac
> OF_COMPATIBLE_N=1
> SDIO_CLASS=00
> SDIO_ID=02D0:AAE7
> SDIO_REVISION=0.0
> MODALIAS=sdio:c00v02D0dAAE7
> 
> 0xaae7 = 43751
> 
> Isn't there some overlap between:
> include/linux/mmc/sdio_ids.h and
> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h ?
> 
> Reference used: commit d2587c57ffd8dc
> "brcmfmac: add 43752 SDIO ids and initialization"
> 
> Looking at all the occurrences of 43752 to insert a 43751,
> could someone comment whether this looks reasonable?

Obviously, the commit message would have to be rewritten
for a real patch.

> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c     | 1 +
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c       | 2 ++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c       | 4 ++++
>  drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 1 +
>  include/linux/mmc/sdio_ids.h                                  | 1 +
>  5 files changed, 9 insertions(+)

This code (vendor upstream?) is probably relevant:
https://github.com/StreamUnlimited/broadcom-bcmdhd-4359/blob/master/include/bcmdevs.h

#define BCM4362_CHIP_ID		0x4362          /* 4362 chipcommon chipid */
#define BCM43751_CHIP_ID	0xAAE7          /* 43751 chipcommon chipid */
#define BCM43752_CHIP_ID	0xAAE8          /* 43752 chipcommon chipid */


#define BCM4362_CHIP(chipid)	((CHIPID(chipid) == BCM4362_CHIP_ID) || \
				(CHIPID(chipid) == BCM43751_CHIP_ID) || \
				(CHIPID(chipid) == BCM43752_CHIP_ID))

#define BCM4362_CHIP_GRPID	BCM4362_CHIP_ID: \
				case BCM43751_CHIP_ID: \
				case BCM43752_CHIP_ID



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
