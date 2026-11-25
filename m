Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB32606A326
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m6JTpJ/Y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rL50TBMR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1Z+7pS4pENpYpLoW6JNG/uDTAxTLpzzVItJJkPlgrrM=; b=m6JTpJ/Yetffo0inYmHGB44g8p
	brmwayG/1zO3WxqTjBBJ+RmOGBSZxvYoRyJrm3JFvLK7D/ZFzFwLZt4HJ7qiwOkARTiO7JHXJBSU3
	UuXUEl0qaSA+6/4CDGxxQI9kMy6SmNN1xdPJOvYVthvG7HEz7CmforV9ZqdC6FgMMFPHU5e/sey8t
	6Re28AFV+MR5GfM/g+bKU/Duc13Wl75GxbiaoIPbI6OV0EYTQM5g/Znknus1706zwpRNhFuBaJaqY
	itpv7Nt0N6VpoPNnWIw4U7FPizdylkgr7oMk8IQm23d/c/eK4jqdXQPyEz/FToyhtOt0BI60UWlAP
	CxTMCziA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFs7-0000000AYaB-0MlL;
	Wed, 25 Nov 2026 16:29:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrR-0000000AYP8-3h8K
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 16:29:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so53622095e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624119; x=1796228919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=rL50TBMR+CdRxrtlIKePzz1kb9Fj1EyA/NjbLj8ghD2cY+GUc/QSE01MBjAL089E43
         4GZpe9Bc1P6aer0dSaHXGnawgDCE6qAZN2Yij25tKEaI87eGIg6mJvMsADEMTIG9H8Io
         p3pzFGp6OnDIRf6R9ldCaU/1DqF0j/Frj1YeZMz2sINWtnp5nFhxj9OTycxGskhEIAFw
         9FvGyY7bNLdthUR25r3jDsOUh8xf0jqJHZ+yLd0CxgfBY1UreUq/eVMjxjQM1wbwQopQ
         3uHUGH1N3P9PYyS3348hFvCl+jZFXeBuiK4HGLBeEr5C+Om2zg3Lcasx/VZAtEdUxB3j
         gmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624119; x=1796228919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=sods4lghRPN1lKxZ0lg5ESbZbz3Oahjn/fdoSsuAJM36xNFHlhUbo52H1EfXTmsqnY
         WQOEC+fOxQENKl2UTRszmjxGgJ7QsSKojsDtdQFwxbD7TdlNcNmK7gBpOQtQXDKK297G
         ujHFaF9Guo4iafe/iBenTcPTn1QL6ixaILcl9a/Nrss8Nv6WLoc1yCF3/aPpkfXbQvhq
         F67BOIk+Gm6UPc59+t4kfvsRoBO2lRQ38g0uyD/gyBHDaHayIBVZuq9kGJum5s3vPW5n
         7LJurPaY1uYX5qPSRLWcuGvXCTnOEqUTn/CK8j/LD6vpyKPDw3CdRD0gjJJbIbkiOyft
         BBYA==
X-Forwarded-Encrypted: i=1; AL+hErFth4xjmoKoPOCGGJnx8n5k3DAfUOS6Ga7yQvnC4L5qWSWdeNLzYxNDjbRrSYIiKALAl58XBih95tZT8KrJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/FukiH9IXUOdxRzIOv7nS9pA7Nung6NBYovXryNO0cJvqwCYiO
	LxUnYaN1SHDHQbdolMNtXi9itKY5tZ9R8tA2NrgUs4slpK8iWXYLDCvkqMP7LdfkLFY=
X-Gm-Gg: AZFdTZe5NIrL6Zir1rjnZb6MRnho1NxL7TB04Fyc5FHviWICX48FaoOxKB1WS8TfBrm
	wkd4lAgVjEjqeuJfH5ysfyOP9b62nO+MijaT9Bb0DAV8WVLesN65wfuouBk9m4ZzYBApZwIG8t2
	Hhkw9uKAptLMybpdLf36UY8cJ1rJaiUk8MBAYs6Ru+RmCmlsuNr5TAZO/BZTwaUDQOELEZEjlOm
	CAZmKnwbcfDcsJIgf7jyYy6DT60sQH6YyKzn0b/tSvODyaaJ/drBVHAm5cKWKzRn4o7dvLcSXpX
	+XFtsgfS0kq78h5+AZyN9N4ghhfBwQK/lxAdvrJc9ssBaMBLNJSM/v61YZEZjSNxeXTTNZ04vRU
	LhQVHx3HYo96zg8brkzim76IBBdlTx/tE/IqGRsyFPn1fPYvpDZ7B1odY5EsEg2wmI2Y7HtEyFv
	B+nmzIuTohra0NFGOl/IVkJqRCeZn75zX+mtAyLHy+X+QQb1WgFB1U88H6qrOvHu9fydn5uncGT
	8mtY6mtplD5708lHB+hYRRZ/k3bUpUpXvugPce10s3rHts/NGqG38IvaVKfJgrfzaKifEXmAk5k
	LEUiCBiNNQjGt1//DTX9+spY1BcOYeC4++XV3AwlzalcEQ==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr384806975e9.20.1795624119085;
        Wed, 25 Nov 2026 08:28:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:27 +0000
Subject: [PATCH 01/10] mtd: maps: pismo: Use named initializers for
 i2c_device_id
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-1-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=851;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IHAi0qeArnt0Dz3MPX/pMNLkcr4ipLn3XGqru6V8PMg=;
 b=FYYb5NZv5bMag5GUq5jhUZI3EA/wssPu4IODYyOGaefHzIx0GqzM1xxUbS1yXt9hVm+9RShR6
 U7w6XKaTkOyAdXUAkIbyQhY8qzilz1ISb3JVyfa0dct/S0WrrapbtfS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082846_222423_FDB65401 
X-CRM114-Status: GOOD (  14.61  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use a designated initializer for the i2c_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/pismo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index b0310fddcaa3..babb6d367623 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -250,8 +250,8 @@ static int pismo_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pismo_id[] = {
-	{ "pismo" },
-	{ },
+	{ .name = "pismo" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pismo_id);
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
