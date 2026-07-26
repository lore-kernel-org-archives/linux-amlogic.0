Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C029DC5321C
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyjg/XSvVSJgB5MbLNe7DFUTAGojQTnHGmP7MqaLSno=; b=DqQiuLS7w1rlOb
	hcbFoSS2CU9fQI3/AV5kJWyUgJWZHw3aWEpU/lVylsI12oDo2deIgtnOjRukrLrGwmkN+IClSjB7o
	UcP4X6rD4vLFjaNMRwdnz8bHeLLny3HYttBiwaxV+NrSReskck0B7WJHbcisR4QJkpCtcqtEvl5df
	4f6kuxp0ipRBtgW1VB8juzumd298F9j0iVWJl+Sy0J+QWRSCT1fAan/N4aa3SCJDlBpB+ZbDfBPKn
	UjM7Wrg66YPBwsCU87cUj+BZMUmSVElzTX0cJyJOeyT+ILP5pcXfpJkgwU/109rwcsg/4FUnl+C4/
	xJYUw7U8R1x9rUFMt0pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HV-00000001Zzs-3dRC;
	Sun, 26 Jul 2026 20:17:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5HM-00000001ZvG-1Mv0
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 20:16:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1032982f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 13:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097014; x=1785701814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=WW2B9GpT9mwzhWSLLmmnRdlISkdxB0l/IKCjHNUtenkkE49afgHI4MxI+SR2qSdnKO
         tjZcQOBz/1VAl4Y0q67bxvvYmdksqzeeK6SbIKuXrOwOjFqd4foR9Zl9rikSIvHrid3j
         MptD9djZ7en3lZG/+GW+arcMcvctfMQCPcrvtpxIFZ4YeqdLn+9wpsGRbBzxLB1e/Q02
         mgagg2hKckXLxRLqdMrPPs+PxRTl5IilbwAk0dQLjMH1MhI82CmezEhJYO5XFZIGmbLe
         PaFb46or2vYQjtO2UFR1MrsXCfX9LYEvwTKNTv/vqAsVIIedQ/7JBobo/ajx8+jNpFsk
         f5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097014; x=1785701814;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQxcs/6dLpHKo3+p+eUTF9ZX7c1Jn5ikh2HXlabef7k=;
        b=fatIJFuVw9f5pEIZ8qiTU98McriLwgVqUlIYUK4wCWRIVARXkufB6TZ1yxhlm4B4Mz
         nr6G168cyTpUBQbz3Q1id1hbm1TZYQPp235mv3lnHCzEcIHDw+50gj8iHD01UkrYkn0i
         6JnZXI39kxekje2dFF6YGawcz9emk2ubyQ2tidxeyXa3V6w78h53W6l5S4Bqgunjt1w8
         ZWHJjk26FfyGBtMlmWKUUjpGNvRtSL/+Fz1+PUQYNwFNUaQs3WtVqFJW/i5z/GKc9Vma
         Ik03kr8hCvaobfZLqOqDt9xOW4TQJ01fuOYhMrZIr4gtZyYa9dlS24Fb4dlvZwU1Vr5b
         6UOA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+kOZfSoeEbUGkrH0ikAnrvpVtlc3YIlKseqIgv0YjI7JW0OOvrpvo/dSKiDBC4nOkbjmXHiYAMrX8I5Ea@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkqc6n/zbKKVmdZLqGgkY2B6Ag1dfLSUcfyneR/V/g+f/brSB
	n27HyssqSDFh8wowl6uRMfrv+dr9r3j3tk5iCCjwoxwbY3LmcOl39pgd
X-Gm-Gg: AR+sD13pi5f1NGwtoQfSYS5EH+CJyApEjbMNjf/iSzUqDQYZks9+w40T1hTl9eq2pwr
	RrjjHcKNG18BqIsKNdgR1gzf4qF/s/SPGDJ9HNdkb39Mqot9EfpQ3XjhN00il8tSlhTQZXXKaFF
	jYH0xGZav8BjbsUGakkni/ydZZVN+4uJworv/KBLMXHfwvqL5QTN2qzyDBzFy6rLLIVPvvFJQA9
	aclztKctgJtzr30cfcleRDJkuqullP+Peyo6sqPE3dZmLzMYPH8tedm7K/gr9hGsjuovLUsss7N
	tCk9UM9VCzj/kCubJ2CS/a+PrYPI19/l2QDTczBhUoscifmPJDoRhU5hI/W4nD8FB6uEc3VDCyY
	6m8dWg70qpfXG5wubLWcUW9bJJ4y9ud5lKCAeklEURckzoIEC29KxclXwtiUAFaYOwy1/TtBmvx
	LusQg+xkciTqtwJbS1aV8xMF2hNryiuqnpNCR1lQ==
X-Received: by 2002:a05:6000:22c7:b0:47f:9022:8531 with SMTP id ffacd0b85a97d-47f9fc942afmr7506796f8f.22.1785097014274;
        Sun, 26 Jul 2026 13:16:54 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm43621117f8f.20.2026.07.26.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:16:53 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add Orbbec
Date: Sun, 26 Jul 2026 22:16:45 +0200
Message-ID: <20260726201647.264108-2-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726201647.264108-1-robazzalberto@gmail.com>
References: <20260726201647.264108-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_131656_373072_F8D1A575 
X-CRM114-Status: UNSURE (   7.66  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the "orbbec" vendor prefix for Orbbec Inc., a manufacturer of
3D depth cameras and embedded vision boards. The prefix is needed by
an upcoming board compatible string ("orbbec,zora-p1") introduced by
this series.

Link: https://www.orbbec.com/
Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f36..a42899bd2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: Option NV
   "^oranth,.*":
     description: Shenzhen Oranth Technology Co., Ltd.
+  "^orbbec,.*":
+    description: Orbbec Inc.
   "^ORCL,.*":
     description: Oracle Corporation
   "^orisetech,.*":
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
