Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D01606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Juxo8W+S;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AZwD8CBN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fr81dgH0vqfzfu7ggEFZ8t4FwBWasTA43t7gWwOZerc=; b=Juxo8W+SMsVXT9tRYNqpv4krfl
	jHH0wdUu4+V1bdIu7QQU89QmJhyztUZS/0xoIagJD1OLIB8o+S315q0jXygh14cp6sOC1BVSN/EE4
	u4zgG6CJ/cyLqpG5Gh2FjD8tOaGS423610Qglm6MRBqh3AER2AyDo7ZpxJroTEY0dCGfSlXkrM8YY
	MFkjXEFlNJj4iynMtDLEicMTtqobdW5u7wdUfwWwNfIWpQyHcxwpsTVLKT9bbEq9vfdp2cBUdN01s
	MEzm0zBmyo8uopcRsvdwgJ8evvqcW2zV/cNLf8PWHAC46DvqM08SNLx7w8naSkWYljXpGOYq6ITY2
	d29qbN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDL-0000000EJOa-1vJS;
	Thu, 26 Nov 2026 19:33:04 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDI-0000000EJNI-41vW
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso52980365e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721578; x=1796326378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuaUxwS6JtTJWMd+hXXNq/iTmPJxIas+/RtLlIzqUXM=;
        b=AZwD8CBN3r06CM+BFRCfWnpNosiRftnF1FlFIM1Kcau1Sfdl6t8OQo+ZZ6QAHSL215
         JQC7fB56lJLFW18o2ou1GKINhIaB25jakHCWNCPfArNgRYUJB/kpIUmfb1GUVjlXqJ9C
         TSbkdEJCoTHevbLwfQrH9ydDeenvmdjNsr2w+T3SB5V+EQgyw9qSlMHgQbZHHe9r/vzJ
         33KyZzlBAnphHA2ez44+iZhxBZqUmcOrSvHPgjLO/19w9gp2vhgOOp3A7sRjc+GqoOPH
         /8W12ePCif2735kK6Towr4S7UabYLsWSvSXjHG44mqqSV6y3r5xrDDtrtZj697eOQ7Kx
         BNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721578; x=1796326378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuaUxwS6JtTJWMd+hXXNq/iTmPJxIas+/RtLlIzqUXM=;
        b=wb/QMZlIZh2tezbpDdS15jRNGjmqsEK0xfnI4bL7hv5zBimzDPYLiHQxJFE26sbxQC
         /CdCPNpp4U3NBy48YdAoyO9uNRpvDi9n+TnSfiyZq82GI/9w9rvJVCDFK+AdDe+e4VAa
         ymOiNUr8uv16aAZs/XIqWitfrz939ANzcTpdGPtT2Nk3l6lVcrqxYexDxi+zej/j22Lw
         a4h2Y8ELFIUFbYVZof1TR/x0X3kkc/cAdKRG1hDsN5MUb+W58EZGYvof69orZ9/iP9dg
         3H0qCvwv6Pg+NPzSHcT4iiTlglxObhqZ1JUlm4wRUBy8EIDvMNr0AeTv0j2R5aCIZuo7
         No2A==
X-Forwarded-Encrypted: i=1; AL+hErFJ8uIlJcj+gVx50GuzPg3xV1FIVWv9sdxYSLt1Ssx6Cramkfa+kSmzkpm5zjbmpr/JVKOtnYA8o2POpA9p@lists.infradead.org
X-Gm-Message-State: APuU4Z8lZVtOT2J2VN39Gjb7u4633FTAaOjiENM9hvE9JKODRVoyKrFW
	DTqIr7aypTc7p5gECn+DADvLqzKjOLSi5nHrnMCv5rgK/TxOhJZmRsnI
