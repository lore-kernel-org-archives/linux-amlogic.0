Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FE6C4829E
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mAyRAHNgm51ubuXXX637FulbQDRC5R9tZem42w3foLM=; b=HcyPPJOjfNKKoc
	wTQqKampNk+h3iVikpRt+ruywfz17t+a2YR35H5vEEixifP6x5OyarJq6grlvK8MBru+ol9uvhyBQ
	X1rbs8WElHEH3MFoChGehRPPINjCTR9svmZ+i7Y0d66JHGc0V0Qcef+eAhYGszVJ7c1rKidZ++QVh
	zary/R4uavwI7W36vF8rvqhCLi7LwboJHus3wiwnV/TyBXeDEnBs0TC0Yg/n1hhq0elmUJkKHdkdG
	yPmP42gt1G7LEjGfsLqQBAtm9abmsKv6y7ipwHVwOt0/EtYjPJcHg5mPgDOEerEU9J2RgzFk5AOI8
	4ogA66TCDXsrNfJnYe8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDb-00000007bF7-2aw8;
	Sun, 18 Feb 2024 11:20:23 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDV-00000007bBh-3q42;
	Sun, 18 Feb 2024 11:20:20 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2d094bc2244so48691681fa.1;
        Sun, 18 Feb 2024 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708255210; x=1708860010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTAPslvY13p4NzGhsLnW7/SPW/FSBPPIbk4inx6n6fA=;
        b=H/mP750qo62DzqUyY0qrZUWXHJ8MzTs42dAL/iUzkX8siUZsQ8A/zKA5HF689TFlZY
         Wj+zz25ncawgJ/+D5L4FOpi1Pbt9LICsh45mi6lo0TyxkZqB9w+XlQWG1IJWPiW87QhS
         2uuASnYx0SUEnP6Psh1DCbUsBp2Ezq7Y7hhLGHizyzjO4AjGXg+EitgpO1AEamk0q4zN
         Jw9zfh+fNh95tC3N5XDSpf4Y4n4NUlSTfh4h1CEWMnPtS1sgTEfq07Vq1kV3Be3N8qLH
         O+BtXiKcUDISuOCf+IClWbQbjJlH5QAAShnEsLnHhjS5VarJmvAANLmCL5VveShuX3aq
         BYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708255210; x=1708860010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTAPslvY13p4NzGhsLnW7/SPW/FSBPPIbk4inx6n6fA=;
        b=QRVELNpoFWcptuQPcjkuS2HibyJNMpg2acO+HNSEzml3tYeJHxJkUAWS5G07HCTspY
         GEGTWO23ZQRmrMAS5mxuHc9q5Xk0vbSqGRUp6HgIW/dBLgLngdNaxVaWB07ZSRrVz4yu
         lK6Mfa4qoNXqZYAmbciyjfI+rx0ZcLHKui5YCL2rqG6VfS72HTs5bap6d2mKAMXcnrEG
         sIn9YyOOMjTuxQ984EbC50DI+LBuFVjJnv/N++6OzP+yliN73irePTtFAky/3i7YP5R4
         ZcnyRGXS0eRd6PD0n4hzSHnrDs6DTkrX3w/dQ746Sm0ET8wnlrpKmxG5MHSygtx6ncD6
         N3LA==
X-Forwarded-Encrypted: i=1; AJvYcCU7CFSsdlrR5gRhzdxf/IyBdxgUlxXqZSwVahDxTaZQGSpKkV4O8XtzWEGpgil2Eqix323vaFC+8gFP0fDOMD47b8OLxH3FNJcVmBkGdjpUwONBNro=
X-Gm-Message-State: AOJu0YxUNzSB7WsoZoza18cE9VTmX6dyRI/PgsgaY16qyc3wEaXWdagk
	spgC3CvA4A1Ig39BVuFoMuYx176Zujnp11JPeh7U+aNjW7WSskDGLstyLyue
X-Google-Smtp-Source: AGHT+IGU3FwogvLK9Dsn9o6uvECcYP+s4KmRBN1wMYYeK+Xa3bpz+cCRwNNUFBq6Z04WlW7CKzBVyg==
X-Received: by 2002:a19:2d16:0:b0:511:aae2:e5e8 with SMTP id k22-20020a192d16000000b00511aae2e5e8mr5883720lfj.52.1708255210162;
        Sun, 18 Feb 2024 03:20:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id di25-20020a056402319900b0056401eb3766sm1675190edb.29.2024.02.18.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:20:09 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/3] ARM: dts: amlogic: Three small binding check error fixes
Date: Sun, 18 Feb 2024 12:19:56 +0100
Message-ID: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_032017_975938_6BE251C6 
X-CRM114-Status: UNSURE (   9.61  )
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

This series contains three small binding check fixes.
Nothing functional was broken before, so no need to backpport any of
these to -stable.


Martin Blumenstingl (3):
  ARM: dts: meson: fix bus node names
  ARM: dts: meson8: fix &hwrng node compatible string
  ARM: dts: meson8b: fix &hwrng node compatible string

 arch/arm/boot/dts/amlogic/meson.dtsi   | 6 +++---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 1 -
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 1 -
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
