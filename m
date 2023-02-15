Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C94C636D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0plWyrIrMKDmAZMse4rT+oveyjx2QABh5jUq7l+cJIw=; b=T9eu9GtjH+9P+B
	oX2KmUdPXO3xtQoWqvYbXbhR0m4H72gD3QZie+nRElRVkRDzAGzIsVIpwYi+DrvNqCRFQOG5hV6ub
	Tv5IkdrHHZNfRVKPQeeClDQvoJR44oU6BImd3GPP1BRRPYSE33Ii9/EKaMpRFiG0Z1fegjg80lC/d
	PPniSXfwMLqr11VEaANIDx5ZS/iZMWr9gQG1jJTir3Svluq1gdYJII5GYtDLY7pkiptMqbiLlCJ00
	phKpx+5OU7IrulsU08/XFgQjwOk0BW5FuYGgwwNvtb+dwkH11HfI26WJevOeWAKbrKC9Mg6uUEa4t
	wJNk4Y96PYMBQQCYW8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOAe-0075Qs-Nr; Wed, 15 Feb 2023 20:14:28 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOAM-0075Lo-Mj; Wed, 15 Feb 2023 20:14:11 +0000
Received: by mail-wr1-x42e.google.com with SMTP id m14so20355855wrg.13;
        Wed, 15 Feb 2023 12:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odieurvf10mcga9adT6YskNMFIVGrQrZFzWT8sMLM8Q=;
        b=gXdI45qWNupQUBNzpcj6HxFh5+saTgX+qIGVfCUiuvmwf06SywKEb7UhUw75y2AU1+
         xeWlliz7Hz32F/q19VUJm16oviUJoCy0xjfN1rzjttKvR+PjUbvDG/YkSeiAwdP6VUFN
         MxbSwRn5BdIzZLTHFy2exEs93NJRDX5R7XyWllSiPr5izHelmGkSpnFsr1HebHxZc0FR
         iGL6PIsZ1So+GgR8UjIOdPggoB4e7Pp4C1zYgnNq+c3CrnvV52EH1YGic7rF2Inssdf4
         +OqYJBJpICNUMF0e7uPY2HkTmx4Gk1ukQdgBkavOjQDJNasaGOIcfTXXpbcoMFCQ9tMf
         oMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odieurvf10mcga9adT6YskNMFIVGrQrZFzWT8sMLM8Q=;
        b=tg3cGDS/EOQbD3cW4MG/7STI/YHxZb1jgL4DbYOJdd/vPWMuKkegZ/OoA8+XAQrGfd
         goUNwx5RX2KcWS6pNoSS0qwa39K42Qc5+2hwPuplqntoY5OjiTNaSv0mWwjEf1Tj1QmC
         ajvQ6Zr+Kd62uLWSsQz63cFQoPj2cYFzhdeweGd35yrlc0SiuOJTatzSIHMXGizxbvl3
         hETCIXfgZrAFZclaeu9fg2qpou+URjmtaDVmZeFYDYQh/lypplH4l3QcLlLvRaYjGVgT
         SJUrdeijtCb3W6/93z0gn5j0v6uVN6/Z8RqtRj9Ex/kymRJF544yCSRvcz4gAaFfg5ia
         Vpxg==
X-Gm-Message-State: AO0yUKUPbQw8OWE3OC82YGMJsoTE+lagXvLYYorphsl2PNyZrKSTh6tc
	a2p6iJxGpbBE5h5en7i5jv4=
X-Google-Smtp-Source: AK7set8dQBdSzKt2yrFiXjGeTL210Xgi5w+tHPueRFWmSyOG7plYKPAt7DqVSI4GYCGJidNrhi2Ixw==
X-Received: by 2002:a05:6000:1e1d:b0:2c3:be89:7c1e with SMTP id bj29-20020a0560001e1d00b002c3be897c1emr397247wrb.1.1676492048522;
        Wed, 15 Feb 2023 12:14:08 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:ccee:9a0d:2992:c73? (dynamic-2a01-0c23-b9d5-9700-ccee-9a0d-2992-0c73.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:ccee:9a0d:2992:c73])
        by smtp.googlemail.com with ESMTPSA id k6-20020adfe8c6000000b002c55551e6e9sm9448525wrn.108.2023.02.15.12.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:14:08 -0800 (PST)
Message-ID: <b6e4011c-1f87-2329-d043-92df760fc854@gmail.com>
Date: Wed, 15 Feb 2023 21:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: [PATCH 2/2] mmc: meson-gx: use new helpers
 mmc_regulator_set_ocr_vmmc_off/up
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
References: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
In-Reply-To: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_121410_777199_6CAC0EDA 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Make use of the new helpers to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 641ea4292..740973d35 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -604,8 +604,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	 */
 	switch (ios->power_mode) {
 	case MMC_POWER_OFF:
-		if (!IS_ERR(mmc->supply.vmmc))
-			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, 0);
+		mmc_regulator_set_ocr_vmmc_off(mmc);
 
 		if (!IS_ERR(mmc->supply.vqmmc) && host->vqmmc_enabled) {
 			regulator_disable(mmc->supply.vqmmc);
@@ -615,8 +614,7 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		break;
 
 	case MMC_POWER_UP:
-		if (!IS_ERR(mmc->supply.vmmc))
-			mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, ios->vdd);
+		mmc_regulator_set_ocr_vmmc_up(mmc, ios);
 
 		break;
 
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
