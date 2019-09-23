Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBE1C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD63820665
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 14:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fxcJ4Jvn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ec7+e/vO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD63820665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qAzCn82NzvPaFS1oMJ0ZRmJLCB7JLDzfXNycOWeNsGY=; b=fxcJ4JvnJHP5fEmVBPZb4TUwbw
	rcZdRKsXgNEIkjgcr8bRS1eO2G6IKHYKLTTc8erqS8OJEgj6SCb68DipeUDNnByv0meC6UcOKAuFl
	AlPJclBMJnQJOj87QBlU8jf5m6grsc4vPizoiZtA81d3hV+pZ5RiKlLTHbUC+G7Tcib9n5e9oSHYR
	YNqrE1ri7kzo5cM2xFXw//xZWGgk+d8EfselDgJXpVJ5m1ieaBca5o7R898EpN7FULUcVHJ6kWyx4
	0GIb7nxsW1jaFtxDVXYCpAeTZCgKJbN4JbOFYoBarFAT0crwGol3bb+wakP7o+o4pN6Csa3+GEKqQ
	pDq1PpEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCP8Q-0007Wp-NX; Mon, 23 Sep 2019 14:16:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCP74-0004xL-A8; Mon, 23 Sep 2019 14:14:52 +0000
Received: by mail-wr1-x436.google.com with SMTP id v8so14178474wrt.2;
 Mon, 23 Sep 2019 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=ec7+e/vOexOvTupF4N51DyUI9IK+tzeCpvquHyORkLq46BBh5H1XRCPAgK316lNwp1
 D7+8f/SzrN8b6TBnPmAIQaclhWgoXOsxC9ygJ8ft+vBjwRPRPlkc3HjBLQMb3KvAcpg8
 Le1f6VFKWhQ4xXJiv6POOQaq7spIJohCaaRTO/12bWV522WIpZbVaTEVlDxJG2XwwAj+
 zUWP7PIo9IZHH6NAXPRwYsdKOG2YfrRbt4VyBkw2Eud/aHYU18ZKtQpiZsw4DmX2EaEX
 b2/FIX8uLF1FKHTy/WrZVX/TpcfIh+xoP45nWV/wJtuP8OVqDcFzDRPvHmPjnBgF+oqm
 d7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xDojPBQ0esilIp1GUWD6dVVMPDHyVZuOXZ5O6hXNfas=;
 b=rvkTA+yaKhvaT+pLGn7Mt7aeyVHMH1VbLDcPPcmKK2PnLSOc6y84UXPN/d7ZakEElE
 pwaxHUP9P2EInFp7E+8Jf096H5hqpuhfVoymbiojyD+QRubGNDYrz0Ta706lmrTUkPQ5
 q0G6rHhnE/9B3Jxc2j0qRO6M46G6I8eyvpdHScxVXXyykBbS1bw2zlDPe/LsglVHiVcu
 bn0qHOdP4XgA1SIoiDMRQmuj7t1l5crHyqGGj40CQVbdn3ByAK3XHQvmi+ClKy/VX1SU
 VpmsBMfbJYtaDR7jF8enbhOltbTsXyto47Zbe9HRnZMqOYJr2v33vVO6sdP8HyLQPswi
 eNgQ==
X-Gm-Message-State: APjAAAUbA36ab/Q9jaOzIqCApGelqycsvPuXIB1Kb2KWezh0cEcP9qvZ
 xCRp+kLPTyFEljqfB9Lx90w=
X-Google-Smtp-Source: APXvYqw3564AefETCZx7N1ORzHLmEWXRNjXvrRmIeHPR7ZbKIzG3YpOhOxBKCySAVsDdCkGT6koM1g==
X-Received: by 2002:adf:fb8e:: with SMTP id a14mr9614815wrr.304.1569248088812; 
 Mon, 23 Sep 2019 07:14:48 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id h17sm7001700wmb.33.2019.09.23.07.14.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 23 Sep 2019 07:14:48 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Mon, 23 Sep 2019 18:13:54 +0400
Message-Id: <1569248036-6729-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
References: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_071450_760703_6CA92B20 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ugoos Industrial Co., Ltd. are a manufacturer of ARM based TV Boxes/Dongles,
Digital Signage and Advertisement Solutions [0].

[0] (https://ugoos.com)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 6992bbb..d962be9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -965,6 +965,8 @@ patternProperties:
     description: Ubiquiti Networks
   "^udoo,.*":
     description: Udoo
+  "^ugoos,.*":
+    description: Ugoos Industrial Co., Ltd.
   "^uniwest,.*":
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
