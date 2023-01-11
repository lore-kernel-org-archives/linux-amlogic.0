Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CDCC46467
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6MkatyQEImMhz1tcAUxlvKVe8L911sTDcLScSGgatM=; b=FXLaP1uKpVaPy5
	Fbis6alM/vM0HDBd3kjKXFC3g/mKdx6qnIoPJudSCm/MF25lCz9PBJAISPI9wu4BYJrUbbjSKqOmh
	olHHx6X885tVcViTwGZaoBDxUerL2yT1SadTTs+1WS/FbWEpcSpfNN3sB3srsczTX6zM6N3fpJ5sQ
	rsEBW3e8gNgfgLrnUKlRLdtc8OLUtCHmEcDwD3Gdke1vT8wDkh1J5KxUvi3jEbBfh3xGe0CIollPk
	Yr66NQkQIjQOcPNmKV21n19SXqOjdbAlV3tuhBMHVDEfsKIAbMF/BY6M/wXr9z01eRi2uB3UoKZbQ
	IckbtN7n5HPcST2Cl3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQU-00Cvvl-Nk; Wed, 11 Jan 2023 21:14:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQI-00CvqZ-Tv; Wed, 11 Jan 2023 21:14:16 +0000
Received: by mail-ej1-x634.google.com with SMTP id ss4so32796003ejb.11;
        Wed, 11 Jan 2023 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KWjxzoa+0Z8TK3Nm9GrwoHtq0LtxqCYWK389rFuM4E=;
        b=h+a29CQk521D2NrlQhe/tYo4lGiNT7rWELIhXIO7Ml+NcbO19CqX+KTlJlvWR4kRBu
         aQiESvFQdxrCDULOctz896YF/MGoQ6JWSNtHJ4oDFShpfL7amueB29VWid2ATGYMGksZ
         H+Wn3xPlD7A7EWRkFVHtYKVBtJ3E5SN2+GeoiIq1ujI/gqogRFPZ5y/emD1UlwJayNvp
         XsWH+46BIlp0Pa6mvyiDP5xP2wdQXHtfuGRHvqo1mP5rX/hQsuCL0f2AtVeSxOMJKsa8
         hVOvFwJlwGWAdVtv6fGiRWTvpSM8emluVaT0XtI1FAGRwb36Id2gl9WJP8+c2vnJwGWx
         T1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KWjxzoa+0Z8TK3Nm9GrwoHtq0LtxqCYWK389rFuM4E=;
        b=Kz6P0ya6QpfvWe1mXb1Z+1H8Vuc2xvNlXxbSyM5H8AQhfTJmpV2AK33lXQYokpGKTe
         yH5ELWJ+CdAUFdWOMMAV6xUidZMN7a6UnyIGJ1Ry+VELpiQykcVcoLZIkGfbomMcj0dA
         /1hXU/WhSFjSxTrSnO1WDvAiG/ROvzPX6xMmOd8Doz34/+3OyTP9YruZoeUeiARCkfYi
         g5Jb6PFqXMGPZ0+RdIdaFEE6q86KzOuOWDwMilAIteaolMVA2KHWvb1u+n+XxYA6NW2C
         dLbkbqx+FheVR34Ejxdysk9z9ljOFANzQBaGZ6GWNtvUip6eOlBRDUxE8trWxizePyEc
         xt7Q==
X-Gm-Message-State: AFqh2koIYc7QG8f5WkEHFGZBnnvGwR69W6KpzkM4ruJju3O6I62DO2iZ
	BzYZ3+zFyCmGKBtLh4PzgqrLyJOOOsE=
X-Google-Smtp-Source: AMrXdXviWXJj85GeCtIXoZKzZUXvd6xK/W7+pVSJsYSAEmdZ/yIUlK9nKM0tvlA2XVXqOD3vnzoNEQ==
X-Received: by 2002:a17:907:6d22:b0:7c1:52c:a960 with SMTP id sa34-20020a1709076d2200b007c1052ca960mr83309019ejc.8.1673471650160;
        Wed, 11 Jan 2023 13:14:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:09 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Vyacheslav Bocharov <adeep@lexina.in>
Subject: [PATCH v2 2/6] arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth MAC node name
Date: Wed, 11 Jan 2023 22:13:46 +0100
Message-Id: <20230111211350.1461860-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131415_007811_9E3A7E34 
X-CRM114-Status: GOOD (  12.19  )
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

Node names should use hyphens instead of underscores to not cause
warnings.

Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
Suggested-by: Vyacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- new patch

 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 270483e007bc..bb7412070cb2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -86,7 +86,7 @@ sdio_pwrseq: sdio-pwrseq {
 };
 
 &efuse {
-	bt_mac: bt_mac@6 {
+	bt_mac: bt-mac@6 {
 		reg = <0x6 0x6>;
 	};
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
