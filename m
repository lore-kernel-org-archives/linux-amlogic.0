Return-Path: <SRS0=nO3E=L5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A80C07E99
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:25:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DB2D61279
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jul 2021 11:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DB2D61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6a7SDV7o6jlqVyzvlKulCyzsqhCDFeEM9chMvHc/i8=; b=T1Ks87FFDVQxU7
	cRIsrYa/V+iWS6HH21frS7++KLeduVtQWd85hGBPkFFl2i+yo9gtWJSKvCHYQaGmZ38pX0uuuD1oh
	Z2L925hjOw5ZUzAbCRIU/q/JgeR2IxdGMxxRYkBx7436Wwwo+Wfgbqi/lXRj60hlbc09S5e0Howxi
	QOV90vufbRggnwqs/ZtIKTFwhQLYXR5vaMW/h2mIiB4zYj/X0itQc0emUvHzJXRhKySptPQE9tARx
	FUfs9Nh8/EMo8wPVjgw+bgY4c1zVAjWgbXzwI40z2dfQANVALowwW8QhTRZBfOMsCeWCaCAA3eSic
	s9GzN6WJ+p9mehYcoiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0MjL-008kz6-6L; Mon, 05 Jul 2021 11:25:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Miy-008kok-Ma; Mon, 05 Jul 2021 11:25:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id q10so236729pfj.12;
 Mon, 05 Jul 2021 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5O0fSJhaUzvQBS/JvZu/NJClK6d4varvuShuvbKWaFk=;
 b=kFqMmoZoh8a0/xcYGHZ+zRDysUQBRHcs5T0gDEqAA+al4IGat9cHr1XU1S5XVwXzLA
 uo5MiUMGtf4TQBD5prNba4pon/uJHm25f6+YhwYftINCPjPB6oHsgE5T/68gsDOiuKNo
 2mMqxc966jXfKamCK/ssEvEpKy0PJlpt/yQ5hVNyga/DViPeehIIwUaSZ4Aju0P4Kpw1
 GEW/ICOJhPR6VXDDKfqMZt8c9gTqfOdoM2q6ex1Yyaggpc31HHkqrz5+t83eqmyVdgB8
 OZwF+wBqZR2coEez3wH4uF0iW4or0LfvsHX58sKqi5A7z52WWWshhJDHz1+byd9Us+VC
 ZeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5O0fSJhaUzvQBS/JvZu/NJClK6d4varvuShuvbKWaFk=;
 b=mBaVzZS18kRLSwMouBRe7I0j8dPx+UCYGA2am2iy75tHUDPvfw/B2/fzwBpSRul1R/
 aZZ7sfINBqwdmsEy6f37K0ZGRDNcv467S1PZb2WXhEh5vevWZuYXhM0a2ax2FhkTBqJq
 wSlHXiSxe5OK21ZVWgBvY5DY0F3DcRMiEhupcOjHUMIrHa0gY1lTkzd+ttIo5v3krx4K
 IKBJxbOlE308czOhIpZS7zI2Q0hfz6nWVqT5oLnhYiIkHbFFaHhWxnN0AS18hSmhel+u
 AeNtIFEatfy79OnM8UqooJfY8uzC6UrjsZzw6hNKYwEhQbopz2JMva3F+HtuBxOq9YvQ
 iTxQ==
X-Gm-Message-State: AOAM531v9GSJFwmRLYuid+d9VzBwNbRJ251ncx43Tqle6VLBRiwzUPmr
 ipoIiTElgjhAHJ+I1oNSxr72cahA1k4=
X-Google-Smtp-Source: ABdhPJxnlaG524ObSrCFPEQsAQnTM1rthDLu6NOwfUx5Q9n7OL6ckReIPpid0igp+v8DCbTY7ebrcA==
X-Received: by 2002:aa7:968e:0:b029:319:886f:fc2e with SMTP id
 f14-20020aa7968e0000b0290319886ffc2emr12728779pfk.49.1625484313903; 
 Mon, 05 Jul 2021 04:25:13 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id gi20sm20976959pjb.20.2021.07.05.04.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 04:25:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org
Subject: [PATCHv2 0/3] Fix the pwm regulator supply properties
Date: Mon,  5 Jul 2021 11:23:52 +0000
Message-Id: <20210705112358.3554-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_042516_776000_A4BC3318 
X-CRM114-Status: UNSURE (   8.34  )
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

Changes PWM supply properties help fix internal link of PWM to
main 5V supply as per the shematics.

PATCHv1 below
[0] https://lore.kernel.org/linux-amlogic/CANAwSgRD9_B7f5UjPrxeL+x-eMMc2MAG3tXLQw36x0ho+ba_Uw@mail.gmail.com/T/#t

Thanks
-Anand

Anand Moon (3):
  ARM: dts: meson8b: odroidc1: Fix the pwm regulator supply properties
  ARM: dts: meson8b: mxq: Fix the pwm regulator supply properties
  ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties

 arch/arm/boot/dts/meson8b-ec100.dts    | 4 ++--
 arch/arm/boot/dts/meson8b-mxq.dts      | 4 +++-
 arch/arm/boot/dts/meson8b-odroidc1.dts | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
