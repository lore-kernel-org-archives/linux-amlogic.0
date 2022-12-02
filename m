Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCDCC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrnMjEQkuvt0Nf/0CH+rRe09piMlNoH5LnASoyrEU9I=; b=Pj7ROKf5I/EqN2
	gKsCKFBj+ms7EhsFqt6eNlmfmZfP7vxDSTLp75wpohVr8i0CrpGHMWZw7GchQ+75F3jBnNWnoX1gB
	fsch3Ucw7YTOsplrfFpb32v3djfdpEfw92fDHMmUPJAXM5g0iSMaUPRZgF2YZvSez8c7rNpjQ7usJ
	3ieS6EZ0uIDM7H1F736lCQqLuUIKEfu2k/mrIn2iHhJvm8WBnCtO1hkkrJqrOuCgd825xsXUknN93
	FmWNmH60yvGFsDa7TBD4xb1ZUq4Y5iQLnS/k5hwD7Ig1FCJroJtag5Fh68WPFZhKgpJShrbrKl6nG
	ZVjvRxtiGyCuFon9Kg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14bV-00G6YG-17; Fri, 02 Dec 2022 11:53:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14av-00G6H3-BD; Fri, 02 Dec 2022 11:52:42 +0000
Received: by mail-ej1-x62b.google.com with SMTP id fy37so10953070ejc.11;
        Fri, 02 Dec 2022 03:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpYJc8YISu2BRlH3hvxZv0fOIwXysejIA3F+djx3hbo=;
        b=f7b0KJLVs/0oskAJftN1Qp6QFdvpMjsxCbNbiw0zdeJ72tKWquaI5caqW/LDnVfhR6
         qJE/N6ti/sPb37MKmE2J/YRHHtMYf8XzCrwNN6Ke0peHMXKrCYhfIgGPjcuQjEynX7vN
         +kkZBsFOtGrX1xrJxn60nO5hHLeUJirZu/2+KqNDANHoqK7k6ipCIyRLqSAb0Ziiv4Nt
         0DWFlY+mVPZG1/1OnMG9Mqc4ys2wu0LJA08/RlR4xs0s8ZQ4kdsKne2bVNbON9vRt3DZ
         XGhIij0pQQD5Z9GvAKmms2+JemxRJHrHirV+kRiopMh9nuFp/C26GaAFMpNNAi5cGu/n
         oBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpYJc8YISu2BRlH3hvxZv0fOIwXysejIA3F+djx3hbo=;
        b=zopgI1PBZxxN3hge4ePONNbgF3Nj7Oaet19I0sw8dqo5N7rs+HWvw8PPbybMu76rEQ
         FuelRBXnlMlWiTAv0847c/oPVAVC3NTnokcY9yUt2xHbr6Qv4qt1qwlWUEqJYQhoXv87
         UrkBB7aIUHOOloyZJNiCyh+Dsa4rzMsOiRhiCKNYftYMR6HrZ1miajWeocI4WjuFdBNB
         KRx5FIs3MLbEdHbABxbX48jb4eFaktPDaZbD10FaQWFy6AaJ5EBsoUah0DxvJs+8h/LM
         bqU9etz+tMuf/+EdAQ5uNWVebSmVCJRuWktsMLvQJjd7Pz8D/WZPhc0ctF2pG8zOUmhW
         WEOA==
X-Gm-Message-State: ANoB5pki70ReSLbv+8M2U9BcF4gp4xaxcOMGFhauJdDlbbRvpHRXaRof
	qNnWhBtE0HkL5zKuV9ZMQjo=
X-Google-Smtp-Source: AA0mqf6nsc6YYjKGVTd3lWG1CooxDXTgbjwEpGKczarRIZtXYEjv/A+Z7GaUd+d2lI3Yo0V2wBadoQ==
X-Received: by 2002:a17:906:c2c9:b0:7c0:ba35:b9ec with SMTP id ch9-20020a170906c2c900b007c0ba35b9ecmr4229488ejb.687.1669981958335;
        Fri, 02 Dec 2022 03:52:38 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:37 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/8] dt-bindings: power: Add G12A NNA power domain
Date: Fri,  2 Dec 2022 12:52:14 +0100
Message-Id: <20221202115223.39051-3-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035241_416962_7E916FC8 
X-CRM114-Status: UNSURE (   8.50  )
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

Add define for the NNA power domain for the NPU in the G12A.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
