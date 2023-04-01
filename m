Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52198C76196
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EdrEKDsOcE1iJod1YzhCtMybVX1ahS/a0yIhohUjLqE=; b=l2uVL4xE2qdgb0
	sBgx9BORnxvyuKfp/xl/tsPxyabUENHM46TihCMMzs4sQbhvwU0UPCjMz+pU5yJ2yICnwYAiY9B2f
	RJKs96VKSeMmn65xs1TFUEcSI/uisKFTgsHUSNP4AbI6xd1nJPRqONris49r9rFyndoBhhKOYhLVK
	Lb5SjVqgQNYsEGqZDp9i+3i3aVay54sOgKJt0qH4oaanyiWYLWOpKaK4xLyQ3OEpj9UGzUL8f44Bz
	884qySju3qMorYggDWdqdXZHYIBRbseo2jZl2vdISdjzvWieOT9OQyR6mRhS2W/BGoTpsu+Wrzfbr
	o8DlSalphGNhzdcXF6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigNl-00B9SE-1r;
	Sat, 01 Apr 2023 18:55:21 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigNj-00B9RQ-0g
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 18:55:20 +0000
Received: by mail-pj1-x102d.google.com with SMTP id l7so23745493pjg.5
        for <linux-amlogic@lists.infradead.org>; Sat, 01 Apr 2023 11:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680375317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy4uihH0Ii9kxE/wqC2siqyFYkxDWx2ySEfeIvi6Y10=;
        b=ZLLUXtaX4xyQvrrSrue6XyAS7chLzHapEBJLwachkkkE8Rcev/1e9eHkXioMAnUdR3
         E3AjBhu6C3Ep24vxzUWjj12P1++LJbzn9kUm0IEwPhJmVHNa33DkDvPAqhtzNzcUYaTH
         avZfp994ZzEeEZrOrZsUn52y7s8VbiCjmRr0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy4uihH0Ii9kxE/wqC2siqyFYkxDWx2ySEfeIvi6Y10=;
        b=UJC3D0UaG5fQqkjrAON/WbWwB2o59knbKLfIAgK0y+Lck/W3yVVUaDKEzwn0FF3mj9
         WkLPSTmzhu9vSuARQhM0i9E6z0FXTemW2tN2Wr43hwUn2D981DTJZEYlXmkorxmhYyVj
         0rJzFDNzrGYbh8p42yyqgW7ZBaX1t8h7Ag+ZEi74MmWD+Hv09YG8+kO9IZoLbQ1aN+p1
         jMStCUS9r38WdXUJIf15IDrdeR00v58MqDoOPr4423RKDKmnUjM9VW79ElL29vwTjLN5
         BEQdgcEAOenXFykjHFiYOnvSFO3JlzbEnD8GclvzCklvUiBY0uOb/cx1PuhZQTAe41Vh
         dWlQ==
X-Gm-Message-State: AAQBX9cfjxipgyFpc/6jvqSmD0Zw7lqztJQlg6Ol6cGbXhjigB2Xeq1s
	INizaHGkL/75hXRRKyHIaGHgwA==
X-Google-Smtp-Source: AKy350bG8I0eTExU9qM8aw6V44tO2SPFqSmtn7C16yYngeScuZ3Y7/ArYT8lNK2IRmAMEzc3So7K8Q==
X-Received: by 2002:a17:902:cecc:b0:1a1:7b8d:6719 with SMTP id d12-20020a170902cecc00b001a17b8d6719mr15569216plg.27.1680375316905;
        Sat, 01 Apr 2023 11:55:16 -0700 (PDT)
Received: from localhost.localdomain ([27.110.126.54])
        by smtp.gmail.com with ESMTPSA id g3-20020a170902740300b001a19f2f81a3sm3664873pll.175.2023.04.01.11.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 11:55:16 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v2 0/1] meson: Demonstration of using binman to produce the image
Date: Sun,  2 Apr 2023 06:54:57 +1200
Message-Id: <20230401185458.2280200-1-sjg@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_115519_323619_9E2CAE0B 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Simon Glass <sjg@chromium.org>, u-boot-amlogic@groups.io, Alper Nebi Yasak <alpernebiyasak@gmail.com>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Odroid-C2 is quite a complicated image with many steps. It is an ideal
example for how Binman can be used.

Add a binman description and update the instructions accordingly.

Changes in v2:
- Rebase to -next

Simon Glass (1):
  RFC: Move Odroid-C2 to use binman to produce the image

 arch/arm/dts/meson-sm1-odroid-c4-u-boot.dtsi | 107 ++++++++++++++++
 arch/arm/mach-meson/Kconfig                  |   1 +
 doc/board/amlogic/odroid-c4.rst              | 127 +++++--------------
 tools/binman/etype/aml_encrypt.py            | 124 ++++++++++++++++++
 tools/binman/ftest.py                        |   3 +
 tools/binman/missing-blob-help               |   6 +
 tools/binman/test/213_aml_encrypt.dts        |  38 ++++++
 tools/binman/test/214_list_no_dtb.dts        |  23 ++++
 8 files changed, 337 insertions(+), 92 deletions(-)
 create mode 100644 tools/binman/etype/aml_encrypt.py
 create mode 100644 tools/binman/test/213_aml_encrypt.dts
 create mode 100644 tools/binman/test/214_list_no_dtb.dts

-- 
2.40.0.348.gf938b09366-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
