Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99626C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Mar 2022 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=psXHE5RsJWTNQ1dYb9T39K3n0ToBb4ViKiLq3Z5Fn2w=; b=C56ZHQclQsSFXo
	swFnRQYLTkHtDVmMj/n7UH88e6YeV7pRSRhWOMUNawu4K8iRUfE6T2jOcdw4iSuAUPNQIhUNUstUk
	GGtIzq93MntiiMd+6z3BlYVBOKngcKli88OhDxPCvO5OMQcedIebwIr0akjKc0+RlhpIMNmhn1inh
	ZXHoeEcHkT84cveQVyFAvgsTrxwG0fKK1mmvJE/C4zkBBbdUOMwNYTfrcNGK/JKTYBCJQtJFKqpOw
	4/rbR3KuxzIJeZMuMu46T4T/FUmgVT3qwAHqeJZa6HlQ22THcYkUxohXGZ9Y5/ktV+DBeyh+uhisb
	mPGtiFYBa57S5Rx8DBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQxz3-00FK0j-Of; Sun, 06 Mar 2022 21:00:05 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQxyr-00FJwv-AT; Sun, 06 Mar 2022 20:59:54 +0000
Received: by mail-ed1-x535.google.com with SMTP id s1so17285918edd.13;
 Sun, 06 Mar 2022 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=plQqywW49Fl/a6AW4mMf+FOFbqVTdp6ARZoJyCX2GbQ=;
 b=pyf8UTIJsWA+ucGrY+KUNwNtKPQjOc9Hz2l8gvRwnOjJZTw6rL3lK2tJh7hqbEKTaP
 quYPBjdRttuSzlHkKGXRBssMxWRJsoZo6mDKthLoIMF9CyoZncM3ox3UA7CiYTJNx75W
 cv86bMsHf6DUoNL9QSn+RA/YgjyQ8LiNS1fcGF/qliPwGA1YWkl4rymH2XKZj9hFYG7m
 ag0zQIFuedOUsUXZ2/zdJeL/PTvO/ZMa2LXlbToHbHrfpDZPnRkyPdC6TzgKtJpkFx13
 exK9bT2tu7AU4PuXMUOWwDJR6h5dLZ4KKSePPRnW/k8dDQRz1zVY6a8ICCe9YJAkuTLV
 osvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=plQqywW49Fl/a6AW4mMf+FOFbqVTdp6ARZoJyCX2GbQ=;
 b=ITX7tQzjqnkYyPciRR5AEeiVbKzOKhpoTSbfnPqcHog68kuEfhFo3whjqyrPuEXT8E
 hCSqlqAC+UIew5vIxJL4cS9YBMUtPtBxwFeEx2u2rAVUib+XdCa+9mNBzds453NH57Fr
 CGQz20SpSE8cuPe+eKVnpYDgNpAcHXwx/nCabToc+RR2nizuK82lwkwU2KyBPdaapArZ
 66c9hp/u9hGpBgpRL4k7kvjSqLnuB1etP1s2WOIUHbl0a6Rm/7dGS2htuNZpSWZ2Ukc+
 eqaQM05CD/90sdThJD17+Kfx2JZm7FeWH0XuKbhKj73H2bdb0BGw3SwCDfui5YY0It0S
 cJPA==
X-Gm-Message-State: AOAM5316mBbwWegIURYSORKJRrC02HbyTuOnJNGkY9Nis2EHWa8NfyF1
 cF5QW27SoL264CK8rJSDHqYhyOVeo2s=
X-Google-Smtp-Source: ABdhPJyD2Vnhs2/E6VZbpv0keAUS4N9MYGqt0FD6DHxNxbOlqv44QyIE5wz4xtjeHsAkRqRhobvbXA==
X-Received: by 2002:a05:6402:1b90:b0:415:d7d0:d9bf with SMTP id
 cc16-20020a0564021b9000b00415d7d0d9bfmr8266435edb.17.1646600391623; 
 Sun, 06 Mar 2022 12:59:51 -0800 (PST)
Received: from ?IPV6:2a01:c22:7720:f200:e6:1827:dd9f:3c0c?
 (dynamic-2a01-0c22-7720-f200-00e6-1827-dd9f-3c0c.c22.pool.telefonica.de.
 [2a01:c22:7720:f200:e6:1827:dd9f:3c0c])
 by smtp.googlemail.com with ESMTPSA id
 h8-20020a50ed88000000b004160630c980sm3557997edr.62.2022.03.06.12.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 12:59:50 -0800 (PST)
Message-ID: <a3c178c9-7c33-d7b8-9f6e-734dc28728ab@gmail.com>
Date: Sun, 6 Mar 2022 21:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] usb: dwc3-meson-g12a: constify drvdata structs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_125953_411621_19ECD7A8 
X-CRM114-Status: UNSURE (   8.45  )
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

Constify the drvdata structs. This also matches the definition of
member drvdata in dwc3_meson_g12a.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index bd814df3b..b282ad0e6 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -188,7 +188,7 @@ static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
  * reset to recover usage of the port.
  */
 
-static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
+static const struct dwc3_meson_g12a_drvdata gxl_drvdata = {
 	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
@@ -202,7 +202,7 @@ static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
+static const struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.otg_switch_supported = true,
 	.otg_phy_host_port_disable = true,
 	.clks = meson_gxl_clocks,
@@ -216,7 +216,7 @@ static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata axg_drvdata = {
+static const struct dwc3_meson_g12a_drvdata axg_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_gxl_clocks,
 	.num_clks = ARRAY_SIZE(meson_gxl_clocks),
@@ -229,7 +229,7 @@ static struct dwc3_meson_g12a_drvdata axg_drvdata = {
 	.usb_post_init = dwc3_meson_gxl_usb_post_init,
 };
 
-static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
+static const struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
@@ -241,7 +241,7 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.usb_init = dwc3_meson_g12a_usb_init,
 };
 
-static struct dwc3_meson_g12a_drvdata a1_drvdata = {
+static const struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.otg_switch_supported = false,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
