Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18285C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:34:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C454220758
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7N+brwV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPMfBxuB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C454220758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=apS8hQfItRMtCuaRr8RgY6K2Le2wKQSaWAeRyFWoTRY=; b=u7N
	+brwV+Bcq7jRTwI6k35ZYRj8ooIMuotcaKz/rtAHwE6Ao4d3M341I08YtVhgtAwSyWxQJEQru0UhI
	xXxE6mRyhBm9OBLN/owUf77zDEEbBoyp+0590CGviGPn2Lf+fDmtv1HUyOeSmno1XkdVPSkW7tMoa
	wmcFWYHTs6+VE1x+35zQC5loABTHnn/FFaX42L0NvgxUhGy0VqV6mdkosUnyCniCHuCXsr/D+qi2V
	BhrAUSbE5gVPpfIjvGJhMs3RFUvHig44N6D3QTsjem+GepCy80tipql83hgWVxLzJVHNNtLj1HsYq
	rK5Vd3XrgUWGi6lkjbZxtFi/4xdGjjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVbi-0007AC-2a; Mon, 18 May 2020 02:34:22 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVbW-0006zw-9W; Mon, 18 May 2020 02:34:11 +0000
Received: by mail-lf1-x144.google.com with SMTP id a4so6632121lfh.12;
 Sun, 17 May 2020 19:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RJIP0CQmzhZgZi7curoUhxtyDwhM7Gccf5L+02fqCt4=;
 b=GPMfBxuBBwkDGH07WQUV82WfnOHnZ1riGASfaG56/QtFxTjZboeHxdQTIpFFNNl5bg
 Bs9wi618SiRwIYBdYr73+8qX7GmNiBUOrnCO3+ztB6N40KxeuGSJ4OtAjjDPTuy5OOOY
 pxp9+6gFBhJoyNcPjU3LS/yzAJav+7T8I8uDeiLDzv7P3H6Ova7R58Y0Hej5aGUxJ6JZ
 JN7yCGVvt4Cy+vuzGcWXF3BBObINI3YQULKfGF19/KFvXDtxTmUwgM1ertv2ijh0hkFK
 7FKBjtEa78Y9VCJ5/HT6KSrZF83dwl2i+5IzD4c48f0MbtwxoxTDFJFZzyCVNzDTczuJ
 0nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RJIP0CQmzhZgZi7curoUhxtyDwhM7Gccf5L+02fqCt4=;
 b=fCYGB6ly3yZDx04GXZIIvy0pMwM2m55je5bq/SdYTidjwlsiz2mlVCSDwADFbdRbEL
 sPaldj/yMgh1ic+nZypIF66NFwAgLNN+qvjv32VDt9gy562JNv4TNTExxLR8bxIrlKDO
 cgwXRPFTgD4QJMC7bV+oeT+K9g2xzH2F/LmCpRzdL3N0CRdiqVi+ScpRLqz+jFQJuVz1
 w4EHrvyCMTYA9QgadqA8Un0SgcR2ADzz7jaCIcddJwpsczDqQ/V8ORVV/napen7IYQoF
 m90lqdet21iCK6BXP674jlMP2l14XDnSVyrwhk6S0vxKXVoZVlPpLKIqhbMoIqNsQdCb
 Q0IQ==
X-Gm-Message-State: AOAM530vQMBDfqIgtwfwwL781cTC7TLHaWg5h0CToh19igijtGkLEbUH
 Csku3XuGsB2waQ9RD9eYAho=
X-Google-Smtp-Source: ABdhPJyC+tzEUGGGFXi/i85Sz9gsnT2zFVj63FdZWioYtju4fNMBf7vye7YPay2X6xjyITXnMzZ6Sw==
X-Received: by 2002:ac2:4145:: with SMTP id c5mr10067638lfi.91.1589769248843; 
 Sun, 17 May 2020 19:34:08 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id l25sm5937498lfh.71.2020.05.17.19.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:34:08 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro
 devices
Date: Mon, 18 May 2020 02:33:59 +0000
Message-Id: <20200518023404.15166-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_193410_381062_0CD2A6D6 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series combines patch 2 from [1] which converts the existing Ugoos
AM6 device-tree to a common W400 dtsi and dts, and then reworks the
Beelink GT-King/GT-King Pro serries from [2] to use the dtsi, but this
time without the offending common audio dtsi approach. I've carried
forwards acks on bindings from Rob as these did not change.

v3 - amend author full-name on bindings patch

[1] https://patchwork.kernel.org/patch/11497105/
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=273483

Christian Hewitt (5):
  arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
  dt-bindings: arm: amlogic: add support for the Beelink GT-King
  arm64: dts: meson-g12b-gtking: add initial device-tree
  dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
  arm64: dts: meson-g12b-gtking-pro: add initial device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../dts/amlogic/meson-g12b-gtking-pro.dts     | 125 ++++++
 .../boot/dts/amlogic/meson-g12b-gtking.dts    | 145 ++++++
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 410 +----------------
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 423 ++++++++++++++++++
 6 files changed, 698 insertions(+), 409 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
