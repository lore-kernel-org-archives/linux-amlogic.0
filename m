Return-Path: <SRS0=tT5V=F6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A117DC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FCE221E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63FCE221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KxXIrg7unPRdXGdhacqLFIvdiDFuEZU7++mSguBdxU0=; b=c2ZN5F892sefLa4Vz/xoO6LWdZ
	hWkZ7NJn1zNx+HiKtfJOhFQa1bpV3XJhM/P1IgmjrSanQhj5Ilhf5ZVnMIZ3F0JmIIji+jn1UMfUf
	iLocG8aMZ8IhPmb4grmfeHoLFZ655VWv8pnSThO5TPu5kC/BZFASXFNoMTL4SU5nD+EybFDGORFsY
	+VeDgBD2ikAw/uKrfRjAV3eCFNa+a20/0vjuyQ+ER3HcyHzFDKm7252WAIOgvjnOz+R57vmjthg2l
	nvl7AH710WFImoAw59yLO/XZQMZhHwhY0IemnteU3NqpZwnZsSGsHcJPUpQqdN0MYA7TG3hpWuKYV
	FrlNUjDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt8Xq-0005X0-Ij; Sat, 26 Dec 2020 12:19:38 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt8Xn-0005Uv-DM; Sat, 26 Dec 2020 12:19:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id lt17so8638480ejb.3;
 Sat, 26 Dec 2020 04:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bm5T9vuPoWIU6xCRU+PgPla6hEE0eBziHw6J7ZqdXys=;
 b=bqq1We105hP+TtOg3qX8jecGZUr9MXbSQ2RvjDz0u77TDGY1DWtFO0BY7DtyJmpIvL
 9X0Ot0AnsXAqG9djHwSY2TOepTf7YTpue4aq3ykqTz+js9XKep9MG34+eDPagjCvutw7
 Thv4/PeacvvNUZ+VspXqdRfZUfZtZkXfth+Roe+g/g41B+G5XOwTAJsVw6agoj+3Guvs
 s0y90ow09kbb8Dn/SC87QRUh02Jx50vNvp9j18P4eCNy/CcgHbiqMZIBoFU2/jBylhz5
 aN0jMZ+VLHhLALXoB/hdeAIq2N67joqKigulW2ebO3IvpUvAmruyvxgpndweIzh5jvbH
 3/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bm5T9vuPoWIU6xCRU+PgPla6hEE0eBziHw6J7ZqdXys=;
 b=mfn46jnQTmWlbKF3NHtFw/KnGIPzQYIfS+pOMgaBwQXH02Dr3OSBnivgvgjfkqjXJb
 Do66FPfCMQkXBv+mSJL6X9Zu3LR4WWDu6HBjAhAZ58/sFMQM/PuwRD6hxsM2HeAjD7ln
 rZB3T3V0qqQ5gi0MbbWZHHmQSHdFkRSRQwVwQsy+FB/kXSOXPrjSwKQERnzbtT97Sqsf
 NArfpx6jEy4p0SVVQJ9OOUnoMOByKfsKjE9L7tb+ScYJ0BP20YtcHrjmnCUgJ6XVPRvk
 clUNTETY4WbmQaEv0WFGE+wSnuyl6BvNkgH5LluzWfNc3mKZO8U07a92+EzcnIB93//U
 Bcgg==
X-Gm-Message-State: AOAM5302MQzGE8G6QnHou7iClthbQsELsLT802FRFgSOJp80S/mVfkzk
 DGpL9T7JdawQJUSgqlW+UcPaiFFwuro=
X-Google-Smtp-Source: ABdhPJwaTJ/wSSQc8uzjHVrEb0CVZyzc5uCwBEghsv+4BwXwE5ZQ9YRadAodvW6Ne6zlWO6VWINCsA==
X-Received: by 2002:a17:907:2d0f:: with SMTP id
 gs15mr34046687ejc.455.1608985173213; 
 Sat, 26 Dec 2020 04:19:33 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137218200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3721:8200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j9sm33842662eds.66.2020.12.26.04.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 04:19:32 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 0/3] clk: meson: three small clk-pll fixes
Date: Sat, 26 Dec 2020 13:15:53 +0100
Message-Id: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_071935_518061_70DF2E48 
X-CRM114-Status: GOOD (  12.24  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

while working on some changes for the 32-bit SoCs I hit a corner-case
in the HDMI PLL: there's some rate doubling going. The PLL only locks
in a specific rate range but the M/N table is not aware of that. This
means for now (I am planning to fix that) that we can end up in a 
ituation where the PLL doesn't lock and meson_clk_pll_set_rate() is
supposed to still behave in this case. So here's three small patches
for that.

For me it's fine to queue these patches for -next. I am not aware of
any breakage upstream, only some of my pending patches prefer to have
these fixes.

Slightly unrelated: if you know anything about that clock doubling then
please let me know!


Best regards,
Martin


Martin Blumenstingl (3):
  clk: meson: clk-pll: fix initializing the old rate (fallback) for a
    PLL
  clk: meson: clk-pll: make "ret" a signed integer
  clk: meson: clk-pll: propagate the error from meson_clk_pll_set_rate()

 drivers/clk/meson/clk-pll.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
