Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB26BC6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2GY9ztcDMfz7OU2xM4LBtMjnFCF3juQAeqxUM550tc=; b=h5+em7qV4k7ymg
	cTaZ447cJ2l9Fgz09DpPa0AlYs0/ReeWs4EufG3wXCU26wEMPxNweFUsrexeORH2rKFGUIRHUb03o
	YhlmbPrHXw/nECfZxSwcYGPaElMzm3szl/zZM8fqxeosJHg2YTEiyTsfSRAas3tBJkZbN3msWX1iZ
	pIhR5yrC6aA7omld4MwS7KYkkvgC1oagw9q84WGTpKAyPeKlvmiL5mW5v8eF39xyyBgQIWwTFCOqi
	Eboi4jNKEU/JyZGJ5hNNN1rigiy7kCXzCKU4wqAhoMrbFr9rr4/GGQxz5svpRWKTblMv0f+pYMwlu
	nhB6Bq8yibIKVUcf4GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiee-0060ZY-Mg; Mon, 13 Mar 2023 13:56:00 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbiea-0060Ym-8y
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 13:55:58 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0F5F92003EF;
	Mon, 13 Mar 2023 14:55:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678715749;
	bh=4rdaoH3eEZKr87H7nHx4rrtPi6j7OD3G/xQau6YSaVs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Pogyvdw/s2rfbw/fF9jZk39okfiK2+55oA3No+mL60Fgc1xV/Ba/4PlS5PHCeVysR
	 4d8dAL4oVp0Qe3sy7KHvEV+LFlPZ/hUY5ueyEnuTL6T0gRsCIL5vaBrvcBvemgd3kQ
	 Ma82cSGimEd3fugLZFQtIDIIxtRz4M3R5vDL+ZM6NQFvUyfOV3dUWYkbPpeks45k2N
	 CUBEq/ux/YeAqLIhtm1OKqeQfCWORe6s/sMJQ2epRj0qknEXdAB2fT306UHNqMUSpJ
	 3On7/kUd8laG1uGO/1zVQTg/Q69XTr//0PNklutkMG3FNutU8Vmy4eYdr1tV/y1at7
	 DUKDdlhrtG1Fw==
Message-ID: <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
Date: Mon, 13 Mar 2023 14:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>, Pierre-Hugues Husson <phh@phh.me>,
 linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
 <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
 <e5baf73b-3b9d-1011-2ed9-4b6fc7ee644f@free.fr>
 <CAPDyKFoAT-jMkYb7=m--q_eEb2xxH-VPQy5vaHNvw4s=WiAeCg@mail.gmail.com>
 <0450e34e-7190-104c-832a-150f15f7c825@free.fr>
In-Reply-To: <0450e34e-7190-104c-832a-150f15f7c825@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_065556_796413_3D28FFE9 
X-CRM114-Status: GOOD (  12.74  )
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

On 09/03/2023 18:51, Marc Gonzalez wrote:

> On 09/03/2023 15:29, Ulf Hansson wrote:
> 
>> To narrow down the problem, I would start by preventing the WiFi
>> driver from being insmoded. To make sure it doesn't affect the SDIO
>> card detection process.
>>
>> The point is, the SDIO card should be detected properly, no matter
>> whether there is a corresponding SDIO func driver (WiFi driver)
>> available for it. For a detected SDIO/eMMC/SD card, mmc_add_card()
>> prints a message about the card in the log during initialization. It
>> could look like the below print, for example:
>>
>> "mmc2: new ultra high speed SDR104 SDIO card at address 0001".
> 
> OK, I built the WiFi driver as a module which is NOT loaded at boot time.

Still trying to bisect this heisenbug into submission... :(

So far, I've pared it down to mmc_attach_sdio()

When probe WORKS, mmc_attach_sdio() returns 0.
When probe FAILS, mmc_attach_sdio() returns ETIMEDOUT
via mmc_send_io_op_cond(host, 0, &ocr);

Wrapping mmc_send_io_op_cond() in a loop
makes it work on the second try.

Would appreciate additional guidance. Am mostly stabbing in the dark :)

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
