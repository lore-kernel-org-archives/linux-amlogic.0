Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158B606A326
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TKZJ8JSE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=mmiSnKt7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sg5cFq5tqxefN7iPWv8QtDnYGRaEk8oyCipiWYly6NU=; b=TKZJ8JSEvEeK4DNv7RT5wIpllg
	KKuvlM0b8hFh3jU1bcRE7oCJtV2LSzwvNJxiST5mjMdRqVcmZeoo5rs+udpFQEzNiFQtFyYvL669j
	87RrljYGsZqaMVKMZRW2YZP81cHZofgeyWZf8Kt7zthxSCIH3H77Ky0Q7rDo8FW92zccB8gBLoPDt
	7i/7STqzXw7jOSHa7usTnJGuNNrWMRGtxHrLiCLdZJrIeuxwEZrGPAWLXj5hdklyDBy2SSzZz7kLt
	OXcC2J2P+IL+NFk3LpqXl2TV9aRnZRly/WSZf20/trLTzoF0zKiELku/UCHhphmeXhoVG6w9Hz1WW
	YqNtMy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmoJ-0000000FKJj-0sWB;
	Sat, 07 Nov 2026 20:14:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnu-0000000FJUT-0aGQ
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 20:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=; b=mmiSnKt7VN6+GPhycFnNvhakQD
	I/0aLWFP04tkvT3DJ4Ju3bFOJvpcnh/XhYRlOJOWgft8kMha2ANT0iUQNsKTj5JgfgxVkK+LUsQu/
	FZr/W9i/D5j508HSA2Y13QYuRD+oybFlOPvLqO+WrZsRUSHbJZtSTfcIhgmqpfBiu3gdgR2FuA91J
	sZXbXRzK1/Q0r3gJyXHNy9+RgZ3yYxGMmWsMfo/MFz91u/9tkks6zDlli+X7hT83nrrbUv/TEoquT
	xx5X9lB8Xd8wDgX9oez4vmszXVy+HOC6MRt7DstGGeV4Yly+Nls4UzohXbtYn76aV0rTFbtKPtg7+
	eeS1g3Jw==;
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPmnr-00000005R2m-0KQ5
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 20:14:20 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad5b52f0a7so7841fac.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082457; x=1794687257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
        b=IMIQg/o+kpL4zC4Oep1NS4ZoKTd/iafIJkhfWJaRawuFQwKzlKAvYza3+JcexEPjPd
         /hrjUwu/GTrUKx2Y/tJRhC/09oE3R6pdzJUo6AkzWyvvziluqKFrpvS6Cy5rhKkMVNLu
         rFbBfv3cnif7Yqu5/RVlxB1+xnCJPQ779yZhjynOmMLJDFSz+Htwf3mMFdTsxqIKhROU
         jRlb2NEEzK3J2lRZgBLA0Hbws2HCuM6YVDvywIaOlmHEv17Q7eKPAuDF29tW26U2Kpq8
         EWt5JHvOvlvNS6QRRzQgs6dvT63pRKjz1TDRaWPmX+mDhwUTwLuGERZG3S/OA4rS88kc
         QK0w==
X-Forwarded-Encrypted: i=1; AL+hErHRQQ2OXsKfmBazLrv+hgRFpeNUvqhcVmlxTKwJjJuFhw4dZ5xNjQt1ZGG+08kqY+YSqW8pH+KRj3NMue+6@lists.infradead.org
X-Gm-Message-State: APuU4Z8tb5IiFor8W3hGSwqqSXAtEPzy5BtoW1V2E0l51XqDdbVEfC+T
	P4Sl/e8MusfrinLCtuNA+EReFK7LeB4okPaen7OIA8w0wk7CzARLgKKcgyNF8Am2eCw=
X-Gm-Gg: AYBFou1IxXtZQmaTQV1zg2mvJaJ9bjkZY/glJs0EE+D4QUaRvKFHiJDUHQ3JgRv0Zsg
	Ou8XXXjO+oTn1lxMFov0AaR0vg9GfPXjmLO8jo9ZCzMH91xXSoz/T/lZquUsVQg6laIYMJOVSW0
	TaAA/u1jXuittVIBbFeOfS8FxpK1zbK6DWnVhxslr5DNzp2nKattI7wobMCUvFgIuoVmZ2exncq
	RGlIR/FbSi1/bpDm3fHm5fky7CDIN4hJbhoevXIvHb3QYCjPUjDi7nqGKZJteHt7jltshpH+Kea
	Jd2Q1eR2RezjyiDFPanYqEKAByaTCgvVFcCFx5gBUZc/pMhQDzb+FJIN8OuhDx17+QmZ0keaKfj
	6OXjIzu0aHVVoBPgpeHNW2KvJAJorltvcoqr7rEURyf1YznXB8gOAjiKkqXfPZzdVMNYYmY+WRz
	KrgMQrbwMGTeg+r9ckbR4WxumXFSvNjnkT/qDJ48iq/uLkRz8MBf0HjeyQgjTWSCFzuShd37leo
	rpy+gITz45332kw+hXa3gunavllrfPncOqfCB8r7IFUUQdU+4gufnGbLO+AGv6uuU8S+tMs9O9f
	CBxUFsw8AJVHWJ4f08es/8TqA0HS5Cl/2GK9SOpEreoAjcmZ553OlQO4Z23iT8XcIgYlMEimoDM
	o9PZzag==
X-Received: by 2002:a05:6871:438b:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4ad98aab859mr3931286fac.9.1794082457245;
        Sat, 07 Nov 2026 12:14:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:53 -0700
Subject: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_201419_007662_00927F93 
X-CRM114-Status: GOOD (  15.84  )
X-Spam-Score: 3.5 (+++)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..39fefd83cd85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2253,6 +2253,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2262,6 +2267,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2391,11 +2401,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2412,7 +2427,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2430,9 +2446,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2449,7 +2465,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
