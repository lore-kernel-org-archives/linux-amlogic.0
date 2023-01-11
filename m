Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E25C5479D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 21:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1M91YnyLeoF+0TvYnJMh/uebRpc2nSLC75luhFS6Rg=; b=eMSL+U2GQpncgo
	y3P7SXtWIwrviH5o+MHNaeqCJKG0dPxujHuHpDfBGTRiKa7+UzVs8QPxT6TlTrLVXhVamB9uRdXgG
	+IWzdANUN4pFknKyGBMWvXkBVkwnvoSSbLEB2b+ZsMUawd1dUwYeDVbpWZzeutajHp6awcePoHTxj
	wpSZ/tlCbaKmNxzm/e7xszwfCmP0zjuS6cJkyAEyUbLD8IKV9qoz5Tx3Y0Wz3XZridjnGxkLvEfKc
	rxD9ELwoacMCf0J6vMoqoM2Nhw8H6yIsE4EAOhxw5SwVhb2MXvPaDzBEr2dC0mD5B+eQXfrQjtc2A
	KqZKmu1sr3oPN8mFb5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQe-00CvzU-L6; Wed, 11 Jan 2023 21:14:36 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFiQJ-00Cvqa-AU; Wed, 11 Jan 2023 21:14:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id m21so24250404edc.3;
        Wed, 11 Jan 2023 13:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO8dFAy9lMaaw7MiruB5XRKNwqBVqDzEtNURhlDQIyg=;
        b=CkHbDQgssw9maLWDccwTm3a8+1oO50Yg+wcbWGvIKmM1Pz24pcOvvE1vYDfNa2Stec
         70aL+nl8mGNAYo/x+HhXp8MrnqJhypqAERDcRAnwhX723xIhspDj/N5XlP5V1naLG1Cu
         ekglZxKIkAqxU1TbxD1h7HFvMvRchLrE9ODzBYCMtfg/QxRWUZJNBIzzWNOuOdCaBdYk
         I3jZxAoH+3Kv7knmoT9Jc2y+qvjl5LcoWeVH9y0JxoLvys5wgZyN97m8FfrUeEfKhZsf
         zdFXNDy4Fo2flLDLpuJKSWx7z3YhbndbPp6dwKEfr0FimKsKIM+RmahwKPWr0DnmTSjN
         3U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yO8dFAy9lMaaw7MiruB5XRKNwqBVqDzEtNURhlDQIyg=;
        b=l2pHqQreTOFcKQIDG9vGm6ZwSmtc2fFd2XwvkcT27RgVc7s/ur9SBLD0z+YoA3xtQv
         YpgOec6mjV4t49sJ2fKJGYqPknTshDUANOj7qUk9WCKeHGv/q4HBHoSpgrDoDx/r/Mlu
         yDz4NUycSZ5Jqxvz2yZUPPzxk31+x86HrWwoIUSPGz1NBXmn1gYguSg3pDWm/HvmmlXD
         Z3s/ko26TqQoMtm3GoZEJDvnQ/gMkcFYsmdk1yo47bAjtaU2YDxuMbOhAsfhhV92YQ0H
         eoU8LM7wIsqEpwqWqCTh+I7KG8Mo8Jbjgu28SL0KtGw7PHMBCOGT2WmQDojGgfOueW7I
         nelg==
X-Gm-Message-State: AFqh2kpTt4AtQjD01bvEnJ/+Byu1y2SrFXKIb69Z5VEOjkiRElQsD8ll
	Od03UleB+RRh/6dQSn8QBxV1rhIcVyU=
X-Google-Smtp-Source: AMrXdXsMaupXPk9MGcqylPAR4I7rmZ1B1hapevHU6JBFJhSZrLhk5VotR+euRXs8TGhuk2HkY1rqeg==
X-Received: by 2002:a05:6402:d51:b0:499:8849:5fac with SMTP id ec17-20020a0564020d5100b0049988495facmr11202794edb.40.1673471648883;
        Wed, 11 Jan 2023 13:14:08 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7325-0300-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7325:300::e63])
        by smtp.googlemail.com with ESMTPSA id l4-20020a056402344400b004822681a671sm6485079edc.37.2023.01.11.13.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 13:14:08 -0800 (PST)
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
Subject: [PATCH v2 1/6] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC address node
Date: Wed, 11 Jan 2023 22:13:45 +0100
Message-Id: <20230111211350.1461860-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_131415_476064_1B3E400C 
X-CRM114-Status: GOOD (  14.34  )
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

Unit addresses should be written using lower-case hex characters. Use
wifi_mac@c to fix a yaml schema validation error once the eFuse
dt-bindings have been converted to a yaml schema:
  efuse: Unevaluated properties are not allowed ('wifi_mac@C' was
  unexpected)

Also node names should use hyphens instead of underscores as the latter
can also cause warnings.

Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
Acked-by: Vyacheslav Bocharov <adeep@lexina.in>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
changes from v1 -> v2:
- Added Vyacheslav's Acked-by (originally given as "Vyachesav", but my
  understanding is that this was a typo
- Also replace the underscore in the node name with a hyphen

 .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index 6831137c5c10..270483e007bc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -90,7 +90,7 @@ bt_mac: bt_mac@6 {
 		reg = <0x6 0x6>;
 	};
 
-	wifi_mac: wifi_mac@C {
+	wifi_mac: wifi-mac@c {
 		reg = <0xc 0x6>;
 	};
 };
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
