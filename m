Return-Path: <SRS0=/zDn=52=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E9CC2BB86
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2020 03:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CE31214DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2020 03:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RozdRNzy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyehbGI3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CE31214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utm2O/GATrpSUyVqnAgMTk+4nRzxaAoQ0+MyB4zs4K8=; b=RozdRNzylnfppq
	Hqp5iUa8ne4WIidY0ngEJ9kat6Qrt854N5lEQNzoCl0Ke6RR7fWnsFzMf725aQmoyEtMNg9Yt2txh
	TbUwgMjcQxLSW8Wdo1HlP7+C9e3oR7pIKbmybGW+0kYNRRk/oTPG23scg2rzkn8GgPldRUmeJ82it
	+CYHibfXBLogrz3DR3iWqM4PKMQcInV487fKVyl3Ith0fkkxJjUlE5QvGDsnWtgEIlYKNPUAfw/gh
	ufmPaFPrgnXabsUYMR9DYh5C+7dnOZQUIa16oLq4r3j3JJB+jR7/Fb3+2pUTL333Vb1DqczqHxy57
	c9pf22Vwkq1NMh2UsCow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMkdG-0002U7-Lg; Fri, 10 Apr 2020 03:47:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMkcz-0002Bf-KU; Fri, 10 Apr 2020 03:46:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2CED320BED;
 Fri, 10 Apr 2020 03:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586490409;
 bh=u8YqO5KRkDMJkvpaDUQlB5lQevXHKx6UCjjbjXQemGU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FyehbGI3uKjc/GZqo3fKv7NKyuTxGogTcBsEaUy737dVauoUXEbgJKYQlQREV76dY
 DieQNIysfQ3M/iI/FTUHFWwlRULY0rOlYo3PwI+OMG6t7CBzkbDX6vkZYArM0jkoXl
 zJE5lVgAYyBOiGla1b0Pxr/9Vz9jsx+Q3f78jtG8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 11/68] media: arm64: dts: amlogic: add
 rc-videostrong-kii-pro keymap
Date: Thu,  9 Apr 2020 23:45:36 -0400
Message-Id: <20200410034634.7731-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200410034634.7731-1-sashal@kernel.org>
References: <20200410034634.7731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_204649_696255_846D3EDB 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Sean Young <sean@mess.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-amlogic@lists.infradead.org, Mohammad Rasim <mohammad.rasim96@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Mohammad Rasim <mohammad.rasim96@gmail.com>

[ Upstream commit 806d06161af045dba29f3c7747550c93b2ea3ca9 ]

videostrong kii pro comes with a nec rc, add the keymap to the dts

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index 2f1f829450a29..6c9cc45fb417e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -76,3 +76,7 @@
 		};
 	};
 };
+
+&ir {
+	linux,rc-map-name = "rc-videostrong-kii-pro";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
