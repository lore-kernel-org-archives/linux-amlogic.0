Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23334CDB465
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Oct 2023 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N9fryGu4EB1UGsnClHekVFigCu1gprVW+z5qzTeb9g=; b=OlR0c+FUaRYr3m
	Ni+THY1mkjipTQQ92yFrmDQm0iqIU/mfTYEr5c8nDsOSgns1XnqYbv7p0AGlFYzEVu1T4s2Ov8lQP
	5lUJVrhQEFTYcohLeF/Yt81shxhy7kgZw/PajrNdFr1Y3NcuuZZyRfE/mGe17eHC5S3elJ0du1QQO
	s/BIeAbYDuJePSKwVoZMZp0BlsKMaw3A4Q+9sVxkraWhweV6vd8cTg8jrLz7lgy04MheA9sb+2Sj/
	g83S7NWOwZBcNqunstc/zt13zjY5WKnhEWk4mFreAWARZQ9Zx0RJLuk/R5ItdO1BkgCUF/bn7hlvD
	f0UvriUdhZxFf5Y43qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYW-008k5V-39;
	Mon, 16 Oct 2023 08:02:28 +0000
Received: from mail-lj1-f170.google.com ([209.85.208.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsIYO-008jz8-0f;
	Mon, 16 Oct 2023 08:02:22 +0000
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c523ac38fbso7965621fa.0;
        Mon, 16 Oct 2023 01:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697443337; x=1698048137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtLS9Nj2nFZBWPhUvEtRP9PYRoru3Ywsw6HKjKsybKc=;
        b=SEAepDQXBp/dRqoocg13mjpC64jGAhHJNIvlFh2vpcrsVGV9qsxT8vboOhquDAuw4+
         9anPZHMkPfQ0x1fSFBoWJvHtCsYBiDv6dFsdUspHMBRYVbCO77KYezU+6NgrzjpDYTMk
         fHVy5PUHDPg6oT752PFtr75X5cgb3B3VcDmSll+OCFKdmapMgCTbY4sru4Wr3VljylHu
         XfFBX6Fm7hJ1hk0s8uBeQcWwFslknqs9kiO+ypcXdi5Hwv71am2yl6sDHvUrbQFEy6Ya
         oQDX7/4hHHPbNpeUUCYSCPHJqikBejBvzPNncPwdhAhm8G3TkRBrmbrgF3xFq55+kvga
         k4eg==
X-Gm-Message-State: AOJu0YyTyS2laqMkHWvSmVpu7nQCGmbH3yJ7egZYF69pw9gsN9GvmKkV
	tV0V8IiEE0/T4QPVWBOTQgM=
X-Google-Smtp-Source: AGHT+IEJgVTIkDdKS8wbwl9GR9zgveQ3KCzOuWUyYvLzmOvka53rPoTXp7pcFySPS7cbYgXGyHt08g==
X-Received: by 2002:a05:6512:33d0:b0:507:a1df:1408 with SMTP id d16-20020a05651233d000b00507a1df1408mr4684169lfg.55.1697443337286;
        Mon, 16 Oct 2023 01:02:17 -0700 (PDT)
Received: from cizrna.home (cst-prg-37-192.cust.vodafone.cz. [46.135.37.192])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c419600b00407460234f9sm6395535wmh.21.2023.10.16.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:02:16 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Da Xue <da@libre.computer>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/2] pmdomain: amlogic: Fix mask for the second NNA mem PD domain
Date: Mon, 16 Oct 2023 10:02:04 +0200
Message-ID: <20231016080205.41982-2-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016080205.41982-1-tomeu@tomeuvizoso.net>
References: <20231016080205.41982-1-tomeu@tomeuvizoso.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_010220_243102_F0885B07 
X-CRM114-Status: GOOD (  11.85  )
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

Without this change, the NPU hangs when the 8th NN core is used.

It matches what the out-of-tree driver does.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index cfb796d40d9d..0dd71cd814c5 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -228,7 +228,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 
 static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
 	{ G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
-	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(23, 0) },
+	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
 };
 
 #define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
