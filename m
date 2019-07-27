Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19915C7618B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3182070B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 12:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uY0p4Owd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LOmDlDmr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3182070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nwn4jt4LhAoC9mmjNlAn9XLXKYPyzMAo1Uw48uTkYpI=; b=uY0p4OwdMEjURE
	eGZiBPl6A871Bg97/z4f/EGIeAG0kR++u0GgMSvLydHdqt+UzDbDdtKexUuKa2Z2wyJnmJZIVnrrY
	LeZ/Pj7URquz1hKiHJjsjV3J7ObrIRd/vlVhl07CUoPZ82izmpfS/bDdU/4WudQd6Q3bNBWoxTWrE
	SYXW8e/GAMAV0J4YB4CLbb9sxVT9iflLDSaCjgteWnwmCWp/q2Fpl8NbCwsjKYglpdyyzRBOj6qem
	YD0OSvQHvqX9jMbFot9P4UkAUyQTvKjcLVR/fxp9EcbM0q7sEhMHo5rJJEguoqnmU6MPJfdugKuP1
	uyD11+Wxtr8i63QfWi8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrLZV-0001FL-5g; Sat, 27 Jul 2019 12:13:09 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrLZR-0001DT-NT; Sat, 27 Jul 2019 12:13:07 +0000
Received: by mail-wm1-x344.google.com with SMTP id l2so49692219wmg.0;
 Sat, 27 Jul 2019 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLCia4qh4Cz22hDttZ6msu77sYqghs6856wL5uLXMuE=;
 b=LOmDlDmr1mz6xDDDjD9Y6KhsxGGc5GpRbfnI8QeCXhKDk54z0oBtJ1FEgORz0p5lO7
 6cChwq0j9UmxyrLrL9EzoXqkyp2qNqX6f8/GHtDo1jZ2HncQAYSMiesfCBFyTds5T/ZN
 2D5DOxJgkDNbPqtnph+G2sRJet+7bs7jSP9jd9YMvJI7O9Df3bmxUTGhfm4113MHcmJA
 6z7bLPkWVBx3WARW/BKwItf8xmsdf7a14Y+qKbxtN8f1D8149s/T0oyaPADmZ4Rv4xfu
 Fz4sVS/RFdsbadw0wttxkY/65mEE4vgvMOfltXj0Ii3u2e98AjbUyZ1RHh0b57fPiLIc
 CRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fLCia4qh4Cz22hDttZ6msu77sYqghs6856wL5uLXMuE=;
 b=RMaINE3pT5jxHF9vqFl+0nKG+uILGx7JsIGVqgA4R2vsAZWVvCSRPoMeXf2dTF0/fF
 mHlx7wt8zZetYx+6Ka/VSMFYv+VqADzh0s2Wx99ga72dwz/Z9zQRChDKiGlh/Iik6NyG
 Pqfum3UIlkpDwoLjEPQUjZDTCLe+sxYlgkE+bF5FcR5qLf4uNGz0rjzeIKB4tXGkKZRe
 Cj09X4ebzfd8PLc2gatnov4JbfNq3+e88XS2wDs7AzTrjrNcVWYBVA7rXlnTG6mxOg9J
 RfQ0YcWVKEK+gnPS5VNUmMu7KiAeKtRYDQF3rwFJVMswW8XXIE/BMRzQF9z28/n/D+wO
 Zzhw==
X-Gm-Message-State: APjAAAWVveGTLES8SQuHJzSOTFhPwHWTxbxyIwtak1PsqS18VEA/eRZk
 54CUf87bgkLxz0Zr2CRzzCpn/KJr
X-Google-Smtp-Source: APXvYqwO2obe1eiMHV1lLLa64dyAAI5GwwX9D2mKtH94uAOPDREuajftYBx7vCdviI6FTZ4AfFG5hg==
X-Received: by 2002:a1c:345:: with SMTP id 66mr91417990wmd.8.1564229583045;
 Sat, 27 Jul 2019 05:13:03 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id
 o26sm111786569wro.53.2019.07.27.05.13.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 05:13:02 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/4] ARM: dts: meson8b: add VDDEE / mali-supply
Date: Sat, 27 Jul 2019 14:12:53 +0200
Message-Id: <20190727121257.18017-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_051305_790413_1B73DD3B 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

EC-100 and Odroid-C1 use a "copy" of the VCCK regulator as "VDDEE"
regulator. VDDEE supplies the Mali GPU and various other bits within
the SoC.

The VDDEE regulator is not exclusive to the Mali GPU so it must not
change it's voltage. The GPU OPP table has a fixed voltage for all
frequencies of 1.10V. This matches with what u-boot sets on my EC-100
and Odroid-C1.

Changes since v1 at [0]:
- fixed node name for Odroid-C1 (which was vcck instead of vddee in v1)
- updated cover-letter since all dependencies made it into v5.3-rc1
- rebased onto v5.3-rc1


[0] https://patchwork.kernel.org/cover/10961091/


Martin Blumenstingl (4):
  ARM: dts: meson8b: add the PWM_D output pin
  ARM: dts: meson8b: ec100: add the VDDEE regulator
  ARM: dts: meson8b: odroidc1: add the VDDEE regulator
  ARM: dts: meson8b: mxq: add the VDDEE regulator

 arch/arm/boot/dts/meson8b-ec100.dts    | 31 +++++++++++++++++++++++---
 arch/arm/boot/dts/meson8b-mxq.dts      | 26 ++++++++++++++++++---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 27 +++++++++++++++++++---
 arch/arm/boot/dts/meson8b.dtsi         |  8 +++++++
 4 files changed, 83 insertions(+), 9 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
