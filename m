Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ABEC433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 21:32:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE214207EA
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 21:32:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxNzSHMq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="rHYnDWAN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE214207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rere.qmqm.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yFeBkFJzm0d6ML6Y27qI967yrwbGQJmCr+p5R8VrfgA=; b=hxNzSHMqe8HKPN8+FXYZVoyn+
	bIraLEzFvRibsj8i1GKdUDFkUjsYzIfbxZOyN6yYXVibPGM0Vu/8kM7WjiG/VgWES4TaIB0SNTU0l
	ycuxDxqxczukBuoTG3iF3967phpvEjDT/GT1EnKF8JV7Vc4BJ64N/e62cLoUD17D4z3Ek3vp0/mef
	3mC5ms4RWIsaoJs2ccIal+GAW8GgI182pl2+cytR95jU2YbSyrHQxTKL4ZFsrk7uyjnP6KHL4O7l7
	VPi0YzCGBxDdFr2icn3HVDoyRfr7sZI/jVeANWsWqG8hU+ImnAllXmzScT6kEay9iLmnuI0/yuRYB
	JpNC+PBMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDaMy-0002Yp-Uj; Wed, 02 Sep 2020 21:32:41 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDaMw-0002Xs-Df; Wed, 02 Sep 2020 21:32:39 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4Bhcbd1b8Vz98;
 Wed,  2 Sep 2020 23:32:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1599082353; bh=GDacUcTntXycW3HLTxPt24O1o6lCFXAi5egUm6GCp7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHYnDWANlv95qPZreUCEccYzoc77bbn+WHcWLJBhy6sn2k0K4siHC9hoVsg+/+rOT
 zpJN1ArAy6bRh8O8FYxl6b/YXBF/SfufJWDOIjWLCmRkcKf6/Q198a+VlFWD/9SIEt
 s2A8OY2emLgL0NZ0+IO9zWHcTD2D3VMSd8/XI8WiPTH9wx3s/Ox7PMcYFv7OoKe22G
 CWJfP93yPUm3WmdRyzoWFdXNAQYiefjsgD9XqWJgJpRDrTYgw7/+C1dlKP7E7+IAYp
 QXUAyzBTUSibrhBWvSWkJpT/Y6kx5cNKggPC19kRufrVfbMXvq8l3UrS2OKWbIV5mH
 osyOa4JHgkY6Q==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date: Wed, 2 Sep 2020 23:32:27 +0200
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 11/11] mmc: host: Enable compile testing of multiple
 drivers
Message-ID: <20200902213227.GE1624@qmqm.qmqm.pl>
References: <20200902193658.20539-1-krzk@kernel.org>
 <20200902193658.20539-12-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902193658.20539-12-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_173238_571790_6F08EA2F 
X-CRM114-Status: GOOD (  12.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Scott Branden <sbranden@broadcom.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Sep 02, 2020 at 09:36:58PM +0200, Krzysztof Kozlowski wrote:
> Multiple MMC host controller driver can be compile tested as they do not
> depend on architecture specific headers.
[...]
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -178,7 +178,7 @@ config MMC_SDHCI_OF_AT91
[...]
>  config MMC_MESON_GX
>  	tristate "Amlogic S905/GX*/AXG SD/MMC Host Controller support"
> -	depends on ARCH_MESON && MMC
> +	depends on MMC
> +	depends on ARCH_MESON|| COMPILE_TEST
[...]
>  config MMC_MOXART
>  	tristate "MOXART SD/MMC Host Controller support"
> -	depends on ARCH_MOXART && MMC
> +	depends on MMC
> +	depends on ARCH_MOXART || COMPILE_TEST
[...]

You can drop 'MMC' from depends as the whole tree is under 'if MMC' already.

Best Regards,
Micha=B3=A0Miros=B3aw

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
