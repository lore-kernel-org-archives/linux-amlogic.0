Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FCFC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wo+zYj5/xhMtQkhFzLyeElKMACxsA62GNvvle6/vmFo=; b=P9W9W9W9j0HwHN
	F/UujfTHZ25tighv5KP01q9l6Fa2fOHeuZPCL2mwMyQlFbhaU5RbYUDjIIc6EQoQ8tW1XMKNMTpTx
	fLQGsYV4sXCHoQ8gxt4x4oxBIgCHJU2CY7aJCHtlKL9/a71UOn4CfJAapa9C0hPfvgrtdjC72iEkn
	zic2rgUb6w42h82v2SNikVQLbZo4eo3ChrQmS0vhfDLWu0YWWXY/6VRB1PUkveVSlMMe7a1o9USR7
	SW+Zdt2xh0VqNPSDz7UHBBFOHojYPEIsrBgjtx4mZW1ErxkHCtML1JLrlJvbS589h2AfnmZo4R4me
	SwGSBoYIz0xDTMyRBgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rEE-00AWj8-V9; Mon, 10 Jan 2022 09:44:39 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6r8d-00ATi8-GC
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:38:56 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e9so24043914wra.2
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=2YeFgGQa22EvUJnP5dVOotBttSSfSVW3DW98txNGYvs=;
 b=yBt4J66ihEwWZSB3g9d8wfypAXrZHXBZZgZ92Xyw2PmFATyjDIYEqCggphiilnRiwm
 NqvjlbYmBmC9lZB/E7qFMfgMzH6gSUIe9C0vbSXw3miCUh+m5V2S7TL901FGL+61WPBb
 qY8DRuVFw4Ae/CvM3bokcZTPA0kMVA6wWegcUYE1ExqIyNWqMVxzRNTqF6XPwOQitQDp
 Gx3X70BgoCxbrc6lbaykRwcynQgoLHKxWJO0ztdbqOd3qY0dB6iiVAvYnVT+NWDtKvmW
 WlfK4ewqvmZIH3QVAfL9VjL9wFUtzDChlgfvsMm/F+retUWPIIBwmvBvEGD3NNG7qzYQ
 Tvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=2YeFgGQa22EvUJnP5dVOotBttSSfSVW3DW98txNGYvs=;
 b=cwAOjc/qn7uZ82eGaeCC9e4E+RG7NbJBhNzhKS17KtBcInfOkChy78EATMlChGPoJM
 HbSGBkh/T1vYEPq6dCw/Mb4zOpnG+bHtmIIdJlMUTm4XiK0WJk5v4MuxJuizPaUMAWEB
 rQ9jNpWfMZlc1vAdQC8SmbhZta7DFvEjJ/gH/xB5YjyWEJiRKzteM/kWPi7TWm9jXKfq
 iRvOYc+gm5Va+L3rkemq4vGITPIjHPjExnI8gab3pnmWHPbwT/RXU7qNd5aZHVvVJr+Z
 k2c5WhHdIlN1OBVB+YBsUxtvslYwiPTOE4hBqB27yg254elwD4C1j42RM5XpB1zD40pT
 eMTQ==
X-Gm-Message-State: AOAM533v+gsuKVZ5JX9KVQtNjg58QqOpMDxnLT84d4PWbtUaN9QPg06y
 OoJrLgjB1IiGW+2a4A6Af562+XMQ7qNKlg==
X-Google-Smtp-Source: ABdhPJyFysIgoti8Q5dwJFHgF/s8l7aYP1rfXoWSMloAz9bwGIlO3l/ATsUFIsQjyE5eUNOuFucQjw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr56395wru.640.1641807529828;
 Mon, 10 Jan 2022 01:38:49 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id u11sm6422912wmq.2.2022.01.10.01.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:38:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc v2
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <746a7f25-1c96-9d27-3a08-e86b2af608ef@baylibre.com>
Date: Mon, 10 Jan 2022 10:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_013851_610024_957CD313 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
applied by greg in the tty branch for 5.17.

Now based on my previous arm DT tag touching these files, sorry for v1.

Neil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

The following changes since commit 72ccc373b064ae3ac0c5b5f2306069b60ca118df:

  ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties (2021-07-26 10:05:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v5.17-rc-v2

for you to fetch changes up to 3375aa77135f6aeb1107ed839a2050a4118444bc:

  ARM: dts: meson8b: Fix the UART device-tree schema validation (2022-01-10 10:32:51 +0100)

----------------------------------------------------------------
Amlogic fixes for v5.17-rc
- meson6/meson8/meson8b UART compatible fixup to notably fix earlycon

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson: Fix the UART compatible strings
      ARM: dts: meson8: Fix the UART device-tree schema validation
      ARM: dts: meson8b: Fix the UART device-tree schema validation

 arch/arm/boot/dts/meson.dtsi   |  8 ++++----
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
