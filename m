Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D545C25B74
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLBZ3fbm1NgHcKY60APffVega/MYuoDB0Iyp6pS3d5s=; b=S63j786tkdwfRX
	rYWWMvSZw0sGMv+WROCMJ7IMIE99E/eEvoHmHlDfIlpaE4vh24WzAAqyIGLoeZMC1OvVUeFCtFtsT
	l7NkmeiELo4rsn3maUrsfSayiIFkcbli3Y1MnOEnH5aAIajk9BjMG0oakuPbkM7DPR2TZcH/g9wmL
	ozS6VCrIAh8uVMt6HNbiZW2l9P1xzirFbL0UR+Ubn8XhPU6aGlnju3wf7Ki7jXg9uuPuDK9QJboPw
	esEy61NJhq+uP6IqOUN05y4IQcB6R6yqqsSkoIQaX+Ki+V8AGQuPHOWL+3M7F5w1N/T0QweTgm5qT
	8V2rcovu5Qiwmod81BwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZKt-00000004cdl-3nTU;
	Thu, 16 May 2024 11:31:47 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZKp-00000004ca9-1xHx;
	Thu, 16 May 2024 11:31:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB584181C2E;
	Thu, 16 May 2024 14:31:39 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1715859100; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hLJvt3Qp8v0w1uJwmrYsCccfbrCeUtcFvurCzwm/ryk=;
	b=g9jNpinpkHMYurNslyMiEuGtbzGGZ2TIYQDy7RVJDpy3biesMJBNa3/c2d45MXJ4RKqYpF
	hhGTxi8A1v5Yol98OElo9K1Wbf1FzwSahKr1YC6KQhW2TyGOxzlVAnMPAaFCw5BC0cr82/
	1SmSZFDAAvhBfGijvlrRIIbuh2p7EbqLQMtDpljWq5+/USwWCJFojYfOF0wqf0gG1WCCP4
	OFzNgj3ZNi/yHy4yTCHlQNdwCwsY8xZtjN5Hy7dpfZQ775ARKq/c8xoIyNxkwUJ/u/wYzn
	t4+r5F/Xr97lYNOC8YaqyePp22cGCYFI4LKxZQIGoWtcLa/FONKxAYZNWc871g==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v4 3/4] soc: amlogic: meson-gx-socinfo: add new definition for Amlogic A113X package
Date: Thu, 16 May 2024 14:26:49 +0300
Message-ID: <20240516112849.3803674-6-adeep@lexina.in>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240516112849.3803674-2-adeep@lexina.in>
References: <20240516112849.3803674-2-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_043144_437934_7E4D50D1 
X-CRM114-Status: UNSURE (   8.04  )
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

Add new definition for Amlogix A113X soc found in JetHub D1/D1+ devices.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/soc/amlogic/meson-gx-socinfo-internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo-internal.h b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
index 3ebb80972fc7..2028101bb9b2 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo-internal.h
+++ b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
@@ -78,6 +78,7 @@ static const struct meson_gx_package_id {
 	{ "962X", 0x24, 0x10, 0xf0 },
 	{ "962E", 0x24, 0x20, 0xf0 },
 	{ "A113X", 0x25, 0x37, 0xff },
+	{ "A113X", 0x25, 0x43, 0xff },
 	{ "A113D", 0x25, 0x22, 0xff },
 	{ "S905D2", 0x28, 0x10, 0xf0 },
 	{ "S905Y2", 0x28, 0x30, 0xf0 },
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
