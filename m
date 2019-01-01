Return-Path: <SRS0=NIB4=PJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEF2C43387
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 19:44:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FEF2171F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jan 2019 19:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YGlwnuIJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CDxzRYci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1FEF2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdWBTF8TzDeH56lKSStKzLoH3nW/M083+mqtCbHLTsI=; b=YGlwnuIJ4CAroP
	ZrNShPhKRIRGLxxjTCN+EQ+dw862Z6Y8zIEtkAm+yRRWPTUjc0/VTx5Aq4IYKjU5eqEjCDlzxgVBL
	HBqLQ5FoJTfxd2OcIb3DGH153oB3cxiJ9e2rv3zScak5k+NhT6StIII0O54QqCrEmOVNCBBc39z1j
	lFoVV5TZuirKifz/3wj+YHIJpqHVDGl78SblaKT9w5qM+oikIJUgYw2EL2+MAQs0wUlPIcHe3UW21
	9Rg654Ly/XcdXQhkJgN9Z02vzIWBBQ1N6XMBEMVKIlUnQ6Pie9uSOgSOTXvAx3iSUhg11d+zeJYQ2
	HZIBeFiXwyKXpz5rz1+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gePxq-0004xw-SY; Tue, 01 Jan 2019 19:44:34 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gePxm-0004wY-G0
 for linux-amlogic@lists.infradead.org; Tue, 01 Jan 2019 19:44:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so28777112wrr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jan 2019 11:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxBcdG/5USi5uOX1JOBscFWeU4VCyKnT01z3qsVhmyU=;
 b=CDxzRYcixveTYzrL15GGn2NTMljy1t3k5xe9/qKivkx6lk44Svs51tEPGOt5NM1kpG
 bpVsKxaVmuvzUQMZGctO/7dN51yRWTpEtQ1VZCRB0FSsUo75JwBvyQKnl5LHHfX6WVU1
 D7KjWxymjFniLF8ZUsSjzRoPQyS5CP8jV96auS25/frgnPblpvFzPQQ89m1e/klAougy
 1QQaQzRUWtXo3rAJUKmd3aF/QyMG9R/q1MqhUUFfCLfO7YsSDKbDyJbl+Finpe7fdK9g
 xJdmGFiy1dJi4C+AlE74LXn1XI2qsrymDCnJHoA9zSwBdPmtRpsrT6m/TW5lwkD8hSKx
 cyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YxBcdG/5USi5uOX1JOBscFWeU4VCyKnT01z3qsVhmyU=;
 b=sHMGdwF5AKdYfmW3zUyAz+E4CWc+cff1za/4Ds05qgojO+Iv8pv92B6aZlueAYNb+9
 XYDKxlYQiJQpAfoaZ2Yhh3yFlPl7e6kLHTFLb7h9xLM2zR/Ba0YT78KiGNSp7E5sADC1
 TwYrtu16gwLUernadrNN7DJy/exEZRn4KsedzyN/AU/uaEPIXBIIc9JZcTZxQNaOzYFz
 kWV5whrahxD8xlOlKImnZqHdA/dSrWaI8sG1sObBTbiOJkqSdkrIoot+lLbquHyL8jlP
 uTGFfqyIIx699zUl/Uk1Wx++9rqp/dYSqlIBHCnC3gTLtX2N5A/Q/rgAFVBNbDW6x5A7
 FbYg==
X-Gm-Message-State: AJcUukcdNmX8cY+OOpf30ihRaP/Tm2IGrYSpQQogGHJnhe2AcMyKL5on
 eutVwUQrgVXSaOzX4ZiB85Q=
X-Google-Smtp-Source: ALg8bN64DDnzn5DH8rCQwHU58l1J01Pbr8s7gRhnO4bA4xq4Hs0XKrGiIV6JSxBZjVhet4pDMGBuuQ==
X-Received: by 2002:adf:c452:: with SMTP id a18mr37011121wrg.145.1546371867022; 
 Tue, 01 Jan 2019 11:44:27 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD719940081266F57D36520DF.dip0.t-ipconnect.de.
 [2003:dc:d719:9400:8126:6f57:d365:20df])
 by smtp.googlemail.com with ESMTPSA id l8sm41505654wrr.60.2019.01.01.11.44.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Jan 2019 11:44:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org
Subject: [PATCH 0/1] mmc: fix boards with CD GPIO and "cd-inverted"
Date: Tue,  1 Jan 2019 20:44:13 +0100
Message-Id: <20190101194414.24766-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190101_114430_551997_DABA7B5C 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: ulf.hansson@linaro.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
 linux-amlogic@lists.infradead.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As I explained in my original mail [0] I observed that some of my boards
were not detecting their SD card anymore:
- Meson8b Odroid-C1: the one one Kernel CI and another one on my desk
- Meson8b EC-100: on my desk
- Meson GXBB Odroid-C2: on Kernel CI

git bisect pointed to the following commit:
89a5e15bcba87d ("gpio/mmc/of: Respect polarity in the device tree")

The one-line change from this series is supposed to fix this issue for
v4.21 (mainline git master).
As explained in the patch description the MMC core code which manages
the GPIO inversion can be cleaned up once no driver depends on it
anymore (it seems that only one driver is left, but I don't have
hardware for it so I can't test it). More details can also be found
in my discussion with Linus on this topic: [1]


[0] https://marc.info/?l=linux-gpio&m=154609359306731&w=3
[1] https://marc.info/?l=linux-mmc&m=154626524506451&w=3


Martin Blumenstingl (1):
  mmc: core: don't override the CD GPIO level when "cd-inverted" is set

 drivers/mmc/core/host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
