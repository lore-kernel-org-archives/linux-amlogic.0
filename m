Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FF606A323
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Nov 2026 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G3wzq+mz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bSc0tph5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ohn/8CyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+8gtT09vosplncej0Dt96KLzkt+3d8koRSa+mOiYcIs=; b=G3wzq+mziNP4nfQ1f+3zqZGaAy
	EWJY8whCj51x6SPOcTsUAhi/Z6lR6gWDTuA1zx2UPTflZeAQBSWCC/wOMwsdDMbMXtYtWymsRWDqY
	lclqd9Q3+wLD7T/oIdgDAm0Dk2l7AGKB7XzAXx02l0SdVKcJAr+MNW84RGFEmQa3IofuogK2B+JHL
	F/Ecfbjb+/VuNI/pEH5JGmYJAv+RNqyzqGuLlzt9ugv/88IQG8unxxdPGYbcRHxgUHyum4c7zTsg0
	9EByPLRv7Nv4G/2pPN0kcNpODMd3BF63Uo4ndNeGXltXdqroVd60+KEW2Z055rd35gr23651w6oCV
	XtwJ67mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGhD-0000000Aiw9-0FYc;
	Wed, 25 Nov 2026 17:22:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGh9-0000000AitA-3kqs
	for linux-amlogic@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=; b=bSc0tph5zviWPDAqLdgTIlQV/Z
	kjGx6nt23FAg88dh4sYUE5bndJimi4dEokLff5LlXPhHwK5sdjy7yRWgd/UGhRM+KCGmJW7o/rqYI
	udmBcNTE6qANq43HexggWniFl1VOq1wDmsKL6C5HBcYHpPU2ZV1QOunu4ENzfBw4faKm68qsx1OxB
	x8Ege9kVms+a+7Vr12g8NZqD72uvPHNQ0QUrZ6HyhO1qhCOl+2nXjppik+z9iiTPfAZdytu1o53I2
	ZD16DHcbAM66k8uG/IKt1fEgmxNMdq3G0mDa4t9a7nt6XC/sW0cybVy7l4ALoGB5/eXQ78AQTbDM/
	B7C1Ur2A==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFrb-00000005X0A-2hH5
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Nov 2026 16:28:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4b467581b98so58636505e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Nov 2026 08:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624133; x=1796228933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=Ohn/8CyErTc6W6F1aX4RiLbnD5ZPY7LrIIEilMEAvsj4t1WbXgPBZC6TbISNIzHmMB
         aPjwQdFuzYPozg6VBDXgJTehQm+bgbeznR5OFEzeuRoyoVzyF0MHt9Kvka1D5ipVVXWX
         Ls+2laJy3dp7bhifkr1eGTlQHJDgoWTfz8/+NTw48eHqFC0bC5IunF7PlpyRxI1Dnvt3
         H1xVY8RaZyVI8n2UYk9XTXzqf0f1vv1Hj4KbV8pugpYFzAI8gwarVrJs+TYRZh7bga7P
         PwfijkfcfgO5Cbbm+KuwC6bEXf5KswkMB8L1HyrTpSDvd6bJn/KOZF/mocg7wDmIo/q+
         Ng/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624133; x=1796228933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=oyJCitwI/K9mRJQx7zJ/fpee2YvLFsi1+u+VLoQq+eZveEXiltBboWNWIP7UDoCVop
         T5+JjmXxazdegp4u6gAoC98C8UGxKj8eBRsGUpNqUMmRdpAjYF87i/T5/eZLXrBPB56J
         KgMh+V5QH4brsy0m1tET3ILnwF2UzhVDKA4xJadZfk4WFkFX7BDjsJAiCPw080JIEDrz
         qq+LGXWHtKg/MhEYmL2+MuhLFNKV/KjmId+kJThS0oz1d0CPM5R9u0PFNVmTjy30MLdE
         yzFiSBaGjP8GrG3p3ISzsVOYWF4KHPl4Yr1J24XapxgYyTzSkPxR5mnQ6iwOPwtZiTyz
         8zoA==
X-Forwarded-Encrypted: i=1; AL+hErE/xtFRORtge3cCJ96ANsZtdvvq1eng7TxTpYjOPnlx/ylB3c9i8pTlXvyh09T1gprV2qr8fpdAscDmptZr@lists.infradead.org
X-Gm-Message-State: APuU4Z/QeeQUERglCeRi4D46TTu6dpuw5SUWD5zU9//DdmHr1/0DYBWe
	49G3/9KIDg+VnRvn/u0cQqj+mFmUOu91rvXx4pIOrBoQGMvDrSMxgwTtBvuClFEwLms=
X-Gm-Gg: AZFdTZd8UuOGDZxwL6iP1CperEh8IF4JTBU9IRwxB6YSsKWFN0KLJUXGKdmhYC/5YIM
	VRWMg+uCk0halP2KAsG/3tzoIpjzK/nH8agnE54Z9Auu0XmLTZvxlfQHI51I0LiZz3FHnB07iZY
	96DWubZhgyk/wxJsSHDp9bopTrMpY8Sp4HQDJqMpgasJQUM3p2SqvkXOs4WQADxIY/p5WjMMph2
	oI9qW+1R+PcGJMdmMYdCqyu7sJZSXTWgImTopmNFsFjaLVRrvhJ5ODMwvpDgiS7aYeBIO6OEg4A
	/yPFZ14mgogbqdwJUU73gE8vkyoZSpnOOgIP5RoEVtqu2Ax4eBFHQIelBvbt3Y9z+DKj6LqoTA6
	Kk295rJdDpJD7MRPMWbuZ7eHuZhJ7TjavDD5SwUB93Clk6OYiKI8nxfxrGVPl1vQUfXx4xObOMw
	NktIJ39dcWgSeNXQKC3nnYGFUTCRMM+9dWAc82BbSzEkK1UVX3yxrncd0gFb8EA/qyCJbUTL1SQ
	/3Umgnss6Y9A1HXUzJ0xDO0vXmJhfeYY67XawOb/HUCPTByZuOv6bDunpRKQ6s/+8CswDJfUbfA
	kSX+cKyhOyTxrlQMOApgJmGTPVDPPt8YQ/uvI2RliEhAxg==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367217635e9.22.1795624133592;
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:33 +0000
Subject: [PATCH 07/10] mtd: hyperbus: Unify list terminator for *_device_id
 lists
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-acpi-mtd-v1-7-42ad2f645bee@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1400;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=MqS4iZQmtSnMUE+1CE4BRTfcmZv4r/EuEiyu/lunNWQ=;
 b=RjOJCajFiP9KV73PmMUa7M74MYmvCY+UYchwJ0DItvXMOOEvWaLyZVGGPGplnX/bvY7hOn58V
 ubNzVDoXbvxCV3x0jZyFUwCc4fN8Q5ycQmLU63Q+/GExIGSiHODobkY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_162856_623539_FF3F5971 
X-CRM114-Status: GOOD (  17.84  )
X-Spam-Score: 0.0 (/)
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

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 2 +-
 drivers/mtd/hyperbus/rpc-if.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index acbcc3b55d86..bac24d9ca02b 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -255,7 +255,7 @@ static const struct of_device_id am654_hbmc_dt_ids[] = {
 	{
 		.compatible = "ti,am654-hbmc",
 	},
-	{ /* end of table */ }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, am654_hbmc_dt_ids);
diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 9eacc9ec7382..a0917f407d7a 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -165,7 +165,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
 	{ .name = "rpc-if-hyperflash" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
 

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
