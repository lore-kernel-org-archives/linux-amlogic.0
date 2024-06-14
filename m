Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF2C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awfHVe9FSH+cZXlfnXfE40feB6H/iu2WjElfgx/j2d8=; b=pFymKQ0aqTs3Cr
	ynJ9Qmw5//luk8VG5wnTtIbcDk4kIIyUJ+RDil6JqTsLR+pUFPJeEwp8tmGp9HvrpLc+xikA17Hq7
	jjJXNUFrQ7V+A5f3xMY5cqXU0OL0lEK4wPpfNJJvCqpRosY2HUtA4e2eaCuuJ9sSecAvau0w9Dnh/
	gxL0uAaIuoLhsqq6Pqn5RKc5nF6eGsEPr0b6sfeOx7xeJNRXsC+HOBXmM6Hg0QXqVvj56OQ9APbuo
	ZvBvzpILoS/WRBL7jipW4JaQKZX9Fa9ylu0WRns1cb1Vwv/zelpKElZOyV9cOIZSjzd2zkzIxwmgD
	DeB8LUiKoCqclrWJ5hLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9ir-00000003OpL-1i11;
	Fri, 14 Jun 2024 16:24:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9ik-00000003OkC-37qU
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 16:24:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-35f188e09a8so1886191f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382249; x=1718987049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqVF7q4lvJozPubshiqMpT2VHbao70PEnYzL/muuYWc=;
        b=KkRotGkWi2gsRHsojPEyo5gjOYRHULfKjBuaW3uXHaUA5Qf3wAy6rMYiZXLyldBRJR
         1nmYlgH+xAH9WPq5cbmRtc3tT6H5dUJns4KOysqma8EagvJsG0AqMq55Zjh/yH9RPcas
         K1aZOjd32WWzgneiKjlYwAXf3eJ1rp6tXL0+Szv82wfN4VYMytT0cYIHx1+Wcdr0sheE
         dv/9EaSK0YtYhqYkkzER9igzEtATY0e90qSN8kgGIONs7uh1pMFHPKUsBFkPFwYCHYgd
         cJkiQLONMgXG0zuEb9xRzdfQreoepe2zMOkrv39lHYzMYtk7n+oxFCen+8GfMPV/PUF3
         o2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382249; x=1718987049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqVF7q4lvJozPubshiqMpT2VHbao70PEnYzL/muuYWc=;
        b=qNaSDkKF9IkjmG07AtFdhGY/G8SnfRKQnlOXQfoOv6RDg52FHdVO/tQS4A1rrPXLwq
         P5lxILAAea6WA6SIJVkqHLDicCj7HqXSLSm78r6ZqZ1XZOxC2ILfN6R3t+6kfpPW1v0g
         SUuI/pdC8uN/XltHYYsLJCu836r5Ij9YcLf2wmLgo0/z24BNVx+4M1hbdY1gdZm+UxMP
         ilHNLKFMlB5CluKeWObsV0gvi/copXJMX+Q4mRgufKQsfl0bkVYo6XtLAN7b6hu7aRtI
         nEZ5u6m1hPgAFrDhYUXWL5sAhomg6WMZytgJaLtbS2dDE/I4fUjOL5eBGJDHRNg3oTJi
         peYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCT9TqNzM4eyLEg9OsEVR022bEQE9DfwFzxm6gHFnIbD7QgrXzFMcQbZiZfBi8wvhgyTddRKjVuezSbYF9QuQ0vJlGPXNdN+myjZv4IvGGEJ4=
X-Gm-Message-State: AOJu0YwidU2FzIGl173RRMU2APHig77JF3psiEjTTxqnJZaoBc3Mry8I
	g1pvQ3pdRWU0V9b6y7Fm5002OrZrULlsq/EB9LKQvwr7A62f0yNtCMV/okl/xGo=
X-Google-Smtp-Source: AGHT+IFYnaf+5rgZ/sPcEHKeTUBhGa2azbnMx/BRcFPt7SXvume6qlcEccJaQcz/vaaoWoci1eBpqQ==
X-Received: by 2002:adf:f60f:0:b0:35f:fa2:3e81 with SMTP id ffacd0b85a97d-3607a788b79mr2258337f8f.63.1718382248812;
        Fri, 14 Jun 2024 09:24:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 14 Jun 2024 18:24:01 +0200
Subject: [PATCH RFC 1/3] ASoC: dt-bindings: amlogic,axg-sound-card:
 document clocks and clock-names
MIME-Version: 1.0
Message-Id: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-1-9f57d9e01834@linaro.org>
References: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
In-Reply-To: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1805;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rLr1JBmyf4h8ZfpUwJNjeawg01+mTkoSSeFi6OYtlE4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lCW1GD+c0W2D0RrxQxor4he3SKfOwZ9JUq1nF
 DUdxVXeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0fruEA
 DFKaDVhm7fVnRtNa7JkVplIkxqGF3hliySL3tbgXY+vz/HCL4fngWPHV976mpGon3TfA5W+EysGlla
 nw5NDStdSWFSTjcHLnOc6ax8XkQNPH0zoXPL93wiC0zhxr122GCvP+1EBeMUpBZmSAMKJKwiuUVASd
 RPWI71tJnoDH8W3SVzNktQ8NiRwKME13v8TTjsdmtgRR+w/vH3ia8MpcZpeQDMknfz8iYTlvhtgRIj
 DIS41nwxGxHdBQaZoomdcnIsJ7Ep79AUurh9Ef0bbEzNixGtNTr+D4pAJp4OvVAwVC5Z+fYKICgUD+
 7bAcLO9uexscPpdyq7swOjyG7JNeshoFZPYrpUuYeFBSYJ+Mh5gftd969ZuopkWTgO0klX1j8GKkTS
 l85hXiWFO78C/oKzGQYQZuYKucBLmCH436zbv7HmOYqml1H9jwYuAGh2w9EMRHdu482t1lNXWy/2QN
 Q1SQ2L0Mq2gsXfDdE2Lcpn3GFPo0i5fU71KbthJSX1pxx/snCDyteRFDNdD5kPjvxgO5I00Gs0v1Ty
 NeUhnY9GKWpW+uZnrc497yhY24lNEyjqW768Ydg1b3IdFP1Dzq/R2hynSXb8CPLYc6dZDpNaaZTjsz
 MrAGh0hnHcLVd7DQ6b7X9fn1zk3ngFzeTY/jx+96G0XVQea3sxULd/8/8W2A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_092410_838964_F0ED571A 
X-CRM114-Status: GOOD (  10.72  )
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

The sound card design is based on 3 reference PLL frequencies that
are the root of all clock rates calculations.

Today, those 3 frequencies are specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
index 5db718e4d0e7..676ff2731b86 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
@@ -26,6 +26,18 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
+  clock-names:
+    items:
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