X-Gm-Gg: AZFdTZdVMVE8vLK1gajKGI/0Qiepat5/FfFJYxgJ8W3du1zRWp9D9St56EbnfnRrlNf
	P2/SKzxOEB0Hq25/HqzrnqYGmmeBtVnoom5/yGfWavuIxl8RtoSlrZVxwo3XOJJO8yZBD1DdnTi
	xzW9hvpfhH2dMRZriYZ98S8SQlSbG9u6GOqBh70/+eCWEhFWOZ5lKeI5z4BvvezTs+fyU99crlb
	ICJZ3ywMTxaVNmtOabukptlAwAiwPjshBoPvudd1sTclO46u3DNqVv5fPvZlPvwKa5v5/SWUki0
	PSfcWUa3oFUJAAtkGueFh9Kenh62OoLy33EzLoz3JP2Ote4wwEIDTsibv6jnBf54Gn+iVrFtrhY
	96YIwwYLAP0zY33J2svF8zWGKEvs5SRUzrPt0X+wzglfvitpeI8c53GF1Ue3j9NVGLYGg4FeGdg
	9fiMaSM0xYePutgKinkvcgHG1Q1cV9npNTwz6GDWQxU8hVejMBVFk8QnPtWfbm7g28ZdIXfGtji
	eCXkxzprwFg3o0KKTlibaOxMcuK9DhUHvDPUnf8x/lrFs4gxgydS7oQzkT3hlvYuj8IXc6Juaxt
	abJYTXkshJ2kMhBp1eBHOwcKvhbr51NYc9LFhWBLNMzUcA==
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr424233425e9.32.1795721578321;
        Thu, 26 Nov 2026 11:32:58 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:32:56 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v13 00/25] crypto: amlogic: add support for G12/AXG/A1/S4 and misc fixes
Date: Thu, 26 Nov 2026 20:32:16 +0100
Message-ID: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_113301_024655_C7953FEE 
X-CRM114-Status: GOOD (  13.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is v13 of the Amlogic crypto driver series originally posted by
Alexey Romanov.  It rebases the series onto linux-next (next-20261123) and
adds the fixes required for the current tree.

The series keeps Alexey's original implementation and commit split:
platform data, IRQ handling, MMIO helpers, multi-descriptor processing,
G12/AXG/A1 support, hasher, and the per-SoC DT bindings/DTS.  While
rebasing, the fixes that landed in the driver since v12 are preserved
(IRQ handler return value and fallthrough, devm clock management, DMA SG
unmap on the cipher error path, probe cleanup and devm_kmalloc_obj
conversion).

On top of the rebased series, three patches add what is needed for the
current code:

  - drop CRYPTO_ALG_ALLOCATES_MEMORY so dm-crypt can select the hardware
    engine instead of silently falling back to software;
  - add the ahash ->digest one-shot path and fix trailing-block handling
    for digest requests;
  - minor cleanup (unused fields/includes, stale kernel-doc).

Testing on Khadas VIM3 (A311D / G12B), booted with a linux-next kernel
built from this series:
  - the crypto self-tests (known-answer tests) pass for ecb/cbc(aes) and
    sha1/224/256;
  - dm-crypt with aes-cbc-plain runs on top of cbc-aes-gxl and the driver's
    request counter accounts for the I/O.

Attribution is preserved: the original 22 patches keep Alexey Romanov as
author and carry his Signed-off-by; the three additional patches are
authored by me.

Thanks,
Jose

Alexey Romanov (22):
  dt-bindings: crypto: amlogic,gxl-crypto: correct clk and interrupt
    lines
  dt-bindings: crypto: amlogic,gxl-crypto: support new SoC's
  crypto: amlogic - Don't hardcode IRQ count
  crypto: amlogic - Add platform data
  crypto: amlogic - Remove clock input
  crypto: amlogic - Add MMIO helpers
  crypto: amlogic - Move get_engine_number()
  crypto: amlogic - Drop status field from meson_flow
  crypto: amlogic - Move algs definition and cipher API to cipher.c
  crypto: amlogic - Cleanup defines
  crypto: amlogic - Process more than MAXDESCS descriptors
  crypto: amlogic - Avoid kzalloc in engine thread
  crypto: amlogic - Introduce hasher
  crypto: amlogic - Use fallback for 192-bit keys
  crypto: amlogic - Add support for G12-series
  crypto: amlogic - Add support for AXG-series
  crypto: amlogic - Add support for A1-series
  arm64: dts: amlogic: gxl: correct crypto node definition
  arm64: dts: amlogic: a1: add crypto node
  arm64: dts: amlogic: s4: add crypto node
  arm64: dts: amlogic: g12: add crypto node
  arm64: dts: amlogic: axg: add crypto node

Jose Nieto (3):
  crypto: amlogic: g12: drop CRYPTO_ALG_ALLOCATES_MEMORY
  crypto: amlogic: hasher: add one-shot digest path
  crypto: amlogic: drop unused field and stale includes

 .../bindings/crypto/amlogic,gxl-crypto.yaml   |  32 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |  14 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   7 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   6 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  13 +
 drivers/crypto/amlogic/Makefile               |   2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 605 ++++++++++++------
 drivers/crypto/amlogic/amlogic-gxl-core.c     | 281 ++++----
 drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 510 +++++++++++++++
 drivers/crypto/amlogic/amlogic-gxl.h          | 120 +++-
 11 files changed, 1219 insertions(+), 378 deletions(-)
 create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
