Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B03ECAAD5
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TeI+io0Vxjdr4QXDXKyccRBystrCqpPIMMB4rzc8SZU=; b=b2aHrel90qcDiOQDj9CTkgfe86
	B9AZEqRIQM88l3TWBXH5gfXqTFvoCP7iUTX5plAGNLjIRmwSBD6pcuw55NfSnsYLAgFiS0nRurUoM
	HEnha0VHq7WrFqmHYT8jH5enR6E57L2a8gFf10eh2XAHMh1+Zcke1ZFHxyfgS6YyZAN8pmTbOGE+u
	Od8MbnC4Jw0V1L+kZhryZTx20ZETrO8bKCPWn3eFH/n9QDbRlSBqji13Ivt2c2rQUFnEvHWNkUjCR
	POCWaL4nfPa6KdhVBWLF+rlEggulrlQEuRMluyQjvrJAUA1C5Z7+bWz8m7u9Z4BL8V/oNhHUGAgoq
	RTAGBkYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFGw-0074nP-Jg; Mon, 05 Sep 2022 16:48:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCmx-004BG2-8b
	for linux-amlogic@bombadil.infradead.org; Mon, 05 Sep 2022 14:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=krKlcnTZdKSlo/zGRjkjNpcb+YkXL08HqYSlJd9Ifnk=; b=JWbu3T8RSoQSyDxEILQkWwItT5
	Y+Di9NQcJv9+ZZ7tmuic8UAxW/oVxNrDr7wyYDrz5DCbeQju8RA4R3zRavlXQ+aY93yRo/5w/agMi
	GBfWFjfIY9D7VLDMcD18tju1sJIgcIJri6ISuGLzdTLUw19+rlzCLPBAlnNT4Iw13YxuJkhPyRl6p
	7jBDSvesdTlj2lllLfN5aft7GCKhYoHBDXDHIOQSTfMRLp/kK58Amc5thhAYDfRIw1oU7iyISQGvZ
	eG1rHx/7njvVe8XV8OGNDDX7OFZwAZsYEgzsO6HkcpRNlWrANAEyYwdcwMQ0M10ijSPSijvK2RGf6
	0lnDlyvA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCZ0-009g29-KA
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 13:55:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso5749450wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date;
        bh=krKlcnTZdKSlo/zGRjkjNpcb+YkXL08HqYSlJd9Ifnk=;
        b=hfVPDii3QFNYESNB+FvWc5Wsv75HGBTxb5conCJDkDWyvc36bEwNh5g+ZJpOS9ljBy
         2QNspjo1Ai2K+DYxypZCD1CZpDas66ZK6CnLZG9XZV1Fa3usId8dnzauvnDpN5gLPflc
         9efOJ9g8ed3OteNGcq/JQ6zNWhpLKWc84RC7ZTyNAU4zu2/igRz6LcAi4ED3I+fevBIR
         sDNE1nMFwRmGOyl/TeIR1UgVlCLfsGIBI8WYDC7RIHmc3QVZD4juM+qiiJb0HxJaVd31
         dxvGDvdcRT20k+EPyCT9tNLD+zhhiAu/Ip6i/TixHUgngChF7It9+9nh7iPHa4Cmflxy
         0qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=krKlcnTZdKSlo/zGRjkjNpcb+YkXL08HqYSlJd9Ifnk=;
        b=Csg05oVxbKq5+meaNf6/9kPeu/hhfstaeSSADa9BpESfXmlAsbmeX+qG31uGxxDx45
         ymr6XycrIQD1HjWFLGdX/78OeTemRByD7qQLsqBRfpI/S6yxJlS9T6H9B0CRQnPZLYWT
         TfCzwJzyrijHiJ0twWiUVWblwC47UySeJCMKs8xlqyfyR9VTPVv4/O2s15xv0zPiOEAx
         0IHRl+Co2GhN3AYJyx8Fu/qx/Ki16AaTmLt5nYj5lM9Ck4tz59jkz1mUipFUBzWnNRm4
         S/A+IKpWWr6HiUf3NG4il9PweFdTSZ+WBKXfmsInK8kLkWeUQ5WqufTF3uQR9ony5Eq4
         Fw1A==
X-Gm-Message-State: ACgBeo0wC7ZIJQco6pChcbT8pMupE2JuVRtPp2qX6NpHfDdZOSB2XI1m
	sM+rWBoXi479E4C9ExkZ4QoqXVoq07pMHOfw
X-Google-Smtp-Source: AA6agR4/MWKs7kS2axm3FVpvnZ4tuRkqR4/RBPo2tUD974F7x6HXd6OKS5M4PMrNlxya+Lhl6hTZSw==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id a13-20020a05600c348d00b003a60b4eff6dmr10278176wmq.95.1662386095065;
        Mon, 05 Sep 2022 06:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003a31fd05e0fsm34941568wms.2.2022.09.05.06.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 06:54:54 -0700 (PDT)
Message-ID: <d0079686-40ae-58b2-e58b-c8dc6361d7f0@baylibre.com>
Date: Mon, 5 Sep 2022 15:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <narmstrong@baylibre.com>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.1
Content-Language: en-US
Organization: Baylibre
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_145458_727579_37A61DFA 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.1, with 2 new boards:
- Beelink GT1 Ultimate TV box
- JetHub D1p, DIN Rail Automation Controller

+ fixups with removal of invalid 'enable-active-low' on SM1 & G12A boards

Neil

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.1

for you to fetch changes up to 5b3a87a5c4f20da682d50dbaf8c4aa357cfd0d2d:

   arm64: dts: meson: add support for Beelink GT1 Ultimate (2022-09-05 09:25:59 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.1:
- add Bindings & DT for Beelink GT1 Ultimate
- Remove invalid 'enable-active-low' on SM1 & G12A boards
- add Bindings & DT for the new JetHub D1p

----------------------------------------------------------------
Christian Hewitt (2):
       dt-bindings: arm: amlogic: add Beelink GT1 Ultimate binding
       arm64: dts: meson: add support for Beelink GT1 Ultimate

Fabio Estevam (2):
       arm64: dts: meson-g12a: Remove 'enable-active-low'
       arm64: dts: meson-sm1-sei610: Remove 'enable-active-low'

Vyacheslav Bocharov (2):
       arm64: dts: meson-axg: add support for JetHub D1p (j110)
       dt-bindings: arm: amlogic: add bindings for Jethub D1p (j110)

  Documentation/devicetree/bindings/arm/amlogic.yaml |   2 +
  arch/arm64/boot/dts/amlogic/Makefile               |   3 +
  .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 338 +-------------------
  .../meson-axg-jethome-jethub-j110-rev-2.dts        |  37 +++
  .../meson-axg-jethome-jethub-j110-rev-3.dts        |  27 ++
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 351 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   1 -
  .../boot/dts/amlogic/meson-gxm-gt1-ultimate.dts    |  91 ++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   1 -
  9 files changed, 515 insertions(+), 336 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
