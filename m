Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61196C74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 18:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ktug3Fvoy7kFNm+LmDhLwjXPBOyrVuwb/S4EHV2Z6pM=; b=dS+nBQL3knksAo
	WKNzcGaKuYqqwEmEOoSJ/0iEv9Zw+TJIz76ptIYZyWuG+d0aXeFe4C33P6Pqc1vduvXyXXJFU/fQc
	/WnkZ4VHCdszcbjuUlmR362JWYYpAN7agrhF2rlzPoSkOibmsnPhSQbk6S+iZA4LFsj+aAuH5SimW
	s6y9Kc71zNgTWRci6/vF72uXUkvu0Aqf6o2Any73mNhSf6X4BQoSDUTGz3ML1Gji4KtfjFCGLbt7f
	PX4BF1swMtIIqPJ20Lp7jEvEA0FladZ2hFY6oahoCRyYGrTpkZEQnmRdNOeHFuffnOm0MBE/nyE66
	UfAfeRnJaYnPckuPV8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pegIK-00DIpt-2J;
	Tue, 21 Mar 2023 18:01:12 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pegIG-00DInu-03
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 18:01:11 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3F7B22003E0;
	Tue, 21 Mar 2023 19:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679421665;
	bh=7jcxLZYZVIxLt/99tnslGBZy06mzJRUXDK5eV7UVG4w=;
	h=Date:To:Cc:From:Subject:From;
	b=uTSUPt+5ngY/UMwWdzRhQE3aZwt94Z3VI6MZ8bcJkSmM25FQRiERdzhVoVbYceTll
	 T8wk5ONZvPzU35S4CZDuOJa+ReSHEGpla/O6ZhZDOA0R0hrx/9GyUGKAI1DazHVVX1
	 GEQaNLzS0mVl4f0Xg0xk7nspVladvYcE1Uj9QxLCjkEgd885S8SgJUKewirGZO0piu
	 hUfNwiovel1nUI4o4yVOguxGchC163ToJNmoCHNUkFB7gRLAAgNMu96ZQ0R/UNAixy
	 CG0yF7DIkXKlXZ6cRAIcX4RKdPr5H4RgAKAvUYfnInmbF1Rl1Aqs8HWBhxyKer2zFN
	 yvLcVK9JBjBGA==
Message-ID: <d2444591-c91b-a94d-71e2-9dedc3b6c514@free.fr>
Date: Tue, 21 Mar 2023 19:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Pierre-Hugues Husson <phh@phh.me>, MMC <linux-mmc@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH] mmc: core: log empty non-removable slots
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_110110_013657_3B83897D 
X-CRM114-Status: UNSURE (   8.38  )
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

An empty non-removable slot might be the symptom of probing too early.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 drivers/mmc/core/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 426c7f66b3492..b8137baecee7c 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -2257,6 +2257,10 @@ void mmc_rescan(struct work_struct *work)
 			break;
 	}
 
+	if (!mmc_card_is_removable(host) && !host->card)
+		pr_info("%s: no card detected, check post-power-on-delay-ms",
+			mmc_hostname(host));
+
 	/*
 	 * Ignore the command timeout errors observed during
 	 * the card init as those are excepted.
-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
