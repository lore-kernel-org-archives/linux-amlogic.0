Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A0CC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:42:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6040D6113B
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6040D6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a1RP4HKBA+TtXW1bSPrs7Wu42pqfrsT9dhbhnE7yx4g=; b=JGQ3zT93GDq+G3BCyaEfFE8YY
	Bau8lecw8gWvMP3NdOaH9R6CD2U+anuryocteXcf3MHkSxFF3V70AMQDpa3v+/2VJWj6WuuR3Zpuw
	hgNrm8VWHd2r66g4Eh8qcahuoxWPHhZY7I6UMpGgFoadIwrMYQPU6wXPMJCywfD7PkD/mCYowKobk
	Jn8yctu1OOKcM0bDEsQyFuLt4i1EH8vk3UwB31eQwuvcAdqqhvoBqV1c7YEN3YfvRDbXaAoeaCjHQ
	MN+fmoZw7EpdD2syG8lHkExsiDBWs3UcZUQxeJWlGzT+/X9ul/+2l/pq8Y2rdEy30o02cd38FqKny
	6tgKeqhUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXKzq-001aRg-Lq; Fri, 16 Apr 2021 09:42:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlP-001Y0n-OC
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 09:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UW+b9Omz02QYLN6IJYLDRcym09SpomRowE67Td03hF0=; b=sK8TQOzsi8kT/jwnLvya2TbuV4
 RybmbUbBYTMVtE4oKBGUstgUSCzQv1AmKou78O7Laz5MiEPVo4tZgqtyPL36Ro3eGBEInPiBve2lM
 oOx72N+SdM2CXT6yKxFDzsf5wbhGNFhkx0undfePD01BTc9CbTn/3IdpVv1fhaazYf9BsXeprmlHn
 fCZn+eScAu+CvWLmavgDHZrOvRgIoD544jZen4Pbl/WEwyk4W5Ey6Yj0ks4vkq/x/P7Ct+zu2rvAP
 nWpQ//wj0IK5UPOwXIO6FEsJFQLJ+IYcoXzW8xPnbiXp7r5m1tY1XOOyHcUwvHMqw6zaZzpG6kovc
 NGjvdFAw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKlM-009F0R-VV
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 09:27:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id a4so26026975wrr.2
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UW+b9Omz02QYLN6IJYLDRcym09SpomRowE67Td03hF0=;
 b=2SXyPTN09paaUUHLMYjUPiOreOsjYnlSmKr4JE96Aqe9W8aFmXg4hr1bj4bxzB2QSt
 75zILaiFt03bYFsKYqUldY0Tm2nfLT/pccj6fgbGcl1UbvoC+gmoOQwx0g+dwPf5xbfC
 QZB9N4nRgbd1LDpB8yHSfk+qjLjKkc6WDst9Iny4KDpA1HO+2Bs7iBYurZH6LqcDGQ5+
 ZDXtn6Y33TdB7Pqszd1cQzxJske76wXleM1nsl26M5yhNsEzYyyRvoYE2QmX6hHKTSGw
 hqLfeB624/Bdl6OMWA8cRGtDlOBjx9VPYF/L6I6QT90YNFOyey68YNxO7hAeOOH4NEQW
 LFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UW+b9Omz02QYLN6IJYLDRcym09SpomRowE67Td03hF0=;
 b=s1p+nT02k+ih/k3tH9/y6WDD4cFH38sR26s0Or5ewRUocOJiqNbGuxoa6JD4A5bccE
 U55ZXGryAJRROXA1h0aJzGq5KBtd86jKVvp18eJyecOOUAijrBd7ZCUKaa2PmXDC7vIV
 Nwwzq+0vbFpPVTDFF5P2UxS5e4Bpq8AZ0xHAR3WFymB9nmu0hITxgjR2tc0vwupDgXNL
 2gcpKqjhCR3hCnAvYlI1t8Dggv8ybHLuMNwnAfpFxQbGng/6vmmVQCQnjqu0sNSxlC7V
 +MQXHKDK4WM7g9N3A4WzZziKknCGgt+0sWZwrwU9qR9tsYsK6xAlYhYj6BZVxM8gvYbO
 wQXw==
