Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BA2C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfslUsCbwUTvbjzJp4exeD7wBb+3KEa8Df+io6aAXDE=; b=BmoOvBj4X7dryQ
	+VrwAdpI9a+mEcRVJAPxBfO8EZFkGiVTgbTEIsZ0Q37lYy+JZUi/sasVvVbcL7SAe7loVEHbsr09O
	QXR98n2maU4fW58N04pXd04VtmI6Sicc0xKqRWosbmGh0t/6g4E/f7cWZYVlVsxEbW+Xl6p8BvkTN
	t0od3bIOg+oHAchlcvoC25UOt0pnV8X/aqOWFlx1w0zltKznvAh6Yo8dZmI+WL/q9i7BCtSJ8pALK
	eUQzfeob1MJOTRG4mUNMXQj76bD+dlV11lwvMSMyYAdGJBAwylq+vwm6BwiqMJBSWrCRlKcvydpsZ
	Hma1RxUGk2Q50gv9ddqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwQL2-006gtX-A8; Sun, 12 Dec 2021 15:00:32 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwQKn-006goZ-8p; Sun, 12 Dec 2021 15:00:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id u17so23036892wrt.3;
 Sun, 12 Dec 2021 07:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UP9pG6uKZAoL6xiFw7btc/sBc9qDC7+hGRLW0JFhSVk=;
 b=HmWK9zrUArMWPecimSXNGOviBl90BWrJqgUGPU7yVt13kPvA9G6JvY7VAJtJi7/eje
 BRkinnynjf56loJ1VqDKhxHKtb98Vx/DiT7LUeqP/Tl0hh599HdhA9/UxQYRZe+OxPDy
 9op1J1ZSDfy0RXoTokv3DAcAl1q4Eeh1NYxjYoDhX4KKuJzCBvvePd232YSBn0zJWo/R
 79GoQ3cqFTrU2xHzpVI2ek0DnSQl+8qCzyad4S75YRAQuTEx9Zz8az1CZy4Nvn+AYoRf
 3fQgM26oppedVZbAoLTJVVeCJuDwdrSM5sUCzvDYCFpLDGVSNOtfI2uNr9w6ilR9Mn8A
 tKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UP9pG6uKZAoL6xiFw7btc/sBc9qDC7+hGRLW0JFhSVk=;
 b=cccqQ2159g4bj+rt1mxTy1HIbcuE1zFukij+qzV/PUX66KZCMzqoYL3VXWsfpGFNRD
 XlIH0GUMSG/PagiVuF1/dk+rrpomkgRRaJVlK2QQTZK3eURTOsDF+P8hxC1NZkWpvFk3
 45virWWuPZPieIRX1pToc7Qy1hq155H0ev96ybpY+QLZs92BigAT2+48O8LAlH3hhYG4
 UQ26lre2Y8YXvWf1TB/6f4hlCyL6WoZs9fIc70iP6njBObRbZHzkGQLV/SCQiKApnudG
 DaVsf1NWPgk+SN6IjjycEhHpC12DzcQHRd2jbA4WOfNMuIRxIfO+fzkfDWaDnYMiu8ch
 A8uw==
X-Gm-Message-State: AOAM532v7yVSMNvTTQ3zAG+IwX/B6EeYOWLdhjRAztd3vxWtASN3ySeY
 o3uNTwgVxnDY+zoZsRmoZiw2KVUBe80=
X-Google-Smtp-Source: ABdhPJwpaIddF4DVl6f4wvuWcPjNKOVW2rREdmwupLSd5gDnxqV8ytN/+qfTw9Ic3bUFJ61NQ0xx7A==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr26132109wrs.237.1639321215068; 
 Sun, 12 Dec 2021 07:00:15 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-6ebc-0100-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:6ebc:100:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id v6sm4284789wmh.8.2021.12.12.07.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 07:00:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-mmc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/2] mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block
 SDIO commands
Date: Sun, 12 Dec 2021 15:59:55 +0100
Message-Id: <20211212145956.1423755-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_070017_335334_FA575925 
X-CRM114-Status: GOOD (  12.91  )
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

The vendor driver implements special handling for multi-block
SD_IO_RW_DIRECT and SD_IO_RW_EXTENDED commands. It sets the MANUAL_STOP
bit in the MESON_SDHC_MISC register for these commands. In All other
cases this bit is cleared.

This fixes SDIO wifi using the brcmfmac driver which reported the
following error without this change on a Netxeon S82 board using a
Meson8 (S802) SoC:
  brcmf_fw_alloc_request: using brcm/brcmfmac43362-sdio for chip
                          BCM43362/1
  brcmf_sdiod_ramrw: membytes transfer failed
  brcmf_sdio_download_code_file: error -110 on writing 219557 membytes
                                 at 0x00000000
  brcmf_sdio_download_firmware: dongle image file download failed

And with this change:
  brcmf_fw_alloc_request: using brcm/brcmfmac43362-sdio for chip
                          BCM43362/1
  brcmf_c_process_clm_blob: no clm_blob available (err=-2), device may
                            have limited channels available
  brcmf_c_preinit_dcmds: Firmware: BCM43362/1 wl0: Apr 22 2013 14:50:00
                         version 5.90.195.89.6 FWID 01-b30a427d

Fixes: e4bf1b0970ef96 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdhc-mmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index 7cd9c0ec2fcf..a89190d479cf 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -135,6 +135,7 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
 				    struct mmc_command *cmd)
 {
 	struct meson_mx_sdhc_host *host = mmc_priv(mmc);
+	bool manual_stop = false;
 	u32 ictl, send;
 	int pack_len;
 
@@ -172,12 +173,20 @@ static void meson_mx_sdhc_start_cmd(struct mmc_host *mmc,
 		else
 			/* software flush: */
 			ictl |= MESON_SDHC_ICTL_DATA_XFER_OK;
+
+		manual_stop = cmd->data->blocks > 1 &&
+			      (cmd->opcode == SD_IO_RW_DIRECT ||
+			       cmd->opcode == SD_IO_RW_EXTENDED);
 	} else {
 		pack_len = 0;
 
 		ictl |= MESON_SDHC_ICTL_RESP_OK;
 	}
 
+	regmap_update_bits(host->regmap, MESON_SDHC_MISC,
+			   MESON_SDHC_MISC_MANUAL_STOP,
+			   manual_stop ? MESON_SDHC_MISC_MANUAL_STOP : 0);
+
 	if (cmd->opcode == MMC_STOP_TRANSMISSION)
 		send |= MESON_SDHC_SEND_DATA_STOP;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
