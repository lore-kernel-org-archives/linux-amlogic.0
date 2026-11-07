Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7837608D975
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rydWcUQN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fTh8Btlr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMqfloQS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/ZCYt8UVrXxPX9ohYf5AahJrptNJ6o70Hgag+63O+dE=; b=rydWcUQNUDNVb0spTeKdlm/WWX
	JFX7Ufo/VWUweTtAn/DiSbeaQna1AoSHgX3PevzWLCug6Be6Oq+wfldkr4Fwmvmlld9j0hm/sp1SP
	tgH/dKC+bFn8d9FqkLVtFNf56G/S9U97vcHuU6Te5+KGS6IYdJK0MNhD2mriX+KFD6YneOY1XSikX
	lcWVi3rvtQehvKriV0R84SLUbRHe7UjB509K1GCEA+UMI+O+TeTDeOc7HQWW1sLfvUiO/YFHaDirJ
	USoEQmRslTVtIGWoWR51JnEUVQoPiz6ahLeQzFIr6Un2myRJ8iDLQEc61S0VCeZIp71+SFDEvytsq
	DmR/sEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUF-0000000EU5X-2F3r;
	Sat, 07 Nov 2026 10:17:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTr-0000000ETXX-1zFo
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=; b=fTh8BtlrmWsLVbROaDZqxigTV1
	3VxrUy44IrQePHMjJ5m2uxGY8hPVmiMz3CQxn5a65Qf3h7gpg1sXhZ9cA5aTX0URrgWfG7heMoVKw
	mkD7CUzWQBwoE+BZUka6k1ZgM+Ysw6gtnw5EcaInVQkY/zGIaVn+rQ+9fAkN0hkR+13oYp99CWpBu
	ZqcPHCYKQS/9fGNc7XQ9/vK84ZsEC2TgjVxWs7f/DHWj3tmf81nldTdSY1nBxxqI9J32tE2h/moG2
	T9IE91r2AJCL/jwB73Awd/ZNXk4reAxTR1Qs5PXRwoj2Bu29OOQexC/qzula2Bnr2v/1fufIfDTdA
	vnVPhMOQ==;
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdTn-000000057jQ-1ttM
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:02 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1881664a34.1
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046617; x=1794651417; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=;
        b=bMqfloQSnUN0Sgh+ZeZkaOLugIjswY3+OloNKlZZqQvDc82UwyqTNhA3stMLzczv/N
         goixVAZy0JJBpeCnUZjr1warNuqMi8PGWudju19k1/y0mEMsjKnGK/CIZFrTC6rsDLYR
         XvlW9wDaWfjLrg9ZciMgV94wygdmsjB/zaAHsbOf6sYkcOS+WzpCZeaKZS9AnU0Exwe0
         H2bAz/DNjtFaIbWUHeH7sE3wG0muJCimhzN54xDP7vSdEC9EQEfjO3Jp6wEMztIUTQUP
         oKndCLRDz5l4k78KPn4XhWEo5YuVYgmK+t7IjAD9pnGtHjICHM2Cx8dfmIXV25/XOOkh
         h8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046617; x=1794651417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ib7/4t+CqeW+ELFBrguCKORu8M1jUc2Wnk+ciSZCkkU=;
        b=le8xLcFSjqSMnwNmQR6bni3rV8OccR+F6K4lgD6JIsy0hoP9ir6Gm3VbfF88fRbKAJ
         Kiks2BfdVBm7RFESqJwfhDxCNeeg2kJRAaiRi/ca/40cye2IZEI34hUm81LYfYJaarQa
         thmereeNjjlgg7lvt6NgyLR+/ubW6G55XaxL+iVMxQZ8yOWJMUpQRidYnbuDbL0XOUcQ
         D/4MOvTaOW7oryYB0zVJqIry2B+on7LiHo7JZw4/ApYmtfSswIY8oHZGWU/V4lVzsmVg
         qP7nswz9ZarhdlkvloL1Oa5ZN9tfLUzVZRNuovTG6uoK4XdranHwvfiuBh0c6JIKyY37
         COwA==
X-Forwarded-Encrypted: i=1; AKwUvBxtY31rwkFvX5+Sb3BLSv9SD1OSFZinn/PI1VznLP2/G3asvC0KY1mcXAxga3GCHhu1rX138Ix0exN+hCEF@lists.infradead.org
X-Gm-Message-State: APuU4Z+uEFUxp6p8NWzqzO1OENtZ4lp+mlw+o+qKO21lf7lPXJ9vnYyU
	VtkXK9/fjBOh2DAHq+L3v91x2n64M1HAeiOVH1V+FazuQ23tPS/TWHqT
