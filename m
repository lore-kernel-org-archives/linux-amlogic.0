Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99DFC43334
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Jul 2022 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lW8Crtoz0RSrJ63NQoJlvm864XudV9ygA43J7jIvYl4=; b=4Ahfex5kTP+hmp
	9UuyXM9ixNsQynHiCXbR9QzAzkI6K5LxXTmQG6Nb9acFsSGmRYlPZdPr2DQqs6bIjUej6ThuKF8wh
	uRVto9J9pItWHlTHjMOWTr8/TrCsTIuMsifAMNYLK89nlgYHVlJN5Zg/lPd0z1WPqNBgtHXyflvVe
	1p0aoa2IYmKt5NQ+lAcyUexwU7st5mZZ3pkCmpLv+bxt1aQm2N5Lc/SOUfUK0d5qUcJVo/aDudrdl
	mjkYNT8rbIJO7W0UL2OAY5DO/slEsxNSGXapdoVFBjsq0Jby6QDCgf9xzAsXj8+5cqjmqCd7z61lx
	UrYF3Kzxu2SdNQrMLV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Nzc-00FQeq-Vd; Thu, 07 Jul 2022 09:40:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NzR-00FQZ7-Eh; Thu, 07 Jul 2022 09:40:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l42so594267wms.5;
        Thu, 07 Jul 2022 02:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=cfC1eHw7vjyJEGT4bP0Ijue63QAf+zrsCzWAQ0rV+Js=;
        b=eBaCrhvMik2nM7yS82rCJEfeku6KyF5Gd9yVUjzBw9knDNqqQA3UHJLWB7PgMDbT+T
         PDa6S0zhQQ6h4qf5AEA0ayAM7yxjiKcl3IkCCQO71pYoys76DlHv+cjOrQYOGj1bszh6
         vZaHugoCRLiR+X2f9O7nnnQBgtxTGIWQm614m743tWWHXzwY7YTiw/0Y3Tbx5sFphmOz
         9by034TRbwnNZCENdFEUow6A8kCv3srDOfcUUWDC1TiGjqJKrODDOgq8Y8DR13WYOr1/
         iMmG31vrAxgbsLlB+QKtPI4+gphvXPMTzAQtrIBp/lI+kMGH2IC4//b0EfdMFBfH+RKh
         DBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cfC1eHw7vjyJEGT4bP0Ijue63QAf+zrsCzWAQ0rV+Js=;
        b=1IBtmjcxKiuUp1ZlxWVWwX8DFO96AcE2eePkjoUDEp8JNkwQmlzCtRquluF0PTbH2k
         A1ltPSH5P0rNOd3n69LDc4sN7BCH6DUTRuCk77sRwGuc+Jr7s8XIQZRFYmDJoQENdpor
         0Yt9sy68IahradW0XVog24OtMJvfvP3QWUBKkZjPMVshJHsRT0zoVdAXBAJgq11jmonE
         S9fl33yt8JoTbVTAUpxuD2NfWlvMmkC+fa3hx4BeLxN8Grge4lJmBzTtVTWXM8H0AHhz
         QBPVv9WuJv/QPOCJxR5gL7XLJYhOo6hcgX5wLTjqhC73Mbmw1vzdZOscNkoKYJ4npu6i
         Cyow==
X-Gm-Message-State: AJIora/yGZdzLDH8mikQHav4T1IpFekG6cd72oC4Zo1FnMBxSy+zpe2R
	PnSXUbeMlEksu77w9WWbO1Y=
X-Google-Smtp-Source: AGRyM1tV3ux5VMnFhY59IYP2nYIcJ/IVUvUn/b66ZUw7h8bA6IKJ3xV0bIf+akq51E1t5JZKF5xDng==
X-Received: by 2002:a05:600c:214c:b0:3a0:401a:6f4b with SMTP id v12-20020a05600c214c00b003a0401a6f4bmr3209000wml.15.1657186799374;
        Thu, 07 Jul 2022 02:39:59 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d564e000000b0021d68d3a27dsm13831314wrw.45.2022.07.07.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:39:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Beelink GT1 Ultimate binding
Date: Thu,  7 Jul 2022 09:39:53 +0000
Message-Id: <20220707093954.21716-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_024005_560477_2B20E66D 
X-CRM114-Status: UNSURE (   9.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board binding for the Shenzen AZW (Beelink) GT1 Ultimate
Android Set-Top Box device.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 61a6cabb375b..3217c069673e 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -120,6 +120,7 @@ properties:
           - enum:
               - amlogic,q200
               - amlogic,q201
+              - azw,gt1-ultimate
               - khadas,vim2
               - kingnovel,r-box-pro
               - libretech,aml-s912-pc
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
