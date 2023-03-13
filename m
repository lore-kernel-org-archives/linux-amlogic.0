Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0538DC6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZ6ClnMSP+A0fnb8FSCVWakiKFJ8wBa8O3q69gYwnFw=; b=T5+goz3wxOK0gg
	1Rv4S+Y+ZHDQza3OXb5OxOLOdZECv/wRVWHnY0Oje9angz17uq1I7YLG8jQq3kpoylwxx/CqcVrrY
	B/DQEFrJ04Mr6FlmTJ/Yb+teF32Pvhq4v/sOX3NhCNR9kN3xFS1TdSDpRzREzHYlVU93tHfVeUNiZ
	9shd3pRC02RYLd06050FZ9f1ias6Gi+8HMTvp+btnxIR9YA5aLiuCQuIfgw2KIJhG18M69x8y47tP
	xI7iinjNbxo8+bNjQoppx/AJo6zKyE9eoCJJ96iZB/+jQGi7TIz+BXGaYa2an6SdDcknlpmfTTwSd
	eLIdghamHo+tiun97Ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbloT-0072kG-Pe; Mon, 13 Mar 2023 17:18:22 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblfx-006zFf-EI
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 17:09:35 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id A1CDA2003EE;
	Mon, 13 Mar 2023 18:09:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678727369;
	bh=smawnl6KcM2cRiLocVN6DhjVtIjFtbYqWrLcYzJtGnY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=rGU7XyHdxIl9sUZUuyqtRcY3SDNWTmlRUZbYeQpRaENyZXPsv8prhAgvhHgDwAdoU
	 rY8mt+SjK4B2P2qu52P0wY6E/f3W18+hdpu/MQere84CXku+d0a34d4zy57Z15APy9
	 +k3xYYOz/+CEnRSciHewGFhpQZHfQxn+CbiI3U710m+ubPKurU7XL3Dp6Ol+y94P+1
	 dfw15qeXtssuGH9832K3TmlbYKVPe7eYUWTj0XJl17Jozw/86NP+1iy0FV3bzJ9syk
	 pLDuruTgz+erHNUjNQwQurZvI/tOOvLndaGWZYdpX/F3t84rvAceMs7Fqa0FWAqr0u
	 bo6WTEq7Ywbcg==
Message-ID: <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr>
Date: Mon, 13 Mar 2023 18:09:10 +0100
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
In-Reply-To: <3d91a067-c9c3-6d71-11a7-1289ea67f109@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_100933_697496_C4EAE21B 
X-CRM114-Status: GOOD (  13.27  )
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

On 13/03/2023 14:55, Marc Gonzalez wrote:

> Still trying to bisect this heisenbug into submission... :(
> 
> So far, I've pared it down to mmc_attach_sdio()
> 
> When probe WORKS, mmc_attach_sdio() returns 0.
> When probe FAILS, mmc_attach_sdio() returns ETIMEDOUT
> via mmc_send_io_op_cond(host, 0, &ocr);
> 
> Wrapping mmc_send_io_op_cond() in a loop
> makes it work on the second try.

Almost there, I think, I hope :)

DT prop "post-power-on-delay-ms" looks like what I needed all along.
It exists both for host (default 10 ms) and for pwrseq_simple (default 0 apparently).

/*
 * Apply power to the MMC stack.  This is a two-stage process.
 * First, we enable power to the card without the clock running.
 * We then wait a bit for the power to stabilise.  Finally,
 * enable the bus drivers and clock to the card.
 *
 * We must _NOT_ enable the clock prior to power stablising.
 *
 * If a host does all the power sequencing itself, ignore the
 * initial MMC_POWER_UP stage.
 */
void mmc_power_up(struct mmc_host *host, u32 ocr)

Calls:

mmc_delay(host->ios.power_delay_ms);
mmc_pwrseq_post_power_on(host);
  => msleep(pwrseq->post_power_on_delay_ms);
...
mmc_delay(host->ios.power_delay_ms);


QUESTION:
It's not clear to me why we sleep twice for host->ios.power_delay_ms?


Looks like all I need is to add post-power-on-delay-ms = <100>; to

	sdio_pwrseq: sdio-pwrseq {
		compatible = "mmc-pwrseq-simple";
		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
		clocks = <&wifi32k>;
		clock-names = "ext_clock";
	};

Will revert all my stabs in the dark, and boot the board 100 times
to check if this does the trick.

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
