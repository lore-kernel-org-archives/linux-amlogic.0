Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19196C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE62420856
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eX+Kc/Dq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPSSJfL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE62420856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zSqT673XiBhSgegmrgNGOOhtGL8URrqrgtsMa6YXXMY=; b=eX+
	Kc/Dq3gFXxChHR2wJeJcvp8dthw+IF4BwF06bYJmB1tWIk5Jrqevmt4Vo/ltmBm9K01elWsnwY9BQ
	0noMJgpCT6yodiqX3fDYwa8qhBcC6AuBGnF+Fed7UQlypaK9HjjA52NY6Kr/OF/Nt4uI9i4P3XsKR
	TIoJea1/b5mEgrPRXw8/mFyipvWAF386Elm1SCNCcT9nMcMy2gKJbRnYvHpbkua6UabZ7rMQSQ18h
	+saVZjYGjpy5+2ecKaWTzkxtipzBZsCWD9J4ALplPylVmAGRGt+ECfGAl9VQwYONZRuTYUdpsOhmT
	/9euOaEZiuXugPjQEdmExlcQVLk4/qA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCOsd-00076z-Ei; Mon, 23 Sep 2019 13:59:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCOra-00062R-Ge; Mon, 23 Sep 2019 13:58:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id p7so10104208wmp.4;
 Mon, 23 Sep 2019 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZSlSPovVH1C68HHuoR4mSQt38eq8rnNz8O+7+IIEJig=;
 b=QPSSJfL1aOg0nq6EnFGDAX7XlU42tnIVmczj8rIsX5h7ye7qZAzW8HgeCcRbIaYivD
 leHtKefJX9inNLpsg29zoSbZUAsu1Ztb/Te8kGNOMzUVGx5DuI01caxEPmBZsw4MStt4
 Sy+SzOMjP64BXgLzwKjbpoji3L4ERPu+ZcP/+5NJkfJ8iL+lxhStreaTfWYJlYCx/lYo
 ZLv3U2z9hxt/CJHrJeixWhrIBR5l5Lluf4qYKIS/D96ewEHBNARanlno6tQtkieattru
 mOklnv3Twz5Xx4lN1XAyRKm1f2PZihr7o3ELGBtHmD8As09NSWZEW79Y6UGGyX8T8X+f
 XeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZSlSPovVH1C68HHuoR4mSQt38eq8rnNz8O+7+IIEJig=;
 b=eq27oI0kiQ4jKzKX7EUoq7fq4H9iNBT0K3QadJ9Q8aDapHSjY4wuFVnQrmKhF/Ov6R
 2gGI01wLEEkofx1DWaH5Pb3SlP+fyaaySFOmxTfXs3hmmyP8FHYGLnNGF/jgVMpQjB87
 q9oeCwPEIlbqjC3m+QdNGZP12KpuPpgZLPd8tf8UgMJvOZSlLwMsSvDmRSKTEDodtD+N
 gzoixUIi8OFKzRUy5cKKYykVCAt5JcBZLCbXnsXMVZPUGuP0y9lKHdFH2j5mMgzq1jQz
 MDVQ02mjXEAyrTSCFzUBZSV5DHFW1E6i6aCdkz79hvqsie8qyiFt3mO8AgCPUWfJyEhP
 ibew==
X-Gm-Message-State: APjAAAWbmPdITROGBUCZaC2s3CEhFa34pBWRXx59ktTV+AN5MRj+zVNf
 nc1DPa5iYhBT/XWqMr55gVE=
X-Google-Smtp-Source: APXvYqx354pK1bP9ANp8dSug8kkg4bI3GeLLbi+p/0E/n8GXT82lX6mUk9A81nyGuEqzAyLDF194Zg==
X-Received: by 2002:a1c:b745:: with SMTP id h66mr13360541wmf.70.1569247128568; 
 Mon, 23 Sep 2019 06:58:48 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm25266184wme.6.2019.09.23.06.58.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 06:58:47 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Mon, 23 Sep 2019 17:57:54 +0400
Message-Id: <1569247077-5212-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_065850_591971_07D4AEA4 
X-CRM114-Status: GOOD (  10.46  )
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
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Ugoos AM6, an Android STB based on
the Amlogic W400 reference design with the S922X chipset.

v2: correction of minor nits

v3: address regulator and GPIO corrections from Neil Armstrong (using
schematic excerpts from Ugoos) and related v2 comments from Martin
Blumenstingle. Add acks on patches 1/2 from Rob Herring.

v4: address nits from Martin except for the vcc_3v3 node as it's not
known how to handle the vcc_3v3 regulator managed by ATF firmware, so
it remains untouched/undeclared like other g12a/g12b/sm1 boards.

Christian Hewitt (3):
  dt-bindings: Add vendor prefix for Ugoos
  dt-bindings: arm: amlogic: Add support for the Ugoos AM6
  arm64: dts: meson-g12b-ugoos-am6: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 557 +++++++++++++++++++++
 4 files changed, 561 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
