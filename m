Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C95CC4167B
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJS9x09/3exmX7G1RY2mMDcxGvC+7/424XZ3GlNSA3A=; b=JoAQGSQCj2kxqo
	Q6AgVgIVdeQC5iPKeDqOYBpi+FU8kwwkZ1wAMgbVVikxJJw1Ubg/OAHksGyLDnwyw/BmSJhGM+Jmi
	XX+0JmCcgS27EfSqRT4EXnHLWp2IeXstQemaxlxz3a73YO77cftWzFyo3haVaxkcHKgnrK+hBeWIJ
	sKMBxqHKvz4TJjZq9075lHgXCm6seOWQGg0m723MHnB0ePsg/5iHuEqN997EUM0QS9ZnvjthayqjX
	18W0Rwl3ER9Qmvwsh/6GoPGDzfm9GPA/PsPb+NY1/ySSad5giGG5ZulqIlv2IS+OXOMCLcJe1deiS
	1+oni7SYncIrTo3sAgTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwLG-007Xy2-RL; Tue, 29 Nov 2022 08:51:50 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwKi-007Xhp-5u; Tue, 29 Nov 2022 08:51:17 +0000
Received: by mail-ed1-x529.google.com with SMTP id z20so18784968edc.13;
        Tue, 29 Nov 2022 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=OZ0nm34nOouWCtBLY5YQkfcXs5+gKWizxqRw4mpYirXfqgwxJKt8opypNNrkdrw8kE
         huRl4/2p57YfjPf+jIM9y6hfA9SAHXcBmUuf74fm30MwJ57+R+Prx9Gm3+xRPSLP7fdt
         DWJPCSW6DmbRLCiUrZ12qXYoyeILY/IkZm1rxzRKX2+KaoMxYseos1KGxMfU2odKqmy6
         Kn2GhZs3dvjc6THp2I27gHqgVxI7Hq/P0RRxBJNpKYSvuord2DiCNUVYwUJ1pGKmmwYN
         tVTlTeAhVLDlbHgt9Y86FIiGccMsQ6RcLYfeMoyQL9H1qttiH7srDmsU9pcJgJH+KjGR
         UJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cg4h08ScbCmARXEsFqgc8N6O4NbradYeqRREoszyl4=;
        b=XutMwLZBpUJf2uPl7+vpkPz0oOFEextnvYtAUW6OyVRsgVEjSLqElEg6IgEo9w2Yo8
         5x9cMu4JBKz0mOoRzl8SYMndnfQHgQh//JHI35ewGRrv5De9MCVRaIU1iVWRTJ4wZ7mg
         o4rU/ves5TrpiTRyV/Ah+ZscdnF6A5PW6c/793wp5Fmkikp4yJxfs2TpF1Aq0bfFIH0X
         ifF64P3yEcvwzWddJ63nYExYs+qpOqKab3wr5NVclRb5ePLj8pVUlCUdMttH1FeoYKOn
         wPmK8gYnsRagS8IuVsxfKOdP5qcvpPj/aClCQVad7re/oXm7dN5ySM5+edNh5vpC5fKR
         npyg==
X-Gm-Message-State: ANoB5pmQWQNA/gD84mClBgCDUq/fGzPAtQRYzHejX/+kND/+uE1KC5mW
	YH3PDfsmueUryNMfpP3MsHI=
X-Google-Smtp-Source: AA0mqf6zBSi++3r4XX3e4bljQj59DYt7fFuQPepG/7qRf1barG5tfUFiR49fDNl2+4m2ca5nK8AiIw==
X-Received: by 2002:a50:fc10:0:b0:464:2afe:ae18 with SMTP id i16-20020a50fc10000000b004642afeae18mr52242994edr.183.1669711872698;
        Tue, 29 Nov 2022 00:51:12 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 00:51:12 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/5] dt-bindings: reset: meson-g12a: Add missing NNA reset
Date: Tue, 29 Nov 2022 09:50:41 +0100
Message-Id: <20221129085047.49813-2-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_005116_235603_D145E2FA 
X-CRM114-Status: GOOD (  10.80  )
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

Doesn't appear in the TRM I have, but it is used by the downstream
galcore driver.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
index 6d487c5eba2c..45f6b8a951d0 100644
--- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
@@ -69,7 +69,9 @@
 #define RESET_PARSER_FETCH		72
 #define RESET_CTL			73
 #define RESET_PARSER_TOP		74
-/*					75-77	*/
+/*					75	*/
+#define RESET_NNA			76
+/*					77	*/
 #define RESET_DVALIN			78
 #define RESET_HDMITX			79
 /*					80-95	*/
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
