Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75124C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4683020854
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ag5ivSu1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjxI57jI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4683020854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NfB1yBZ5ud2FmHhTfVcOOXoNE1DkOHx3oe2KOpQvuhQ=; b=ag5
	ivSu1/e/1vF7TAXuVjq5siXoWaMecNtX9WIsMmtBIq2Kbqnee5/2BPHNwHXrYl/pOcCkNXQwuDG6V
	qIRQmIWUsdiNRjgnE9G6w1PYsyccm2ZEMNRLBq1KNxrNTrYYISEZcYWjAMbIWMjPjZqTN9TErtxCT
	T4z3JbNF9vM60CaYnYOLNnomFmqilGo0sGxH3mH+PZagXlw5Ihdj/s3K+qBhBOUBT6rcR6QIJMUWm
	Ecw5TeBLBEdrli5AChca1CN7qXwvW/i8BQl9ydxGWTz4KdQ45dpakottYtVigNq+paubR529KTt0q
	mdtbbVIo33aniYzjwjmeyjuw2Di4fmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Ets-0004xh-OB; Fri, 06 Sep 2019 14:07:45 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6Es5-0004PN-Oc; Fri, 06 Sep 2019 14:05:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id h7so5726624wrw.8;
 Fri, 06 Sep 2019 07:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YhOPiGQ/jKMfAKNMmBIBmilg3dwIp+IShaOpXqxWprg=;
 b=FjxI57jI6z0XPsMkktNq3JpEyfAjsH53bwf7ysTuNIDKxiHvFK9CWMakQdziG6QSXg
 /4kn9zNNpDKtusr+UVNL1ITjHOZ5Abmb+g2ErAiWIUiSJXWgJpo7nsJspE7WNZEDmIbf
 OcXX6vIsGNb9E8MJZbTw/9+6Zvc6NQ4vMgKFnjslN5XJFBxIHZ9fVc5o/3cwK7zU/AH2
 sh7pzhElxBpPxFj61sWwAOYILB+WnlUSxUbmZlJL7Tj2g8x9NnDV6B2i16CuYcl35RbW
 lAHpzEykJcI69j0BW7NWuyluAsy1Pf12NlAULs8krx3jjoZ6YlgOp0TMwFqebdRi9GKb
 ng5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YhOPiGQ/jKMfAKNMmBIBmilg3dwIp+IShaOpXqxWprg=;
 b=gJfnhiai/VAu5N9t5sWFsSi5jCsz6lb2LpudC9bySIGajrQlAZWfzGQ1t7s/WyOQTo
 1/QFCZ46hE/eJUJNnEbdJuboOkXoKnRuuxOYxs4MM87sqWcBx9nAlFhSBVOMX5Nrefcz
 BMmbsvAI2GZsjldK+MEtl9kup4fRPsvqQN2xeRWFWV8zArjy8Vj9kKKYiwzZkYSvXPWK
 Sd+gKmLqO7O1u3jit96YhggudGizyv9MbKsC30NxqSFkQnqEyxbyLZgmIZNMa76EP37C
 VCuhfIPV83ZBRk4MOXP5a8nCPMZxPeDHi1ZKjS2VUqVfCDuWmcCUsE6FFtE1vx+JytH8
 surA==
X-Gm-Message-State: APjAAAVxaWT0TCjL5j73ARwRlgI7U5dKmslDT09ELZ8t0Lp5JlcPL3hG
 HVGeutt8GFFahmHIRuTKZXg=
X-Google-Smtp-Source: APXvYqyour3/+Klmag/nD1xyNEEijuh9OxYfZsVW8R9vEdtv/6UIzhNd9mDLPuW0JOIbs21O/mlgFQ==
X-Received: by 2002:adf:dec8:: with SMTP id i8mr7527923wrn.286.1567778749916; 
 Fri, 06 Sep 2019 07:05:49 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id e20sm7480542wrc.34.2019.09.06.07.05.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 07:05:49 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
Date: Fri,  6 Sep 2019 18:04:56 +0400
Message-Id: <1567778699-59231-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_070554_054239_16760F15 
X-CRM114-Status: GOOD (  10.45  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Ugoos AM6, an Android STB based on
the Amlogic W400 reference design with the S922X chipset.

v2: correction of minor nits

v3: address regulator and GPIO corrections from Neil Armstrong (using
schematic excerpts from Ugoos) and related v2 comments from Martin
Blumenstingle. Add acks on patches 1/2 from Rob Herring.

Christian Hewitt (3):
  dt-bindings: Add vendor prefix for Ugoos
  dt-bindings: arm: amlogic: Add support for the Ugoos AM6
  arm64: dts: meson-g12b-ugoos-am6: add initial device-tree

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 557 +++++++++++++++++++++
 4 files changed, 561 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
