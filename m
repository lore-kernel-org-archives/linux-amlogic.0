Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA32C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 14:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A74B21738
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 14:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JgGIcwym";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KUEgFTlJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A74B21738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xVvf0bi0UpZi0UNp+n82ccHikWinVS6dn8YKEsIEh3s=; b=JgGIcwymEGg3yV
	1H9s6U2u+aJW4s6iHral6MwAuRqaBwAdRjwzn96vkgrBgLxYVTdQxwwYKIFy+eNvx0czvbawxnDMk
	BOxzLTIAWwCE3xSKss6OolwkmjQbavKSmuNqaOJS7FSl0MY87UA58pVn+7j4GXaOXvRYcTYNv1ySs
	MLEhDEj1mhFpNMArcHKSrJG22XyGpjq7xcdpJ9dAXN8SJNHlZB8W7abtjt2vXcXKCgSUtCux3LoF7
	ynqkFXpIRzDWGm51VsvXn2AhEJ+2KU12Wq4yeq0i8g5J3UBE7xsuKWqdQLxR6g8zizKQWEIBVWido
	apt70+6sqRuVatNmiKUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go7fY-0000FF-6i; Mon, 28 Jan 2019 14:13:48 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go7fV-0000Dd-0l
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 14:13:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id 96so18253652wrb.2
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 06:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpNbFL6ONdQohI3xz9B61W4M/fvLpOFKy8Sisbnkre4=;
 b=KUEgFTlJMz7xraqDOiQGsYrJ2t9STMcHTRhKY/T31n3swojOjnSPdPGe3jQXj50aqq
 Aa2kjX6rM98KpEgVVUKvaqevVNR7H4vVE/zAK0b9Bi1naOXKIzqjy1h0V6x/5ntbVvJl
 b2d6fgOIJaKh4dWNzP9mCEiShFxgddiLXX2DILxjSWvzHJagBHQfVGST0NswauCmLwN6
 3JY2kl0i9P7KkXJ/MAzX8nfVVr0UHng3Onr22kZ9DHyG+GmuLq2F6V+A5+/jbpNtxncP
 Q3El9iMBb7jQsU5sU+srB9QwQS/rMUGZF/2Hr5/nwqcpQSMj8SprygZC5+SIIOYw2ew+
 AQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GpNbFL6ONdQohI3xz9B61W4M/fvLpOFKy8Sisbnkre4=;
 b=kHK1gF8JdUC86CPDs3Jpol0sU/KxpCp9G0aCawLVGp6Ob7DUDy3sKMTd3nCbL7Pmss
 dsyx7iia+pYdWBqX+glTuGIDysFwoWlNtbiTmV51GwVkAiDQIP2w73PqBQjnqIAd8bWx
 wyttd2r+weoWXQ7BWiPdXzMmJN5Rsy3DZup3BtCTLJMFURkkPh9R+xbtpz+o0zmo/5HS
 MpN7g2t9ax0bWByYr2wm7uAxhKuVT/XziiSwjOLXfBz8nW3W4dTd8c5tfLb/N3sKGjR2
 4tV+wEGWng15alSarGZKbo7k75bv5fB4E2RKwk8CV1RR5KM7AbwjxXG8SvY6UR4qatHu
 nUOg==
X-Gm-Message-State: AJcUukcZpf8GJAjYcABehMQXfPpXsgUcNP3B8qM9q/5J7MdrCbpj6lQg
 I/QJ8CwkY38zhBDCuVTH15+bSg==
X-Google-Smtp-Source: ALg8bN5GughM5mUUiNMpin2eKNC4qYdUU+6AqYPcenyQnI8cc8C4gk2sQBlHEYHaJl2c7d1MM+tZbA==
X-Received: by 2002:adf:b649:: with SMTP id i9mr22438177wre.70.1548684822582; 
 Mon, 28 Jan 2019 06:13:42 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id o9sm44131913wmh.3.2019.01.28.06.13.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 06:13:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] reset: meson: add g12a SoC support
Date: Mon, 28 Jan 2019 15:13:28 +0100
Message-Id: <20190128141330.21927-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_061345_189347_8F5C0227 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds new dt-bindings for the reset lines of amlogic g12a SoC
and the related compatible in the driver.

Jerome Brunet (2):
  dt-bindings: reset: meson: add g12a bindings
  reset: meson: add g12a and generic compatible string

 .../bindings/reset/amlogic,meson-reset.txt    |   7 +-
 drivers/reset/reset-meson.c                   |   1 +
 .../reset/amlogic,meson-g12a-reset.h          | 134 ++++++++++++++++++
 3 files changed, 140 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-reset.h

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
