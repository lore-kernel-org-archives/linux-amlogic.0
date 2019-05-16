Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08498C04E84
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 15:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDABA20657
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 15:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lWyvSyOq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hZmYFnES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDABA20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDUcGbRuhaHiZCFHS0fL6zkdtFX/VdR9gbluXjcfAGU=; b=lWyvSyOqmD0U42
	Ec1Qjeb6DLsItBGDuVhxpF+sfgv1un9INFKwNwUbU3qhuXfHqxN4iuUqJk3E4/YJ3LxW+9KxEM1zu
	Wd7iSdigy4v4ZRouGhBWvxfQ7UplXbjH1Niy6GwFL1y8rsS6A8JqMp7+m3QuV1MejY3z7Go/fezYI
	wQRIq6i9B3rhNCo5YTR2qD9D/b3Kc4hR4NJQzTQBEvk2lG3WL1UjNMFtMy2ctImgWjK7O+jEJaNxl
	RtLw1g9K7z4+jovy+3r3JLa3TheZ7VE31nym+n2mKm3aBJrTaysl1vkaZBdFTLREj7Zkbx2lpltor
	Y/vBQhiMWNxDrlEXD32g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRI4u-0006Wp-Ei; Thu, 16 May 2019 15:13:52 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRI4q-0006UK-QQ
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 15:13:50 +0000
Received: by mail-wm1-x344.google.com with SMTP id 198so4033570wme.3
 for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2019 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m99MP6x4cChPdhbIubtpCxGHABkHuAb2m4hPfeMsS4c=;
 b=hZmYFnESuV6VuicUNxJtmgvxqvOU0LIiIjYlEGsI0RkzI5Tk2IzOetocq1Z5UmerbG
 MOXmFIJwhjvbTTU2fuEx0yis/gk3acViM/0yeBRgGO5Ui77w1HmnFdoY9zHTRBblKKwE
 /iYeklpIPxMdpjronphLgx0HWI98eTem+wx5rbVZjX+Rva3dLo2A43odbvzv/cfEdEne
 0+HT9R4H1uACijhqnf8h86PLldxtwYSVKLuBF3FFOf6iPjL/dGBQx55aE0Ugz2uWM2Y/
 nQz02omzLe6ubaQvObP3hjE976/I+4ggSupyrmo96nbBJQjYlHZU0x+BbO9Pa0RZG0uV
 MmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m99MP6x4cChPdhbIubtpCxGHABkHuAb2m4hPfeMsS4c=;
 b=Wp4m19/rNtKLL3O/2HhJ9SxtP7bwppP7TcRD632sOaqeu19t5F8SxxIIevz3e+otAk
 ltKClqrujMyP+wCQn58sI59oL2f0yBXNTitzqqu8O41ImhZDazTBzpijdNuittVNmzkV
 N3Gy+SolCIVCRlwESrepem1YT0ko2et1eFzUazzSzZx+r1vTCqamAXyr/s1bQRLX0ciS
 TReVzj9dupyl8XsD9DH1yoXslf+gfaOz4s6+VkkTjLdMp5TuhHQZZpiA7AMpcAor2FVr
 vwhiilidwGwcsqy+Ls9uVIftu9uElgaikJiyUjPqbT9embXu3EITfT2hVz0cOHkjSMUg
 nZRQ==
X-Gm-Message-State: APjAAAUm3C/Le7tg9C/05TEwR73lvhB038aLiRCKCkxi+eoJdNwbSrCf
 4LChTWFGy18ckFVHpaXRsByRkQ==
X-Google-Smtp-Source: APXvYqz0RBerowQxIC2ARNV37JyqrgGCqaAxT6IWvRGxWQ56B4nchusaxmMXapm+9EOE8RC7Q22Gfw==
X-Received: by 2002:a1c:a745:: with SMTP id q66mr18504974wme.83.1558019627166; 
 Thu, 16 May 2019 08:13:47 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 17sm6968126wrk.91.2019.05.16.08.13.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 08:13:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: meson: add output support in pinconf
Date: Thu, 16 May 2019 17:13:38 +0200
Message-Id: <20190516151339.25846-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516151339.25846-1-jbrunet@baylibre.com>
References: <20190516151339.25846-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_081348_854973_CED0B1BE 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add support for the pinconf DT property output-enable, output-disable,
output-low and output-high in the meson pinctrl driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/pinctrl/meson,pinctrl.txt    | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
index a7618605bf1e..10dc4f7176ca 100644
--- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
@@ -47,9 +47,15 @@ Required properties for pinmux nodes are:
 Required properties for configuration nodes:
  - pins: a list of pin names
 
-Configuration nodes support the generic properties "bias-disable",
-"bias-pull-up" and "bias-pull-down", described in file
-pinctrl-bindings.txt
+Configuration nodes support the following generic properties, as
+described in file pinctrl-bindings.txt:
+ - "bias-disable"
+ - "bias-pull-up"
+ - "bias-pull-down"
+ - "output-enable"
+ - "output-disable"
+ - "output-low"
+ - "output-high"
 
 Optional properties :
  - drive-strength-microamp: Drive strength for the specified pins in uA.
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
