Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4155C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8422020823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 20:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lhgrawIi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CbE698Q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8422020823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pjw8oL1tBeO+O5j7mPbDzTlEaX2oDnlsLc0DsNRd7/M=; b=lhgrawIij5MmiE
	gq3TkerIQTy91k7qqcb2pIvuEGTxkvr9tvB7URxGYBnZjfZo1WavyOCFXPcuw8H1EgwvgDW7jm16L
	np+sSyjFM5udzNzweWFZWzsixWH6GpvPPgFiUtQSUtAvfo0jugfcEcdnT2edLOmZlrmzL8dkhhMoF
	bEzL+jbwHFQQR+zJkd/OwwPYnnv5QJ7AA7u4ZBujBB+R9ObMpa67caOnw/mRH9tmhk1o5x7wquRAS
	5Jg8+20g0BFQSoGoIlvzCD4Rre2vY+mL8D8mdq004PP0kPBZNqFk2+ZUWATveotpasVzQoY6pyXcG
	QpGT5BoYHUJUp+qtykvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9bwC-0004n6-AW; Thu, 28 Mar 2019 20:47:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9bw6-0004k5-2F; Thu, 28 Mar 2019 20:47:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id v14so291939wmf.2;
 Thu, 28 Mar 2019 13:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpONjlavF550NKmic2Y1k93QJBkOf1HPbHKeBcY7TQo=;
 b=CbE698Q6MQ7/qD9EYaA9eN6og/aSmQrQiaIqH1rlMlbea9KTtHttQwK4JqIEM0Rgmb
 7j9iezUTd0KscM+C22isyLMVwFrHrj2UoyGoaub94NeEA/rDjtnAXvyxXSSdfL09SmrR
 4+pQrCnqvkAO/+KZ59I8LeVPBX+3m+eiX2IaqjNJLzuZlfCx2IwgrSOdCcgGVXgjKUbC
 VS5LcvxNgTMdK/YJx4LfWrVEAsO0+NsNYH8gQ15nu1aws2FpugXYn4opWAKob0rVQtgG
 +KLFKc0gNxhxq2bfPyXzjnlmbizFoMu7c6HA3EV12WTW4F+uZR0AIHlWl27Wf2LBrjwW
 kXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tpONjlavF550NKmic2Y1k93QJBkOf1HPbHKeBcY7TQo=;
 b=qAZ5mXlU2fGt6zUZgCswWzk3goV0+V8YGpTeHyALXLlGzrGSGFGWjXXq6DvgoWVoQ/
 SyrFdRNzJ2WZ1mUbt/4iWAiMxWPL4j+ARnDrzB81S4eKYn9DGNSF8ajquHTFuQTLB5Hf
 3v9O9ru5LEOk1xIAn844+bzYEexM+RcX3DylN6ACmn2BQC0sDNK9Whj0mz4qWm1wzNvi
 G7M9GPWc+A/ClH7uFDwtBYogGk26VJM5R7XufVtyab96Q0qzFucbRfaJ0TwKd+94fswZ
 pQOFhqJePmGDVH33SUiIrGbs9ZY4jfkwNP2SyCc24fXBgTFAZfyFqn3Za9nVMluId4cl
 z4vg==
X-Gm-Message-State: APjAAAUUH4bRchRll7SqFiNvXj8P4+QasLT8+AkFfRW1hXU0eeFpOjxc
 33URkETZbBH7oIthZDGUgyMMdowC
X-Google-Smtp-Source: APXvYqwug30bln2Shxd4wIqjvrncOWW1bThOFMoQmXgqpNjyG3CsXEK5xk2eYKcn49FlmtWFUXM/kA==
X-Received: by 2002:a1c:2394:: with SMTP id j142mr1220211wmj.111.1553806059516; 
 Thu, 28 Mar 2019 13:47:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD73999007CF185662A5FF671.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:7cf1:8566:2a5f:f671])
 by smtp.googlemail.com with ESMTPSA id y9sm257173wrn.18.2019.03.28.13.47.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 13:47:38 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/1] gpio-line-names for Odroid-C1
Date: Thu, 28 Mar 2019 21:47:20 +0100
Message-Id: <20190328204721.25970-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_134742_100998_9B9A2F0E 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Similar to what we have on other Amlogic boards this adds the
gpio-line-names to Odroid-C1.
This makes it easy to compare the schematics with the actual .dts
configuration by looking at the debugfs GPIO file.


Martin Blumenstingl (1):
  ARM: dts: meson8b: odroidc1: add the GPIO line names

 arch/arm/boot/dts/meson8b-odroidc1.dts | 52 ++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
