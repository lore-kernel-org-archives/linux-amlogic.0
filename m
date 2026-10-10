Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8497ACA9EBE
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6EM6jQE1E6/0zB+Wh3bYHhfqPfgOLfkwgUNCv0+40g=; b=4JUbxCEpbKxXgk
	obQadsOlJvk/81O9RIR1IwdeaNJCqFEELHAbjAp/KPOaw0V2FKmAMgmzkoJ9D48CwSZjBUzdaDExd
	V+gUmh/E+3+7KHImDtVqJyiS+Ail5pBJllrQXrKCpQ1uSjBrPNYBnjsofnYDSTsGUC9MC02+FsWVX
	wvyGFD6uAk3u9y6Z4rCE3RLcsodjOQLYDkP/9RmDqa1hsRq/p98izjNVpeshNCROvA48eE6wW/Xt1
	n8ZULqwovwxsWRnr4Oygx6CXcMdXQwRHPSdLc+3nWA0tF+aMgSRJcgN0hTLJLtEzXm+xZxj8tPCzw
	+Y3uqjUkc6qZrRV7YyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUna-00000007sVU-0DsM;
	Sat, 10 Oct 2026 10:59:30 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnK-00000007s7A-1EAF
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:16 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso319255f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629952; x=1792234752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdKVlCj4REX0NWkQYtOCVGuCUyIjtnl9DbGH17gD2u8=;
        b=sWCyIL5w0TWDbbvQw5l7OFelFoSX2iTF+G81/dpN4etGmWP+46Jg5F7ZDNTR2yWQjm
         2pPdbDjJ9xAPYEL1RPFUh6X2fTuVqm4WXc8P6BRuQ/AqZk5PAKnkS6lfBhiyIqkS4gVL
         1p3SU5jAhmO7wM1KgaV650PGzZWmUjYQImCA8B4DbLw4tbAyj4Osv8oFevTSUv2QsI9a
         Dn9aSLOIeijRzbfr9JTGEJztRO1/JXeGeakTU30jDS2dw6kxCKZ/oJkPGqecYlEorfWe
         5AgDpneRKavcNPRxld8JZ83UKiPc/jopHGWc9wyPti6CvQ1UQmFyJu3qAWcZUX8MeZSM
         unZA==
X-Forwarded-Encrypted: i=1; AKwUvByB0OzRB7e/7NMT+psvxJWi+qODmlZ1SYEnjbSpt4ombaFRAG/eCSH14HEUxDhmyrFy5x0rbPfOLTIXBPGo@lists.infradead.org
X-Gm-Message-State: AFq9FYIGzkKrE6tdfNk3W5CZFqzwLHLhC//yjcN6zx8S74r3Ygv7yOdU
	VA8CdzBG+pgEXyEQq5mTQobKf+Y2+uvERrT1U3mnNDdYlZHK4QlbMBNF
X-Gm-Gg: AYBFou2Zs4OxBO41gO1os9Ao9W8dlZB2KKbSQ3azg5SxwTu757uJ/cRoWFlOoo9kl5H
	XLwglhVbDzcL4qPcc79+BF7a7tPCDpI5z2Z0GMhAmA6gzQrjGJfV6biziBJiN50QFqcoS9D172S
	dNt46QmhWE2ZC1b1P/pZ0sQhDbIlvKmtATdqLph5Al/9ehDfXNr7Z8Y49qfmzTJpp9J2h32EVZh
	PU15iKXNyZSNPdW8FwBeATGolvKv4PpTfEKB0xmBLrn4/4fkL5wr3N54D5bAy0wut84QzF66Rjt
	D8ShrQa6+5UaDw+Db5YI54LafWJB5U/fg3rg0IA2aWMoVr6+tmueUjfdFbIIaBJp2QANtOhK4QK
	9ARBelvqBbLdfFS14+UZ9XBfCK8Vkn/etmdMjt1yCI0HrRHxmaheyAlYWCN1BGolvh/1mqgnykq
	NLwKF1vfQR7fpDvkBvfYVip7zz3c22eEPuyrkdmAUrxjwtOs+w8SvEijUEpTUDYQRDGig84+L1s
	fRuj7EjYdH/IWPB7rUmvjbTc6F3eEs8vWc=
X-Received: by 2002:a05:6000:2dc5:b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48dbace3b32mr6883381f8f.41.1791629952539;
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:12 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate who adds the RGMII delays
Date: Sat, 10 Oct 2026 11:59:00 +0100
Message-ID: <20261010105900.247342-9-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035914_556570_72770D53 
X-CRM114-Status: UNSURE (   9.51  )
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

The informative section explains in prose how phy-mode, the delay
properties in the MAC node and the mode handed to the PHY fit together,
and says itself that developers often get this wrong. A reader has to
work through several paragraphs before answering the one question they
usually have: for this phy-mode and these properties, which part adds
which delay.

Add a table that answers it at a glance, with one row for every
combination the properties allow.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..bba27a9feb61 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -339,6 +339,24 @@ additionalProperties: true
 # has added. Failure to remove the delay will result in a
 # non-functioning link.
 #
+# Put together, with the two properties in the MAC node, this is who
+# adds each delay:
+#
+#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
+#   rgmii       -                     -                     PCB trace   PCB trace
+#   rgmii-id    -                     -                     PHY         PHY
+#   rgmii-id    present               -                     MAC         PHY
+#   rgmii-id    -                     present               PHY         MAC
+#   rgmii-id    present               present               MAC         MAC
+#   rgmii-txid  -                     -                     PHY         PCB trace
+#   rgmii-txid  present               -                     MAC         PCB trace
+#   rgmii-rxid  -                     -                     PCB trace   PHY
+#   rgmii-rxid  -                     present               PCB trace   MAC
+#
+# A property for a clock the PCB already delays is not in this table.
+# It is either the fine tuning described next, or a mistake the MAC
+# should report as a fatal error.
+#
 # Sometimes there is a need to fine tune the delays. Often the MAC or
 # PHY can perform this fine tuning. In the MAC node, the Device Tree
 # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
