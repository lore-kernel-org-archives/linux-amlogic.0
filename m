Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22362C7619A
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Go2Oa0WMgsNEvyRpKjyyt3v9ftMOb9qrmCZAdCMeUyU=; b=WYl88JCzExU2jl
	UU3An9vba9/LDkwTYWOJKJrkQuPFeV9GBFGKTIyXGwfT6fNJOVAFDzUmDcxmeOuGXM6WZ8bNtqyvZ
	uJmyTA7FlFM01NttwtarM4tqCV7FjOa1CVtM72OWm/MyIBhF8nKM7j609plYoOzrmsvMDF61RSOaw
	tR+bHeltcATHUJkM2Kfkr7qgoBkGOLOalutn05mwdyP4HQ21FMt7HneMPD5amNASpJTCEd94hFLrK
	yR/GNoTE0XLxSlQ0VdBxqwsp3aLxSTaref3ZmfzYaGSS8avq0OKHzKr9UPQjiApCbLXZff7OjUt4X
	y+kbWyEiQ6GFIg3VsHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXW-00DBVu-0C;
	Tue, 21 Mar 2023 17:12:50 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXT-00DBTp-1o;
	Tue, 21 Mar 2023 17:12:49 +0000
Received: by mail-ed1-x531.google.com with SMTP id b20so29572300edd.1;
        Tue, 21 Mar 2023 10:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679418761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDQGY34v5yd3veLbGYP2fWFdtFLMuweQoEdgE2PrVcA=;
        b=MyB12+FMNsCsdjFvnKTER5OH38gJqe1NqBNKEHHySj+8226h6cS1PIFOy4RKSUYGb7
         KM3U/lMUOlRDFlS7J/JdiUC25ZK/8yFBCHqn6wy8a+jXZSBJ8O3Nm07f2mhFXq7NhQkg
         QkFhW9yRKxa5wqVkfR1moLvrxMZax2KbUafyu4992fqDdUY7qAHee4jzjrT0n+aJ8gFx
         ajhJJVoeV7WIIZpxNNLnxvH1Pv9IFM9Nmdj5Dc96Pe/awCPoGnAVpYhLw97NX5tsS5Dm
         ZmWyJWAhJ6ZR3xWBHGXpdtjNEADcoJs4yFqj/hwdR0i47kAAZjorFVOqE+lPKcL/VZtu
         aYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDQGY34v5yd3veLbGYP2fWFdtFLMuweQoEdgE2PrVcA=;
        b=n1eXtu4n/qsVqr4uvDGzX8pysNbrx7kIOdibmIazlvp6toXFfI4fhGzxNKrwdyFir2
         LUocDbldmWMfXqv83WI2MvEwdjGTFuPn/Y9JWpSPJedeElzWWDrnho60tHf0hVblrs/s
         FHNgPVt03Y5argWICKAZ4wmEVhtA8+8beiIDggzzGvIij5x4ZSJVakspszmLyo+R0OuY
         iXyKKyu1G4Yrv6OcO+miYwjp7QfC+itmmLurULl+N7MWHz6HDYA2aaChxvNl4oLK3wxp
         AWTTgyk7ZROKdqaBZqrVKFvhQT8VEgmuJT+z1JAi5mkZmUsOCfp7sZvVweh+g6Je6dae
         GYxg==
X-Gm-Message-State: AO0yUKUD29nT3Fak3B+GyMZYLS18/GIvH3/JSaV7q2bZxdMsW39QAJ0f
	vtcZXnlidHxfNZfWqS+/nOMYj0k0QD4=
X-Google-Smtp-Source: AK7set9hBgmphPshIttQT1y1BW3L9H1aYEHrvY3x1BVqrUmeqG75DeBoDxX0hJDyrCWo2TPZsdTX/A==
X-Received: by 2002:a17:906:68cb:b0:8b1:fc:b06d with SMTP id y11-20020a17090668cb00b008b100fcb06dmr3204927ejr.77.1679418760866;
        Tue, 21 Mar 2023 10:12:40 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-bc57-1c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:bc57:1c00::e63])
        by smtp.googlemail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm6474959edf.63.2023.03.21.10.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:12:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] ARM: dts: meson8: add the xtal_32k_out pin
Date: Tue, 21 Mar 2023 18:12:11 +0100
Message-Id: <20230321171213.2808460-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_101247_750870_441547F4 
X-CRM114-Status: GOOD (  11.01  )
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

GPIOX_10 can generate a 32768Hz signal when enabling the "xtal_32k_out"
group with the xtal function. This is typically used as LPO clock for
the SDIO wifi chips.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 21eb59041a7d..4d18bb4e3c33 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -568,6 +568,14 @@ mux {
 				bias-disable;
 			};
 		};
+
+		xtal_32k_out_pins: xtal-32k-out {
+			mux {
+				groups = "xtal_32k_out";
+				function = "xtal";
+				bias-disable;
+			};
+		};
 	};
 };
 
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
