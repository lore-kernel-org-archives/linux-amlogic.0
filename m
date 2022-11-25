Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E582C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbaBvkQ5E9rEh0NUHn9+5A1olmsXhKe9lMcLd4EvwfE=; b=QRMqU8TPiGyRpv
	GGye+0stb52fobHiZONgi3qAfHLChhX+GrAPJCR3dQsOyQL5nWNGQ3YRfSRaE5AI08fZNSIhoVUKk
	1TRrSdmzLOoxGDZqNpJfweBvATI4pKYGh8eqRSM5qFvB2vlQZ+o7mT5o2SnTKlfFWpRVRZB3TTtJX
	hGu3lsux8FniRD0OFd2q/r3OWvKAlhWZdO400mYEt7ytZA9F6cdPx80cwrWVVcYqmYQgiGyUVIB21
	SZybMVq0JpMNRvsOp9jn/y41npSoCYvGxvmfdA0l5d1cXofL5F+ISuilTWWx9UVVog5qycF04tPIh
	jkwnw/LBoIYyPASAxNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkx-00G1wf-Oj; Fri, 25 Nov 2022 11:20:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkC-00G1W0-MT; Fri, 25 Nov 2022 11:19:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so5942388wma.3;
        Fri, 25 Nov 2022 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl6GRHmDwXTkupYiop0EErlDiZv2DZKUPdgh77pu4+I=;
        b=bZvwjPkKOEGihx59nh4uidHxJrPCbUvQpYbhLXdUzPswveM4bbAPcx2AfxM0GxV65U
         gEDxIVX1v9Ahnj1Yxqm35oOORkIy4ObbLnK/GSiTO0PVWoPCbRuMZhvsiiy8kkgofHPm
         6WF29o678DSOo0RmjuQRDFhajdlDXOUPVM7AU5JcISGjOEmLQdzbDS3YpboMZg6VV2U2
         4kkFW027bQRBKNRpgLK8TCft8ddSP89OssBzRGzXgQX3ay1lAnkuKvIyW6hE/stdHBFs
         3hKVB6i25eax2KFRBW7V8RLz4yWrxjqV6UUVUJYKiDb1nV0Vy0REj6EAqGxSWjAH0UMA
         l/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fl6GRHmDwXTkupYiop0EErlDiZv2DZKUPdgh77pu4+I=;
        b=tooZ1eLnh8/unL8ppZF2OOJWlVG3xKL/tT4R17hMdtypMUM/yWP1cIa6fNqkaJNwzP
         xJnQPjUSXnq32Vrrstxw6j2PacKgnwzzFAq82GpmYJrRLIgyKU3F13KEdDxVP5M8ZEBy
         hp/2YtvPGGHMh7pmFGgm2OI7OjhTmkPt/pbS1jenL/3WE0816PPKAxxiasfDlG1wEYZW
         XF3Wx7tZQBYgq3FsY+DstqcJUGFvv9d2+U9W4MuTg76xDbdIUn3Z5wyHauSSrhWVsRXW
         iSsZlXuyrhibtXd/61VKK1UJ4XTh5bXRnqXoZOQjNdcMQV7o8zvG2b+0hSTDvJV533rR
         VX5A==
X-Gm-Message-State: ANoB5pkqHJOBl+BnwZ0gBS1DRBVNk8rc520xixV+Z01WgtlrPBeMLhM9
	ArKQ71/NgpBqk+SVCdVuqOo=
X-Google-Smtp-Source: AA0mqf6eAtIlDdCwbMKZ0vP7/JzHXc++3weMINUQ93oarLXwbQKfH/KLvspYKAT/dQ+fAFQJlQrQFA==
X-Received: by 2002:a05:600c:3b18:b0:3cf:6ab3:49ce with SMTP id m24-20020a05600c3b1800b003cf6ab349cemr27089016wms.137.1669375181147;
        Fri, 25 Nov 2022 03:19:41 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:40 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/6] dt-bindings: power: Add NNA power domain
Date: Fri, 25 Nov 2022 12:19:15 +0100
Message-Id: <20221125111921.37261-3-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031944_770371_119C7C95 
X-CRM114-Status: UNSURE (   7.89  )
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
