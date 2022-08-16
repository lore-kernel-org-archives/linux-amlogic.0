Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBA2C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P+kAQ2ynRQNkcp/ApqcJbNFNfctRW90S3q6LTxAZres=; b=xlzf9nT1L5t9NL
	8JgCY2PT5MimJ6J0XEZ/+knU4e/ccEmdOUuvly9mkii00GmTpH4BoR811xCAykXjeEfjs5o+hrgoM
	zc7qsI7OkRUkdcGmF+oQSL120En73tEqK13mFRpP7vVFi38W+l6wkKdYttWBnuS6nhANRhW9ZqLLx
	8ENlpFhkYrWK/PZnYg/3GVn7XiUa5QwfCeT+m0qvtDhLCM54bMzucJK0PXotJeJWvbXaf/dDakQl1
	zNe7qQv8SHve3bDFHTh72IJygyu6HBKZjQROmyO0Va+DJfl29mLm0cfcyWNPi9fYejbKajGmkHxI2
	+RTDBwsq3G/hF2xgufKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvaw-002FC2-L6; Tue, 16 Aug 2022 12:22:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvaj-002F1e-MX
	for linux-amlogic@lists.infradead.org; Tue, 16 Aug 2022 12:22:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id n7so1220990wrv.4
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Aug 2022 05:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=K+gdbXGX7sTipYoI1hbcvxGCF62qNZJxUQfUKALJAPQ=;
        b=653mtiOz+xhTjJvQu/Z8561OQZ/7yZgXascR7WHeo+CK7dRlhjy+Pq3wT3ZBDFJ21i
         oJKNjxmxmUdqt6mrGY8kvub3ZiKfNcp/lmuGeAxR7lihOi9dguTy8jHRrzinw44OVbnc
         CMs0onKkiB1dxcEIDMPewbFr5Q/sDl/Klvh0M9AGoiosBAzQSwblc7Y+XDsGdVbw0R4+
         RyQsMOhjiajyRExT1KhuTZG4x9qG5dGUHGptj2Tapqp1Iw+LBbJuZjn//AN3cOcfvtAV
         HDvCGQqRYvG+Y/Qff57TRjaY6Rn3dntmPB6ef9s7uLxe8v+zEGAf9ibCq/TMkJW5YDte
         LYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=K+gdbXGX7sTipYoI1hbcvxGCF62qNZJxUQfUKALJAPQ=;
        b=brpVcnop1VByilqz9O1lrHZudlBzZz5rs5bZA+xHp1LP2YySHDzvty1dcU5cIhsO0W
         XhPws/uLtibVge/KakxaHRQ8u+BMnXBoQ6aB8xFIvu4eNXLmGHAKA4w0leo6tsM4MD6C
         wHy2b48vxDCt91EsslQAc2G5Q5IhfAS8oWT/kGU22NwAr9KYLPxor2EXFqKyvYxpAgGN
         egVNvCQNrS9YnyN+uXrDtgeXDqvXcO0KrhmXu52IgLe8LTdvyD+XnYfpE0iMOkgpPyXA
         zRXyPFIhMT8SP/cUapHxh2kWxK1ezGnY0gxSIp0KyGdBVCF9pPpSatRS8PPOba3pJDvR
         YpOQ==
X-Gm-Message-State: ACgBeo0qboBcMesY314W6N432aay8nBAWDWXGdK6Es7878Nwsuny7rxA
	ZqmoacK1faPQ5ROxAFaDQ1/sIA==
X-Google-Smtp-Source: AA6agR4mWwoCuQHHvTE6vn6N3LqhAmKu+A7J3AQ88Wt275PoY4JM7vCv03znTgErhkDwLb2BpzYjcQ==
X-Received: by 2002:a5d:6f08:0:b0:21e:cfc7:bfd1 with SMTP id ay8-20020a5d6f08000000b0021ecfc7bfd1mr11687835wrb.329.1660652556367;
        Tue, 16 Aug 2022 05:22:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:ef0b:d58b:b15c:96e6])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b003a5f3f5883dsm7990873wmq.17.2022.08.16.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 05:22:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] arm64: meson: add support for JetHome JetHub D1p (j110)
Date: Tue, 16 Aug 2022 14:22:34 +0200
Message-Id: <166065254995.976383.683359500915068130.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811103113.3097868-1-adeep@lexina.in>
References: <20220811103113.3097868-1-adeep@lexina.in>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_052241_741196_D2D59EEA 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, 11 Aug 2022 13:31:11 +0300, Vyacheslav Bocharov wrote:
> - add support for JetHome JetHub D1p (https://jethome.ru/d1p) is a home
> automation controller with the following features:
>   - DIN Rail Mounting
>   - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
>   - no video out
>   - 1/2/4GB LPDDR4
>   - 8/16/32GB eMMC flash
>   - 1 x USB 2.0
>   - 1 x 10/100Mbps ethernet
>   - WiFi / Bluetooth Realtek 8822CS or similar IEEE 802.11a/b/g/n/ac
>   - TI CC2652P1 Zigbee Wireless Module with up to 20dBm output power
>     and Zigbee 3.0 support.
>   - 2 x gpio LEDS
>   - GPIO user Button
>   - 1 x 1-Wire
>   - 2 x RS-485
>   - 4 x dry contact digital GPIO inputs
>   - 3 x relay GPIO outputs
>   - DC source with a voltage of 9 to 56 V / Active POE
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.1/dt64)

[1/2] arm64: dts: meson-axg: add support for JetHub D1p (j110)
      https://git.kernel.org/amlogic/c/59ec069d50550273a83180ea6c950d382d7bf8e3
[2/2] dt-bindings: arm: amlogic: add bindings for Jethub D1p (j110)
      https://git.kernel.org/amlogic/c/a80c60359a42cf146872b9442cf847e7c2452a23

These changes has been applied on the intermediate git tree [1].

The v6.1/dt64 branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
