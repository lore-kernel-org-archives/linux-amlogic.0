Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE54606A33D
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3qQ6QShC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=DwelXj2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pjXHufRxNap9AvPpYGoU3DZkKHjDLZTkoY0joved+1c=; b=3qQ6QShC96YRMw+Tf/Xn5OhW+V
	epRt0XvZUJRcTNNgZeoWpQ6xdoH2v9MlExFuuOv4Wvs8o5hOfO7cWT7Gy/CeDLgfq7Hfx4joUWWBX
	teRRYS3QD51niuE5gPnuIlmVnpSvKiEIYbVtanVzYC6U9XBW2E73zgMqcWt4I7O1b/lVMU8Wr1vZF
	ISe5dr13rAaSrNcWQEEKy8AoSbDR5xmufRNmHTQfBkyYfauOV85ubK1IGUaw2q2nSFXmjGspVmYdc
	OEhDlGxq8Rh85SrU/Y0JY07SvJRNxEJCZVijlzDo+krc83snY3ZZHAKvdd7MfglNbKyOdaLNSDp+R
	fPXNNWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEcL-0000000AIcH-0Lsu;
	Wed, 25 Nov 2026 15:09:05 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEc1-0000000AIaj-1gGU
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 15:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=j5WS
	HF96nKodvhrZlDzmgM50kjWquzlJzGWnJzYvtHs=; b=DwelXj2yeMhW0OjANYw+
	l1Seg4y1ORKWxjsmdYbitbYB/uB1b//e8z24C6e9pIqrLOoptN+gYqAPFZYwU5uR
	YoVp5DpD9PktyL3ZY7CbCk6CxjxhYeJ6dc4xOubAHsG4YssrApDBtrdx4gd56V9Z
	4q9AGZtEDHz3LGKjHtZ5EnHV/ipb0hzBAxExVNK+xzTTnHME6EXIJWtnBC6HNRT3
	Wjpq+YXghOLxvjtKj/bvpdMk7+8zxhe/OfkodwQnF+tf9W9xlsOZmPc5UPeObbTY
	QVwTDmPDUBrfbRIvkUwX23wTxUVMuYlDnUc2BavH8zwKPmoUMWR9ZLKoGJacM5EF
	9Q==
Received: (qmail 995227 invoked from network); 25 Nov 2026 16:08:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 16:08:39 +0100
X-UD-Smtp-Session: l3s3148p1@XUmlMxthFqJtKXCX
Date: Wed, 25 Nov 2026 16:08:38 +0100
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lee Jones <lee@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Al Cooper <alcooperx@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Apelete Seketeli <apelete@seketeli.net>,
	Aubin Constans <aubin.constans@microchip.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Cavium Inc <support@cavium.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Georgi Djakov <djakov@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Jan Glauber <jan.glauber@gmail.com>,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Josua Mayer <josua@solid-run.com>,
	Juha Yrjola <juha.yrjola@nokia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Phil Blundell <pb@handhelds.org>, Pierre Ossman <drzeus@drzeus.cx>,
	Pramod Gurav <pramod.gurav@linaro.org>,
	Ritesh Harjani <riteshh@codeaurora.org>,
	Robert Richter <rric@kernel.org>,
	Samuel Ortiz <sameo@openedhand.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Tony Lindgren <tony@atomide.com>, Ulf Hansson <ulfh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 00/13] mmc: Assorted bug fixes across MMC host drivers
Message-ID: <awb59uLiTOEfLaSm@shikoro>
References: <20261123191703.179283-1-lee@kernel.org>
 <OS3PR01MB65968B3C9FD48C0A7515AA1986432@OS3PR01MB6596.jpnprd01.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OS3PR01MB65968B3C9FD48C0A7515AA1986432@OS3PR01MB6596.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070849_941947_E27601CE 
X-CRM114-Status: UNSURE (   6.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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


> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

I plan to review the Renesas related changes early next week.

Thanks!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
