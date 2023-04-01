Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B95C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Apr 2023 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EdrEKDsOcE1iJod1YzhCtMybVX1ahS/a0yIhohUjLqE=; b=pnIg8J0Qz1Rf9a
	B6eT9CQ7uteFVIZyGOhd/tENLxyJYsdcizUN3z6baxpDCxG8PH7d9RPlihtq0S5Z0Q+2/x4vgubLB
	e/PP4WjzWNtm2WbYoRZzDVuQRWnoZAp+YwDRSHU1JdKlookwS/KQujlYuwk4a87gYYvaAO5m/S66e
	JGUrHlgYC1XGlzkAKhSIUPp6icV97TIaT4n1MdFtudH9Hhx9y3x0PB0r/MzAw/IkUFhLhYy1zkHpB
	ZrvaDb4pvTb9zSEBxNdEYxpzwuzCcV5wpqt2PTh1+qCxcozTSadbBzNCLXlJPfH+xe7LoqF9B09NW
	MK65HhbbyGdYjqbwgoPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piUm8-009rDc-2S;
	Sat, 01 Apr 2023 06:31:44 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piUm5-009rCk-2g
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Apr 2023 06:31:43 +0000
Received: by mail-pl1-x62d.google.com with SMTP id z19so23489748plo.2
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Mar 2023 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680330699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy4uihH0Ii9kxE/wqC2siqyFYkxDWx2ySEfeIvi6Y10=;
        b=RDIi5W+DRaGNim4yKqENmDeWAhjz3NbkHGNVQ+KcoxEmOcwt9YUBXiVR5/bY91/xrD
         5O38mNBCT1IlAjyhq7ac+emL8kFwQWV5DtfI9vdixOTdnsJva7pAZ7MMI3Ub3RY/npMe
         yiIOW30PfcAsLBHAQlBg0zsc2k5sQyip7Ybi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680330699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dy4uihH0Ii9kxE/wqC2siqyFYkxDWx2ySEfeIvi6Y10=;
        b=2Y0YPr6zUCVsyn010u20QufIXy1g5eg4uuYz9pTgHJ3pydoIesiNSuDVjGVIflA+XG
         Ou8McmiQDf2eWO0LQ+S6POBOSHyvVNzOns3gPqj0G0v0VS5PVGg+FhxPXrlw8telTlAW
         iKD8x3g5RUwavYfcOuNkm74nvFo7C3LjUBL3fgIb6j131l836tUmTsSXj50hpqYC0kas
         wETva2jAZG1faBv4ZG42gUDSikLnupKO3kaGmTMZH4Y4dn4TJeHf0JgFmlDz22ZoOoVS
         ewZrosqaZ1C+LATn5Gp0AzRkInkjHHW6AD2E77uWguBi0u7OlfFtGLuDBfD3vwrYIPlU
         blFQ==
X-Gm-Message-State: AAQBX9dPLWO5vNpcxDFjZe3SWiR8+OdrI1xY0LdhtdD2EqvkuHixSQvW
	A66KN4KWVAOPMSeCaZeK1SAHKQ+waQl+1qGGsIM=
X-Google-Smtp-Source: AKy350ZpzLy2Z4tYn3RLqK4Tmip/iTl6oGiue5SnKUN0o5RiHozQsTmAjI1T5zr63mUR0Mdwn29jKw==
X-Received: by 2002:a17:903:410c:b0:1a1:f0ce:bb8f with SMTP id r12-20020a170903410c00b001a1f0cebb8fmr23595811pld.65.1680330699564;
        Fri, 31 Mar 2023 23:31:39 -0700 (PDT)
Received: from localhost.localdomain ([27.110.126.54])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c10200b0019edcc30d9bsm2598077pli.155.2023.03.31.23.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 23:31:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v2 0/1] meson: Demonstration of using binman to produce the image
Date: Sat,  1 Apr 2023 19:25:43 +1300
Message-Id: <20230401062545.2267422-1-sjg@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_233141_890648_EAADB1EA 
X-CRM114-Status: UNSURE (   8.22  )
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
