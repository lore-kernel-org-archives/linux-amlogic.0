Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8553AC04A6A
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Aug 2023 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFUmdfaySrRqxQlItb1yPvuoIqDeDAxsT1G4bom5Gz0=; b=Vig/Z7yIOQLicZ
	NDbkKaE4HpyIdVp76t43xhyphZ1IxvPtLX91QYgo5O5F2478lbseSv3gs++0M0NlXRJzXmCWL5jR5
	poumqHNt2b38kjtFft28atgEm9QxtmkGaLFGNYrf1RXVsXjmRoQe9F50TaddHoUimbXj4ZXm8aJqh
	GB+DMXl9q50yeMQ28Ctbim9bEgtUuX1ysSUFVEYG73lkX5mIZz/HfqiVwrM8HLjxhlxQvNN94bYPk
	cW1i6w9m5RBcvruKajRfUHel9G+YrMtzShL6md+x7CRMqetJebILuHKw562Gt+g4a6XQrLgaAuLAw
	zRTYH0fUwFpCi+bh1vVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX4P-008BqO-2f;
	Thu, 03 Aug 2023 12:04:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX40-008BDB-0d
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Aug 2023 12:04:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe2bc2701bso8704135e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Aug 2023 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064255; x=1691669055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzxyWkiN1A69x0DIwd458bfxdRtDYOqwDKDZ4Z/ZEik=;
        b=v16lEH/jrSpOks7R1vH12BlvA51meCVBbQ6yubayT4UdQZKd5qJThGLx+Dtj1b/g7k
         CRPnNn/ttasF3lRd1ubsbk7fh/E8Wt1MuBzBq2Le1gtOORpki7VvHbvP8eU3BN63oK5h
         z4oSHkKGZo/4Rn8S8Ghz/qEtWpcdhWT4A8ubOtzvLK8lHFFQv2oUYY4wwQ5I11r1rqVC
         YDAiT6gGie0eXJlNh4oXk1sL+xgCxgF23ZKM+yLOzC7mj5bYLb9QmUqPyyGCQHlAko6E
         CxNfn+Cghj2t0lHA98lV57BE5ArS+4mLD6nJj/2gRzPvB6rtADYNrOJZLWcXjoCx7ZuF
         6Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064255; x=1691669055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzxyWkiN1A69x0DIwd458bfxdRtDYOqwDKDZ4Z/ZEik=;
        b=Nv/uxdkn/Se5YEL5lS0RijcwL8DmMAMRWBubYmzVQwJoBz+P1Vf/PItxdC8pZhOsZN
         MQ6ueKu9muahMIkceXGCvGA/PIdx4tn1g4tBpRT0KthYW4olzGw7z3YqVguzhOZdvVIr
         +RMpAMso/mDDFJ1YflYNKHcO4E0b7eePBc9yzlYBRTVTEJxiuyVMit863ZQ3dLUpAhr9
         578szfrVzOkXVj2Ig9cfuSra0CnJ0wMuiLC0ZxDJa6BvHIlzdeBL1xBADi2jM68pp1pL
         GwJ1N8K6CnaJ0Mr3FNefcvBnSeO+rm06QeqI6utz/J02o1luLJvODEe8jIJCcYv31uh1
         ITDA==
X-Gm-Message-State: ABy/qLZl80w7omrvCfp3jy9aPL7X8+cbO/sD4r2JZKMOBe3LUvaCUal9
	Ei4lqA5dabdQBpwHbqeiUjhjiA==
X-Google-Smtp-Source: APBJJlEeHVbwq4BgHjFhfmZLB/eOSONBSfWKyIIiRns+KyAHIAATyaJhS3mYa8VwHigQDtBgCpFUNg==
X-Received: by 2002:a05:600c:215:b0:3fe:25b3:951d with SMTP id 21-20020a05600c021500b003fe25b3951dmr6981946wmi.5.1691064254853;
        Thu, 03 Aug 2023 05:04:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:04:02 +0200
Subject: [PATCH v7 8/9] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-8-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YvY9e2v6HU2ew76GiDtsEE6jJoqLheVM9jPCKZACTKA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5eyAEtKjhQQaThvEQUtQybzgmuUa8kSA9QIhAf/
 0jQNBASJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsgAKCRB33NvayMhJ0VXpD/
 kBE1z7wxuGCqFxbECgLt8gaolDh8tIO3VpAvvqGF0MM+dsFXnnBhM3VKCKWaj3bezqN9juoXGRE50c
 XHRkosI3uH6geWA79diuFuGjacrXswIDFyscAD80f+gFQkrrKakBCwXMC0FbEX38UPMYd15AZ6vaqo
 atKyND7i+CLsBlzGT2Cf1ttbW1h2j3wxyTSUGQC2ZdMaKFtFjcrd/NgiySODOqRHY/OUjIW7egPQFG
 SDdaBodZgwkRAZOb6lTbk5jzJI6/1XPG2DSw2Mzo0Hq2GghtR6INmBQrYHerzyYDikcMs9cXdlwpOP
 4u/S1gonB3ilX7EpMz7Tb3f0qa5uAac2NVxLqQ672xq4DymdbWXhsbgk24j2fh1/SgbV6fPLYSzLe/
 c3fxU0CzUlRWfGdvFidtoSEvKa32QMi79RIostOvMt6ea620cRsS3dyWpSf+GlpdSE1HSjl2rI5mqG
 x24JKPJZxwOZllHodsZ1/nGoDOkmAG3kzw/sgwSsbAbzP9wq+dMhAOcWJQsMvkaGuv0iNdlYaJG3gs
 E4JEg8AO9HyFmP7d6wZOALQ9m1tqw/s2lln8nWZX5rcu8blTa2AqsjHs6B1V8hW75rW+f1cXJKs0vV
 YarFxYup5en+aYayRFHx7FO4tmjmnPK1rywsvEx6lfPD/zcG4+7KEP+zEL4w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050420_276282_49A931FC 
X-CRM114-Status: UNSURE (   8.47  )
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d59842655c..c237afef5093 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -163,6 +163,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
