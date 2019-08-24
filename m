Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09666C3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:05:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE5762133F
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 08:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RZ39HXkn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+deEbbl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE5762133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VjaYCgX9JWkuu/+GJGCJIO2vg/2vtlmF6StdmOUr53U=; b=RZ3
	9HXknYtWueYSUP9sITKCHJYMucUWCmGCNW9VADTo182kfwj/JfNGu1bz1Oyqt5C6GwazmnhAvoJ/s
	Siib/4qXEtl11wMYfWXY/CvUtogR2s9DG5AIw+QhQ6WpL77e7UY5G2Lx9DXQHCf5+z/lqcHkg7Xpi
	njZA11IEVnSklF/2j1g2bEliJHl9jBNAZr4/znqn+wvVeMHc20mHL8ap7rj1wNnlTDrJPqFLoKla2
	oJ2rHiSX3gWiJHbqgdjCVOxadxc8zzBMvFcI141uGdsJCRuXQ/nkKuZhqT/Hxtq6XabUArMo132hx
	nOXMDkF2hmKycB5TUYUwEuIQyZIjxjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1R33-0002P2-J8; Sat, 24 Aug 2019 08:05:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1R2k-000100-6U; Sat, 24 Aug 2019 08:05:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id g17so10612882wrr.5;
 Sat, 24 Aug 2019 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QxuDzkK00aaOAlXF/Oj/CO+qrmGUaqzzWbuNX1BI4gs=;
 b=p+deEbblvZep63OJ0tg1ZKNocoHPtca5rUFwIcNYqjzJQ6fz3J4MFZx1TfRKM9Zquo
 puHSAqkeniym3CgmDQJk+r12Tz8UNQL3FWo/qhM9DEHEfb1UDSyvVOcnczXcMEt5KOLf
 ByK6/vbFyNUoGTF7qjLR0fwX2f3oAgmxLhqeP69pGoFB/49Oq/GVgNzJ8aeV1PyjeiQ1
 KbBySZ7q6CLmlCHrfsnW1tIBF1PgjAtRBb4pvOPlvY/jrjbin6F303vdKv2wYHb1GaNU
 v42PuoVnuVo3fA6TG5+fNl3ocDAjOGiVPgyqXVUCS71tZX63lshDW1iGT0pnDUPXV8Bv
 52xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QxuDzkK00aaOAlXF/Oj/CO+qrmGUaqzzWbuNX1BI4gs=;
 b=agR+hcuW+sl0rG/cEV3nj6e1ceNN5c5FttFt3P+VJCMGD/xgSiabgwI/VqhdoCgvTC
 6GXJsUnPRNLxRqLObjG/AbL/E143napMj1r5xiRMIyDgOb+zN39q78qgKILsfSk3w7PP
 eU7PuGcgrxT1Y1FFttNKpNfHfGS1VU7z5piOZxcMNfi6sxxehnudTqSMQWski5kr7fMd
 DhdC0ZfDQC05hjWnbwp5+GSDP4Zhz974SemyMy2ibPFMlK0bN5+OVGZrnJbGPr/ugViQ
 BPEbk5+OKO65giLf95jar+HkE6jkHxdhrVbDt3yVV6NrjP/RDvK7x6RY36yHojMeE3lm
 67SQ==
X-Gm-Message-State: APjAAAXY9NghEWND0T57Cm+UkI8E9ZJhGjiu6IOqFnlkSiSlyseStOf3
 znWdDoVQk3j0Nae/ZHp1uy8=
X-Google-Smtp-Source: APXvYqwWknuBhaNc3FSges1Tbji5oWqWhpZ+K1p772146QPQkalYEinGlEhMb/GbaP5Fuxtfph/2+w==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr9944795wro.302.1566633900177; 
 Sat, 24 Aug 2019 01:05:00 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id w8sm16615656wmc.1.2019.08.24.01.04.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 24 Aug 2019 01:04:59 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2,0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Sat, 24 Aug 2019 12:04:07 +0400
Message-Id: <1566633850-9421-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_010502_265173_A82E93B7 
X-CRM114-Status: UNSURE (   9.93  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Ugoos AM6, an Android STB based on
the Amlogic W400 reference design with the S922X chipset.

v2: correction of minor nits

Christian Hewitt (3):
  dt-bindings: arm: amlogic: Add support for the Ugoos AM6
  dt-bindings: Add vendor prefix for Ugoos
  arm64: dts: meson-g12b-ugoos-am6: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 567 +++++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