X-Gm-Message-State: AOAM530uQvVc19MGgq2Id6JdGABmOCxCquR+bEs8HwBGGdseMXNbgOaG
 fxr/xADxxpQlbM9CwAnZO7iacg==
X-Google-Smtp-Source: ABdhPJy7PfjmtGJBOdddxLxdWJGQghNiu2LsQa7tLkmPIufbPgxZciXvPq9nhqNHPw/dBMV7hWt+SA==
X-Received: by 2002:a5d:4251:: with SMTP id s17mr7986834wrr.174.1618565263540; 
 Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver
Date: Fri, 16 Apr 2021 11:27:37 +0200
Message-Id: <20210416092737.1971876-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416092737.1971876-1-narmstrong@baylibre.com>
References: <20210416092737.1971876-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=AIXqGHKTvAxrfKSlg1n3zbWJ5IG5DkS6Kb91/enRWC0=;
 m=2JvXyHbVOdgr08yx3xTtTb2RALrmH6WvCQut165FoNE=;
 p=ALx7NrZjStGjkcT7P2hXJBXnDsBMqDSSAFEUG8wpqV4=;
 g=4e6918702c99f2fd53451a77865692eeb1ce6f11
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB5WDsACgkQd9zb2sjISdEMNg//eHW
 wLuyr89JyKh095fVg/U17vGXWCLJ4CoUOcvalJ7GqQfF094VlAnboFML2V1x97mGiXL9dEWzIXIU7
 njtgfXlKA0lczx6uhZMbkD6YoCRHxvLZ4I3oWcCl1hZnKlhUgysO7Kp5RPAGRVQgNxkopRLK5LBYo
 DqmIEfvh976jxGsRdydHIgt3xKSGYV9JLj57+PP6WbnD0MHOm5EJLRettmjVJl39NzW6kbvlZJxrz
 n/vbP1ydH7Mf11NeHGkzi24eCx79FuAbCKIFdfIoZREybjXGjoE9guX4LKHbrzznFx1H12emkMucS
 cZ6EDw8V0rEtZJBQnib6MllzAp2cSEsA07NTn8/m6SlDxFPh/ZyHKfgJisY2bclJAzgJAWyj+/oxl
 1aliLRovtOP6qej39sYRMp8S9RBADFdmqamr+B2CbqH23odahkg2MbuSfm5X5tKeqOVlwsMnNMi+C
 NV9df8kcJvjTx/A7ypWeZdZNa4Lp84bRYKMXE1kGpBCz2HaWN6qQmEOaODqGyY/w/RADuPRcc6Yxc
 8pqefJFUx7qK7YiV+gHcw7xI2z2FNcR+D+VTpSVHJNsOYMn2Up7wjyySgCZzOBGTgAwqkIBDeyccR
 brk9G1Fu3JQMrQqOlguW82Xz+kpfjxjAVsuszHdttk/bhsHqpvgjO+ka4JHEWzSE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_022745_031576_DBFAB5C1 
X-CRM114-Status: UNSURE (   9.69  )
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

On the Amlogic SoCs, the DW-HDMI HW support is here but the DW-HDMI CEC signal
is not connected to a physical pin, leading to confusion when the dw-hdmi cec
controller can't communicate on the bus.

Disable it to avoid exposing a non-functinal bus.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index aad75a22dc33..2ed87cfdd735 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -1103,6 +1103,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	dw_plat_data->phy_data = meson_dw_hdmi;
 	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
 	dw_plat_data->ycbcr_420_allowed = true;
+	dw_plat_data->disable_cec = true;
 
 	if (dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxl-dw-hdmi") ||
 	    dw_hdmi_is_compatible(meson_dw_hdmi, "amlogic,meson-gxm-dw-hdmi") ||
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
