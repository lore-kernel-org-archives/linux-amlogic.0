Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E63DC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:23:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8A1206B7
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 09:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gL6HJIFN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e2Pwq8N+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8A1206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gsy4HAVJxHMfi2sMES/G4zlvec754zO+1C62mdkBbM0=; b=gL6HJIFNAK5pvL
	8hoRS7tEkCP3Wwe+xCa/za0UVUK5AYvS/b36ktLgSqnEwjKJmAjAoWeAGdY427ZY7que7CVYdhHGF
	rIlWjlCbhET0s7E2ZJqTF9VkZvXgTxqI9/HjC1KNoFaLa8lru9cPgV5bRrP0ukRXSbucIJD4Z1ZXw
	vkBLH0zJzoasbJD5HBVlJeU/Gznebomt2W+yFtIHjxYEi2+Jh69nOjvEjlUQo3wn0jc9U2qdKNZu+
	32cMD1xDhI3hflmsepUW+rSg8+4xZ07fAbA9Sh23Mq2Dt1QqcBI70K7VwXidf1JjOrYNzc9gu0ias
	fDNvksoYJ2tY1HWa6gWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsPW-0003Jb-Bw; Fri, 12 Apr 2019 09:23:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsPM-00039n-UR
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 09:23:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so10972756wrq.8
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6c5xGsgEUsBmr+NfEPZmljbvAMnY7PKQByP0HLkSwg=;
 b=e2Pwq8N+XLbow9tRHSQP4MLvNZNC8O0Kzpx94hFulcpf6DCqJHmyJb4BhB69iV181v
 rMj7qeb3B8+t+9M9emNOfOsLxsA0D/DHVKpHxMSNyuPdlywcG3i6fZjYKYBu8n5Kt+Hb
 I/lGi/35kXN/8KYe76Ue30A4lAkqN3jBBpi6GuWLq8DlFepoZrY0C4zc7RQZHp+YHSDY
 BFw6gDksLOQAYFO8T8R5mISq10dkrbd6FyReN0nvLtxp1GKkcoJInn5Z1Ckr4FQOWeRz
 QCSwjGhaoNvs+nMHnNMA86Ruy46GeEnVWWqiighrZh5FlncK8Fjj4PvDzrkw33dDqSrb
 QOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e6c5xGsgEUsBmr+NfEPZmljbvAMnY7PKQByP0HLkSwg=;
 b=S/lstisoPT+sWHexP4ukOcdkc1hZvHAZuTVEneW6UFx1AKa+2yDkAJbeyD56Pgi4pn
 QuDKJIVMlkMuDCXf0KcpZOtnEWdcVau9GhYH1uydkaKuDelOrs+XUEueocFld0j0C3X2
 1FFs/+2RNWF49HGhV+aEvYpJm+5Mx0XrRXSDxz61KSwJgPKNh6ZGivYpjJ46addxBNpm
 314aN03W6THPX1YtpkySpO8XENPBrNxwy7eZGgCBtMuQRDvzpD8WAX4S9Qyenon/IRx5
 ZAtm/7wDuREe5EU3S+PXVhyBKkO6GmaASs5QUj8O0Qacirh35SmE0n4JHk03S87KE5BK
 Q6Eg==
X-Gm-Message-State: APjAAAWCwsm6/UB+f3BDtTq/OZPW4y8z4utEXCdWLkr/e4UJosDAzVI4
 pq8Kc8Q6X6RwUautc03sZkBfgg==
X-Google-Smtp-Source: APXvYqyj8Gu+Ubs+zej9YnxEdsDcovDEj6rsPye3Ho5bURXKk2LkzZRoqINhMeKNdlfTQIYRoZMMog==
X-Received: by 2002:adf:e50d:: with SMTP id j13mr36968828wrm.165.1555061019438; 
 Fri, 12 Apr 2019 02:23:39 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s21sm6630224wmh.22.2019.04.12.02.23.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 02:23:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH 0/3] pwm: Add support for Amlogic Meson G12A
Date: Fri, 12 Apr 2019 11:23:34 +0200
Message-Id: <20190412092337.6941-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022340_980046_EF8570ED 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the PWM modules on the Amlogic Meson G12A SoC
family, including bindings changes and DT nodes.

Neil Armstrong (3):
  dt-bindings: pwm: Update bindings for the Meson G12A Family
  pwm: meson: Add clock source configuration for Meson G12A
  arm64: dts: meson-g12a: Add PWM nodes

 .../devicetree/bindings/pwm/pwm-meson.txt     |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 179 ++++++++++++++++++
 drivers/pwm/pwm-meson.c                       |  17 ++
 3 files changed, 198 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
