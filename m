Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCAE606A32C
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rJA7WO6A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=aTB3nh5l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vqVal1O2FmvmDaWFByghG0KbYA/TSeADczPHMx00aK4=; b=rJA7WO6AkBtmvTvyZexWlILrIX
	ePaB4cMp4LMbwgDZZczXp9y+kasb3O3rVOSDLgD8ALwETr59kPeNzwDmA1JZf2vhHzKN8QkerSam4
	RF4B7qgt2oXlNF6TLSsXXGsL7//72WshkGwh9mFzxtpY1J1PkhXRlsEFfTFmTTfYCozdtjnLmzDQg
	Wh6kSMtCDTsFo5P5a0qqOndM9t2FyQpHIiu3QbbqxioyMEkK/wQFRGKRjaglnO9mV8qqNSbcMjPXi
	1vQyQf05hCR0XK3J4LGVyJUNCIWzpPvGpBTaXycC34Py0MiziNdteRUK3Ei4DyjoBlpZFvh9AmThD
	TKkIro2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9d-0000000EuKe-0Htg;
	Thu, 22 Oct 2026 20:12:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9a-0000000EuK0-2ybP
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso105188f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699965; x=1793304765; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=aTB3nh5lmhaBVCJA7R8l+zXXm0OdGNaHOLpv4j9FXIfwhsjcqxny8edF9lLRcmdLhG
         jBseK8iRcfOe0docgLYyCHC99mR9uvAGEyuG4TsUcW3OKkGPy21cnNWxNgUZJtglq09h
         mS3CEVNlzUJLfRAteonGg8lcVuSH+FmCoTWiKEwCmvmKi7VxQbKdUtkNrPzuaOXF62Lu
         g8uMkiXRriPOqkLYjRtxWK9+Kvz06sX+dJHJ7XoDLo12TF/HjZl8hQSerqscz2fex0Ms
         6wa/1ZJFlvjOR03nXzFxueic2HfKcFsjEqqDAxrFcRogSUelV9IOiXl76S+mUY8Jjs44
         cuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699965; x=1793304765;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNZQ0gtxT4Wys8jIUcbHf10HyijtjKU9qxZIf3oS0F0=;
        b=dadEEybhC9ZThB0XB81LCQ4RwZtrG22RZL+jDiluMYTjT6S1js+6KlBb3wOarImGy2
         yGpD1Zme6+20U1AFG+BWiCbKNNEWAMihrK3UweynKDmTaNEp87lOtHmm/JoTL186RXmn
         AqzhO4pKwVy5zmcOmWd/ZAoETZrH1JgjM5SyTkxvFYO9ny98MwwKtExi6Bl8GfGUmyHW
         y9JC0ZuZ4XAbuO01k7CX/uUaVw9ac+34g4seTMHTzkt5JK27jxmAPeKNRVyIYMoBTC/c
         ylsyqIwGQ3yN7RXkm1u5hUCCFHDpulqRpk/ls3ViuhAQplGBPL/ds7js8oEZX38YmRkM
         7XIw==
X-Gm-Message-State: AFq9FYLIAW3mIwIB0+qZoiIHaqdZTFLqoenSYjhZfQTOOzlAY3ld9XKr
	yQFwzVbOQHVQmRwUfUkPJjJYer0DyG7lvC2Klo5ZJ8DKFe3ZkQYEjFcOUF9O5pluvOw=
X-Gm-Gg: AYBFou3hEUvZMFtLJTFnjqy0AijebDn5Wh6Flr3uDcsOKqzAAsCdgTeEBxrBPT290UB
	MLPhCbM2D6zDuNly7tY8Gjjre6ptxib2Vuo1ZPFUAVW81Mm47wRMrOb4cpjDRtUdfltBWBkVM3z
	Xv8Ps8pz+KcAm+XAugYD1xJLag2zaMkPjcahQHU9oyoYNE/npR0xXv7KrV3P0Ik6j3ZGdhklCJA
	Vlc7EfbsPcOTxG8QA+LqNh8nXT9GwaLUd0vys6N3GmDr45JAVWUbri9HlR4aTB8OwjFtTdR4ZIi
	V7pMo96KL7On45CZZDkcgklQgoVMLgNMf/RUsZLf/ikGmIVsIvwq6R5Wb7V1cPtpZJmtkDowfD/
	2Wl3e0iy9294y0fylS/Zh3DPlDanu8UXEm2Z2q3MMjeAKUByyR2LI1ZcUbG/Sx5ttS8CnzVIkt+
	toXGHAl1ss/o49byCwunGKsuSSNP4qhJFI1cc4HJ/DRJsc8sCeXl1biFFwJGkUqpzjHDrs4iIyu
	Y8I+s9dAK05pgVl4q8cLEzqDd7p5sF4FrhfMRrA8hW0TLRqRsBxLs5eqDP4hw++a2YrZGecfzXb
	d+RqNpmq9KNgqgy1yUzZRjRvhm//H/GiLYbZXFIa2Q==
X-Received: by 2002:a05:6000:4007:b0:48e:870:778f with SMTP id ffacd0b85a97d-48e2649d848mr12345891f8f.16.1792699964688;
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:44 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Fix the ENCP clock select field on GXBB, G12A and S4
Date: Thu, 22 Oct 2026 22:10:31 +0200
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBAF0KuUWTvQRrDiVcRFOv2xozWGTCpC6
 d2Nunybt5IhK4xOzUoZLzV9xopu15BMPl7BOlaTa92ha53jJVnJ8A+W+c6Iktgws00aCocRvZf
 9cBT0VIeUEfT928+Xv20ZbpDyLWnbPqBM2Q5/AAAA
X-Change-ID: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_131246_795567_DE2A4EA6 
X-CRM114-Status: UNSURE (   6.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GXBB, G12A and S4 clock drivers describe the ENCP clock select with
the field of the ENCT one, VID_CLK_DIV[23:20], instead of [27:24]. Fix
it in the three drivers.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (3):
      clk: meson: gxbb: fix ENCP clock selection
      clk: meson: g12a: fix ENCP clock selection
      clk: meson: s4: fix ENCP clock selection

 drivers/clk/meson/g12a.c           | 2 +-
 drivers/clk/meson/gxbb.c           | 2 +-
 drivers/clk/meson/s4-peripherals.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261022-upstream-clk-encp-sel-shift-fde7ac3b8ce7

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
