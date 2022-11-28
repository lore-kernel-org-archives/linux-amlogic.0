Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96135C46467
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3E9I3hjslGi8HM07dOIQCkDrvQ8JLKmOwKl5K4YixRU=; b=cAOfVkHfYeGmOg
	2j80votE/LBPd2Zq03BrHcZ1EdJaLTVnKyAu5j4+pjJjbEb72B+THomM+udzDyYAbH2AXpvbW3Sq5
	aAOpd0TiMMRaWUsuanvLBv384WRa/9RPdn9Sm0S/tCNVb5kJLBq/e/6AidBpdfMHTUSiqqp46nNpw
	FrMJxUI2T0kT6xty8j5N3F/2adh9KcaAHtvbh3rDdtFGggjp8efEzuaVZVt/GuVO13+Z7MQf/oNM0
	2GT3dSQazB1y4O2peJ7KX0fLFAszilVHtrO9MO0gb9Gv1/uZjeToAKcNLTFX5zqdzN5oJMqLpDgoo
	cihiHH/AWip9L/K7oaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9d-001E7D-Ov; Mon, 28 Nov 2022 11:18:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozc9C-001Drl-1D; Mon, 28 Nov 2022 11:18:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id d1so16236321wrs.12;
        Mon, 28 Nov 2022 03:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UPpIU6lTdK7INRlRgvRZ2pUB9CB4XOUu+P4PTYKdZI=;
        b=ipUjo8xR+7idcDTsImEjZah0QvWL0uQk2xlkUjMYuynXjZ0QvObzZOiVoCYlojnlSS
         XbBb3P2jIfFbLscrZHUQ5i9dvgF1Pt8hi1sIdHeOsVUVn43UsQDntPld5dYgu7uKjNMY
         D3PopNhhi6U9MWYE48WVHHTmEUfVD/4mugGEQccnpRTA56O3m/LPyg8esFmeggk7NIa9
         T4PKRmEg1ftNX1D920C+4r9xOWNpZyJsBb9FhELekVN45K3uSSradstyupQT3ncH8lCa
         8q6oIG41cJiW2EprBP7vO3gopJJ43YB0Q1HJqt2U4kfI0ChF2WUzsK2DhGs5C5ixnl6N
         FzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UPpIU6lTdK7INRlRgvRZ2pUB9CB4XOUu+P4PTYKdZI=;
        b=iHhwxXCBEC5P0W+R+1i0R3o9zgffJCkUweTa4bCvT/1iuarUnczUp3t1HJTE7zgi/C
         JLbyi8jtYHGhYjFUuoXRfctkrCoOoyilypAdhz8KZgKNH6G16WF5T4iPvXo5iDUkqm+g
         2NfyXthLDO5fb8fGeKxfwMh0g/e6jxm9qwjhH2TG9n/Jn3VTg4qVtoMP/vV3MgUqJiyZ
         rjuF0PNUPoWtN/TmrELpmrrWVc6okkvZKsubmt8i/s0PXqVYqn0EcKsN4WGOSf2J+02K
         eTKwW7uveqaSelI6pZTGY1OzNvbgsHJNzL0xYVdOf2BDqzJ0xY5uA/jvHG2Mc11pYrqF
         nYuQ==
X-Gm-Message-State: ANoB5pnFk+1nFHnnFK/6uOi5WaCYcfZR9qpsE7FcGZ7lQ4FwuTSL6Elz
	liqcg5TJKt5xAQHDo6xvFoI=
X-Google-Smtp-Source: AA0mqf5whm/4QpVrKDo6y/72I01fykgiBFGzZqcNUSNcXLDufdCn5sruz5OJk0RXKqeNqz5JXViIlw==
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id c14-20020adfed8e000000b00241d7ce4395mr22369951wro.553.1669634280306;
        Mon, 28 Nov 2022 03:18:00 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 03:17:59 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/5] dt-bindings: power: Add NNA power domain
Date: Mon, 28 Nov 2022 12:17:35 +0100
Message-Id: <20221128111740.39003-3-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_031802_109220_43557512 
X-CRM114-Status: UNSURE (   7.68  )
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

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index bb5e67a842de..93b03bdd60b7 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -9,5 +9,6 @@
 
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
+#define PWRC_G12A_NNA_ID		2
 
 #endif
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
