Return-Path: <SRS0=nO5Q=6Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D73AC47259
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 11:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F90218AC
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 11:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgqeK8d1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LxjJWlYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F90218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=umJSIgoMxS6LdeN1Ywm4xam0oZqTpbMMebmn+J1AVKQ=; b=tgqeK8d1JcWJu7
	f8Ho7qKJ7sdg17SUW5OeVAmXsa6aolKFayyJxmoJr075iW7XoYUf7aN6P/gDuqmY+nQLey+gKb1k4
	a/JOrddbr+qbqtlpEfMdV468VvaihhCXmnIus2eRVsnt+iownXDWeYfCe4FsFsM9Y6fAekJbb+8IE
	qSMjQb3NqHXcvPE21kYZfhh/xWaIA+1xXQR05PljS6pqXKplG+miADjwdJd8lwYoiWIEwBdF2Uk80
	eldOMDtEHkSN5RIjbpJwwp/jednTIbuM3LetzN5YEMmufktO7XadkidciOLhq/D4ZlmNv1A6Aw2xu
	b5hAk7hf/mJmPV5KRvBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUqdO-0007pQ-JS; Sat, 02 May 2020 11:48:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUqdB-0007d7-UE; Sat, 02 May 2020 11:48:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id h9so4644499wrt.0;
 Sat, 02 May 2020 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ04P7TSqYHI0BEsYEPy5ZIV1UfajleYqyakQOSdSE8=;
 b=LxjJWlYBZodSX5E2jkNwT/W4PziNmRdCiio+Z1evlx1zNwhx/yoPrIcoN+ucvrGU0C
 +76kBrRHgROeieclsMy6Weh53cFFIfVQxaL1UDjweptSecxGeMQdTPkCtUWmv38445QZ
 GjNbivCQX2PR+qSifcZOWNVU7Zt0nsXQQ9TW5kvtXijoBYjJvhxxpyJbHdeh/t+V4zBk
 R9tpxCGDRH+eY+rt9G3yD38xmnoocJv9Zg4yLZ7xizk4F2KXoyhCmMsAGlgzqARbwEu8
 te2xwl/bJoHf95zTo2s5rTY1QIZVL/zqfNqe8AJU4MKRsaDzGhkoAKPxDsKyxeijxQgf
 ir7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ04P7TSqYHI0BEsYEPy5ZIV1UfajleYqyakQOSdSE8=;
 b=rD0BZVkte7nQlbd0QXf5Hyrzrox4TG3DKpSEfi6tkY+oties6I8DsQPSMN4kYPDwmi
 vwNzmq7qIAqEi3P/CwlOSoxDq0xXZ3jVd2kMPMMrCb9YKIIShESJ/xG47D5sU0mQbYfE
 WmoK6GdQTuqwgJj3RK9ZtmiePFxkZupAnPphNJaer0352IuuATogGeynFr9SplbuXtSp
 VSt3viOwRFPqjQZV9FvY6xxser/SzXx1LqcRPGAGV+ykQXGCYlSBKIZVzpOVxjJDyxWE
 t16bYpA/hYu4eAXaG6Z4wMWrra1zHt8+3uZ2bnNWeVYZKVL6eOwXGsRtqxGx7dsr2E7s
 Ca2w==
X-Gm-Message-State: AGi0PubK+a502KhSYTyLrubShcLYYXHTqh+1S5SdSAIDZb/PavuSy0E5
 eaFqxllkwbbgI/y2ysizkBLHsKRDq7Y=
X-Google-Smtp-Source: APiQypI4ZUBAtewD7nQbJlc7jakXABjmhVSfjjkwsJjCou8f1sz0NzCq6maAGyorKQSE9MIlA+3JPQ==
X-Received: by 2002:a5d:45cf:: with SMTP id b15mr8718208wrs.78.1588420107254; 
 Sat, 02 May 2020 04:48:27 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s17sm3801599wmc.48.2020.05.02.04.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:48:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 0/6] phy: meson8b-usb2: small fixes and improvements
Date: Sat,  2 May 2020 13:47:46 +0200
Message-Id: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_044829_997217_78F5A79E 
X-CRM114-Status: GOOD (  10.45  )
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
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a batch of fixes and improvements for the phy-meson8b-usb2
driver:
- convert the existing dt-bindings to json-schema and add a fallback
  compatible string which is already in existing .dtsi files
- differentiate between Meson8 and Meson8m2 using a new compatible
  string for the latter
- simplify the code by using a MMIO regmap
- set / unset the IDDQ and ACA enable bits depending on the operating
  mode (and for the latter also the compatible string)

I suggest that all of these are applied to -next because we will need a
separate .dts patch (which I already have prepared) to use the new
Meson8m2 compatible string in meson8m2.dtsi. Otherwise we will be
changing behavior in patch #4, because meson8m2.dtsi currently inherits
the Meson8 compatible string.
The number of actual Meson8 users is very small (I only know one case),
so keeping Meson8m2 working is more important to me (because I know
several users with boards that have a Meson8m2 SoC).


Martin Blumenstingl (6):
  dt-bindings: phy: meson8b-usb2: Convert to json-schema
  dt-bindings: phy: meson8b-usb2: Add compatible string for Meson8m2
  phy: amlogic: meson8b-usb2: Use a MMIO regmap
  phy: amlogic: meson8b-usb2: Don't set REG_ADP_BC_ACA_ENABLE on Meson8
  phy: amlogic: meson8b-usb2: unset the IDDQ bit during PHY power-on
  phy: amlogic: meson8b-usb2: Add a compatible string for Meson8m2

 .../phy/amlogic,meson8b-usb2-phy.yaml         |  62 ++++++++
 .../bindings/phy/meson8b-usb2-phy.txt         |  28 ----
 drivers/phy/amlogic/Kconfig                   |   3 +-
 drivers/phy/amlogic/phy-meson8b-usb2.c        | 149 ++++++++++++------
 4 files changed, 162 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt

-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
