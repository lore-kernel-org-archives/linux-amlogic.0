Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B49C6FD1A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 15:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSuImf0PgKxMleG/ZVgTZKal/7cWXDjkidWDfbqdC1g=; b=i1N6d21qvSxUmJ
	uehFjL8AwfMvRaDAo91dHDGhJFYwCgxixeCtyEykdNJReS2dDT8Ge60ELKtoyHwyM35Rq/cV5iL0P
	x0G8M0o3y8m1pC313Pa5O787FfRVw0kvdV5pPWcQ1P9Hsklh2nbYAEar/7e19YcrTN02pLhAwpjeO
	DDEX2XaGpVabkFZtJqD9cHRT9lPIgWmuarfY1crThviZMLNR/1MRq+CtGa8PlVuAUhhu6OG/RB39r
	tWWnmyZrvLxJVf6E6MY8KBrMOfy5BTEfdM2qBcYCLOjJ199Xkv4X2plr8kpo9+LREkXyU6SmtQPLz
	8AYQNUWMTU6PS/pnfsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ1P-0019GL-Iw; Tue, 07 Mar 2023 15:14:35 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYUQ-000sqG-Pw
	for linux-amlogic@lists.infradead.org; Tue, 07 Mar 2023 14:40:33 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5044F200432;
	Tue,  7 Mar 2023 15:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678200022;
	bh=cUlGUlxnrSswLEgVcqajPis8Rc++laPQrrim5zSPy+s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=o7xInn/vkT5pOuWHAPWOKwqulC4OhEuilkTDXRA779CWcQT2wHa5PjewJfve7OUF2
	 3JtSMnOJioljgrYsCL5enpwHMZ8E1sBbqdCIQWAa9ezHULngjEZbyaupG1X0Ploou/
	 QChJD8GJJopUVI0cuNUhuJlc87ec2iqFreliL1bV9IYc6xpRiMgb4lyCZ8eb4fZU2/
	 jQBSBp5Bm1j0MWMJsaanTx9EdH0+qyjgPQNy4Nr9YWHKkMthVWAzS7P38KIzw+S+W7
	 /AKFw69pXNvCpe0m/eEpF1NPgeQ+Shf6wzf/YoXmem3bmEKVaQKWQPTXHyE+YEC3bA
	 0tTiP2mpUbk6w==
Message-ID: <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
Date: Tue, 7 Mar 2023 15:40:05 +0100
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
 <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
In-Reply-To: <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_064031_346436_7991CB40 
X-CRM114-Status: GOOD (  12.11  )
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

On 06/03/2023 11:41, Marc Gonzalez wrote:

> On 06/03/2023 11:24, Marc Gonzalez wrote:
> 
>> # cat /sys/bus/sdio/devices/mmc2:0001:1/uevent
>> OF_NAME=wifi
>> OF_FULLNAME=/soc/sd@ffe03000/wifi@1
>> OF_COMPATIBLE_0=brcm,bcm4329-fmac
>> OF_COMPATIBLE_N=1
>> SDIO_CLASS=00
>> SDIO_ID=02D0:AAE7
>> SDIO_REVISION=0.0
>> MODALIAS=sdio:c00v02D0dAAE7
>>
>> 0xaae7 = 43751
>>
>> Isn't there some overlap between:
>> include/linux/mmc/sdio_ids.h and
>> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h ?
>>
>> Reference used: commit d2587c57ffd8dc
>> "brcmfmac: add 43752 SDIO ids and initialization"
>>
>> Looking at all the occurrences of 43752 to insert a 43751,
>> could someone comment whether this looks reasonable?
> 
> Obviously, the commit message would have to be rewritten
> for a real patch.

Help. I am thoroughly confused... :(


Through the SDIO bus, the WiFi chip reports 0xaae7 (i.e. 43751)
hence the /sys/bus/sdio/devices output above.

sdio_read_func_cis() -> sdio_read_cis() which sets
func->vendor/func->device to 2d0/aae7


But when brcmf_chip_recognition() calls ci->ops->read32()
i.e. brcmf_sdio_buscore_read32()
[ vs brcmf_sdiod_readl() in brcmf_sdio_probe_attach() ]

[    1.177283] brcmfmac: F1 signature read @0x18000000=0x1042aae8
[    1.182912] found AXI chip: BCM43752/2
[    1.186384] BCM43752/2: chip=aae8 rev=2 type=1

Here it reports 0xaae8 (i.e. 43752)

Why the discrepancy?
Can it cause issues?
(Sometimes, the whole SDIO bus doesn't probe at boot.
I am still investigating these intermittent problems.)

Should I use 43751 or 43752 firmware...?

Regards.



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
