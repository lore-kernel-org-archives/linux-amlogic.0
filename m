Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA1E60A3834
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jwXXhcDT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FpbHQUiY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mx/WPVN0BCzI4ZSm5bru+8xaN3TNY5tMUqPDByBqoxo=; b=jwXXhcDT1fgJU7KcZ/3N0EC6s4
	E7XuTV0jp0y44IdyBe/YJo3PG/6+4uel/xTME00O09iYElpXRxp3SlaISD01cBbXaC0LCWnSJXBg5
	+zbDVcYoj2fvGJ0lBQ58ue5Up3NcBrLGHlyv99tLRE6jraX/Lpf7eTOPiJuLGiFKYWbziOmnDpJ8N
	Zx8WQVmL4hqcwlUO9Y9tSlOA4aU59ZI8lroP5QqBnjy3rnwLfq5jRR2uhkC/ES6b0AYGbX8gga9my
	4eu4tRPSo5EAxaptBoSUuOwFYiuipf6UsGHS5Wur+IZtWg3naxtwYq8nNq5RrUr0h1r4dfLn92fT1
	UsSjBZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZR-0000000Ehrb-0fy0;
	Thu, 22 Oct 2026 18:31:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZO-0000000Ehnl-1Ak2
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1141045e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792693876; x=1793298676; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=FpbHQUiYvVLE0viChxKuaCgCDKxVtpgxBUou2CT0PPHk5hMXyqUsD2N++a3jxFMsFR
         eY9nnrzal2UzgGm5q1nS25DqVfZDKnfOje3PwSJ6g7wU1Z/lqIYkEclh00iGNHxDb8UW
         PAecG37uKvVo1yEwnM6MnN34o0bycno/PbCm1woCIdpNRe9Xlx6Dbs5+g+GZ2a5N6Trg
         TBjUqOb7LGSzUBS2mMvBBtxcF3RNymygVHRyA7Ae9v9rEW/jb2TOaQOaZ8TGYVaLRTZj
         L5fjkBEaeGQlHylnBE69N5l3S8eEP3G686XaY6f8Q4ldE9D0gVDnVIZp2W6lZ/wGTGmX
         kPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792693876; x=1793298676;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slG8drN2CZNWeeyGQikzZ1nNKkPrs1g4paTzj1uD1x8=;
        b=jmtY9atXuMnfY1MswPFWLp+h7OkoPX8iUamxztOAqMAq0HG9aaxKu9QPZKv7n175la
         TYBDfhTEwg3d+JLsUHisXU1lvpxZ8fFvlo8tpWiWgCxJ+OcGGlHO25P7l+VNYUfGX3Zc
         xe7p4SqNknr6bmyRmvMte3KJj5fCAxnshdnk26LR7e8UsOnPupOpK9JjiSI+nFrm81xG
         pQbTlv1c748mz2M4Lpa+bxULfJVwUOySsSBzB9qccIOszEjWaUIwqSPC3KUUxazqoNN2
         0Lm2cuZwWwCI4Z8KjhTYnRhcIKxvGZUzmaQGXFJqfIvNa64PV/AtqcAjOZYxIGC+wJZs
         oJjQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4g8qM345nzlxa/m7xsnRvUfP7w8YADXMe2GgJX0VS2GyBV9jhApEBtwZ/tqBMOjFtAqeQ96f52ARgvVt9@lists.infradead.org
X-Gm-Message-State: AFq9FYI+gKls2IsnKeAtordp1sxJ/omIjZ9JfITkgS0OCf7dZjwHq0L+
	AjTi55J8wovwBnapUyy1FK1p+2t5iq5FlkTPSfjPcBOpC+sVV21na2LiO/erBXZ3XPE=
X-Gm-Gg: AYBFou3dlaoDCGt3h4MPgjbVFiub7eIh4mYqXPamIKQ7LiwUbBPW7cIEzqL2njxuRAE
	7ai5qw0aC3JuBkkrP7EBrAjNfdaYT+QvtHTfiw60SEn1EGu/X743U3uAZZWFwVPJqlGpg4O/m+A
	oeyJTNKjXdWKJzp13lLTdBZ4HSsMIRbPIFR1FjYPWu30quWTlcj5w882EoXCw4vn0W5n8JDICnb
	yH2yMMXx7mgazNUkju8TNbpiR9YHq4D2ZsAp3eVKFyEpEDrChqtsRsD3r30eF/jOYHdhzo8QUSw
	LbAwMpdyQG0ZkElKZ6BuUgyoCza9jj2/au0uzH6pIRGgiw7l4Q8XNAYaB3IUnjAYTFN5QAYL7Rx
	hl/BAC1vGgKXJ1xCCSWGQDm6berbXc/WjKaEu9QLwSyIOZIJh4sWePfUW6Kaedih63zOMdrBh4/
	QshpqKw+dGNiQV3NKk/CvbYcqLYYo8fNajPWDsBk2YyFaQh/bO7734mW1dqRm0I9rZJsm7hp1Rb
	ILUQIoaX1zYTXLaVV+iKp2R44dJOvWvlZukzz3aGD3KFnsMPyfv0JP80UAi7c3/7cmddxyd97AR
	pVmdm4YR9IM3ZFYMiMMjdJ0HC6Dwsgqup/S0nEF1hQ==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr127571525e9.16.1792693876294;
        Thu, 22 Oct 2026 11:31:16 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21143094fsm4556975e9.1.2026.10.22.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:31:15 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/4] Fix and complete the GIC description of Amlogic S7 and
 S7D
Date: Thu, 22 Oct 2026 20:30:26 +0200
Message-Id: <20261022-upstream-s7-s7d-gicc-size-v1-0-8285053cf4ee@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDQAyF4VeRrBvQUafoqxQXTia1EbwwUSkV3
 93Rwtl8i/PvoByEFepkh8CbqExjRPZIgD7t2DGKjwaTGpulxuA66xK4HVCfcR47IUKVH6N3VUH
 OltbnFuJ/DvyW791+NX/r6nqm5QrCcZxFFhwhfQAAAA==
X-Change-ID: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_113118_343843_B5250F30 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The S7 and S7D device trees describe only the first 256 bytes of the
GIC-400 CPU interface, which spans 8 KiB, and leave out its virtual
interface control (GICH) and virtual CPU interface (GICV) regions.

With the short CPU interface, the GIC driver disables the split priority
drop and deactivation mode and warns at boot (patches 1 and 2). Without
GICH and GICV, it cannot hand the GIC over to KVM (patches 3 and 4). It
needs the split mode for that too, so KVM gets its in-kernel vGIC only
with the whole series.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (4):
      arm64: dts: amlogic: s7: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7d: fix the GIC CPU interface region size
      arm64: dts: amlogic: s7: describe the GIC virtualization regions
      arm64: dts: amlogic: s7d: describe the GIC virtualization regions

 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi  | 4 +++-
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 8610d31587e139380db9cb8708f4263833b482d0
change-id: 20261022-upstream-s7-s7d-gicc-size-db94cb656d36

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