X-Gm-Gg: AYBFou3zNnQyy+HE4lxeZlWR69MOeP+9kT6+XTwJOvw9js0av8X7uuRYK0YxrUhHv8W
	uG0kUH6G6U7palpTyWkcJixE8yVFlvu+afIhfI/pFbJT4JYLErmReJmKRgu2ZXwsxF7RrfLSl7o
	noKHpbEZuR8gxRTjbiUB6/CLekpN+4iHYT67YpRJ/7v3GfIbVQ14kD6V16/nh1pAcwnPQlLRT5y
	4bK/AdeHZNSuMYSQG2uJU+tzgZdmKgDKElgt2B2OWhDB/RP0CnNnqekd8Itl1aXJSUtzoIuqL7S
	fY2Iv/PIYWwXTQiUEB3DEpQ3oph0exlKenYDEExhkU/uOozXDMvpQj+euMJA1Dscle6EQlrAi/i
	Jf/A9Vd6g7AcfPPyomMmj5oX8MCJ0gc4v2KmpCzVRFSL/OWnE65PzXt5fmElsDknnCbhRNtepMI
	8/PEKNSpWVRZFelCg21Mb7CgmfWnghHFv3V0UZXn+JhxinTZDYJCZV+qzEAPyUTYEJa51Rq8QOV
	N0vm3Rg7c0WWHqwtlMfTfLb0HARZflDdlQKcRoUUjwk123Dp/qVabcb6zxvhOMntO1mv91is/HN
	GFViQaxHA2dIZc227GbQBPMFhDg1Z2OuaAnzVfViy7KsSJshfYUoAVo7wSb0MtFvPqhuhs6eHWI
	A/YidSyrgftWDjPGxBY2tigRfzxlVIKc28MWKSR+RH/oF9vfQAn/eJ30SwR0H1Tq50RHvDNdXOy
	A5jl5PYJNnmg6nVuqs5H6XqdGIFF+7jQuVu0kghI0mNVIr0FxkMRlc
X-Received: by 2002:a05:6830:310e:b0:821:d65d:37c1 with SMTP id 46e09a7af769-85f1d102bf6mr5942686a34.25.1794046616620;
        Sat, 07 Nov 2026 02:16:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:08 -0700
Subject: [PATCH 11/58] mtd: rawnand: denali: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-11-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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
X-CRM114-CacheID: sfid-20261107_101659_401910_5202E151 
X-CRM114-Status: GOOD (  20.80  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both Denali frontends allocate chip and controller objects with
device-managed storage that disappears on unbind even when MTD
references remain. Give each chip a retained lifetime and a reference to
the controller, and keep the initial controller reference until IRQ and
mapped hardware resources have been released.

Unregister and disconnect each chip before disabling the controller.
Remove its list entry before dropping ownership, and use the same
release path for partially published probe failures. Denali chip
initialization now consumes its chip allocation on both success and
failure.

Fixes: ce082596ae43 ("mtd/nand: Add Intel Moorestown/Denali NAND support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/denali.c     | 31 +++++++++++++++++++++++--------
 drivers/mtd/nand/raw/denali_dt.c  | 21 ++++++++++++++++-----
 drivers/mtd/nand/raw/denali_pci.c | 15 ++++++++++++---
 3 files changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
index fa2439cb4daa..4525cec3cae8 100644
--- a/drivers/mtd/nand/raw/denali.c
+++ b/drivers/mtd/nand/raw/denali.c
@@ -1176,6 +1176,12 @@ static const struct nand_controller_ops denali_controller_ops = {
 	.setup_interface = denali_setup_interface,
 };
 
+static void denali_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct denali_chip, chip));
+}
+
+/* Takes ownership of dchip, including on failure. */
 int denali_chip_init(struct denali_controller *denali,
 		     struct denali_chip *dchip)
 {
@@ -1192,7 +1198,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 		if (bank >= denali->nbanks) {
 			dev_err(denali->dev, "unsupported bank %d\n", bank);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		for (j = 0; j < i; j++) {
@@ -1200,7 +1207,8 @@ int denali_chip_init(struct denali_controller *denali,
 				dev_err(denali->dev,
 					"bank %d is assigned twice in the same chip\n",
 					bank);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto free_chip;
 			}
 		}
 
@@ -1210,7 +1218,8 @@ int denali_chip_init(struct denali_controller *denali,
 					dev_err(denali->dev,
 						"bank %d is already used\n",
 						bank);
-					return -EINVAL;
+					ret = -EINVAL;
+					goto free_chip;
 				}
 			}
 		}
