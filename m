Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF13DC2D0FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E33423126
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kc/pEkae";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hQvwoJ0s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E33423126
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yt9sLZb/hVVzcK4Zk9Ilnp/G+S3C3EjocCbBbKVPsjg=; b=kc/pEkae+cMfEe
	ZZbelTfCEQf02iREAsATPbNuAFrDQiP5a3Qz+LEVqGhGJNrxvW6JJMUckgDvX3LdSCR3kclOdZo11
	NJQBvWB7H1n/Ihj6LJqwIzGx+xLR+P9rcpszLHV+uRwwbcCz/ykkDCZ70MrF1gqLGg/W9WSsNEwBz
	MEGYk7i4JA+PXJnRSxurRYEzbHaYyROpP0nIJgyaBh5jEC9HcFFprNVFTWSi3ZBAqFNPfq7XHoj7F
	o0aVNw98N+SluhzdIBR6GAGthD5vsNgLRI8+4H2LfuhAiw1WmC/dSKeitEfEuerpXK3zKzIxS6DRW
	ANQOUzYTG3Yu/+u8wGcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYdKH-0003bE-Gf; Tue, 12 May 2020 22:24:37 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYdKF-0003Zy-Eo; Tue, 12 May 2020 22:24:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id f134so11971675wmf.1;
 Tue, 12 May 2020 15:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3JYtCC160grnwE6BvzFFT35Znva2JhGH/nT4YDuTlc=;
 b=hQvwoJ0sGtbGXc/vgE08RpNq8NhCXWwbCYEAw4DdaOMFvlvGwQq1geEbh1X7M2eTKy
 4oLUxSPSkXscP0Nxs0cx6IHK96imv/vwnucMyZkl40CO2vwhNxJnGqKoWdDrRwA1BcNx
 Ph1tljbnb1NEEvAeZ2zUnVD82u8fPfkLAeJ3lwcYcMMbwanqulK84LMjywJ8tJT/imK0
 dBhNP0wAfOBoqyVxhD1UaUMw903d69lo86FVDvEJCY/wkstJVDCV8NIRV6jujIVcxZ13
 E37RwPQVbRymP/7cf/p8pBdoWlxVI6Fwh5bp3YgaVXbUPaM+kgnJHH+CjMVA41qYFAgw
 qI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3JYtCC160grnwE6BvzFFT35Znva2JhGH/nT4YDuTlc=;
 b=oi4JartWhx0lzgS3DCgchkEmNkpl16/Mn3yGz70hUtRLEBi3EE48vboRWuCKfsuWB5
 bIBR+qw0bFyNxEJ7xGZBYgzGRFTxxxcAV2lJ8bfkH2Mwkz0yYU4ZEJMexVnFTXdRc+In
 wetrhXBhxmlDejdZVlPRkmXSaBJQaGrbdqGwuvVQP/7Sy05tiOd/uXCmZjh+F9DL93z7
 a2l991Iji9cH6XBI56myyZQJ3sY8bJiSY9D7GDLAKETvmdcrXpemwKittfRJTNcfJAsD
 BxyfHBMT8EKOBWSKl7RbX7oCuqQeDCsge96eOSGoZaVocOyf9Ufn3WTJ5XrugEU6iz33
 wwag==
X-Gm-Message-State: AGi0PuY/kynT+JaVODru4KHkxYk+J+bTUepsM1T8/AGcRbQahRnygaBB
 vlp86Dn9T485EklxD70+sS8=
X-Google-Smtp-Source: APiQypJMD560C6FToyg3qo2nTuZXPqWd03WMPLbFvRw4fTasGxutlwQXHPM1M2jgjkLV9Nm9/AXE3g==
X-Received: by 2002:a1c:9cca:: with SMTP id f193mr38545472wme.71.1589322273850; 
 Tue, 12 May 2020 15:24:33 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b2sm21758758wrm.30.2020.05.12.15.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:24:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/6] phy: meson8b-usb2: small fixes and improvements
Date: Wed, 13 May 2020 00:24:18 +0200
Message-Id: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_152435_518439_5E0283A0 
X-CRM114-Status: GOOD (  11.75  )
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


Changes since v1 at [0]:
- added Thomas' Tested-bys (thank you!)
- also switched to the correct email address of Thomas for Reported-by
  in patch #4
- added two more spaces for the indentation of the compatible "enum",
  fixed the indentation (was three instead of two spaces) of the
  phy-supply property and added additionalProperties: false. All
  spotted in patch #1 by Rob - thank you!
- added Rob's Acked-by to patch #2 (thank you!), after fixing up the
  indentation to also use four spaces (same as in patch #1)


[0] https://patchwork.kernel.org/cover/11523811/


Martin Blumenstingl (6):
  dt-bindings: phy: meson8b-usb2: Convert to json-schema
  dt-bindings: phy: meson8b-usb2: Add compatible string for Meson8m2
  phy: amlogic: meson8b-usb2: Use a MMIO regmap
  phy: amlogic: meson8b-usb2: Don't set REG_ADP_BC_ACA_ENABLE on Meson8
  phy: amlogic: meson8b-usb2: unset the IDDQ bit during PHY power-on
  phy: amlogic: meson8b-usb2: Add a compatible string for Meson8m2

 .../phy/amlogic,meson8b-usb2-phy.yaml         |  64 ++++++++
 .../bindings/phy/meson8b-usb2-phy.txt         |  28 ----
 drivers/phy/amlogic/Kconfig                   |   3 +-
 drivers/phy/amlogic/phy-meson8b-usb2.c        | 149 ++++++++++++------
 4 files changed, 164 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt

-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
