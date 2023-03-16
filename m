Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1765AC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Mar 2023 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/F84jiscYiBOgm3QG7Ldr9nrjptlXpvWBT33drN0lQ=; b=0dp6FmLL4E+zJ2
	QqMaK4rCjm0kv330hdnTgBHd1P0YOUG46Ocx734ERroTdHZfkwux3QJJ538lysm8jDNRtzRCKVRpC
	EQRrVSZE1Mc41Oqrxpg0bJMwYecenzg511ozn8xH9cwzcgsEMJRsPPy17QFw6LZw/ZGMhBGl4wLOe
	rgyWml1+QrkYKqzoNqPWDHDwB3Fxm+T5/Zdnuq31ecGIQWJFMUPsXbCGR7hOOeLAHgoyGVCsGiVPv
	/iSelnPlt7cC+rVPRGlk/FCb588FPeiU4BCXuGb8JwWYzSwNB8rk2xm9cyrMyljinlT4w5hj05ILQ
	ElacVmjENJEaqV2sCoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnvg-00GZwF-2N;
	Thu, 16 Mar 2023 13:46:04 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcmmM-00GOzI-2z
	for linux-amlogic@lists.infradead.org;
	Thu, 16 Mar 2023 12:32:25 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id AF2F32003E0;
	Thu, 16 Mar 2023 13:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678969936;
	bh=7sByCZQonxzhEDH1I+lansujnbSB/8bL/D+4bF4ipS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Mz5OTwzumY8eM0GX0Rr3NJGStsNfL2fIjqZpzD6k6IjaJtslpnswQh+pBfHEAXtuH
	 ouYMnm7m6nLeNSiXyCxH8pmkcvSFmI7EQZHNDwr1QXqdSb4zZ3fuNV7wCEu8nJ5C5i
	 GqYiIZbdPSx5tPhWLmOzUdArqRVLk1DRFSAhjFzV+WkS88SerVNU0EhP0z8gJ5TCt5
	 Ia9lux1JvYaVwEE/VpNAI+R+CWB9WFzVDg9ApBpOn1axojWCmlNPGy/tknAUC5QL0w
	 0z/7nK3RHoLj06nSqrNDJilUoF5KOfzSehRsJQj/xGNJ3ZoPtI1P2xPXHvjDNA8lHm
	 lpfa5nkKD8T8A==
Message-ID: <36feb359-e59b-d28a-8651-3178b37eccf7@free.fr>
Date: Thu, 16 Mar 2023 13:32:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>, Rong Chen <rong.chen@amlogic.com>,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
 <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
 <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
 <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
 <15b12187-abcc-b77f-6538-ffae5988bd2b@gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <15b12187-abcc-b77f-6538-ffae5988bd2b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_053223_415886_5C98090D 
X-CRM114-Status: GOOD (  11.26  )
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

On 15/03/2023 22:14, Heiner Kallweit wrote:

> Let me ask few more questions:
> 
> You said that the issue is with a SDIO card. How about eMMC and sdcard,
> does the issue occur for them too?

