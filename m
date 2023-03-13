Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE4EC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOMQbxDcG6Ih10cQ3V/hXxPBlgCG9TZzqI7Bl9uRg2Y=; b=dwNr2Fqzp6fgqF
	N85uuQaCbL+cSxLqb1OLjWm5PAaVO+1OaWGJE/1cuCmtP3zKFMYKltgBTtYijZ7Pl8OHQGjpAB2JN
	8zkN5OjqFbUkwVgERAB96aKC42+QRqBgTEys+C9XwXPQRh2HLcObmKAfv8DhQOstsNv1CCCJdHhNP
	fBcNM6bgn8IU8bwR982JQaCWVCEEQPBon5rOxuNblO0xvaeZ254lQaMXyXV3LVypaZnWR02t7PMqI
	+L5wmiDJHNmm8dxvMPO1AvqxteUwoO2NNMMGuEmFyTA7QY8YRvWgy8m3UCFxDLYfad9BYn33oenDh
	ldB6LydkyvTmMikDCh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjam-006Gms-4M; Mon, 13 Mar 2023 14:56:04 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbjYs-006FqM-El
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 14:54:08 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 405B72003ED;
	Mon, 13 Mar 2023 15:53:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678719242;
	bh=UnHZBQTT9hhzAxrNCZK8DTtPY9z8YJna3Q7VPAED7GI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=n/WRreEvMyHnd2toVT02RiQnuM2nVprMx1IRczJrzx1lca7yigeAvnPvdVbNNPPBH
	 ndvqjYWGTmC4pm6APoO/14pWDUyctCiRFGtYtYcsB6LwAp/QSCnLHjpCpgm58rswKQ
	 vh8j+Xa9nC5VyQG4+6dYmXuYVm3rNM/hqvqD9sft56+FEyQRehMhfr4nmSXRjpXMsv
	 yVZw8uh7V4MCpZnXodj+ZMslff5P7ZNhu+zseqBvMtXnyH0X1PKX6Q7q+tw1C7a2Pz
	 NL9lLeY2jPZjYAhoilpvGntAstBw+PgbLnlC9zrOn7L0wi+dFcxYKQA/JDIxyq1e/J
	 J7VeIiqLCU+Jw==
Message-ID: <b76fdfb1-753a-db17-e732-63046a336936@free.fr>
Date: Mon, 13 Mar 2023 15:53:40 +0100
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
 <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
 <da979443-7a99-b0c8-911b-c5a0d21d595f@free.fr>
In-Reply-To: <da979443-7a99-b0c8-911b-c5a0d21d595f@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_075406_694854_126D27DF 
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

On 13/03/2023 15:41, Marc Gonzalez wrote:

> NOTA BENE: for mmc1, in both runs, kernel probes 10 times and fails with:
> 
> [    1.265231] mmc_attach_sdio failed with -110
> [    1.373006] mmc1: new HS200 MMC card at address 0001
> [    1.377242] mmcblk1: mmc1:0001 SCA16G 14.7 GiB 
> [    1.383718] mmcblk1boot0: mmc1:0001 SCA16G 4.00 MiB 
> [    1.387257] mmcblk1boot1: mmc1:0001 SCA16G 4.00 MiB 
> [    1.391912] mmcblk1rpmb: mmc1:0001 SCA16G 4.00 MiB, chardev (246:0)
> 
> mmc_attach_sdio() fails but mmc_add_card() succeeds anyway...?
> Confused.
> mmc_attach_sdio() doesn't call mmc_add_card() if it exits prematurely.

This might be because mmc1 and mmc2 are of "different nature".

[    2.083053] mmc2: new ultra high speed SDR50 SDIO card at address 0001
[    2.093918] CPU: 1 PID: 35 Comm: kworker/1:1 Not tainted 6.2.0-rc8 #300
[    2.100464] Hardware name: SEI Robotics SEI510 (DT)
[    2.105296] Workqueue: events_freezable mmc_rescan
[    2.110038] Call trace:
[    2.126856]  mmc_add_card+0xfc/0x2d0
[    2.130392]  mmc_attach_sdio+0x22c/0x3c0
[    2.134273]  mmc_rescan+0x258/0x2f0
[    2.137723]  process_one_work+0x1cc/0x320
[    2.141691]  worker_thread+0x14c/0x450
[    2.145399]  kthread+0x10c/0x110
[    2.148591]  ret_from_fork+0x10/0x20


/* below message from call_driver_probe() getting ENODEV */
[    2.152299] mmcblk: probe of mmc2:0001 rejects match -19
[    2.176589] YO mmc1
[    2.180263] YO mmc1
[    2.183937] YO mmc1
[    2.187621] YO mmc1
[    2.191299] YO mmc1
[    2.194972] YO mmc1
[    2.198649] YO mmc1
[    2.202326] YO mmc1
[    2.206000] YO mmc1
[    2.209674] YO mmc1
[    2.209687] mmc_attach_sdio failed with -110
[    2.318954] mmc1: new HS200 MMC card at address 0001
[    2.322515] CPU: 1 PID: 20 Comm: kworker/1:0 Not tainted 6.2.0-rc8 #300
[    2.329061] Hardware name: SEI Robotics SEI510 (DT)
[    2.333892] Workqueue: events_freezable mmc_rescan
[    2.338635] Call trace:
[    2.355453]  mmc_add_card+0xfc/0x2d0
[    2.358989]  mmc_attach_mmc+0xf0/0x180
[    2.362698]  mmc_rescan+0x280/0x2f0
[    2.366148]  process_one_work+0x1cc/0x320
[    2.370115]  worker_thread+0x14c/0x450
[    2.373824]  kthread+0x10c/0x110
[    2.377015]  ret_from_fork+0x10/0x20
[    2.381265] mmcblk1: mmc1:0001 SCA16G 14.7 GiB 
[    2.389945] mmcblk1boot0: mmc1:0001 SCA16G 4.00 MiB 
[    2.391199] mmcblk1boot1: mmc1:0001 SCA16G 4.00 MiB 
[    2.395897] mmcblk1rpmb: mmc1:0001 SCA16G 4.00 MiB, chardev (246:0)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
