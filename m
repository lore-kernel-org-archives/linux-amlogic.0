Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0EFC433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:54:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6B5613E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 08:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6B5613E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPnTrRCmKfmcdQDg4dqAKSx2Z40lTd5pfItemuFklys=; b=Qyumxge3czG3rpaAh/mnBFu2Ub
	n392+TMhfXr2EaRzayubo8uekKY6N2FnYabanW7s+PMi8X7Kx95u+BDU3tt26tQo5E9MYnZBWXR+t
	Iha1RfUC0A2rhYZZRlHDdwwu4xhsXSVtXqq4EY/Va1pMvaiyP/rHtgjYtCPKtkjEEfP84IZkNMvuW
	ZaBy+4tyXsJ/7Nw2NYXISHmbmaOy283VLtejqWl4KEMhm6It0vsZVgRo2Yw07Q7IncmAWgzkagAfD
	EnKdl8lKzLsIjzZX7Gk7Yy8bIrAcy6VgkGqStTU3Ik6Go+Qi72jxSIiErtubmg1KtIGGh9RugMwxK
	ZSfR2okQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2RK-005NNJ-FZ; Thu, 29 Apr 2021 08:54:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2RF-005NLs-5Z
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 08:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Okh7SCTJDi6w4nnu7QO5qBG/v+E7WIC+sY8y8/WILM0=; b=ppGkVBsbXN+RDF/Y7X4RX8QS9C
 9gM0Lfxrik+kiB+DKA6692CYPnC1ln8wa5WJfNE291sD7dMoyo9kbdU7FNWFtKMzNBHjrIvuEHdNa
 FPC1Dwm7qReM+FEWpGQIh5azPwM0e66RR/muqUad+uv25lR5tRUW6cyk6H7gt1N2oySU64IFGT6HK
 8K1gQXnYdDMCBzPT+KLajpRDKZN2E6HW6LOzVpQ1+90ArLMsLBHYATqH5cdwe1z5UveUEMV6Uih5T
 mbPzjuIZQTWVJlhjvm5wl5bh7upy0SB/emErgh7NrJGWmJUK+SbuJaEVlNlhhWFkinZoCAopgSX66
 kA4Jch8A==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2RC-000VIq-1a
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 08:54:23 +0000
Received: by mail-ej1-x633.google.com with SMTP id n2so98691483ejy.7
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 01:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Okh7SCTJDi6w4nnu7QO5qBG/v+E7WIC+sY8y8/WILM0=;
 b=u8Vd2oGaTMPpqhwHEz69+5zFmMPmIW3Xe+oOdNQOxMxVkTrl+SeLoyuD0sKuN5RD2l
 u9MVW+trx+Evc55frr7/kM0Jc+c5ICqksesG26zRL8EzYE6hWhF1lujGIqCgmJTGJ7yv
 7KQkm/Z/HxbwntAviIeZVJZ4OJ/2HUalcwNFUpfL/5tPLKGmyjZY2RxsIVJq9az/0jdc
 3gGWYlvf9GwqQbJbg1fTQDlBjWzYe0kO9lhBGQQ/O9yBSgNqwSj4ShtlKxQy205ti5Lq
 d0KLW9gNA62xYvdWammNPJP7+crCLRDXbFhQlRrQBzpIfqrsjn3DYm6W+SD303KGUmxK
 tBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Okh7SCTJDi6w4nnu7QO5qBG/v+E7WIC+sY8y8/WILM0=;
 b=J8fp1psiPunc6q/Ot8FTWLiXvL5q/bcN9wBoVx7+Jo/TldzK/8TYqPyCSSD+SbsYgr
 OEEFen6O2sbzApe+zu9IygTcBk3FHgQk0IjAdEBUC2lI64FbOJjLIO6o1O/YqkN52xfg
 5ZLYLo9wKOOGSzSpq6V1IdAH5sQPrrUNDqdHlJZD9Ap+5c38r18AtTFT2TjkUHGtG9Va
 4FvjoJ7b6Ne6JyzQyljs0w7oz+e4qpvk51V5Gj+h4QzCN+sieTCo53peAQYnyY+RXdyt
 Of5HyJwBiVFOgh/h+TQpYjOsB5JwSAQ+st5ELduPVbzHrfI1bWCBorwwTBDvj0/6uLnz
 aiLg==
X-Gm-Message-State: AOAM530HD3E9NJoNRUcijatrtcRXhnxdPakqd1PGQHNxf0daNgAkVmK/
 hYrhLjRP5QpYNDFDaeehXjB71w==
X-Google-Smtp-Source: ABdhPJwJoIa+rgy+CBsStAafFHpT7XKNSzhMNvbJHyz88GZFb+n1fhDg1aSkROswvEIgI77W9+pK7A==
X-Received: by 2002:a17:906:2bd1:: with SMTP id
 n17mr22869220ejg.371.1619686459979; 
 Thu, 29 Apr 2021 01:54:19 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id x9sm1835847edv.22.2021.04.29.01.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 01:54:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: vim2: enable highspeed on wifi sdio
Date: Thu, 29 Apr 2021 10:54:13 +0200
Message-Id: <20210429085413.60368-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_015422_102147_A9CA4FC8 
X-CRM114-Status: UNSURE (   8.06  )
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

Enable highspeed mode for vim2 sdio. In theory, the vim2 SDIO bus is
capable of handling SDR50 mode but this needs to thoroughly tested.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..217f9d6d470e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -307,6 +307,7 @@ &sd_emmc_a {
 	#size-cells = <0>;
 
 	bus-width = <4>;
+	cap-sd-highspeed;
 	max-frequency = <60000000>;
 
 	non-removable;
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
