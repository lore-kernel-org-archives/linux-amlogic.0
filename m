Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27EFC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC176157F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC176157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UkW1WJGCaTMWTeU9C1QQP1CC7yFwTQ7+VQNwnFH/8i4=; b=eRHHnbLlTLteBm5OmeKQBSLA0g
	V8xkt1AhWXJytC9SOhV7iTSSUFuaypH2BZ2lvEFZEhh+Fr3k4Ss8G6Sr0FaTUK1DFA5GUXzzw5Eae
	YtquCHf+ifOlSsejoGVizpEUJfFiOVysV10ILrEVjiEtwtkCsuDYY9cZ5yom8nYQREWjNsDosLrSZ
	XVaUH0q8+JvVtbg6kP5fcWd2vw1JyMwIItin4c3zLUyp+lVFPMduoCY15UbF7665j/4GK1T9FQ23A
	G/267XEW/OkknMzmP4sZhGLXNgMcd2sBjU/QG2Ml6/A4qP9YZCV7GakJxUk67kfNKY6giTqKRTP0H
	2AqJ3x5g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR12K-001qwJ-Vs; Mon, 29 Mar 2021 23:11:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQu7U-000kDi-SM; Mon, 29 Mar 2021 15:48:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v11so13326746wro.7;
 Mon, 29 Mar 2021 08:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Qih3TtMHQJLAXNG5X3gxadti71q6KlG7tdechBjfyGU=;
 b=cFhvG5IwuGl4H4NE2yJmORHRAmmmgxRDFtVc8PQUf9wUwHYK1OUXlqAVyJFWX6QAbI
 ULyxl8sPBIdyT6XTDdemJ0jEl+TznffN5mvH+tKdjI1stKx57AG47XgHFqBt7jlTvs6i
 2Kx1KTlao8qc/OKGAkI0tsMzFrnjPWy815Zwyk/tV2MiaKTe/zY680fH/gijUSm+Zk68
 14K/3OKh0OeadWbCWVwNpiyaud4P4liQPRAKRQzuUqrA4G0FueMQPKPlNI1xNIe0/t61
 eja39RcO+OMvXBn0OoAc6cqH8P3/ipsaz/Uok5YRsiKoP9KT692UJcbsboPbdOk2lOgT
 qFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Qih3TtMHQJLAXNG5X3gxadti71q6KlG7tdechBjfyGU=;
 b=aR/vNZTIkwuRfaWepxro0daCcNhI00YKvoMzs/lCtsGYjEfILjojn723nls8ypRS+c
 dLUOkXcJJ1n7WWAp5yYfU71iBVpBQFODbXw0ND4p3ZksCsOAoA45wiFEVFDeCOQiCjzK
 UkZh3esJ6UZ1u1CbcIa3IW6BWL98i7cOq6Lb8CD44QKF4/JMwITgPLdgaPJ/FLqZjrTH
 ciWj7jhShDKgA9VSP+O0PgjYEc4S66CROlUJneHXn40SdVc5Sxdv39mtTIUT+dURTKG5
 +WoQAcsBRjcXbHOaeanxRG+FytapE1ImHv1ZYpftNGY5dfGciU+3VHBf5L0JNbycmtM2
 75EA==
X-Gm-Message-State: AOAM531saIag7wUzuOu2TL2MdS55cg7srJjEE9/WmGC76EkdUe+vWHBh
 5o3sqtt3Y1/J8Gh/38VhDFg=
X-Google-Smtp-Source: ABdhPJxIauCgVfivl0+YJXVppDpW+s3lOtd68GaioqwWVWUWe+zQWVqp5ZMIUwzMoBnHbYBTC71nmg==
X-Received: by 2002:a5d:65cd:: with SMTP id e13mr29848822wrw.334.1617032877429; 
 Mon, 29 Mar 2021 08:47:57 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b131sm24987323wmb.34.2021.03.29.08.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:47:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Drazen Spio <drazsp@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: add support for MeCool KII-Pro/KIII-Pro
Date: Mon, 29 Mar 2021 15:47:50 +0000
Message-Id: <20210329154753.30074-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_164804_010115_597E6DC1 
X-CRM114-Status: GOOD (  12.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds support for the MeCool (Videostrong) KII Pro (GXL)
and KIII Pro (GXM) Android STB devices. These are quite popular due
to the embedded multi-standard tuner card (which is sadly not-yet
supported in the kernel). Both devices closely follow the Amlogic
reference designs with keys/buttons/LED details taken from known-
working vendor kernel device-trees.

Testing was made by Drazen Spio via the LibreELEC forums [0] as I
don't own either device. Since dts files were added to LibreELEC
nightly test images I've seen the number of active installs grow
without reported issues.

[0] https://forum.libreelec.tv/thread/23590-nightbuild-on-mecool-kiii-pro/

Christian Hewitt (3):
  dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
  arm64: dts: meson: add initial device-tree for MeCool KII Pro
  arm64: dts: meson: add initial device-tree for MeCool KIII Pro

 .../devicetree/bindings/arm/amlogic.yaml      |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../meson-gxl-s905d-mecool-kii-pro.dts        |  86 +++++++++++++
 .../dts/amlogic/meson-gxm-mecool-kiii-pro.dts | 113 ++++++++++++++++++
 4 files changed, 203 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
