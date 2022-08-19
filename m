Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA0C32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 21:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2WNL5nqs6EmFpxNoTRAUZsEZ/LRRg5yUzyOL1i3KvT0=; b=VGbBk+4Ugtr8kk
	mI36PqCbCd96IAO9IZbGnTSxEde1m+n+NToJ3oyfNf/zy1Pvjp5qRB0igW0u+CJylUhOXssdL3luC
	a4R55+tMICPVSo62VEX/vCfKVHVd0R8ODUxD2qXt70LcsELl4XkRjfMHkXFn56eVmjK5GPpBXOwZD
	BgvuSzlnCggCQu3K4HvCQ4r3RzC+ci8kaamkjso60aKTMPjTh0z/9IcqV+mU2CRC7HDE1XNKEuOiH
	sKpIG8reKAwxyLD7JzcsHGddYgsX9mCon9SebmwUA+igbo1Zmne3ia08oDJnV+jNwHMGhAkgHkqYa
	9YjFIfm9qZGVXLAYEhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9Gc-00CHav-9g; Fri, 19 Aug 2022 21:10:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9GQ-00CHVD-TK; Fri, 19 Aug 2022 21:10:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id b16so7056990edd.4;
        Fri, 19 Aug 2022 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=NBYnEE+ZcGcA5nR0OncsdiejmoJcs4SXrksqg8rn0TE=;
        b=EiyN8qkZuhsNuDJ+RsVJv9zoP1v86cPewj3dCCdAj0WYbrTz3IirRHornfoKHN2EX1
         RblJRqealF3qlKnPECTIwKWZZ/zDWPFp3ltvIqug1U99zKehBLyIfmijWjGfsoKf/rlr
         PwCNSiAbveAo1fecac9NSaBqZ0DR5MX51x3PMTOl+LVh4E2UISSLNP694xM6XfZBtlVu
         jfBiCPlbCjMBKKvsRB5VJFePvicx5pS0XrEWAl61WlC9Np9Fxn/0tiehNp+8gWSOV25i
         m0Kgl4NlEDFPmR4XnHYZNzeV57bqLO+Hp6BTcwZO/4YrlDwH8F1Jx7p1Q1pJbuaiSneT
         76FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=NBYnEE+ZcGcA5nR0OncsdiejmoJcs4SXrksqg8rn0TE=;
        b=Hu4Ra42nLtV/hyjG/uryDRT5vUvRPPT3UMAnN8D6kPr30buoHg3odCWK+SUiAhiSV9
         K+XP+vYX9khDQ5uHg5UUobxca39lXwqrVqEhIKUG6SNpcFoI6NmjSTVAg4X62AKZMUve
         qUy9ZngLA48kJ6aKw4aN7N/lUEoFGkm/ulH5DGmszljsE+vFOfCS0jbwa8tXFVd4NHlg
         wBINsE1358MZ7Yoe/rQIQB3vRDlT7FxAD4OSfrjUCn+AN664qI6gV987sjkt0G/yu93Y
         vER0uG1BiaBdb+bAqZC7dUNA/xcFaI9n2c5Aud5MxaLFcZXbiJpuLp4SJOYRv5E00odY
         3Ozg==
X-Gm-Message-State: ACgBeo0iGnuA9JWmsvICl0tGmlITpIs2110Hw5cekdFM9ILeV+p+IBbM
	SEaQRApsAb7iiOcWCNJfKhY=
X-Google-Smtp-Source: AA6agR4VpzpXQDagnJncbtzN+KhdcC2/IhTNEsoqKtJlpg0z+zwnqYF71XvfVTe656IzmITn63iZjw==
X-Received: by 2002:a05:6402:10cc:b0:446:491f:d6dd with SMTP id p12-20020a05640210cc00b00446491fd6ddmr3105505edu.360.1660943443774;
        Fri, 19 Aug 2022 14:10:43 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5ac:3600:6819:de7b:5db7:493? (dynamic-2a01-0c23-c5ac-3600-6819-de7b-5db7-0493.c23.pool.telefonica.de. [2a01:c23:c5ac:3600:6819:de7b:5db7:493])
        by smtp.googlemail.com with ESMTPSA id r10-20020a17090609ca00b007317ad372c0sm2785649eje.20.2022.08.19.14.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 14:10:42 -0700 (PDT)
Message-ID: <b94b7f5b-1095-33a5-b1a0-20a6e2281bce@gmail.com>
Date: Fri, 19 Aug 2022 23:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
Subject: [PATCH v2 0/2] mmc: meson-gx: add SDIO interrupt support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_141047_014500_E6FFA8C3 
X-CRM114-Status: UNSURE (   4.47  )
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

Add SDIO interrupt support. Successfully tested on a S905X4-based
system (V3 register layout) with a BRCM4334 SDIO wifi module
(brcmfmac driver). The implementation also considers the potential
race discussed in [0].

[0] https://lore.kernel.org/linux-arm-kernel/CAPDyKFoJDhjLkajBHgW3zHasvYYri77NQoDpiW-BpKgkdjtOyg@mail.gmail.com/

v2:
- use new SDIO interrupt API

Heiner Kallweit (2):
  mmc: meson-gx: adjust and revive constant IRQ_EN_MASK
  mmc: meson-gx: add SDIO interrupt support

 drivers/mmc/host/meson-gx-mmc.c | 90 ++++++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 19 deletions(-)

-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
