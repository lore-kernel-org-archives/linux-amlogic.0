Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333EDC11D20
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE7420679
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wj/BSqQH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MXSn1rgd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE7420679
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibXZhKlTOUv0JNiV0wla83xlF6AL152DbX2bqHwRYTE=; b=Wj/BSqQHKXtEkh
	9BnzuUiBWdFtRvea1O893G2Up8ZsrerttpRDCLDGwX3BdcBFi36mr2rkd2MK1+976IZ3dP+NANYnI
	ohjCJEtzNlysaGCwHnCefbxQtNLJLo6xCG/ZCb3yipM1QLGVCGm8rosjSFjFROFX6snE/kjkhnk9O
	Wi6IUM+hqBo5/LFsdZWVGEyTXm+8DN4l0XWxT4/sIbFWByMm6SthoE+R/hNRdTmyCudQ4j9GaK3DS
	iC3lNuPjKgOHJxLodj6bov7IRe/LQOCZvqT8QymT4v2AUQUeDnbvuas2pl58MVzWGoNW3CIzFj7tX
	n4+PmdragOn4DVi36P3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4stJ-0003wg-Hz; Thu, 20 Feb 2020 20:57:49 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ssq-0003dP-OI; Thu, 20 Feb 2020 20:57:21 +0000
Received: by mail-wr1-x441.google.com with SMTP id m16so6139315wrx.11;
 Thu, 20 Feb 2020 12:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2f3uV3RWKbMqCO2QFYzkPoEF8LM6TNVDI/Gi9TBUfHI=;
 b=MXSn1rgdt7P3tH8KZP0tFbRW6901b2HrvP3o9gUFzYQW2YGGn1fvKWV5NbQR8QnUEm
 VVPdxU2ZVBFz09WF9nLh6Th61kWM5IYt2PHvpZ5fMlsHe/S4YDfA6kqHtd6/bzu3Vctd
 gzuBSqpJ865xupjulzXrZpNZs2zBp6Sqbey6Yp7xpAaCm9ojA3Y3OBWgDOVD1pYeL9hi
 RiQQYprFLTNE0iABe1B0lPQOJWgYGIyYrFrBQy6rH9OSpUKysGYV2sC3AEo7pVGr0q7g
 +1d/YnfZyo9if35mQTuIQqcesG72SynQdXGtogTKJuXOSrLvOxVNtZr3BG6YaVnJgxUA
 5L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2f3uV3RWKbMqCO2QFYzkPoEF8LM6TNVDI/Gi9TBUfHI=;
 b=Fk9eqfKns1Smz16RvEKfxpIkpKKpPifMkyWD2KhX+mXZyn1f4kgShUmG/Fq9D2UQqh
 PreRMZqn7bfHh5yMxSraIRUGQJrO+gOt9p/ivb+TstTaAtHLVbptks3tpDLhasGmAqx9
 o3n3UCTvzcwOr6kJlJz+CRWBC+iRIYkT2c+n8vPWuRV47533U8+3Y8ZpYZ0VpKsIb2e3
 7Vo8WXZc4n59xU1jeyeNf1fXZH1Fm7VXC/On05Bq94L+UB8QhpvwLMU8NTC15eiKqmg+
 ZjJHwMJsSHVNGF5Gl/7Znm5cJJCMW1zY2fAtckbjHFm6JiaAIlH5Z9f1jArVYFDYRB8h
 Qx9A==
X-Gm-Message-State: APjAAAUDjskbsW5yZZPntzcu72mzDKZ3nYAmpVs4yeNJC0LD8ZGj6s2w
 Y66M9yUuZgjIPXRXiI2NURk=
X-Google-Smtp-Source: APXvYqxE6O1xRP/s3Eex8+uTAabiof5+67V1QlISYwfPiFGVMeLM+jOyIb3TGVjHrpRx4Ny1OfKZJQ==
X-Received: by 2002:adf:f787:: with SMTP id q7mr44114421wrp.297.1582232239167; 
 Thu, 20 Feb 2020 12:57:19 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a184sm695039wmf.29.2020.02.20.12.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:57:18 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, broonie@kernel.org, robh+dt@kernel.org,
 mark.rutland@arm.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 1/3] ASoC: meson: aiu: Document Meson8 and Meson8b support in
 the dt-bindings
Date: Thu, 20 Feb 2020 21:57:09 +0100
Message-Id: <20200220205711.77953-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
References: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_125720_788362_D763629B 
X-CRM114-Status: GOOD (  10.07  )
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
Cc: lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, perex@perex.cz,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The AIU audio output controller on the Meson8 and Meson8b SoC families
is compatible with the one found in the GXBB family. Document the
compatible string for these two older SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/sound/amlogic,aiu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
index 3ef7632dcb59..a61bccf915d8 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,aiu.yaml
@@ -21,6 +21,8 @@ properties:
       - enum:
         - amlogic,aiu-gxbb
         - amlogic,aiu-gxl
+        - amlogic,aiu-meson8
+        - amlogic,aiu-meson8b
       - const:
           amlogic,aiu
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
