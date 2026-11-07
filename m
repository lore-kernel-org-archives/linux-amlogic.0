Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A810606D80C
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wN95LtAX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iAQUBlVm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRa9PRG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R47AcTSF7jE1CbunSgPu35xCIa9i1Ch4Hc2yXJf0L2Q=; b=wN95LtAXHTSS96YqfVYfcCvlgU
	5fa2tXcWatopi7qH1q5vwnh2mdOyyYrquLjAXBE2RlF99qKdTX14HJQOs+XYzEmKpUMFNy+h28FPl
	aBRgs6o8zrIFeSrjTHB2BKllWvf1RUFrAMv/lBhOFUetkpHSnkRnkXVI7T7IwTgibriNJ/X2FUQma
	3Uo3GXEh76DVfuGp2Y2t+eLYVZ7J7PRvJg54sH21328POWz8drH/BEkLn7fE5dAJrLV0VpQnQTtMl
	zFyvJKmtjXuyFtcLO6c/H4aByWxccRTu6MYhlT7SZzV46f2vcBj5dVPi4aHmA7uU8Jg4YVK26MWY1
	SW5D2Ndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdV7-0000000EV2w-1yT0;
	Sat, 07 Nov 2026 10:18:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUF-0000000EU2e-00f0
	for linux-amlogic@bombadil.infradead.org;
	Sat, 07 Nov 2026 10:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=; b=iAQUBlVm7GjBE6wukHNjowH8LV
	POf0SMLy8ydMI6hRdWZu8u786iCfxJDz3uI0Yh3+l7rGh3M4FrdolUw6eGEvh1cQh7e11+p25sOhW
	so0DSjDZmTMi5Tao3yGje4XaBV4DX1sMQuG5rsZw77VV+/fJ3Kg9BGZ9n2Qx1YvBTsRKB2VFqQNit
	pnyo7KJVI/ViEdNDcEeLbyE5D/fukpivPfDY5fOes+FnX4gPK3+ini+XSjxajsNcmTf4zLKZ//mZc
	qwXjGcQQ2o00pIKQsyyoj/2iQjC5OwP2QX0rPpnbdcOEUDQcfH5JYJw1jpB2OyPZeA4fbTGuCNH1M
	ec3vlbMg==;
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdUB-000000057xZ-2ljG
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 10:17:25 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f84a55cc06so967611a34.2
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 02:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=RRa9PRG27WU59oh7LfcNJATeay2+r5TuQXVOqLAlh9oGgecQ6DqFJGQ8myeF042hh7
         ssWhKPXRnp04hocqlAKGaOdkKWBXVBSMqHzV8tT0Tdu7hkDNipmY4ocRdn7PvDYs16cm
         uZyfmu0bMTe4BTyWM9ncqhZkeT9yXMkAMGTcvmAuOVFhnVWojG9J9XIHGlW0Gqw/pgXx
         ur8mXK1s3vjbGN/xB9CGDZqqpvXjVDRBXdQyC/4PS3Dh1K9yyojBnMq8KqX0gVsKo0BQ
         aWU7zsQFYqZiZGWOLzn8louu+B9RpDfu47aRcFYtzA4a17wAbp2y5I1CwYuxMO4nVYy5
         uZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=A3MtlLm4ooRtN+5mo2MDqC9F4c9n+3z/C2nP+HLMKHnpHgs4O+ica3zUwR2+cv+k6E
         PpsAONmlIDCsgXf3+vWDIhG18h7dPvQy6DGpuSpSX9qbzx91OZyqQKJof1lF87EU9swk
         U4uul9CPt42QNeoMv6WNNc7vcEbWguEui217m3v2UxNH+JMsrJYr944FmsTE640wWTnA
         Y3fRa1JmTt9KG/OS15vYmhZr8Kc/7Cntar1mqQxlJP6/SKt86pBEikXTa4Bt/fMlekgo
         XPFh3+gUF0GrK4449IBv6x7Qs89Bp1/w+nLq7NdAlq9L3T+9MTmQbr3wbigSBPxEqltd
         v3jg==
X-Forwarded-Encrypted: i=1; AKwUvBysmCXhFClLyWQaiy9JQaQQc+tEopUrNKiG1e1nbQfLYECQRx+P+5mBKtt+/QVUbxMNqu09dbcA/mkaK7RQ@lists.infradead.org
X-Gm-Message-State: APuU4Z92iZDCki3D+szl+w8VOJjEdrmAS3HFu3Jc20iSGB8PYoqSNAND
	QEH9+UEPwZsxVZkLTg9aP1Yb7olrXpL9goIZEr+h8446UuSYx+anuQTB
X-Gm-Gg: AYBFou3H5kTtlo1M0sKGxkSCPHSgLl75GG+q6k2P2jAIpyYYDCqrMv/lcxhFx1pXzuP
	4qO71Oi/56/P/m/0EQcxOgGMUzI+u2HmBvimDATjm6kRO1BiilqeqvNA/wvFmixJsd6yJjXFknV
	xOGk60oxy3gK2x9xPfXwlGntREtMOqQdOh2D1VCp0xJ4iutOzpBVUWy6/crUz5Bv66E4UNZSp4f
	0xu1stz4q1fXZv6Ac9iqEr6zhhPOiJ3h53ZPyMy2IVcZJhwrGYWvF+OsTQ70m9oWu2S+7vcZD4G
	h+A5GFBaDOR88zxl91T+NWOjpneosCShqMUj1f+xNKObsNjCCIIDhYPiFr+lgefC2pwqygS+ZLu
	9ipVXbMcN5Uh5pPvcLMDivgRc2tB2PSWwE5AnIjpa2kRO5FPAjQNzwS99YNUkp/1ah123pbjdCl
	OPdLYY3bRtTIGjVTas51btl1BYk9PND7xfpvtNlFRQMM6oCuRrWwZeP6T0XxPiJVXRiQJpjIMQ1
	yZNXGE/qd2FBnZZW4F6I9LGhZY7yn7sPwkNlqHlyX5wr5SkOhSAeb75sQy1ytbPKt20ZszXouSS
	rgusHMOsPHBycsO6/I1NWn+y9jh7Ag/Bvhrvv5gr5vIsCb5OKN8gKJvdtN1bw9rQ5vbZeV2Gz5q
	UfecUpOaumawNjbjE9L9TQF9ydA3zayfe/Mx8xiwBZdaO1muXI2CQ7/W/HoRQhZB5s9Z4eCJpYB
	HLSUMtR3xfAv7l+giVDXXlJ+EsrzP+xf1DEVQKJbFLEm0DuzaNa80OFxK+uycDQRHF7eFP9hdN+
	Q==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
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
X-CRM114-CacheID: sfid-20261107_101723_626749_50641744 
X-CRM114-Status: GOOD (  18.35  )
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
