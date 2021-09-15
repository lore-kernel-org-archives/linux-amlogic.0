Return-Path: <SRS0=XSrd=OF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6B2C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C67561211
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Sep 2021 01:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C67561211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u0Q2rkLnwguj3AfwbAz5oV+Be46MkNpfvMUpjfz6ufs=; b=FbT7Hi6j0oil0p
	pS00/DFd+HjK9vdk08gyHoDKtoi8ETjgYgC38n7mO/VI94NkJjFd1KeOZTOVwRcUX0kjtMXTIdXfG
	zcrRnBRipCdwCRgyonRmT0Bos0+Th/vNBoCQ/d8BBBhoxlpCJodm4CJOb5YYTrbnDdmNSaCottd/f
	PL5J3UhDnlOFn7uyy/tBJb0wWJg2QRXtoMc8Xq2T/vVT+JshWw5ipmHkGBezjLPtO0AQdTV4rZbFd
	3hFyxwdvaJXi94tQmJcRFFGLApGdeTxT21FnY4TCJvO/wXWZwIPqj5gT1Lc45yDonGM43lL/jtyYQ
	AX8Bc9pNgFGiphg1KzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQK0x-007qwU-O3; Wed, 15 Sep 2021 01:47:07 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQK0v-007qvt-37
 for linux-amlogic@lists.infradead.org; Wed, 15 Sep 2021 01:47:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id kt8so2506888ejb.13
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Sep 2021 18:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=K8AVYwqCBKJh/T9Dadudf0R4uQD4l+eFIidQcl4p8Mc=;
 b=I1OxdeAOAtTff6pSSTZ5tM2bGykJUbzL0oOjnqLkb6t13sm0KcqXHdWe0BPSpXm9Lo
 lEBltZTmby7zL5PP84yNEPC08nNer5r9upgYPSpa29f1r30Dy2DtQBu00zeWvE8tbn47
 l5tv+pOKSF89hnllw/WNxitfN5K0l3Hn+LdYpmz1y9pM2zX1oTXCGgPDG1MqYneTOqH3
 CibOhbRglHSWGDC6ZcBhBhFujEazG7Emsm9X3QzO4wSgLCsoCSPM6SgQtchZV42G5QzE
 F1OKxjmXJry5pWVe33VZ9IxfqnoJ68cENQTWzti1rPpbkZv9E3zf0m9+9nBXPnge+xEP
 05SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K8AVYwqCBKJh/T9Dadudf0R4uQD4l+eFIidQcl4p8Mc=;
 b=lCxl0OoecvcewJoNzXfaybQvdtALCzh/a3SPe585EKD+Tn4BfxMZ/HCFahTx91aTbW
 EU5QnGnUeLP67uJi/unS0iEH76y5ax3abNpGiu9VMA4GkODku/lMpYjhXVn7XeCRLIaD
 OX8MjPvHPVjl/cA9G+zEEfD70F+/7wRaKuoKeWo9/VgtJJqn3fTkur8uEZlZH1IxXcNS
 Xy8hyzbgl5I7rMwkUdEg4JjqX+1R0qtepIvqWu5f9KtVDKj3UwDfap/0UUEAqB1+iAjY
 Oxq3rdYs0QZFZZyMlRPWNSvbdoHk1oQvE8FlZjODlbk7vAdAssiBHW6CEY6sqEX/FJFt
 5T7w==
X-Gm-Message-State: AOAM533Vxe8qbwrfJ6LdmTSGF8yTG/+ghhd9rJRDapbNRip03pei/s0+
 aV9KTbV5Y4eW5cZTwCNPLq4=
X-Google-Smtp-Source: ABdhPJzaf22AxYW/ecnySlZrZb5kOKPxM+9lN9+UrkEXCVO0FJsILKhXL6Jz+9DrF7u/C7eImcyDzQ==
X-Received: by 2002:a17:906:1319:: with SMTP id
 w25mr22819106ejb.552.1631670423477; 
 Tue, 14 Sep 2021 18:47:03 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id a15sm6601835edr.2.2021.09.14.18.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 18:47:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de, u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/4] ARM: amlogic: add Radxa Zero
Date: Wed, 15 Sep 2021 01:46:55 +0000
Message-Id: <20210915014659.5336-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_184705_176445_EF212788 
X-CRM114-Status: GOOD (  10.52  )
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

This series alpha sorts the Amlogic Makefile, then adds
support for the Radxa Zero SBC using the device-tree
queued in the Amlogic maintainer tree for Linux 5.16.y

Patches are based on custodians/u-boot-amlogic-next

Christian Hewitt (4):
  ARM: dts: sort Amlogic Makefile section
  ARM: dts: add support for Radxa Zero
  boards: amlogic: add Radxa Zero defconfig
  doc: boards: amlogic: update for Radxa Zero

 arch/arm/dts/Makefile                         |  12 +-
 .../arm/dts/meson-g12a-radxa-zero-u-boot.dtsi |   7 +
 arch/arm/dts/meson-g12a-radxa-zero.dts        | 405 ++++++++++++++++++
 configs/radxa-zero_defconfig                  |  70 +++
 doc/board/amlogic/index.rst                   |   3 +-
 doc/board/amlogic/radxa-zero.rst              |  74 ++++
 6 files changed, 565 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/dts/meson-g12a-radxa-zero-u-boot.dtsi
 create mode 100644 arch/arm/dts/meson-g12a-radxa-zero.dts
 create mode 100644 configs/radxa-zero_defconfig
 create mode 100644 doc/board/amlogic/radxa-zero.rst

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
