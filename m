Return-Path: <SRS0=ZD2b=GW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3F0C433DB
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC7820DD4
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC7820DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hPJKd9UhOPgCXkZkBF5Ia70enKVeAO25ou4OG6fjacc=; b=ukoSAP0Ios+fkDmWvJXcLN3mYl
	i0RQTQlXFPZhvreCjZvjEdz2GSOfpzfb0YVG5ZchhamVGpd1GbxvIuFlK1aJjNdm+XISB/oDS+Kdk
	xkTOhrnOArGze0yxWwQoOPC3PI24GQjHKeZKf2CejiUB1tNoYf88fW4I/sGcTAQRAIkSYQHVDofKE
	/wy9sE26uG1Eo+DbBkSTJ4Xj3Mc1UdyL5bcs0yVZ1EOktabybCbvGVNzQnlUTeycMSC1Q1xS+P10r
	0dPTx+KFR2TONQ5mhsrVIAZcB+eV+Xxh7tuaSz2D4Ch9HpqwlR77FaGi7M0BdEc0xf/70xdSfEr+4
	EgiDEo6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1sS4-0007Km-HC; Tue, 19 Jan 2021 14:57:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1sRy-0007Hd-0b; Tue, 19 Jan 2021 14:57:42 +0000
Received: by mail-wr1-x431.google.com with SMTP id c12so1499311wrc.7;
 Tue, 19 Jan 2021 06:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S7s1aDdJzIQjumzCvBYrOOcnrCsH9+fQZVg5rQvhpjg=;
 b=QpVvmAtyMBONqrk1J3o1A1o3YCgKKWEmtVeAn5I6zbQExRfwxCB1aP76iMm1tvaKV0
 kSCGfOGdmTvQpm+gek0pJr4Qw54rnBUunT3i/CcxjVlS18BCcXNVt50Go3mImTXxAZjI
 nwFyFLGb+tzkvxcuDWOff+yK5fWUNfEstqNh/8/shTcqEFpVKX62vnFzcZGvfX5+AWJW
 MV7dM/j9Rle19cDTiuH6Wsq1ECFEa9CZqNRu4vKjctpQKhJjAGZ2EgVbskNSyPSKmeBm
 nxKIbIroZJuCNMEdoMeMVKOim3bnEOkQRpqoo63+xNC9mR2WzvN37T0GZuyw9Bc12d/g
 geTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S7s1aDdJzIQjumzCvBYrOOcnrCsH9+fQZVg5rQvhpjg=;
 b=Ji1E4viU9/0gicqWEC9jecsMddK87qTuXQYo+du9Sz2K0KAeEldAtI+CgAYB4biBOC
 YKZN1FTihNwwHtoDoUULOCQf3GXbQoXndJ2vuPzyqS8ZsLFtJXKysQNKBKIrdoUfi/AI
 YE2Y6Bn6i+CS3MhIqcqe413k4JerHuxgls2Pr4n359udgvPNAIHYDQ9bbs9iTn1sRM5h
 pUUQXyFzmfgGWlfdquP3M8oYPuLfOAktDq6afTTBN+dzI/alFT/NQVEBnG9e3MhF5U53
 zeAuQYHEbjjsPsUMjwXP84uGqXtR8ePXiSvUkxh48a1B+i7jSpOY5LqfyDz7+ZxJRa2k
 k0ZA==
X-Gm-Message-State: AOAM530pB7q2ieYNlB11WBksEpF/cGYPq/jy0hGgmKNK2OzgoAZ4JR6C
 NEjnlq1ImhpXFpiq3rEPjg4wl472LtU=
X-Google-Smtp-Source: ABdhPJwlVliSnGIRl5fq1VrlSGKf5EfYyoA/cUAaO255OlTrVwFyZS+pvw/KTSyiE5n2JE7dYIKmTQ==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr4875065wrt.246.1611068258821; 
 Tue, 19 Jan 2021 06:57:38 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id s1sm36786893wrv.97.2021.01.19.06.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:57:38 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: meson: add support for Beelink GS-King-X
Date: Tue, 19 Jan 2021 14:57:32 +0000
Message-Id: <20210119145734.12675-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_095742_079683_E280ED91 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds bindings and device-tree for the Beelink (AZW) GS-King-X,
which like GT-King and GT-King Pro is based on the W400 reference design.

Changes since v2:
- shorten audio card name to GSKING-X
- add Neil's tested-by
- add Martin's reviews

Changes since v1:
- move audio from TDM_B to TDM_A
- drop S/PDIF content
- add Rob's bindings ack

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for the Beelink GS-King-X
  arm64: dts: meson: add initial Beelink GS-King-X device-tree

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 133 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
