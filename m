Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE3CD1284
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2024 17:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ni0Eo0RQXV6LtI9QLoL6VbihXYvHcTeH5iAuyw79c0E=; b=TNjK8/28vjP6lu
	LZs2xP7sfqc/uVPyrFulguZoL0wolqRj/aJhoTfpohYCI7qOR53fzExR9LLwpZYXCanv53FxqtWAX
	2YKj4zQEOWtqH5gv3YrCaMshMkLuhIwG6GkTfslj7YDSgKtcSurewm3iLkP4rrOfoiteQQ+XUGFy3
	KOR6wrSaXrGJ5n5j7ruzH7dBYxWtsXkdZTWehD5KVAUdRO1555iT9ixyK+hVQPZOMd0QnzSYwdpQb
	Ik0NJmKK1FvaiTZCYYOTeTd9vnnKNmTD0dbG+eSFAbGMQlzeWEb8v901TM3OQ0O00qTEw6/FhtXt2
	1NV63eUtzB7Efiwqxg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqz0j-00000005zpC-2XdT;
	Sun, 31 Mar 2024 17:30:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqy0x-00000005iff-0GDq;
	Sun, 31 Mar 2024 16:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:List-Unsubscribe:List-Subscribe:List-Id:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description; bh=rZwAhSZubu/1cmpdTVljvVx0jvWScjKt2fJdmwsJfGk=; b=rbzAE
	GvnwUU7YuYtTApwGIywoHyuYWlEtLmD3qZ4wpNYPfRwTBGDWa7EL+rOujp7zVwIpLWiC3707ejw7d
	IcGBsuvgxZpdOa1K+wYtRG870TeIvxk8iwuvg0IoxzkNrHyu/16x50g6MR/mhBC1YjnkeSsOvbP7N
	/fLp6S/59mr+3O98BoV2LW8xTCxU2vpzv9jgkVhII5FkpejgBjhHsQJhycXcoOa/dNDeuLF1GQ6Sb
	9qEaBpQM28tbBCB1HH9QydZGV8VkIZTnjnimh2pFEJM4iFg+whNWVEOkSDOw7LzXIuLV+t3ifQ0Wt
	uYYaRAfnbgBbCmaLMI31xS7PKUpbA==;
Received: from a.mx.secunet.com ([62.96.220.36])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqy0s-0000000G5JG-2Tdz;
	Sun, 31 Mar 2024 16:26:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 94A812084C;
	Sun, 31 Mar 2024 18:26:26 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SB6QFcRslPqE; Sun, 31 Mar 2024 18:26:25 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 1776F208B2;
	Sun, 31 Mar 2024 18:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 1776F208B2
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id 0A74B80004A;
	Sun, 31 Mar 2024 18:26:25 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:26:24 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:23:28 +0000
X-sender: <linux-kernel+bounces-125417-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com>
 ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9ye
	TogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoA+JDp8x1Q3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAGIACgAPAAAAi4oAAAUABAAUIAEAAAAcAAAAc3RlZmZlbi5rbGFzc2VydEBzZWN1bmV0LmNvbQUABgACAAEFACkAAgABDwAJAAAAQ0lBdWRpdGVkAgABBQACAAcAAQAAAAUAAwAHAAAAAAAFAAUAAgABBQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-DRESDEN-01
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 15274
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=139.178.88.99; helo=sv.mirrors.kernel.org; envelope-from=linux-kernel+bounces-125417-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com E2FA1200BB
Authentication-Results: b.mx.secunet.com;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Q+fBWFju"
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Q+fBWFju"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711745959; cv=none; b=Z4d2PUulpZsr0m1a/2swz8hYgXCd+vadlDWiRq9w8uEBZJv+KRBbbUl4iI3dhqzstvHq/tUJlZXmI7noq6zUxZBRnuF0cbX3s4XrEU2qaEGQT3Zvm6xVInn7flJBX5oMeRHJpFaUtqQqR0Oxo7CyO5Xmw0p48sR/bbRu0GJL32s=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711745959; c=relaxed/simple;
	bh=3wLzIvFJXMplW/KAkVYcSz1vGr/nC6U7PB+cPZLmK4g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p0HMqbQFA7uhsR0Ope5kNuYaeBMv/78AMrc3um2XC+v34dr/86WGFQMEwbgYumTG13DTDzhxFMa/Hwkksalee6P1m/M+jRGtSjKaAj/fYt2hbyQjw5KWUpDBoa80yUUc/nOQCQrRpVMowRomjPACb9fWNC5BCLrDbZulqc+5qBY=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Q+fBWFju; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 58DED100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711745954;
	bh=rZwAhSZubu/1cmpdTVljvVx0jvWScjKt2fJdmwsJfGk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Q+fBWFjux20rxIt5dNutzyO485NqjnrfdT7bYuXIuFPbqVjZbY4eRhM2uoasfMCCH
	 L7SG6djQVrpb7jSTe4GGCFVIbAtkT45dabq2DfxrN1UyXjBZ3N1qGiS3b07+jK+mzC
	 Z6FzyLSfy6URE5aQuwSzqb0n2lw8z31N76ucsg+a805pzZGzBQrh1beLc1Qe4HXPSB
	 l9+cBYWI2BDE486CGgJSIHXLVr7xgjMziKv7TsLfK4+3tXMRMIKxchg9LmihfDOt53
	 yN0SM/AHYacaKJcd9sR5oMlc+zSpewY0TSylVgXUXMDw5QOdU3xK3USTCrK4wTprER
	 AJhbOuq79rfZQ==
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <kernel@salutedevices.com>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Dmitry Rokosov
	<ddrokosov@salutedevices.com>
Subject: [PATCH v1 1/6] dt-bindings: clock: meson: a1: pll: introduce new syspll bindings
Date: Fri, 29 Mar 2024 23:58:41 +0300
Message-ID: <20240329205904.25002-2-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329205904.25002-1-ddrokosov@salutedevices.com>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184500 [Mar 29 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/29 16:52:00 #24511844
X-KSMG-AntiVirus-Status: Clean, skipped
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_172630_699606_9D063EAE 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

The 'syspll' PLL is a general-purpose PLL designed specifically for the
CPU clock. It is capable of producing output frequencies within the
range of 768MHz to 1536MHz.

Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
---
 .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
index a59b188a8bf5..fbba57031278 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
@@ -26,11 +26,13 @@ properties:
     items:
       - description: input fixpll_in
       - description: input hifipll_in
+      - description: input syspll_in
 
   clock-names:
     items:
       - const: fixpll_in
       - const: hifipll_in
+      - const: syspll_in
 
 required:
   - compatible
@@ -53,7 +55,8 @@ examples:
             reg = <0 0x7c80 0 0x18c>;
             #clock-cells = <1>;
             clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
-                     <&clkc_periphs CLKID_HIFIPLL_IN>;
-            clock-names = "fixpll_in", "hifipll_in";
+                     <&clkc_periphs CLKID_HIFIPLL_IN>,
+                     <&clkc_periphs CLKID_SYSPLL_IN>;
+            clock-names = "fixpll_in", "hifipll_in", "syspll_in";
         };
     };
diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
index 2b660c0f2c9f..a702d610589c 100644
--- a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
+++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
@@ -21,5 +21,7 @@
 #define CLKID_FCLK_DIV5		8
 #define CLKID_FCLK_DIV7		9
 #define CLKID_HIFI_PLL		10
+#define CLKID_SYS_PLL		11
+#define CLKID_SYS_PLL_DIV16	12
 
 #endif /* __A1_PLL_CLKC_H */
-- 
2.43.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
