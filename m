Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5280FC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:27:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A217720867
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 01:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A217720867
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=My7aE4niVNLltVH0qTHxbTe+5PIhBo3jeaJ0fDsy4Fg=; b=HnxT3YrFWOuH8wDMBpIIfxF86J
	/6FW5Mwlc+PUGN5K8Vc2heoR2Hm1BnemUQ/ERQuIr2uOHtcobqjGc/TbaLjtjmzuA/z3SblS9nqbO
	ebYpmrpRS/jQ6jEKVYl6Cu+fgHICMPmDeMnaN5IGciGecqq5iZJjtlbL7IA0fsi9pktP7UqEfLetX
	xJWgN7hOD3W424zRxoI0Qyg6UJpXPrxOnFp6WGnBtCdc97qL5kEjlcVVPCJL8tEU1kV9ErTf96SQl
	wg6wpLJpwz+kntkmfoaVYya2BxW417NnRgxXM4k35V+tYjRFYATjb5yYYzEzI8owkHYm59p4ViyB5
	F+uqnkbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuQHA-0000k3-K8; Wed, 30 Dec 2020 01:27:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuQH8-0000j0-EN; Wed, 30 Dec 2020 01:27:43 +0000
Received: by mail-ed1-x52f.google.com with SMTP id dk8so14165274edb.1;
 Tue, 29 Dec 2020 17:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ARDULvl3K+7mKmorfNn+FGZREJqQZbCok3NrkDyimB8=;
 b=ZcuNfiQHvJIMcXrTtox5laXU3Dx9NrLtrwcrB8xthQmGlTCzsc+kLmv76rvWh1SAJJ
 tSCo/HmXcaoS7VhbUProe6Pd7m5ZIPJK1xC/eUauojnlQ0bIOnNg3PPrTjjhytxi4wGA
 AYW/Jo/eZ00etEXLXudPuzWry6D9jxg8lsfC3kBARM7ScnB+dG6CQw9foMJPYoXD2N7O
 J4flPQCnGLZoDth8IzuygGGyrAawwJewuoCaofKA67lDuKDmj3jVekEs9oXIBhLLbtMp
 qBrtvhZuCMovXa4brw2q1G2Hn6y6PKdkIkVeTCkjGLnp2jbEqVRR3FJKLITp7iyoB5m6
 jI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ARDULvl3K+7mKmorfNn+FGZREJqQZbCok3NrkDyimB8=;
 b=TFQ/0EBiIIG89viFkhXVf7vhOgmtL1RUyTchv3KyZ2H+Sz3FDcrI0fltJpi/R5FRXG
 lR3cSqIoFGdD0LwENm24OPMwSDXnr3XmgFXZdHOCd4NDS8cp/35t81Etfi+W9zB6q4n7
 LmgfL60us1tshdRpbN4ztLg+yw/FF0ZgxOg7Bt8ZkMN0Roz8iW9vS6oAmaCtrj1f+WXO
 9c2zvt/wUMSk4ZQJhQ3trHJyyKV5iAZlBLDZI88neXiZnP4BTTiPRfhfkXIICxSxEuJw
 tA7L8uAMnjh97XSQJtNzDAzQ9al9Xp3VNQd0z4/+41SmL+MzzcubP6U0jTaVDE0cRWC9
 5kIA==
X-Gm-Message-State: AOAM531cD6O165eaYhY5foeoGw1a5OObgwkn3e52WjgwN3+sqooa/kuI
 Aj8op2Z4aErrTBLdXgN5C2s=
X-Google-Smtp-Source: ABdhPJza+dkuhISoCbq9Ju6Frs/urZxRvLH025K73xoTWyGduYLzL9TNOLz0Tk2zCYERiB5KWDuxjA==
X-Received: by 2002:a50:875b:: with SMTP id 27mr49390011edv.24.1609291661131; 
 Tue, 29 Dec 2020 17:27:41 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:372a:4000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Dec 2020 17:27:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/5] Amlogic Meson Always-On ARC remote-processor support
Date: Wed, 30 Dec 2020 02:27:19 +0100
Message-Id: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_202742_535877_F3654621 
X-CRM114-Status: GOOD (  17.76  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson6/8/8b/8m2 come with an ARC core in the Always-On (AO)
power-domain. This is typically used for waking up the ARM CPU after
powering it down for system suspend.

The exact ARC core used on Meson6 and earlier is not known. I believe
it is an ARC625, but I am not sure about this. Meson8/8b/8m2 uses an
ARC EM4 core.
They all have in common that they use a section of the SoCs SRAM for
running code on the ARC core.

Unfortunately there's no information about the remote-processor control
registers in the public Meson8b (S805) datasheet. All information is
either taken from Amlogic's 3.10 kernel and 2011-03 u-boot or found by
testing (for example the clock input is not mentioned anywhere in the
reference code, but disabling it stops the AO ARC core from working).

This series consists of five patches:
 1: dt-bindings for the SRAM section
 2: dt-bindings for the SECBUS2 syscon region which contains a few
    bits for controlling this remote processor
 3: dt-bindings for the AO ARC remote processor
 4: the driver for booting code on the AO ARC remote processor
 5: (only included for documentation purposes) dts changes (these will
    be re-sent separately)

Patches #3 and #4 should go through the remoteproc tree. Patches #1
and #2 may go through Rob's (devicetree) tree, Kevin's linux-amlogic
tree or through the remoteproc tree. Personally I have no preference
here.

To test this series I ported the Amlogic serial driver and added the
board files for the Amlogic AO ARC EM4 to the Zephyr RTOS. The code can
be found here: [0] (the resulting zephyr.elf can then be loaded as
remote-processor firmware from Linux).


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229


Martin Blumenstingl (5):
  dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
  dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor
  ARM: dts: meson: add the AO ARC remote processor

 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml |  53 ++++
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 +++++++
 .../devicetree/bindings/sram/sram.yaml        |   2 +
 arch/arm/boot/dts/meson.dtsi                  |   7 +
 arch/arm/boot/dts/meson8.dtsi                 |  21 ++
 arch/arm/boot/dts/meson8b.dtsi                |  21 ++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 240 ++++++++++++++++++
 9 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
