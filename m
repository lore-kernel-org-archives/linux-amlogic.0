Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE85CC6B2A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 08:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SS5IiRa+AAzOA128zyUg/2uyp0FvMWhSohXMbdWj2jE=; b=O8ss9W4ndIXBBU
	VtFGx8+NMean+abHM0RtUFfPJ200dPXk9DG23bW/PFHSD9D1qJtjHZzUOLy4L/QbjthUtSmaJF1U3
	uv0plfENk2/MqbjdFN7ZVt2ZV2NM7Lm8t8z9u+cA7Np2izIvbnxPUM6fKKnuaAxYw3P8zy8NVqYQy
	iXmiqMHkmLeXgP03p9WkUNNHAc0yyLCciipNrmh1CJJIy2CbboxDXmAcHSquXtJOhK2Pa+RiK/+9k
	HljnmtlIKaMoymA19/0wD1WSLb08LTL/ajV8zagRq1hyYbXb0vIChLuUgAQMlcKdKoDYpBopLj3x0
	2oaajKMwGkI2mqPi9UOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuEx-0000000Es1j-2gcc;
	Wed, 14 Oct 2026 08:21:35 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuEs-0000000ErzD-0lBR
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 08:21:34 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc7cc8aafe6so1515736a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791966089; x=1792570889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=VJPWNbk/pi14CtSWdduvaEexCh6yqwUM5eGhJVf/veCCoxXu2KysLZFu6lW0ddE38c
         7DNNwpKMWsYSuloeACoyt7hIeQFV5T8JCY3+xpzEnQrEKi6aSDPhgyZZjoYOwZ20EJSu
         pH8qi9hhoilPHQdePUn93LyKenn8dnR1k093o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966089; x=1792570889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yVCZM5zURPRE62cvJS0zNIsVrphYetwj1gaMWhP5efk=;
        b=Vupd/fQrRENm/ddx0wfy53qGgDKyfEGSTYqhX8tvw9Ff0OK97O/7XwK4AJlC5kxFE0
         M+d9pp+QIZJWAUM6p2SBzhOQbNtw5gElom9rDsQCDx92/y1vHtBM8NzmLB+ZpxTeI7lt
         k2ccJ9HRNk3PgUWQUVJhxmZuk4K3lJ35WDgTlwJena2J8q9kPgK/F77aP1L8szF4L+O8
         XxcT3krK0rYjwvmX+s4auHteqxu70BAPFrwRtC85E2UcYY8aJcRheSs2cynBprwyHgIK
         AT6dbGWufX0Kcu5HmXNII7/amu6eJq3lp5XDQmRE3jnu3EHxIYh6w3Pe4Kcj4H+FRsPO
         ru+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/0CXwKYk3kmnSbpyki37p7zzm6YRN4vlfFXQs3EfpDkdJUF84qB66ZuIi9dFSD8eowm2RahRcNEk/zvtg@lists.infradead.org
X-Gm-Message-State: AFq9FYIWkwcvhYRYwVWwkFFfb1vu8xdpzcVK3RiI7wS35K+JtueTe1pS
	TsZrADiBFWIWDC8HMAHtCgJukNOqA2Dj+DOW+FPZYd8B+0gvDMtAm16DZA3BNngI0A==
X-Gm-Gg: AYBFou2zoUV9Jt9/ddmhjqmw0MzT15IT8y+oJpN1rdC3o5bXYy3jqpysfSCRLZnV99S
	hWs3U6mlXYlSUDacvTxmYxZkR72hp97DBUtUt/t8YEBjEDyZNOq6ZJjzfp64Sjw+5aHSTa0v65R
	+3uG4qBfojJpzdN036VuvfC7pPDF5L3+sRs18OGbFgZFe7R1HBn73fhyuL3mNg746cQYxmpfN/a
	duyZRHxEvBcy6zgCLWnny06jSPHgwDW4EpDcl5YVj/jb2km+h/DLITYCNz4SuYnTCnQlxJXvv59
	kMlz6x26c+nqzEkjZLnZYGzM+narjo1Afz47rzKfoVyDR5CtNIG9m4KHyPuyJ0XfM7z/lJQM5P2
	0z+WoRFke51gismzPro1vd4s1ck0NAuJT6UiLprqlZAbSnFX3uHRYLLot8f3TmYVFGK+kATr2Lo
	ERkHQOW/JeH76DTTNYFfAQLiavbRRM989mE1PQB9KePfPf26xb4frsbo1bSviu4IjAQuIMYePyV
	n2KVRJkIuV+lJis5W6qvYZWaFHaVivGV8f9e6W1CGhmIykRzCGYlir82Q==
X-Received: by 2002:a17:90b:2b44:b0:3ac:7842:bd50 with SMTP id 98e67ed59e1d1-3ac7842c19bmr520798a91.15.1791966089278;
        Wed, 14 Oct 2026 01:21:29 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:373a:9eb7:c5ba:7b5c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3682141a91.2.2026.10.14.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:21:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Wei Yang <yangwei1@eswincomputing.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Hang Cao <caohang@eswincomputing.com>,
	Li Jun <jun.li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Roy Luo <royluo@google.com>,
	Yang Xiwen <forbidden405@foxmail.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Xu Yang <xu.yang_2@nxp.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Ze Huang <huang.ze@linux.dev>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
Date: Wed, 14 Oct 2026 16:20:35 +0800
Message-ID: <20261014082037.1774672-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261014082037.1774672-1-wenst@chromium.org>
References: <20261014082037.1774672-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_012131_449506_D37335B8 
X-CRM114-Status: GOOD (  11.18  )
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

Besides hard-wired downstream USB devices, a USB HCD's downstream ports
can also connect to USB connector nodes via OF graph, just like with a
USB hub.

Allow a "ports" child node and describe the possible downstream port
nodes. USB downstream port numbers start at 1.

Also fix up the address portion of hard-wired downstream USB devices to
match.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 45a19d4928af..24df99dfb243 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -29,8 +29,16 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: The downstream facing USB ports
+
+    patternProperties:
+      "^port@[1-9a-f][0-9a-f]?$":
+        $ref: /schemas/graph.yaml#/properties/port
+
 patternProperties:
-  "^.*@[0-9a-f]{1,2}$":
+  "^.*@[1-9a-f][0-9a-f]?$":
     description: The hard wired USB devices
     type: object
     $ref: /schemas/usb/usb-device.yaml
-- 
2.56.0.212.g129ede20d9-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
