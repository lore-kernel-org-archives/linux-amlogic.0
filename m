Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10B606A321
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I06kDSo+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UDieDNpa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ItaWz0KaPGMfMKNHo/WFzMPAaWkCv/HxB7CRAqRmrBg=; b=I06kDSo+/elQMJgtj6BoNEQ2bw
	3wvI7SVkwsheSaN4ENch7o/B119vuF3YbFUU6V+JqE+DGQ+RQzDyDV+J4hpKwLAeADe13euGTid1y
	hZAmgtldpcfG6XOrUZUX3WEOlRuTN2ksIG+6usPXow6VrJ6EFRxEhmA7M0zYX+nSlhgKpHGPG8TFX
	uruVBNvPy6UapMR+tO2Zz6ditUXrPAzsYQz/dw3G2XcbjGuNXtHnOpBmxQ0CtUzkESTMEZmNoTx++
	V3zUuQcM4h7QEvn47LD3Z7u5zoo41AoTD3RadqG3XiZQpypKaX1cKTb/QzryL4DE106O90T5X2KYc
	5aKp/XTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdSb-0000000E5Yh-1ACS;
	Thu, 26 Nov 2026 17:40:41 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdST-0000000E5Vr-22f7
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 17:40:39 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-92182125ec0so15197056d6.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714832; cv=none;
        d=google.com; s=arc-20260327;
        b=BQA9Ll0sUJ0hjZjMOKya7QjSQClXOk2EKouqV71VpamHu7FnIx+K5exBCPgQktnNXN
         QVI+vEcDRIJUHUbtTKnfd40UW8WFeHXsJH/y0c0CCBuLxaEVMaVQVZrwgJHa0boWpoJC
         TeqvaoYnJBjWFjkYXdm/b1Poj6gggkAXEr46tkCMXpH7ruz2zovJTVsP3jSGprBIqbaR
         zbuGMllWaZ5lkReuJP3gWRlLReKaZH9iXqHeKNh8NDo2ity3HvWsDfdElAWxVReQ+4/q
         /HF+wlokF1mm8qohr/3CHLNTPRsj45Od4OXImVJeLXs8aUywlmDsrqlGpTuuYEOyMgM6
         7wFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=0prVKhTX1GERD7TOq1wTB/x0wPiONI+NA4DwPGA3pvw=;
        b=VZ5P1IFpKSgewU7QoSliFWInhs5xQTXgHszNlV8UUQc7thBn6cR07Pb8bY4PRxLamh
         OBl+03RitEbc1V7Se0zJJAStMDbnhx447/vK0M4beCdFELfjXc/LyWk85fs4ch1QXIy3
         h+3JVveFEASoYlXUtcihWbzPalPO6IrNftOxfHYo/v5f9SPpKDuuAS1Q22uDQxkFzRYK
         tEcomJFPog6m7EZ3Q0ICVc0oP7yQKgF0WS0Ds8w/e++OB3zMtnbKku6NmbN8o0BgbUZb
         wQy6JTC8RCpdO1AYYDyiChCLcfwkLt5vvCGrA0dVyWtsakZr6iNCOFdyWc/h/TUtP0SY
         mRqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714832; x=1796319632; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=UDieDNpaTBL7/WP5r4ARaKBywa3vKIAdMdWO2TnWCuxKoVfMx6nOncjZ+345Tmj6Fm
         gM9p0R7x0c7O3cnDe/mpYnVz9u/5DRMUrHbBjzWN+jy8sPEDhExiubxIYypgNiHX96pR
         fBc2l2ux7kz9DEIVZOxla5OedMA5ERHFnxnkINb4h/HeYfrvb75NMWRCKf91exv0UKaS
         r/eYaXKSNN4dAmj1VK1365FMyiaNAT1UAEnV6vyaE8YY66kEkPXs53HaDGKwnVhu41A9
         j4cd4/U18xzs+iLxDZbGlwT4Dq6udFTx1lEg1kGoFcmiakiaVrxZlyDi0vkV8YMfrrow
         Elkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714832; x=1796319632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=gzGh6wSBV4sxCf4hlj4dtDkss0r3M8kP4N7TLBvs5E2Iw7nmHFMRcLcblZUCppfw/x
         CfxM1wyUN46lYsbbWs6pe+rNgarNQL384/2eogWfQ3zU31my+emoM7kqeAbpWsKx7d5k
         ynGZkd4DvyX9HIVbH5NnlD0Ta5b037qdPEjp5QA6OiA/S4P6OmM0JbpPx6ltQohQbtCx
         86eDwz/Nu4fFR9SgydfHnujAZ95KS0B3tE/JIKW0HXkLzwvVfrt1V1L4rUJ47GnEhtBp
         V8iw/nrC00Uln5K+HArkN4zHhBv7iA8IItGObIP+7b49br/WBbR81TbUuMr/ECGje7N4
         nD0A==
X-Forwarded-Encrypted: i=1; AL+hErHxOFblIonivoveXhUq8uc6NgRh0Yd9nGOztKYA4oDMj3URgiAP59Oi50ol1f9MBEBCFN8/xymQV3oGieMz@lists.infradead.org
X-Gm-Message-State: APuU4Z+Z6JaJprdRa9ykQ7hlKG0TFvo4F011PkF6IaPQV58FGsMrjusX
	J4eJJxrCUci/ELHbXoG7r9VCJ/cpySmngCw2JOybO/M+T4oL8LfbTe+c2Ijry1Zvzn/DzY6vEP4
	YFfJB9OL4ZStpRa+x9285hQDPP/RngAaBeEhrtiLdZQ==
X-Gm-Gg: AZFdTZfP+a8fiHxMXlzWgxGqZvCRLDDyZHsP6aYXo8Pn3bP7VuUTQwBSXO0X3nl0u1j
	qO3d1QmXtBcStRnkKDhsYWxETceL8BW+CmR7T/gh0jChVTvWM4YUkIEqaKRkPYU5nRXDW0oglJG
	+G/y5onJrWATDxl4PD3Ot97FW2SsteRqa+CK1mpFo/HLbLeBHqZ+twdKq6r9281QGDaIckmTw9v
	4XIdlTws/HnKCSjVUDm7mrSkNd/AucviX3Q589x09lpFGKBqZCx813X6DlyOKoI2RlUZ44CtMLm
	6qIL885E1o/K/UNbsu5XQZNPqAFwNW6Y/C8UY/52OjUt3vBmiUvpCluXuS6sqq0NukgF3XVOneW
	xd8MMjpgtUZoX4AiVTQKSzH9Jj2nA3zUAGa9bhQLGuSjWPNQC9a9FbDo1tfykxZAQIQy8ZAg=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_094033_645871_AA108279 
X-CRM114-Status: GOOD (  10.40  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