@@ -1250,12 +1259,17 @@ int denali_chip_init(struct denali_controller *denali,
 
 	ret = nand_scan(chip, dchip->nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(chip, denali_chip_release);
+	if (ret)
+		goto cleanup_nand;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(denali->dev, "Failed to register MTD: %d\n", ret);
-		goto cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		return ret;
 	}
 
 	list_add_tail(&dchip->node, &denali->chips);
@@ -1264,7 +1278,8 @@ int denali_chip_init(struct denali_controller *denali,
 
 cleanup_nand:
 	nand_cleanup(chip);
-
+free_chip:
+	kfree(dchip);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(denali_chip_init);
@@ -1274,7 +1289,6 @@ int denali_init(struct denali_controller *denali)
 	u32 features = ioread32(denali->reg + FEATURES);
 	int ret;
 
-	nand_controller_init(&denali->controller);
 	denali->controller.ops = &denali_controller_ops;
 	init_completion(&denali->complete);
 	spin_lock_init(&denali->irq_lock);
@@ -1368,8 +1382,9 @@ void denali_remove(struct denali_controller *denali)
 		chip = &dchip->chip;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&dchip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 
 	denali_disable_irq(denali);
diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index 8c822eae72e7..8d813cc05d04 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -81,7 +82,7 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 static int denali_dt_chip_init(struct denali_controller *denali,
 			       struct device_node *chip_np)
 {
-	struct denali_chip *dchip;
+	struct denali_chip *dchip __free(kfree) = NULL;
 	u32 bank;
 	int nsels, i, ret;
 
@@ -89,8 +90,7 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 	if (nsels < 0)
 		return nsels;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip)
 		return -ENOMEM;
 
@@ -106,7 +106,15 @@ static int denali_dt_chip_init(struct denali_controller *denali,
 		nand_set_flash_node(&dchip->chip, chip_np);
 	}
 
-	return denali_chip_init(denali, dchip);
+	return denali_chip_init(denali, no_free_ptr(dchip));
+}
+
+static void denali_dt_release(struct nand_controller *controller)
+{
+	struct denali_controller *denali;
+
+	denali = container_of(controller, struct denali_controller, controller);
+	kfree(container_of(denali, struct denali_dt, controller));
 }
 
 static int denali_dt_probe(struct platform_device *pdev)
@@ -117,10 +125,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_controller *denali;
 	int ret;
 
-	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 	denali = &dt->controller;
+	ret = devm_nand_controller_init(dev, &denali->controller, denali_dt_release);
+	if (ret)
+		return ret;
 
 	data = of_device_get_match_data(dev);
 	if (WARN_ON(!data))
diff --git a/drivers/mtd/nand/raw/denali_pci.c b/drivers/mtd/nand/raw/denali_pci.c
index f53df1b32dda..c39abe71941f 100644
--- a/drivers/mtd/nand/raw/denali_pci.c
+++ b/drivers/mtd/nand/raw/denali_pci.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/slab.h>
 
 #include "denali.h"
 
@@ -27,6 +28,11 @@ MODULE_DEVICE_TABLE(pci, denali_pci_ids);
 
 NAND_ECC_CAPS_SINGLE(denali_pci_ecc_caps, denali_calc_ecc_bytes, 512, 8, 15);
 
+static void denali_pci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct denali_controller, controller));
+}
+
 static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	resource_size_t csr_base, mem_base;
@@ -35,9 +41,13 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct denali_chip *dchip;
 	int nsels, ret, i;
 
-	denali = devm_kzalloc(&dev->dev, sizeof(*denali), GFP_KERNEL);
+	denali = kzalloc_obj(*denali);
 	if (!denali)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&dev->dev, &denali->controller,
+					denali_pci_release);
+	if (ret)
+		return ret;
 
 	ret = pcim_enable_device(dev);
 	if (ret) {
@@ -92,8 +102,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	nsels = denali->nbanks;
 
-	dchip = devm_kzalloc(denali->dev, struct_size(dchip, sels, nsels),
-			     GFP_KERNEL);
+	dchip = kzalloc(struct_size(dchip, sels, nsels), GFP_KERNEL);
 	if (!dchip) {
 		ret = -ENOMEM;
 		goto out_remove_denali;

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
