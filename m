Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2EFC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 11:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5984320880
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 11:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7zY5sb3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rmypMms2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5984320880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iv+pILl4rbD8hOjxuRG8Ws2A+geIk0Gbz2SdELBt8ow=; b=E7zY5sb3YmDWJ/
	ulUwjwfgDmghAL3VaYParkGh1950/jXJS+r4FNQ74LzdK8UUl6EA6kzWzuytGEVXscgN6Cj5YCk8a
	DdgBtVhHRBaQxwenOcfeA+QV7vfe1JQDfQjEbQV1zJy/rEUDY5+YwzyOdeiqgGpOJGjJ1rQdOd+MD
	juzF9XZHrWNJLxELu/EB1iceVrItiiyvZTbOEpAo1r59i3SozhaPjeGMk0G2jNgafOP5g47PTxK+o
	9tsmHBEQDUT6X4bZtFiOCNIc2v2434Vo37GuR7bQ0T1jXOFzjD1DUnt5nF9Hdtyr+27UCNrxb880K
	n5gw+m5ruMs+/idy0LQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAvOR-0004BZ-9g; Mon, 01 Apr 2019 11:46:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAvOO-0004B7-OD
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 11:46:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id k11so11619866wro.5
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=CHrCwDX8iOS/5b9b7A7FYNRe0vDw3XPvhkLA22AWRp4=;
 b=rmypMms2JzccblSULY89YHTeULcN5SShuC8BT8TTlQL0EMRiWx4iwjrjtp4w1d1NZ4
 WlCNL2jEDdMWKQ/8CIGTG3fF8k8KKuobNVWdio+eGkMWInNijVxQaHNO6Xn2QnRs9v9e
 xg0+zNywkIy34J+4myFwuU1OQDgvB28fKsZecyYxGxp4/9aPhn1KWFdsz+9zzgX+ACHf
 LE6dlajJIty2fc6QaxZDivU9mXYT11f0f+gkwIdwG2bJNZqTDdPUijNsAEYoYR4FoAwG
 yCYz3nJm4+Sc8Xy8dSuK9VEHUMQGXHJRq6OZFN+B9KXKJ4C12m4sK2ZYHlwiiDR2LCWa
 46Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=CHrCwDX8iOS/5b9b7A7FYNRe0vDw3XPvhkLA22AWRp4=;
 b=d2D7bWIYHwhwkH2TIqGoAg2hb1DtHvNcPf55sawj3dUmtjT9sc6sJPEuSZG1klpBHU
 WyXil9Zkto/VK45ZzMvOUBirFFW5QIoTa/fzvJbgSw3PhPYBxpXWUzxu6FUai6I0uWFl
 dt82TNVKI+n70Cqx79Lvr7JGCHNvxHpkx49loSjQM4u50MjsX4FF1h7QYOY8iWYmRFyv
 d0fm0/jnH4z3DLYQHv4ZGXY+JbgM+Q8RtEESYoUgZQrvSMafDoIwhc9oXPadg5YQNyCl
 E6+YhD7/DRGIiaEaHBYZjWBPY/MWbACvDV9eQskkORjUe+k/Ekxx0KkRPCiXxyanw7qd
 1D7g==
X-Gm-Message-State: APjAAAUaA5pFIoH26vMHDlMpfzppNr786qXqFZIGmgalwvfpziTA8M1y
 Vaqbln09R9o6euuVDPVT/8xUmeaFHYmEYL1q
X-Google-Smtp-Source: APXvYqxnsxfDUILo5bTMeXcTBzHZcDEX2ReZq5KZjxTa5i/9qsWz+FHyTFDOlEDSwGtFfmebijebmg==
X-Received: by 2002:adf:afee:: with SMTP id y46mr39895586wrd.217.1554119178773; 
 Mon, 01 Apr 2019 04:46:18 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 n11sm16564883wrt.63.2019.04.01.04.46.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Apr 2019 04:46:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: headers for v5.2
To: Kevin Hilman <khilman@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9ae7c5ac-a941-1dfa-1831-a7122d55c139@baylibre.com>
Date: Mon, 1 Apr 2019 13:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_044620_794062_31AA9886 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dear Amlogic arm-soc Maintainer,

Please find below the Amlogic Clocks headers tag for 5.2, which
is included in the first clock pull request for 5.2.

Thanks,
Neil

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-headers-5.2

for you to fetch changes up to 77a725ff7a640ab24ff9cf9450e6eae072c49f16:

  dt-bindings: clock: meson8b: export the video decoder clocks (2019-04-01 10:45:11 +0200)

----------------------------------------------------------------
- Adds VPU and Video Decoder clocks IDs on Meson8b
- Finally remove the wrong ABP Meson8b clock id
- Adds Video Decoder, PCIe PLL & CPU Clock IDs on G12A
- Re-expose SAR_ADC_SEL and CTS_OSCIN on G12A AO clock controller
- Unexpose some AXG-Audio input clocks IDs

----------------------------------------------------------------
Jerome Brunet (1):
      dt-bindings: clock: axg-audio: unexpose controller inputs

Martin Blumenstingl (3):
      dt-bindings: clock: meson8b: drop the "ABP" clock definition
      dt-bindings: clock: meson8b: export the VPU clock
      dt-bindings: clock: meson8b: export the video decoder clocks

Maxime Jourdan (1):
      dt-bindings: clk: g12a-clkc: add VDEC clock IDs

Neil Armstrong (4):
      clk: meson-g12a: add cpu clock bindings
      clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
      dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
      dt-bindings: clock: g12a-aoclk: expose CLKID_AO_CTS_OSCIN

 drivers/clk/meson/axg-audio.h              | 20 ++++++++++++++++++++
 drivers/clk/meson/g12a-aoclk.h             |  2 --
 include/dt-bindings/clock/axg-audio-clkc.h | 20 --------------------
 include/dt-bindings/clock/g12a-aoclkc.h    |  2 ++
 include/dt-bindings/clock/g12a-clkc.h      |  5 +++++
 include/dt-bindings/clock/meson8b-clkc.h   |  6 +++++-
 6 files changed, 32 insertions(+), 23 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
