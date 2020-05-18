Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C38C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 840452067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQWRhKCK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIdv6qQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 840452067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=MC1FbOm9cINSenVsgrNh4iADaOhQNfV9+8+7X74hNXA=; b=rQW
	RhKCK4pAm9CfxnmNIabZKw2NFv6G+jeUwc9jmH/Q3XuGAPuhQ10W4t9CIXKsd+sD/hu6kPNo07fiM
	0wLSjeprmIAPeDSiC9x4FEoSFrwteBV/gwqOlUj6haDEabSj3QQcnMf031jsLNxkG64Llsr7szBgj
	olypVre7ebZVmkDojEvOimJd7yH7UznpILir+oAnU4x447stQ5BwBI0XoNB/J06Jo95LbCy5SJC1/
	CUFtNrS9cTu+V04fp65r4uzcbmD3RrPpGTbOUmjerIfI3vdOXtggCPqGcnlrFoNoCJgI6YVwfIWjC
	0+ZY1xTzV3mGc1oMYyTyl/vE3ijQX9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVTS-0002Mw-EJ; Mon, 18 May 2020 02:25:50 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVTH-0002B2-FY; Mon, 18 May 2020 02:25:41 +0000
Received: by mail-lf1-x141.google.com with SMTP id c21so6647915lfb.3;
 Sun, 17 May 2020 19:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5rfhPys2btHBP3bO1j73TJDJbaY1/Lc3Z3m/cpPLQBs=;
 b=hIdv6qQcebc249xLUdQL6uLE5N+tSqfaElBQ+qolVIzlD15FiWmnC++UjW1CiHtpeA
 1Vfsc0JqlB8BBowqlHNKqcbYnFIRJLu5bOYJ23qPAwAzNoDkzRk/kLlMrOmJeKp9dMvk
 btJJj304foMsxB1h+mrPSXYJzq8QuJ5mMMl2CxSCDaLUWGWSyyL5x4sLC9yjnYioEZX/
 Du9de/uralDhCVxB3ZDzep/GZXolCoolLZ5iwhHf85vd4Et7WBZ/ysFFpdnH+hK9OkHV
 5VNKhBWk6SWOt4T7rWQinQQJg3Ps2E5aR5QVir0Uc/UVA+ELFO/60P8P4w7w8FXypcDm
 aLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5rfhPys2btHBP3bO1j73TJDJbaY1/Lc3Z3m/cpPLQBs=;
 b=npibL4rUryTVGtLjY3aVWrrCeuNGyM/KVM48Yjnub+lvfB+V7a2mYmH8VxgmbYGT6+
 6kM8vLtYXZqu31Dk2j32ru8L0LUlBteWwsQFYyIryFhaT/iC4fUKA4KYAd3W5MwMHRFu
 wd3VXZ1w35FOC+M5b+kyi2gaogA9my0dbdKVeFh+rWBi21MkUWUmNhgwl2iLMYOWZjpL
 kAC6IvXbilgPOJeR9LlrIkpnQOTRGduRpzET6XzSspGiq2NRuNM/5tDnG/kLNOQSZqZX
 NBySdGeW13brihFoqC0ptdJXy84KbAAE9n7rz637mogLLaKAazF/nRdkZ3f3qc52KM6f
 pkug==
X-Gm-Message-State: AOAM533KcR0oJfqTnyCvFZxJyddCuO31EuaYaodY2pX2B7vlh6STLzbX
 DYX2ueOR164K0oHIKGJm3TA=
X-Google-Smtp-Source: ABdhPJx78gamRe3spCIUTVhwN4EhDyWwwJz8Kr6sgvXe69Oqc33iHr4FBtSY2OvT8S+IEyKJt/Hv8w==
X-Received: by 2002:a05:6512:1047:: with SMTP id
 c7mr3079621lfb.12.1589768736906; 
 Sun, 17 May 2020 19:25:36 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m13sm5997306lfk.12.2020.05.17.19.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:25:36 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro
 devices
Date: Mon, 18 May 2020 02:25:26 +0000
Message-Id: <20200518022531.14739-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_192539_520557_042C998F 
X-CRM114-Status: UNSURE (   9.45  )
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

[1] https://patchwork.kernel.org/patch/11497105/
[2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=273483

Christian Hewitt (4):
  arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
  dt-bindings: arm: amlogic: add support for the Beelink GT-King
  arm64: dts: meson-g12b-gtking: add initial device-tree
  arm64: dts: meson-g12b-gtking-pro: add initial device-tree

chewitt (1):
  dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro

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
