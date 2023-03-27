Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0C1C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=utBluO8dw5LD1q2A5QzSB6dRkZec301foXx5hpHVtCg=; b=lKitr3IsaQvhxc
	wKxCaucaBQcMXOsYpwMQyNHTuiJd7taP9YHRHfkMcCPAscKfQzsKwj6FToXF6VSGtnPS/XlIwd/Yv
	uG50usqPROdOnA/c1UZdKW5KL8S02DdwopUabfWsNILoEmGjUkOWQp8VLh3ktMHWBaWOZDfJDy1gT
	NHd6RISsVwofl1unDQKL+5Ws5YrhMZ4cJb+eiqJZt5x/GSLI6l5VYPE7dbqxwSWu1k2OvFMfj18J8
	HxbsRuyth05w3oBZE1TVHEvcGNJu+69Kysx9+IaMSs+e3QY0QnmLUKO82HMy7lB6vrXmJCgXOmz4+
	9u7q8O8WBJFdF25srKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pglnp-00AtvG-15;
	Mon, 27 Mar 2023 12:18:21 +0000
Received: from ns.iliad.fr ([212.27.33.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pglmS-00AsqL-0b;
	Mon, 27 Mar 2023 12:16:59 +0000
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 518FC2106A;
	Mon, 27 Mar 2023 14:09:43 +0200 (CEST)
Received: from venus.iliad.local (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 35B8D21039;
	Mon, 27 Mar 2023 14:09:43 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
	Pierre-Hugues Husson <phh@phh.me>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Fix G12 PMU conflict
Date: Mon, 27 Mar 2023 14:09:29 +0200
Message-Id: <20230327120932.2158389-1-mgonzalez@freebox.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_051656_416998_A6EE0215 
X-CRM114-Status: UNSURE (   5.44  )
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

Move the PMU DT node & adjust the register offsets.

Marc Gonzalez (3):
  arm64: dts: meson-g12-common: specify full DMC range
  perf/amlogic: resolve conflict between canvas & pmu
  perf/amlogic: adjust register offsets

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 +++++++--------
 drivers/perf/amlogic/meson_g12_ddr_pmu.c          | 34 ++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 25 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
