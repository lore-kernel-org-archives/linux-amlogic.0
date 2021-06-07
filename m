Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F0AC47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F2B601FC
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F2B601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ej0Crwm0tqMwTPz7WAcVVvVEm0AC8nQl9w0HvaPnmv0=; b=XxB2nEou0Td+dT
	zeb9EKeHm5ZAuyZarSj1E2JzDvvogswc75b7kV6eZlMpRkG1mDubt5KQ/ZP57ZcCUQUNt5ELPnCA2
	2tgcZZxLkYBlNNM63KA+op9iWqJowEi6NbQCdFyvu8YBzuoCrAtn0S8aFPaTmrZTA30qhsFAeI/78
	jSCQTKMwMiwWOA9QWGtNuaURA5ZsxTwWmzHWtb9AGs3wSrVE+wZHzqfs+XOV/WR3hUODue4VfsFUV
	sqWic9sNvrGHE1eTfb9B7CtO6/1nLMvyIUXGjgt66wpxZPerzknrriy679o2Hws0YL0eLbsztoWn8
	3X1zWLSzjCmwkxF6ESCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9CD-001qN6-T7; Mon, 07 Jun 2021 06:57:13 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9An-001pjL-9O
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:55:46 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so11861391wmk.1
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rkx1/XKlP8OpLSPbyBfhpFtPzmIt10Z4x0aGkniH3Kk=;
 b=r8PIC046W0acmJ5kc//XMyihu9X1f44q/bL1VDJGA4t3LuPH2drErHWjVocXAfCmQU
 DUShRkdBr597rrGYBu/4knQQ6WWiS33FEsRSLBZqwC3OM51Lp9yCUj7vfVJRYC92Fzx9
 mh2w4ONi5p2AxhWcmR8VfbAw4ZVlT0xb6IjA0fFlrcAMAIn743C7ICkG/macEtVtfyTZ
 l9OPtgrYJBQKJxbbL7BDLm+YOOv8vS9PT8U1Tbxgvjpg8SN6EfAyuyIBQuOWFzvECvoX
 bzJp1rF8QBsSSDuDY17SHCeWv1pTOHFhhGdb0jHB5D7kRWe7Mol6YuE7+mH9E99HR9xn
 +/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rkx1/XKlP8OpLSPbyBfhpFtPzmIt10Z4x0aGkniH3Kk=;
 b=Ya+MfIbh9g2bpubsu9DkeQnLMw+KCm2MAfGJ28lc6wlG2166MOvmN0aXHLxKUhTjU8
 xU3Lwj0+Umhtwe2A6Zw7IUFWiZyZMrwJsXBeHA8+46LFmwdQ2M6C/OZUkyzim9nYi6ez
 Q0x4g8YE4uKrmNEd7M+0OF34CLsTKidNqOves930cnG3xo4wuKXn0ODyGUECa7LZdHXb
 RTnrtnUdJwQ8UJ+aLc4mExmgi86IoNavv6OKmDRMHLhEi134SX8ASwkdIuAeV2eJYg01
 fCDGXsr2hrTgqHVF8NqpXRnq633/VTTdJ9IxoPqkpiMLEkbFJlMai70pxARnJZjBeiz3
 qTFQ==
X-Gm-Message-State: AOAM53052NYR1MPF+W7CtHDtbhM4i3FSIqzjURpxqmzCHQ4B1WLb2Fq5
 rCshjozn4z8uM+hkcjpec2Jg4A==
X-Google-Smtp-Source: ABdhPJw5uYSIBsGWP25lkrYy3w6robKsJmc9LsAeF9HFjoqg492tVNgwYJnpaAwFo3FouASm8l78RA==
X-Received: by 2002:a05:600c:154f:: with SMTP id
 f15mr9574692wmg.116.1623048883504; 
 Sun, 06 Jun 2021 23:54:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/7] arm64: dts: meson-sm1-odroid: various fixes for C4/HC4
Date: Mon,  7 Jun 2021 08:54:28 +0200
Message-Id: <20210607065435.577334-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; h=from:subject;
 bh=0eOtnh7RB4lBLG+mXsh+c2AQMdf7GQcwCtDgJ1wQ1e4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcI9qzof97GT2qkdxpNoLxy7UutAJW3fG/FkdHR1
 Kk05oJmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CPQAKCRB33NvayMhJ0Ts2EA
 CJWDyK5h3AGhrcSBXbLTL521NkWGIKCej31qDzRW8MGQp1tVayHIrkPhjOJeo5Ru7q9o5bmgXIEs13
 /x7Rp+6qDxmMue19QPB5eujiQfczYxp6G73gRdSSNlatSbwCZYjVsjQsuZzcUjrgi0Mi69BdDmH8p0
 dbDi2vgPLVgCQUFDKyCDG8RtVeP2nGsS9z7D3q1mS24TylAn11EufTBXcTk1Bx4DEjLxdpUr7ZApSb
 3UHLMjAgp6dII1z0vjDe2DLhFjXQLlcXcE4K1rjtTllBQj3vjEetRfGEGd2yAisPBL4AfOZRtO/YqF
 GscgrrJZC03z/Iq2g1LinOCGrKC5Ku0m0W4I4iobAcno/URayuZF88oqByzm9sxaPV9Fo/u8VunqUo
 EN0H3IjTxiOvAGlfmt52JG+1unGlGmIRz89u7KrmDVpy3NZsGpUxh8qRGE/7rEUdt8sF9JhnnfEceh
 Ew+XBryecSsOzb1kD6vs5gDqaYVjMLiZH9nBy97mc281nOGXkdgMdw7LZGifF71UVJM4Px56KCBTgg
 yf6aF0vjylQ6hBImOLT3uxdKhXXtWlwzn9R/k8H38KW8PS3GhroBG5tlhh2iQuUUehDsu4ANuHIjER
 Kozpcp78GDDNNWvWgwxmY3B9Of/vhkUWURml5e6Op1zf3CWXsnZTxr1JBJ0g==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235545_350369_AE2B3908 
X-CRM114-Status: UNSURE (   7.77  )
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

Here is a collection of fixes/small additions to Odroid-C4 & Odroid-HC4 concerning
regulators handling, USB and SPI NOR Flash of HC4.

Changes from v1 at [1]:
- added review tags from martin
- removed invalid patch about hub_5v
- added proper vcc_5v gpio control
- removed invalid hub_5v regulator already controlled by a gpio hog

[1] https://lore.kernel.org/r/20210601090140.261768-1-narmstrong@baylibre.com

Christian Hewitt (1):
  arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4

Neil Armstrong (6):
  arm64: dts: meson-sm1-odroid: add missing enable gpio and supply for
    tf_io regulator
  arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as open source
  arm64: dts: meson-sm1-odroid: add 5v regulator gpio
  arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0
  arm64: dts: meson-sm1-odroid-hc4: add regulators controlled by GPIOH_8
  arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v regulator

 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 17 -------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 48 ++++++++++++++++++-
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  9 +++-
 3 files changed, 54 insertions(+), 20 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
