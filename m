Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CAAEB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jun 2023 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+rMu6a8sYPc7krd4Xg+Jiy7FVQys3sH/X5o/coNPqM=; b=TX3x8KmNGxR5La
	9qlRS+7wX1JxkgVC4rmIl5wAFS6yQUIceuym5sp2FqvxWQhDXsbPVlSymCiBnW+HxLztbGPAizUCw
	6hVvewBUhZP8wUBimwzVqvduS9w5BQAL8zvdOL3gpR0rFz73zYH+Dl4RPG0Ebj+UZSPBuNYvNcyep
	Dg/T9Vb6Yoa3M3YmX79UqduC4isaILDrEWmiOjGbsXzretGGIHNAQFdOB0zHcVcy2qCBelGoDRzoS
	i5sRqS6Hd/EcGlG4NRksXqW8dgpPVwMYQaQHR/tjWqR5vFZL4yAiTeVE1Qz9a4ERbIVI/cg1YsNVq
	j0Ehb9WsUT/+fJuF9w8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9M5D-00AvXL-1W;
	Wed, 14 Jun 2023 08:42:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9M5A-00AvV0-1b
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jun 2023 08:42:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51640b9ed95so10980802a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jun 2023 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686732138; x=1689324138;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opM3iGVAspr9kRraTUg2dpdsl+wTsC8aJ5I0FXPKrxw=;
        b=Wk16ZydFOesluSaK1ZqoT7KG3Fhc9htRTlxyRk8zkhykFxIghx/+7qZ1xLgdjxioMl
         LEVJniNwvxFsDjV7gtJm4TGphBPptwMGFh3Gx0XjBeG7E6NAD2fWvYjj3XLj+aOTw5kA
         pw3IRYRBltLxeRvXwUZeHOLJTQv030SaUZX1npNTxwHv2qjj4eBonmg1z2IyhlmKhpiv
         uGcfMRv5fiPhhlQblMHQciZkZ22QPAptosBU8gWsq62vAZg+9ZKqIO/9wYOqgrWk3g/a
         imnKZSvZY0A3r0NwqyPj37gCjsYv0vQKa32yh2e2w2Teufs4J5yMwP/XY9u4pWnwpnfS
         KEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686732138; x=1689324138;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opM3iGVAspr9kRraTUg2dpdsl+wTsC8aJ5I0FXPKrxw=;
        b=AmmEABdYPupXk3yONxBNiJhoNd1fPTogGhPZf2uE7XW/y7xUO3EWnSEg2Q6+VfrIhV
         7dgOJqgUxV/7kJsfrSxYkiQZ+0c+R3r9Wy2uEjBr98u7Lsp9as1FtvIyPdVQrumyRJh0
         DC8hFJW1kjW2JG0BiBr7d98mD6tLUVS9ETHp8wMeD8/97CT8858x8S8xCvDImDnoedBO
         R9d2Wl9oXaoS8nbk8kvw/emxy+zT3qC9TSv7tIoa8aweIWmsKslq0NIz7bKg6AGOLbX0
         Bucxdlm4zpIaxlBrzqjHFIKRZiQz2RqsYhrf+asLfY9DoJvF8wRzVyjni0eNjiJuwY/d
         +N8Q==
X-Gm-Message-State: AC+VfDxanuIo2py0BNysaPdXQPGD83YpgrY+wz2sLxZmloGfartH6P2o
	iHvZykKNuVx3AKll4y33Dj0=
X-Google-Smtp-Source: ACHHUZ7ya47oM5/J7tl94dZdyLzklENOnczzEO6zvU9K1dvMu+8hLctghYF1M6GLPCAEacPna04cBQ==
X-Received: by 2002:a17:907:3ea1:b0:96f:be1e:bf1d with SMTP id hs33-20020a1709073ea100b0096fbe1ebf1dmr14432692ejc.69.1686732138321;
        Wed, 14 Jun 2023 01:42:18 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:fd81:17b5:3295:3921])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906348800b00977cfa6ff46sm7685042ejb.103.2023.06.14.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 01:42:17 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jian Hu <jian.hu@amlogic.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: repair pattern in ARM/Amlogic Meson SoC CLOCK FRAMEWORK
Date: Wed, 14 Jun 2023 10:42:12 +0200
Message-Id: <20230614084212.1359-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_014224_532925_4DDCAF72 
X-CRM114-Status: GOOD (  13.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit e6c6ddb397e2 ("dt-bindings: clock: meson: add A1 PLL clock
controller bindings") adds a file entry with pattern
"include/dt-bindings/clock/a1*" to the ARM/Amlogic Meson SoC CLOCK
FRAMEWORK section. However, all header files added in the patch series to
add Amlogic A1 clock controller drivers carry the prefix "amlogic,a1", and
there are not header files matching "a1*".

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the pattern of this file entry to match the headers actually added.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08c7efe271c3..08f7c69c67c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1887,7 +1887,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/amlogic*
 F:	drivers/clk/meson/
-F:	include/dt-bindings/clock/a1*
+F:	include/dt-bindings/clock/amlogic,a1*
 F:	include/dt-bindings/clock/gxbb*
 F:	include/dt-bindings/clock/meson*
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
