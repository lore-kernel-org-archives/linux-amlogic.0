Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72149C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 425D62084B
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNMRS7Rd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1PZNLNkc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 425D62084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwV1bq7ieMkdMsrq57hziUBYcFAML31I5oNk+vs+VCE=; b=FNMRS7RdLgO8OW
	ZJdxQoMTRrBtkY5+Es7+lA86j8hr/LyeXobXkfza+A4bMVdoKPUs+yrsavdllN+q2iItaRlfCHQMw
	EPcNwhWp6kTIkonxdes5PLVLVzGCBQdm00ZMnt6aN0TavVn4U4hewaUzcsvyangD3ednXxmRV5VyO
	eWJ6900RbmWi6L3rXs0TLKSlMunYa5/xrm9QAjZZJXJeoAzpYOGxZrFrJmslWuJAGbmUU4/HCcB+B
	cR9gXzDC3QP4btxQd/cF3scngHqFlwL3KFAShXYjaxBl9RuIjrmvfWMwADA7aSrdrK3h1Q2n2k2TO
	I2ES/Ev80Dn1bQckCJRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsBH-0000Ru-Eo; Mon, 01 Apr 2019 08:20:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsAm-0007Gk-KR
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:20:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id z11so9399022wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LP1GDjllfpczPTet5xNq5bDA1vK9bUccs+ExPgY6qfw=;
 b=1PZNLNkckfq8xTd+uNEY6gpitC2ZtLcwvqHy5dzgaRExsDLdJUAq/Op6HUAjFPwhO8
 RD1dLIFyatxH9znQGQCpUOqBlZAtZB9nYTjKK1h4MoPAsqD/VYenfiseRK6UUabZmahY
 ypfxqVWexc0QxSF5LZ1XWYq7UO2vZFGn0/ooyAXTlSSW05wiHcNk+dpNyNk8BQ1IWxXJ
 kV702bYXTST2nmnl+EaM/VLUqWMHWQjv1rxURPQ2I+CDYUUFtpmcZL7XiwgjWHEzot9g
 a67OSn/5bNmfO398OZ6tjaEOMrYpR0v2eOvW+51mrYCzHYUJSUm8MPY9krzwfNOc6e14
 8JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LP1GDjllfpczPTet5xNq5bDA1vK9bUccs+ExPgY6qfw=;
 b=cRsXEmIMOfMh+0O7Nl1H5mqAI21Zc3CvaMA3HvPcLmxIobFU6oUrpgvw8Ccv+lMXoW
 DNGahz0YSl4sl1mQsaguyBZZXZA16w0Hr+4kmEeL6ekZIZ//M9EwcnTNkl9NNKVmKOAX
 wsiwYcfvqEJPor22BenHekFHkGqYsxmuR8q/iUlfTlSXsbx9fCqJIqBlc9VFjb5h9Npd
 pdRBHA+dGpfd8Yg9ibJgRMx5BwwwitYbacJZHH+Nc1OjS4Xoy9I844LKopko/xG9hgx7
 qcMV5pmvOHyIqN6vFCyn+huosjoDpKXh5eP36jcz0Xs/WsuecHTQd7ws4XqVRzdUkcoA
 D1Ig==
X-Gm-Message-State: APjAAAWgIi917jOE+ryNW7Ud0Pa4ZWNGu3p9zCp27RgXG693FN7xuzO8
 pmxLL9IVfojMzdRLZPDt+grtNA==
X-Google-Smtp-Source: APXvYqyjhMOXxDcnRSPa1BeNDjB/ZTcWElG0lMOA/TJpy/8yYNCDEEfa6GeMHcL3EmnfaGltyVFx1g==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr11730949wmc.68.1554106803091; 
 Mon, 01 Apr 2019 01:20:03 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id r196sm10053534wmf.22.2019.04.01.01.20.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Apr 2019 01:20:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
Date: Mon,  1 Apr 2019 10:19:57 +0200
Message-Id: <20190401081959.16474-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401081959.16474-1-narmstrong@baylibre.com>
References: <20190401081959.16474-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_012005_354240_08AE5407 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
the other one is AO-CEC-A described by the current bindings.

The register interface is very close but the internal architecture
is totally different.

The other difference is the clock source, the AO-CEC-B takes the
"oscin", the Always-On Oscillator clock, as input and embeds a
dual-divider clock divider to provide the precise 32768Hz base
clock for CEC communication.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/media/meson-ao-cec.txt      | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index 8671bdb08080..c67fc41d4aa2 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
 to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
-  - compatible : value should be following
+  - compatible : value should be following depending on the SoC :
+	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
 	"amlogic,meson-gx-ao-cec"
+	For G12A (AO_CEC_B module) :
+	"amlogic,meson-g12a-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
 
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding: must contain "core",
-		  corresponding to entry in the clocks property.
+  - clock-names : from common clock binding, must contain :
+		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		- "core"
+		For G12A (AO_CEC_B module) :
+		- "oscin"
+		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
 
 Example:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
