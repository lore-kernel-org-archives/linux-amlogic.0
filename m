Return-Path: <SRS0=HjQf=GF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314DAC433E9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66A2207A1
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A66A2207A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TfWSrZD9vhJMSjzU8ir703XDzifNdsU46Nf9kEOHxxI=; b=gzQvWdiIV2M0wItMIYjLqfm5Qs
	1IG5ocrMvb3xkWPZi86eNiMW88TqR7l3j672LokQF6ii4qz5JhraJir4hFX9/T5GyxIHPMmslykJV
	UBnABEIEUT9w85EKORWzahBpu4iju8eLE+q5X4Ph5I26Iuh+RXwExrDvbjugx8woZBpK+4KeBXHrr
	gW0StdvE9GN7aKGzctuRuKCm0YnhJnGk/BfzgWhRtg1zDOJeDaxom9aM2WtwgCv7A1z/koliwgu/q
	PBdumlhxVAv803CVKZXrXL7Ric82Are6HV/nfPOUaKp3EN213lI/AtYu/DpOWRaVQVWvEDX8aINDT
	pWy3Y7ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvnzj-0002y3-LK; Sat, 02 Jan 2021 20:59:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvnza-0002uL-13; Sat, 02 Jan 2021 20:59:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id g20so31498550ejb.1;
 Sat, 02 Jan 2021 12:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXTaInf+Yo5LsKCyI11wuDAzV+8zs5s3fKU7mcWEjLM=;
 b=iMtMm8AENs9yq4HSoLVRH5uCuHA4CxeZ7ZjC6hsG46JVXFGIggBgB1Chn/sx83BQDB
 EifmK1hdCuB5Zf2++3WS7V5cs2jOIwFblHALQnONN69vTDSE+1wsqhkLIV3zHsrVMjYS
 R+aKPeLJGUBw6u5eYuPHVrFonNMaLvdxRtkeBQ/jEpGNOewxWC1CgJ2q4iixzxvUzwu2
 zN774PybVeaky+S46eAzr2xs+AHbWsUAL5tv2qs0br7YcekHnpH00dQSXGc1rF4qeU2E
 n95MoM3+vjAh92+OLyYcjp91QsKh6g1TqrHgdU6z2kC4SN5LEN8BovBs8B9WmAJ9Xa6a
 M+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXTaInf+Yo5LsKCyI11wuDAzV+8zs5s3fKU7mcWEjLM=;
 b=sNvh4PvnRzxK7tHY7NXEi9GDxRjDhZMDKh1wtqlNITpxah1otaz5jRx1yIzsN5SUe4
 9BEoawTrhpX0xNcQpW3WizjJXgMTUluQYLkhA5kUDapI0fkcprjw+FQgYu+wFMl/s2nq
 JNQWjcKzPcm3VbxZFHkLdrI2f4FpXtttxgyquEN+w4OBmXHMwk7AvkIXo/gM9JXWlwNH
 VtYeEP8DKOjwfPJ2TfKTm8VRxv/eitVvFZ3eUK/WZOzj3yd57AzcwAdp+p1G2nc7xV2/
 DPNprsNltmdfC19VLaReU/9NAFlsi49xH0GEHcCwpDogbcFZTVkPXmZ9f3HhmMjZxc2q
 TtpQ==
X-Gm-Message-State: AOAM532cB2Wj49ggaVnKuciqNqOtrtpA0H56tFoD0rgfJEMJYA63l0v5
 JIFUxRn/ytMLOgBh5gefLJ8=
X-Google-Smtp-Source: ABdhPJzosbgg4ui+GXvaroIAhnbnYvuiBqMtlxkx3Df4uX6nAlSVLgQ1IV+RkkHV0fcRbc7EjNG/7A==
X-Received: by 2002:a17:906:9250:: with SMTP id
 c16mr62319967ejx.355.1609621155067; 
 Sat, 02 Jan 2021 12:59:15 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:59:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 0/5] Amlogic Meson Always-On ARC remote-processor support
Date: Sat,  2 Jan 2021 21:58:59 +0100
Message-Id: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_155918_178331_4C8C0096 
X-CRM114-Status: GOOD (  18.83  )
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


Changes since v1 at [1]:
- fixed yamllint warnings (after installing the package these now also
  show up on my build machine) in patches #2 and #3. Thanks for the
  hint Rob
- dropped the explicit "select" statement from the dt-bindings in patch
  #2 as suggested by Rob (thanks)


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349


Martin Blumenstingl (5):
  dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
  dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor
  ARM: dts: meson: add the AO ARC remote processor

 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml |  42 +++
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 +++++++
 .../devicetree/bindings/sram/sram.yaml        |   2 +
 arch/arm/boot/dts/meson.dtsi                  |   7 +
 arch/arm/boot/dts/meson8.dtsi                 |  21 ++
 arch/arm/boot/dts/meson8b.dtsi                |  21 ++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 240 ++++++++++++++++++
 9 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
