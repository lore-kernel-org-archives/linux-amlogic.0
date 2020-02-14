Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB7BC2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDF720873
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 08:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQm/IUz4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhpUMtp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDF720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAND0uTLOU/d+RQJfjESFdY1yd/SNLJQMYoSjpCUpzE=; b=mQm/IUz4hnJwcd
	vQQwI9/a4eAjVWDjxCMlPKsqOFH/iq82ZUJtcJOkH2/EdLq9SlDWr3bYrjh5GPwFQYFewDU6UA6jX
	JzB5o5yRR+6gZ+Y4M/YEYSzpKeupFsCt4a4ISvV9Q0SJHQnX0JoMXx/pBDMZheoENHPLAXVEIJgOE
	GcrBLPP2WtPpZJcPCVwEDWlyPoDZa0M9V2zhKwFAFpW5f2gq2Tgh315MazZI0KqFFfnEYQHFaG0ef
	AU7IvpOufBJrwCY1JWOy0nTyY8wDgF5+L465Dz95Fs/6Sre8sDYTsbv1FFqHsgELOfbMMKzO5QUsx
	2UgY+vHiLH9Jbvz1/Xdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Wng-0004LY-R0; Fri, 14 Feb 2020 08:58:16 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Wnd-0004Ia-VA
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 08:58:15 +0000
Received: by mail-wr1-x443.google.com with SMTP id z3so10002073wru.3
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 00:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Irc90DN0i25mcUWnLAY9jN+3gV3ff2V6EdTyREmtBhE=;
 b=MhpUMtp2apgY8D8kmzQUyar86n+3R9c9/kRmQDn3d0qgrykpbmz0su5D/DkMPPYOf5
 fQ4dYJ6eb1+0zv7soSO8uK1W5jW3PMrM8YqDT3j/hxZEdc+48Fa706AjpEAqQYpHk00I
 IIQ1RPK34q5OAIGa6Q0DLneHjD+3MDAsZpJGNp35CdUZh4/I4Erk7j31lWYkAqldxyOu
 nAeNR8F5gdu3Pgjf0xTkgdxhVnoBdPrfflET7Zf659LQt/SvnwxG4mlSydozeNxHR8w7
 62jWOrod9gOq/82kEJ7hRL1LkMUJcZ8vdmpNZmwZIa3OMeLTMsIK2rRoxOehN1rzWX06
 Y7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Irc90DN0i25mcUWnLAY9jN+3gV3ff2V6EdTyREmtBhE=;
 b=FQ90WmDa/y2UnPvJ+G6tOnsOTRGZoL8860l/+OUzXSGQKaFFAhDJovb3I3XaMr+4xH
 4DsTzQHe/tD6ExIQQctyAbgK5XPgIcVfKMmcMjB+Q7u1PkGr6Ylrje+vNj+Kzw/piBxE
 5q2xhVfD8/bSnXDu7U2xZM4/heiXfnYuWfHR+sM763U6uhfHoBfsAvs9itWkgU0TUMh3
 ZOl8boJ9mFfkRBeRuNOq5tfjoWOm4ZQXGRQfIUsrm4LtxvFC5Pj5jr8lK/C1AuePy41O
 85+WF8NKogiVQw2Ot09ISF30hKiZBPW4O5ydrdlmEyDy7eVJ52yMEeFAkxUTf8k4EN3F
 hAww==
X-Gm-Message-State: APjAAAVGFTKq9QfndEU0d+DHySLf63HVHPnIzSoEx2Oove/bRc1Dh4Fy
 UwKf0dfo/llYMIGYiLUHZojzYG6l
X-Google-Smtp-Source: APXvYqxCKt3cCV/56HGkS2Sfu0F9XYisTXgYw9P466q6HqRPWnVlZJZH976Oc0JLl6CqaWPZWyz3Ng==
X-Received: by 2002:adf:9427:: with SMTP id 36mr2978504wrq.166.1581670692639; 
 Fri, 14 Feb 2020 00:58:12 -0800 (PST)
Received: from localhost ([37.237.208.38])
 by smtp.gmail.com with ESMTPSA id n8sm6004306wrx.42.2020.02.14.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:58:12 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: linux-media@vger.kernel.org, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: media: add new kii pro key map
Date: Fri, 14 Feb 2020 11:58:01 +0300
Message-Id: <20200214085802.28742-3-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
References: <20200214085802.28742-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_005814_011014_356CD4BE 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new entry for rc-videostrong-kii-pro in linux,rc-map-name

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/media/rc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
index a64ee038d235..b27c9385d490 100644
--- a/Documentation/devicetree/bindings/media/rc.yaml
+++ b/Documentation/devicetree/bindings/media/rc.yaml
@@ -143,6 +143,7 @@ properties:
           - rc-videomate-k100
           - rc-videomate-s350
           - rc-videomate-tv-pvr
+          - rc-videostrong-kii-pro
           - rc-wetek-hub
           - rc-wetek-play2
           - rc-winfast
--
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
