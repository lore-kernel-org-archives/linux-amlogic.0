Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF46AC433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 17:58:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD9E611C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 17:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD9E611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opCjk+gl+y5lOCPwPZiQRnhuxw3Id+lNbx8JBzBggQ0=; b=X03l6vYXrkQ367qxEqcTW298hM
	rC7nTIKxvBBnnzfAX9d4kpXHrEHN/Thq+RqHx7dKHL3jqZ6VTov0ITLXSEHeu37PJ5GFXzukIGTXt
	aHoavo+YdX66IM3BPOq9iinjit+qNU52+yNioVhgTRoejBmfEu0Mr4Kp6sfyCtv5o8taGkLoXZMKM
	lLDNHpwF5WJzLagQ+bcWuPGGNadTFOwCE4JBSnh2MqqNxIBbFaxQ+9QHBabWxBXgEm9q0yBSpvybs
	nhV4RIBlzRNdMCTq3rq7nPw9tewU6UfhuqjUOdpaIMAtd/1LkVDmCbS2Yz6rnfrsN0sm1hwZRWpK8
	paD4BJyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb5Uo-008Du3-EY; Mon, 26 Apr 2021 17:58:10 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb5Ui-008Ds7-GK
 for linux-amlogic@lists.infradead.org; Mon, 26 Apr 2021 17:58:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so3750440wmg.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Apr 2021 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5ky3C278fTyj7xzurTFg57gY5CqNWeI5tQJtroGglE=;
 b=hxhNDOS+yXCfKTmokgJ5ZlsmPx0RcbLFa/82e9gLxFOGzyHSTEw9/FIFrKI7qZ9OBN
 FyrlM646/u5pYH6pjPhPXj+d/PS6Cs9ITo9KTY3FzCnZ92Cm9qo5bXht8fB8MvbbDNON
 CtEE3HvZYtw8MYPE8Hzq9KbjcXWfSpKW0Tc2Z8lPY+q+Bq4v4fpJZ2IW/PQyG/U+Bwm1
 P5kh09lPxpBBD1rf4PQq1Lsycc/LkoQdA3fYeWmc38KCmmM6UtClI4uAVYDU+6L3NFdI
 jpJWeCJJtuwNJyHj1DDMarggDO112TZugQ1seVmvH0U/DXU7Xg3hL07dHpNdSy0aTEvS
 pmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e5ky3C278fTyj7xzurTFg57gY5CqNWeI5tQJtroGglE=;
 b=QzUF49iejDlc5CVOzefcE4f8ofUCXbRziHMTnn1DdGpv04WqsJ5sR8kh0yQitDPPUk
 GKP/gULDkZQld3PnzFtdKWCjFgk7wnezYdv/91DUtLg4W4ipTt5ks4nnzSJbBJGnuyic
 c30CYlzrUIA4xPcFhy8gl8ot3RCfgkMlZVsNx6ZkvBSb0kbJGUn6Bd8P/7o/jur9Raa1
 4lv4FDTtcNDgmehcnSDMWviw93mUxhm4cwaQU1nHLH+Lp0c9kxvHnVbwxAF7q790RoJo
 7kHQwR1igHesoPmx9p4/BLedZhA+LZWKhJiblZT8Hwyr0s997apBQboZP6hVTYM0AnER
 83Bw==
X-Gm-Message-State: AOAM533D85CgDWnF0sebYsUYgFVkE/oGvFqSBodqX/MJGOAajtPB7PLx
 QpUd50hbDzd9SSSSkJdrn1W5eQ==
X-Google-Smtp-Source: ABdhPJxOEf5WrroQm4+6ywa4UClWp0/lOaQSNgKwiy7DDgNpk9QkOesL9yO1Ur5kkX5LmPKDQE6LgA==
X-Received: by 2002:a7b:c94a:: with SMTP id i10mr231005wml.79.1619459763236;
 Mon, 26 Apr 2021 10:56:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:b76e:7362:77c0:ddc3])
 by smtp.gmail.com with ESMTPSA id
 l5sm18001806wmh.0.2021.04.26.10.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:56:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org,
	khilman@baylibre.com
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 1/2] mmc: meson-gx: make replace WARN_ONCE with dev_warn_once
 about scatterlist offset alignment
Date: Mon, 26 Apr 2021 19:55:58 +0200
Message-Id: <20210426175559.3110575-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=D4BnzQN4yovLOupJGSNrbWTUPYCcxuBJZXJ1F8kaNeI=;
 m=ygoCLhKf/v/HVpjA/Pa8YJvQeeXyjQkv6fyzRtAwrHw=;
 p=XuOMdYKhwBPfihg5inLCFiEtpgUiSKXZkxwW0eW2eX0=;
 g=dafaad0776a887f410e5d3ec6e08cf89118507a5
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCG/pEACgkQd9zb2sjISdENlBAAgUb
 Vjq5e1kby6MqtJS5HtnydgaMwvUs/tVSnyZGjwrspH/tuRQo6VtgxCDgW7bG5W2Gp3pnXauXLIzer
 jXQoBjFRLNt5rtwRg0bZPnBVIkt+8eXUtO57on+PrNCY3K04QL5A9iWYavQGEzWo+fTXzHwU7Kuwa
 QNNojZU8fL7umEGvgeI/AhIu4/gmYtpQ2EMnumkvoXM/UNBua/bMQb3gDXlHbfsiIhsDA0et/Z/QB
 OyPpiJnncBU1CvXxQ0g/3bqtZo40MvNb4Gmc1IxSM0cxUS97BLk38nnBFlSF59T7k1iUTAkSjDLLo
 f44Gmrf79q0nJR4aTbNVuCqeQuU8pWF9xnOn1cuM5aij7tphWCWR6IMxru9VJsptExir7P8cHD6sN
 noZL8hhK/wUF2lq5jYwTZGQLejK/nP7G40ZyfJTy+lkotMlwd3+PDT69az3no+qweFQu3PQvDJbSW
 IMXO+V+9OvVXCYKYmgY5Aqyr1rt7sevV6ziOpGb6oQceqBuPDRA41NQdmARoXec1x/k0qTqCykmN6
 G+dsLxrbs97zTDf1snjcKBaZPjFUqtaJ4EgqmJ7V3EHvzmyGfpeJJppigVbbDbWq9Y3vRwDepFzf9
 C8Sxu3hz0Hmy7CDTDHR/zsRR7L2VgOmvbKg6v7I8cNkT1Jpl4dEdci/x2/2xuDLE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_185804_602792_8D24A6E2 
X-CRM114-Status: GOOD (  12.25  )
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

Some drivers like ath10k can sometimg give an sg buffer with an offset whose alignment
is not compatible with the Amlogic DMA descriptor engine requirements.

Simply replace with dev_warn_once() to inform user this should be fixed to avoid
degraded performance.

This should be ultimately fixed in ath10k, but since it's only a performance issue
the warning should be removed.

Fixes: 79ed05e329c3 ("mmc: meson-gx: add support for descriptor chain mode")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b8b771b643cc..1c61f0f24c09 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -258,7 +258,9 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	for_each_sg(data->sg, sg, data->sg_len, i) {
 		/* check for 8 byte alignment */
 		if (sg->offset % 8) {
-			WARN_ONCE(1, "unaligned scatterlist buffer\n");
+			dev_warn_once(mmc_dev(mmc),
+				      "unaligned sg offset %u, disabling descriptor DMA for transfer\n",
+				      sg->offset);
 			return;
 		}
 	}
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
