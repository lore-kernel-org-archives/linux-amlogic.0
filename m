Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3360C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 14:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7D122249
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 14:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oy9mSD4U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bIz/qMbL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7D122249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ClsEWd0V4GW9Hk9wr2BfoCfaju5tYrZ9jegThEBJwIQ=; b=Oy9mSD4UFOt8G6kuiVTYsoYHdn
	9wWZv7JfYktkFCZASyPeSXkS8IcShC1eFiNpfZjewCVzUOOyHsQRuCQF81sk7v3HiVqaZ+bR2n0WZ
	5ttEQ6V/C7Uy84biqWkFJl2RQ2nfUF+/QojhumVFcdAQXy0JBgY3ZqiiSyuEmMuroDv5FB09vfoEu
	SRSprlRFQ6fYcYLEN73Pg4O1epXpzGJXMhEikfWVdKmSBwmFlPspjSP19C9HDgjVnWBnpZO/ijS5D
	PdnlJ5LamTZ8addfnDYPa9o/1kFT1MhpeYM9RW7lE1RnsiiMOMWmyIh2OSYlqWKPg/Uvv9hXXAOxu
	gWPhgUIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIBpq-0006Rn-Nf; Tue, 15 Sep 2020 14:21:30 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIBpn-0006Qc-Ox
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 14:21:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id c18so3512225wrm.9
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0CRdTYVYc/U7fysKoWQV0wj2VPNEE4muh/srS7OLm0=;
 b=bIz/qMbLKItZuCECmgJiND27QuOQaYIKjHTV/Er7jU53TBbJnm/G6VDFIogRCkbHsy
 JPajcLTsuWRdC/0sOwKIWU/n3CmBIx0K2/gXqNmyK9GRZr08b2e3dEk/mxL2UHCt4KZm
 f56Un+tnsWdrhzAvj1KespuhPag13sz+8CpsO67cYdotmsnc/3oG6WWFqE9EfCz3m5HF
 ocYMByWkdvhwRJ6ry8VWK309gvWAcQAp/IElAW71Bk8wzOEH0MFP78J7X/HSatjKHowV
 LJZZs/hHMsN6aNzy/sLpqLRXrU9c7um1j5xSK3xT2lmJkHJwkhlHz6T4shnfKxAu4Kaw
 M4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0CRdTYVYc/U7fysKoWQV0wj2VPNEE4muh/srS7OLm0=;
 b=ip4GAy5BJmknNJJXtNsiJrjRpPrTJQbnH14DThur1UW3ix7ISvu4bPxZ3TYA9pHdHm
 ulFUloNqc0B9891q6wE87LsiPiEX3Kx6xkPtOD28CZrso0HVrv/fDwCqrn2V6wZsTUfw
 4zCzJ8J2yLXtEa19CVvRwMU5n5/79ty4WsFqMXLUgCbe7/S2ZOsO0AFrQX8HPQqVSpnt
 BIcuRnbGbQ8SlJaYbw8hKy5pMH2FaseirPYrWECnrdSsy/UT97XA4K4nLDnmhJR1FMc1
 ZYloCuVWMYHsPmoBo6cmeiikG06knE5cqBMH3ApR2Mp4tRugsypLhuA8O8Prsjiw2sgT
 IflQ==
X-Gm-Message-State: AOAM530kvBFaQEHOJg1Mqzk1fDo572XK6J9Y5zaKiHraa/hHAFqICfOT
 2CJYF0CfAn/FcnNjoZiFp62hq0V2QatT8Q==
X-Google-Smtp-Source: ABdhPJz7AsnxbhTnOadmbKyAmvlVXDYp5iixwoaOgOYfqnVaNg+KuYT5+0TX5Te0hJCGigoNRGUBSA==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr21052586wrp.286.1600179686724; 
 Tue, 15 Sep 2020 07:21:26 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id d2sm27821482wro.34.2020.09.15.07.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 07:21:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: add aml-s905x-cc v2 support
Date: Tue, 15 Sep 2020 16:19:19 +0200
Message-Id: <20200915141921.57258-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_102127_922285_A9E92F30 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds initial support for the libretech aml-s905x-cc v2.

Jerome Brunet (2):
  dt-bindings: arm: amlogic: add support for libretch s905x cc v2
  arm64: dts: meson: initial support for aml-s905x-cc v2

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s905x-libretech-cc-v2.dts       | 318 ++++++++++++++++++
 3 files changed, 320 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
