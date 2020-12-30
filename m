Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8B4C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B77207AB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B77207AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCnWBMw4UlOYsmtL/D30QPcOaD5/03l2Mftj1XoGonw=; b=o3UidMESXVjk26LEpwB877RSTk
	WyRRvyZ1SQvYkiYvoOYc7V4V54V1NhySZvi5FK2MLqrsLltmlhdAMlQGzFLprGWK4BAbtED8z6ACZ
	SwdEsIR2Ra7ssQ/JgnXcyCsdPr5yP8zpACjsVcwu2JsG2ji9myLob8XUuwkzXg6DWF8Na3hv1day3
	2o8M/V0L+U6Y5MWLcosKYsetwqgkXMwtwM3MqPm5JHjq0coRBmVjF0YJhEArw4luVtrj8KUFuYEYN
	AhGy97+QCa8LVVWEx1+AC8PogYPKOqdu127enkYJcn9scEK3t4y1DkbjbzKxX6SJPdYuvHzKwGTl9
	nhg35LVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuYrO-0007yW-Dt; Wed, 30 Dec 2020 10:37:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuYrI-0007x0-TH; Wed, 30 Dec 2020 10:37:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w5so17043135wrm.11;
 Wed, 30 Dec 2020 02:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lB2jyYvwAFJqgVsiDcs5q586quNuRit4RsqbIhvpDwc=;
 b=t8D2NXMib2OLbtiEq5l5ecValyii3h7bqMz+EpQVrCxtRdc+mKf4ZdiWmkUYabnrfq
 QDfC60lxCZ+4sUmp2K4b1waHjxiDnq+CJCjV929wEbbDLkrbQ/K3JnRW9ZTUmzvaX1Yx
 0Eh80JlyEikRcwuo0kk7EaHMp4pvjNx4W4mDjts3rDu5OBy62WCYDStcM/rqHy45fwuR
 8DokrqVFRH4IPlCdjNdnnAvlAhfHwIzBe/ict0mXJuJ3Zq3s5Ezg8UlmFl86okqGtVMB
 b50Zjlvsv1RrlMLZe0kJ6J2BzT2iudLqIOPwkVXyTWZziRltj11Lf7QNAIRwnAdQBJOV
 zTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lB2jyYvwAFJqgVsiDcs5q586quNuRit4RsqbIhvpDwc=;
 b=BL2kTfnCykHelUX+h8diMiY6YIpK2d5BtggHJoeWy3ACbS65QuelfjLYBWNnoxLiNn
 DMJSCUDoj0/ztV21Zkjkj0ieVPuEISoWIhwEPUiVtEG1bs1AYc/InMRo2/iQXkLqgqsA
 Pq31KjN/e/l9MMPU2Vvim31e8/Q9yy5qClIQ+L/mzdCPdTzeehpISGBiu5RMUsf7LR0g
 0NNHwfArttXZUELj6bAeCVkNrH20fihZycV48PPVdzOypO9oV3l6kkgft2OcoDyCSXfg
 17k8J/4jJD5bTu48Cu/wTFcB+R4tU2NFXzOzc04CrvPTlhgVtHQJrVKqhTeAUzeI0E9E
 sGAg==
X-Gm-Message-State: AOAM531FRGgnQauM2noUZk0cLm7wxlppqRSRgb1NQv9tLN+jnO1eNfLu
 i7W90CeWbIz+5GtcVr+ZN6o=
X-Google-Smtp-Source: ABdhPJzLX1NguQsuiZgg15MM5WznDUrE9WmYBn+8YF63U9dYWpUYEV9el75+TDC2/A3CUHqLMEqmsg==
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr60289027wrp.121.1609324653781; 
 Wed, 30 Dec 2020 02:37:33 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j15sm66672156wrr.85.2020.12.30.02.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 02:37:32 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: meson: add support for Beelink GS-King-X
Date: Wed, 30 Dec 2020 10:37:27 +0000
Message-Id: <20201230103729.2272-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_053736_985925_A22BCC91 
X-CRM114-Status: GOOD (  12.69  )
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
