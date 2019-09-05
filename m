Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C42C3A5AA
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFBD22CEC
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PoVJ7Rlt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KvoyxWVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFFBD22CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTXPAOLjsctQMvY0mmDGJoUIPBoqI7REfHHNXAmyf20=; b=PoVJ7RltzMNhT3
	fMnLEZ0U12m2Y3Ueg1uEPwVbkgHNE0BBq1EA5THLs98n/L6lhlVCFaI3c6Xaq+6cN0Iflm7lnsQ9I
	jokX+QDRM1Dc+ffMsySArJsvftmI//M3b+kq9o6+BvllPMfNzovJi+m8Zgat8n0SxtZdQVNaksqIp
	unskZkI1lWjvGvtLZ+2m0z5m/Xw727qVA7NA/nDdKS+2yRfbhJ7HJlq3TdGUJVciaRZqSLP2dlZsj
	4EzIc2xt4uqh+4J1P4sDj6hdkMAbGVBSpKkv7YYtRaTwtezZqi1bzU6kehjqdpXuy4co4u4JqZeJY
	bMLcKOiXM8n51cHjjaXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSH-000862-9J; Thu, 05 Sep 2019 12:01:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSC-00080N-CO
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id l11so2453573wrx.5
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JtJp8hwFJlC+ElDAvP+29EWq9+aj8xhCfyxpFjJGuMU=;
 b=KvoyxWVLk27MSxWet5eXVTEvqpz7OZQMYgLSKMOIRVRN8rsctD7bnPqdMwnLL3zfea
 F9a+I+VnlL2sjNeccOjyir/GffR3nHzT5+vvnS40miEitiIwqkwWFePtCCIQQe+6pGKS
 phg09gOPaLHtB62WhhzohCzkg6ZYAahehhGLmE1UqmkLWSecAcgvcHOUZ2AeMgEUfg7h
 pSxePwVlV20zeOmm+F3v5RlPjQSSF0OaJlZWhTzoptuJ27kovmuiQ9MFH+B98IzX6gWH
 Dp/KxNn2aUJZMh96iRGVoPVvSRBn1dVIRDwacVjbTBbNBKoodXk4z/k0x7sTcek7lcjl
 pgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JtJp8hwFJlC+ElDAvP+29EWq9+aj8xhCfyxpFjJGuMU=;
 b=alpFPnVmDXficT58pPJdjEI7aUbDg3XWkSEEH/f4FF/5G5zvHvAnvfbnIZNZTWGCYt
 CksFfPh/YUVgY4puvTcL67PdPkkq8x+lxH2VwRpHua2BH8K6/JIAG+uooSurAWbHLTgI
 p0u9MzmJ8eO0jfypnDpTr4QeBzacs3JR/gDdwavJSZi6aQcVKrIQc/X4f/b95B9bgzy+
 4jlQQSKv3DmBNH94D89UVAWCxaI3zz8kYlsG9tQCSoz6MEUqWtZS+nt/GgQKLxIuigkr
 Vf50xwNJlfOll+ZT7sPrnL5dwCFWIhIerhRIJBnt5h13atyWJzzTK/YOPUveJ8/ZFqQX
 jcUQ==
X-Gm-Message-State: APjAAAVCduag9z3BTiqNMQcGdg+PqpuXLUVAmqWG2/JuSinchrWCtFfm
 tCkPzj1SXlcoXC+VRuuAnmn+Ag==
X-Google-Smtp-Source: APXvYqww5BSzZzo/x/XBRxOD6dQ2QeJpWjyU0lTTUfZ8RlpNitNFN1NvIC/CeZ7zZgHLX/5AzWLHbQ==
X-Received: by 2002:adf:f543:: with SMTP id j3mr2444374wrp.243.1567684890446; 
 Thu, 05 Sep 2019 05:01:30 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 2/8] ASoC: meson: add reset binding
Date: Thu,  5 Sep 2019 14:01:14 +0200
Message-Id: <20190905120120.31752-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050132_418357_7F29997F 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a audio subsystem, which is a derivative of the axg subsystem,
provides a dedicated reset line for each of the audio components.

The axg did not provide that and it is unclear if/when these reset are
required. The reset already helped solve a channel mapping issue on the
tdm formatter devices. Let's add the reset binding for the other
components, so we can describe this in DT. We'll use it later on
in the driver when/if needed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt | 5 ++++-
 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt  | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifin.txt        | 3 +++
 .../devicetree/bindings/sound/amlogic,axg-spdifout.txt       | 3 +++
 .../devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt      | 2 ++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
index 4b17073c8f8c..3080979350a0 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
@@ -12,7 +12,10 @@ Required properties:
 - interrupts: interrupt specifier for the fifo.
 - clocks: phandle to the fifo peripheral clock provided by the audio
 	  clock controller.
-- resets: phandle to memory ARB line provided by the arb reset controller.
+- resets: list of reset phandle, one for each entry reset-names.
+- reset-names: should contain the following:
+  * "arb" : memory ARB line (required)
+  * "rst" : dedicated device reset line (optional)
 - #sound-dai-cells: must be 0.
 
 Example of FRDDR A on the A113 SoC:
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
index b3f097976e6b..716878107a24 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
@@ -13,6 +13,9 @@ Required properties:
   * "sysclk" : dsp system clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the pdm input.
+
 Example of PDM on the A113 SoC:
 
 pdm: audio-controller@ff632000 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
index 62e5bca71664..df92a4ecf288 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -11,6 +11,9 @@ Required properties:
   * "refclk" : spdif input reference clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif input.
+
 Example on the A113 SoC:
 
 spdifin: audio-controller@400 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
index d38aa35ec630..28381dd1f633 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
@@ -10,6 +10,9 @@ Required properties:
   * "mclk" : master clock
 - #sound-dai-cells: must be 0.
 
+Optional property:
+- resets: phandle to the dedicated reset line of the spdif output.
+
 Example on the A113 SoC:
 
 spdifout: audio-controller@480 {
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
index 173a95045540..4e8cd7eb7cec 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
@@ -6,6 +6,7 @@ Required properties:
 - reg: physical base address of the controller and length of memory
        mapped region.
 - #sound-dai-cells: should be 1.
+- resets: phandle to the dedicated reset line of the hdmitx glue.
 
 Example on the S905X2 SoC:
 
@@ -13,6 +14,7 @@ tohdmitx: audio-controller@744 {
 	compatible = "amlogic,g12a-tohdmitx";
 	reg = <0x0 0x744 0x0 0x4>;
 	#sound-dai-cells = <1>;
+	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
 };
 
 Example of an 'amlogic,axg-sound-card':
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
