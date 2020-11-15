Return-Path: <SRS0=lFz5=EV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6948EC61DD8
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6D72244C
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2020 18:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0jRgfhZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qpYQKM6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6D72244C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9ty47SpV4cJsUQDkI4ie8H0F/C0aGmsOuVOKUiZ4rY=; b=W0jRgfhZnMPzrfCSvY3FkRPjS
	WXUAKs/XjoayldsBYVE8LuZFotANeU5umq6p010S46BgHXZ8p0AA00M2+2OYGKA6d3wCET2FXhYPF
	xM79utkYHrW1aOxqZRvNzQPjBEP3DLPd3/dn3G6t6l6hZqkZMM+OxuEfiXqKkK+8CqAOSzchzZztd
	HUmffvuZrsT+ANt+ikb34Y/tjRMcVY3PPXHK/ZWen70YnamJlHCDIIHotmmNMYYbmrTKqqY0XvqTX
	10RImK6Kuz4gNA3b1WawasolFdqtPl/z55VqEM6U1gmVr8p6rAI64TPeZpUzw3K7rLxRJS5PGrkeP
	NBBmVp0Gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keN8u-00043V-Nm; Sun, 15 Nov 2020 18:52:52 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keN8m-000401-Dx; Sun, 15 Nov 2020 18:52:45 +0000
Received: by mail-ej1-x644.google.com with SMTP id cw8so21297224ejb.8;
 Sun, 15 Nov 2020 10:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E+18CrNfDdc6Xjlrzu0P7r7p/VFLVBF4d9iMMGcM4qU=;
 b=qpYQKM6MaTg09ytOZkAKsNMsrZ3Qtc1ndV3ioZIhLQrmezuEhIpVYiCj3TskTOc7z9
 4SWnoyUIRksTLrJqex8tVOZY1ojC3CnIYaO8moeO1Sqz8ndphdgffDHgdiULllerTlIM
 5guOynfVSUHYigqGDM5pctfg1eqhsFIPUshY6bngIQpHNh9lb4GBE6RkW2j19s0+m040
 DsgTIBHKB0m/kciFb7fD4HDd1DWahbRPtLxqze3lC3oSGS19cdzEEzsmdEegRKEZbLxx
 Vnf1KTliHLBwmzkCkpR3t+QzpHu+h6pzTpXdljaUvBkEx79pdrzKLntjYn1ap6+4th4r
 8Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+18CrNfDdc6Xjlrzu0P7r7p/VFLVBF4d9iMMGcM4qU=;
 b=dAcLk+/PQvHsldXyJqeo8V1q7qsND3kinUQv/ysQDzk8mwewF/R8HrojfBrVP4TFPQ
 G2Wj/C4ZIOKDgeWl6geCdXBWXG3RpMgr2TxNiHo07lEbKyJAxlHmXrjJEltB5s0OE5zC
 r+t1HTPc+yaUK2wptz1lkOjVirNMs6IwccsLphlC4CwaHozzcxRfUcCF7xX/U8XNMZXL
 PheLBC5bDlp+t0GJX1Q9SXOelus7k0yCs3aKQW4O0/z6DPJqqkijKpoLmKf+pleCqf88
 ftC9jO/14wKMYW8KEAlHa+eKrZjrCnERErQSZEpHVx3ZGTVWeove/+1QoNd5bVKr8E+Q
 +Dtw==
X-Gm-Message-State: AOAM532FoyvB3R13cTCnRC4/qrIFZ9iCrV29FBopaJXwN4K0tKl7bfry
 jO3rLuzqj71vqFca7OQNKBQ=
X-Google-Smtp-Source: ABdhPJyMRtxi/13PoZcT9VMOoxSgXzahBF89j9Fi+8jpVaj8nVR13EInIWvMqwHEwtotej7ruZbGoA==
X-Received: by 2002:a17:906:4a98:: with SMTP id
 x24mr11318257eju.304.1605466363133; 
 Sun, 15 Nov 2020 10:52:43 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119])
 by smtp.googlemail.com with ESMTPSA id i13sm9233520ejv.84.2020.11.15.10.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 10:52:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC v2 1/5] dt-bindings: net: dwmac-meson: use picoseconds for
 the RGMII RX delay
Date: Sun, 15 Nov 2020 19:52:06 +0100
Message-Id: <20201115185210.573739-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201115_135244_486339_0D48EE75 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
delay register which allows picoseconds precision. Deprecate the old
"amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
property.

For older SoCs the only known supported values were 0ns and 2ns. The new
SoCs have 200ps precision and support RGMII RX delays between 0ps and
3000ps.

While here, also update the description of the RX delay to indicate
that:
- with "rgmii" or "rgmii-id" the RX delay should be specified
- with "rgmii-id" or "rgmii-rxid" the RX delay is added by the PHY so
  any configuration on the MAC side is ignored
- with "rmii" the RX delay is not applicable and any configuration is
  ignored

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 61 +++++++++++++++++--
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 6b057b117aa0..62a1e92a645c 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -74,17 +74,68 @@ allOf:
             Any configuration is ignored when the phy-mode is set to "rmii".
 
         amlogic,rx-delay-ns:
+          deprecated: true
           enum:
             - 0
             - 2
           default: 0
+          description:
+            The internal RGMII RX clock delay in nanoseconds. Deprecated, use
+            amlogic,rgmii-rx-delay-ps instead.
+
+        amlogic,rgmii-rx-delay-ps:
+          default: 0
           description:
             The internal RGMII RX clock delay (provided by this IP block) in
-            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
-            should be explicitly configured. When the phy-mode is set to
-            either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
-            provided by the PHY. Any configuration is ignored when the
-            phy-mode is set to "rmii".
+            picoseconds. When phy-mode is set to "rgmii" or "rgmii-id" then
+            the RX delay should be explicitly configured. When the phy-mode
+            is set to either "rgmii-id" or "rgmii-rxid" the RX clock delay
+            is already provided by the PHY so any configuration here is
+            ignored. Also any configuration is ignored when the phy-mode is
+            set to "rmii".
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+    then:
+      properties:
+        amlogic,rgmii-rx-delay-ps:
+          enum:
+            - 0
+            - 2000
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-g12a-dwmac
+    then:
+      properties:
+        amlogic,rgmii-rx-delay-ps:
+          enum:
+            - 0
+            - 200
+            - 400
+            - 600
+            - 800
+            - 1000
+            - 1200
+            - 1400
+            - 1600
+            - 1800
+            - 2000
+            - 2200
+            - 2400
+            - 2600
+            - 2800
+            - 3000
 
 properties:
   compatible:
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
