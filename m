Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D1AC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdyKPHRpuNeXfbrNWjNxZB9jojgeLOaN05K6OX8kJJk=; b=0HZCKLzAHDkBAS
	lmjEW7LfR6Zyc9rAPoUszwMmMQYk44+sjGGIQ6p182yR81w2WKqT90RPaNkm2xWjewQogRjjHGQ7a
	swoxwVE6kWQgMGVj6nqeP7yCZpJq8Ox0ICbaAyPCtjWXug8DVxZR6sK2DWRd6yUFaxVTr16Z1gkVX
	PDzEwG+SC6Bgu5H0mPji8ErRhTEEasgaGPlBWPSLg+g/1hrXVxo81sJEqIBNGYaD57iZVob7yqTtT
	MefZBGLKIRkb22XSevXl1O58H2qDYaXW6szHjT+fNG/k3bGSdAas05kHi9HyNB8jPnn9Shj5voH3H
	pJDW5LS70ObOMHg/zmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7fG-00Are9-2P;
	Tue, 14 Mar 2023 16:38:18 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7f4-00AraI-2f
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 16:38:11 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 83A0E2003FF;
	Tue, 14 Mar 2023 17:37:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678811880;
	bh=ooLFZIh4ulWCiJYZc6yvrTXCsSwnpVuJlixKNRQY1oE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B9487GuR3j6kDpBB3qOrBYwF6FKn4IOPzAaNUzUdpX3Jsr+JU2tFCsol57Ej3fBfy
	 emDip74YRxyfzOIwWOcgqcZ2D13VkEkWhLyfTB3kR988vqTK2KIWmr3z2zgooYTP1j
	 Qww2XjFe4zaP+9/7ddmqUBnG0Adf3MObL06tYNkerN0AlTALt+Ccvy1SOYRjP17r9Q
	 FVVx52RR69x8RXY7yBkUNzBwCyKPI+s8kyET1WSN4zH80O9WaFNTBrkNbdEzYYCJcj
	 RQLyjyR4kao5QOey0Eab2H5ijoe4/ay8EgG0JD1kdZZ27n3pNNvgR3RiCSUNJ25TC7
	 mQRW0ZRkuJYhA==
Message-ID: <893311e7-6fce-118b-a683-6988de161698@free.fr>
Date: Tue, 14 Mar 2023 17:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
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
 <eecb86be-81e3-09cd-8ec7-4e77c42f2795@free.fr>
 <CAFBinCDHRhLSyFsEv7cdhSgZorj-TdR3HhqSBnAQcUtEsecV=Q@mail.gmail.com>
 <6ac1ecb1-eba4-b0a3-579c-afcbe532a474@free.fr>
 <CAPDyKFrC3a5-VP2DvCYGYUzKtX4Jc7cvNQOKfutW0sha=szOyg@mail.gmail.com>
 <c7e48c6f-530b-7198-b8bb-fc927a2fdc66@free.fr>
 <CAPDyKFpJR9rgadXEBn+73FKgmLM8sZgzNbKV_x_udwOSRGH44Q@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <CAPDyKFpJR9rgadXEBn+73FKgmLM8sZgzNbKV_x_udwOSRGH44Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_093807_040754_50A8175E 
X-CRM114-Status: GOOD (  11.41  )
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

On 14/03/2023 12:08, Ulf Hansson wrote:

> If the delay is to manage vmmc and vqmmc, which is somewhat part of
> the generic specifications (SD/MMC), then it should be described in
> the host's node.
> 
> A pwrseq is something special, which is also platform and device
> specific (the SDIO device). If the delays correspond to this, it
> should be part of the pwrseq node.

Uffe,

Wouldn't it make sense to warn, when probing for a non-removable card
returns nothing?

Something along these lines (which I can spin into a formal patch)

--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2257,6 +2257,9 @@ void mmc_rescan(struct work_struct *work)
                        break;
        }
 
+       if (!mmc_card_is_removable(host) && !host->card)
+               dev_warn(mmc_dev(host), "no device found");
+
        /*
         * Ignore the command timeout errors observed during
         * the card init as those are excepted.

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