I have never seen an issue with eMMC not probing on this board.
(I have not tested the SD card slot, as I'm using it for serial.)

I did a (probably silly) test by setting mmc->ios.power_delay_ms = 0
in the driver, and logging relevant events (for timing).


Here's a boot log where both mmc1 & mmc2 probe correctly:

[    0.879968] >ffe03000.sd
[    0.880320] meson-gx-mmc ffe03000.sd: allocated mmc-pwrseq
[    0.891604] +mmc2
[    0.895179] -mmc2
[    0.896873] +mmc2
[    0.898829] <ffe03000.sd
[    0.951755] Q
[    1.049162] >ffe07000.mmc
[    1.049602] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
[    1.061378] +mmc1
[    1.061666] -mmc1
[    1.062841] +mmc1
[    1.063532] <ffe07000.mmc
[    1.072056] Q
[    1.079669] R
[    1.123210] mmc2: new ultra high speed SDR50 SDIO card at address 0001
[    1.193650] mmc1: new HS200 MMC card at address 0001
[    1.198553] mmcblk1: mmc1:0001 SCA16G 14.7 GiB 
[    1.205777] brcmf_sdio_probe_attach:  AFTER
[    1.209853] mmcblk1boot0: mmc1:0001 SCA16G 4.00 MiB 
[    1.211218] mmcblk1boot1: mmc1:0001 SCA16G 4.00 MiB 
[    1.212254] mmcblk1rpmb: mmc1:0001 SCA16G 4.00 MiB, chardev (246:0)


Analysis for mmc2

[    0.879968] ENTER meson_mmc_probe()
[    0.880320] meson-gx-mmc ffe03000.sd: allocated mmc-pwrseq
[    0.891604] ENTER mmc_power_up()
[    0.895179]  EXIT mmc_power_up()
[    0.896873] ENTER mmc_power_up() => premature exit
[    0.898829]  EXIT meson_mmc_probe()
[    0.951755] ENTER mmc_attach_sdio()
[    1.123210] mmc2: new ultra high speed SDR50 SDIO card at address 0001

mmc_attach_sdio() is called 60 ms after entering mmc_power_up()


Analysis for mmc1

[    1.049162] ENTER meson_mmc_probe()
[    1.049602] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
[    1.061378] ENTER mmc_power_up()
[    1.061666]  EXIT mmc_power_up()
[    1.062841] ENTER mmc_power_up()
[    1.063532]  EXIT meson_mmc_probe() => premature exit
[    1.072056] ENTER mmc_attach_sdio()
[    1.079669] ENTER mmc_attach_mmc()
[    1.193650] mmc1: new HS200 MMC card at address 0001

mmc_attach_mmc() is called 18 ms after entering mmc_power_up()



Here's a boot log where mmc2 *DOES NOT* probe correctly:

[    0.875868] >ffe03000.sd
[    0.876196] meson-gx-mmc ffe03000.sd: allocated mmc-pwrseq
[    0.881407] +mmc2
[    0.886832] -mmc2
[    0.888544] +mmc2
[    0.894688] <ffe03000.sd
[    0.901587] Q
[    0.908937] R
[    0.913466] mmc2: YO no device WTF
[    1.042609] >ffe07000.mmc
[    1.042910] meson-gx-mmc ffe07000.mmc: allocated mmc-pwrseq
[    1.053460] +mmc1
[    1.053694] -mmc1
[    1.055039] +mmc1
[    1.056956] <ffe07000.mmc
[    1.064126] Q
[    1.075205] R
[    1.197676] mmc1: new HS200 MMC card at address 0001
[    1.198337] mmcblk1: mmc1:0001 SCA16G 14.7 GiB 
[    1.203947] mmcblk1boot0: mmc1:0001 SCA16G 4.00 MiB 
[    1.207858] mmcblk1boot1: mmc1:0001 SCA16G 4.00 MiB 
[    1.212593] mmcblk1rpmb: mmc1:0001 SCA16G 4.00 MiB, chardev (246:0)

In this instance, for mmc2, mmc_attach_sdio() is called 20 ms after
entering mmc_power_up() and CMD5 times out (probe failure).


> Then you mention "too soon after reset", but add a delay to power-up.
> If the delay would be needed after reset, then shouldn't it be in
> meson_mmc_probe() after the call to device_reset_optional()?


The first mmc_power_up() is called from:

[    0.916446]  mmc_power_up+0x2c/0xe4
[    0.926186]  mmc_start_host+0x94/0xa0
[    0.926197]  mmc_add_host+0x84/0xf0
[    0.926205]  meson_mmc_probe+0x374/0x3f4
[    0.933086]  platform_probe+0x68/0xe0
[    0.940159]  really_probe+0xbc/0x2f0
[    0.948008]  __driver_probe_device+0x78/0xe0
[    0.955080]  driver_probe_device+0xd8/0x160
[    0.955087]  __driver_attach_async_helper+0x4c/0xc0
[    0.965689]  async_run_entry_fn+0x34/0xe0
[    0.965699]  process_one_work+0x1cc/0x320
[    0.972847]  worker_thread+0x14c/0x450
[    0.972855]  kthread+0x10c/0x110
[    1.018906]  ret_from_fork+0x10/0x20


The second mmc_power_up() (prematurely exited) is called from:

[    1.061686]  mmc_power_up+0x2c/0xe4
[    1.065136]  mmc_rescan+0x18c/0x310
[    1.068586]  process_one_work+0x1cc/0x320
[    1.072553]  worker_thread+0x14c/0x450
[    1.076262]  kthread+0x10c/0x110
[    1.086528]  ret_from_fork+0x10/0x20


I'm confused about device_reset_optional() vs mmc_power_up().
Do they both reset the controller?

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
