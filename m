Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C77C27C52
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hPqIXeEIUApFi8xoDG5NdzvNDSFwbo50R51jdKszAek=; b=wQn/665CEpwQ3b
	QmluBuTkbcdod59McmRD4LsqeH/1NCcOzHdsBkv0Ml25rcSpoAndcuJwy89jkou4bLJ6qgnd7k3TR
	/7FXkGDqLVeKcPA+iQY75erjGBrr+CSXKET9yZSvnWXhRaMP36uwYiOYLUEaxCiJrU/RnteibLuTF
	qWsX3668a23g+7fk7ahx3rglYx2OAQCxqCscmE1RnG1ZjHtdeY0TCBSCZzct2rDMgiboylzRzvIdZ
	l/QO1f42wGIqY+HNvq366gdQ3VfqxRKhFSIozm6ImSFejvXm/0WNHAFGQ95r/JDcY628RVFPO5GbN
	v9cHk6wIeR2Jo/Mg5kfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn4T-00000005RIs-2O1w;
	Wed, 05 Jun 2024 09:36:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn4Q-00000005RH0-0Fua
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:36:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4213485697fso39799235e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580196; x=1718184996; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+Qke+DYIixXi8AtYBTaGh8w9/pQLqnaMQOsYZEWgPo=;
        b=p07iW88qf/WOYo/geyOVOe0SgSNFUR1B3SdVDAVN4QLBJp/3mxtWIsIc+cn07vvLRj
         DIBOeSIcj3eOXqw3eEBxdMJmoDMX15z3T3BR179SHC9leUOhSuI/uCh0RaCukVp1mBaz
         jyaiCUo0DrUP4yvZ2MUEcPfF0YZrMryM0x9j7PPXxwVdB8Iy6lQUa5zUFXAibx2ScRxk
         MKPk60a/nIZv7tTAjtSVk/rKuDORXq2gxXbdAwJUmZe0j/CaIfQS7rwLionMMVRay08p
         6NzA/wKnhCnUn/tXZ238dxh+reb63wUWW5qgpaFUFU7mkHNaI2BrgaxuvreBc8fc6RQ3
         aqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580196; x=1718184996;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+Qke+DYIixXi8AtYBTaGh8w9/pQLqnaMQOsYZEWgPo=;
        b=a2feyL/G6WRpfItghDGUzrbsY97BjOY4N8S1Lw/96U5w4aJ/cv8zG7uyPPRkz+J3+f
         4IWeyFDTIu17mwa62Wku9a5sQ8XfyR+O+TRZVIEAD7i+u9s6SOdEQhfW/IKP591jGryr
         tmM8BAMyoBGaPWy6QUHeo85fnQN+blk8imPxcwoK5dLwerDZVccbrF/G88K0V/G6eqVL
         ObJVaqH6zQ6J1cVjOxGTNfsnXxzR3Kb4IOFyriiv3kfOHv/sDip6wZPpIMjV/x/WTgPG
         c17c7dNvi1tZGSdZN6bJF5zeg4DW83Ma57cCNEo4Fv922P3gr4cKKSGl3+tOC6YRiOId
         omYA==
X-Forwarded-Encrypted: i=1; AJvYcCUfApLRY1RoyOZUiGaLOCqJAcSeld8+BsJjB4KQH9feEEvfFtH3rbq4IayV57rDPr9+S/bOQY1tODQIr/jCHvsfn+AtGw4tuxPNNvWc3dyENC8=
X-Gm-Message-State: AOJu0YynF+7ajZH+xLkaVae3GmqeuLWNhSOdubk3pC54By72dhjtJnGn
	VK5c/H3nLgCL6S9OtQ4bbeygrx8tDQqzNjNWm93meQU3rlVielXNwprhMRsVrLk=
X-Google-Smtp-Source: AGHT+IFnr32emR/PgOzI+akAF0W2xUwd9LLOs+MUm2LqQFB7YUQr4DvWGDXy+MVTyauWrZccpH/Bjg==
X-Received: by 2002:a05:600c:364a:b0:41a:f76f:3362 with SMTP id 5b1f17b1804b1-421562e9219mr15433755e9.21.1717580195873;
        Wed, 05 Jun 2024 02:36:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158149008sm14118775e9.29.2024.06.05.02.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:36:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:36:33 +0200
Subject: [PATCH] dt-bindings: rng: meson: add optional power-domains
MIME-Version: 1.0
Message-Id: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKAxYGYC/x2M0QrCMAwAf2Xk2UAdm0x/RXzo2qwGbFqSTYWxf
 7f4dBwct4ORMhncuh2U3mxcpMn51EF4ekmEHJtD7/rBXdyIa6kc0OdXSY1btVXJZ5xZIksyXPh
 LhrV8SDGW7FkMVRKGyS3jdaDJ9zO0e1X6p21+fxzHD32uuVWJAAAA
To: Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZGNGImwfXQPYzvN7hTLk86VHMRVaS+cOQyr5AuCudSE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDGi7TW+cDne+1GPmNVykLtj9Lh25nQ29KXMDq1M
 wpRlrNuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAxogAKCRB33NvayMhJ0SRIEA
 CM7OJXDmeM01XGdakesCnn7mmmpFjwKAmLXZ9B/Z2Ux+Zj5saW+XREccR+BVXTAJKKFP4z+mVRadie
 WWz1n8ht7hN9/FUbB1Ek9loxGnipr4aYjtv+YTxvOeNUCYNls7vVltlb9oxiapoeNhnUB611OyQMfk
 XRMz/c8SJUIBmRn4RFOGzHxAsxUHTLwokEEQKIKAb2+reEX4lMmCvkSYvDhBS3husXD5Vits3lnu2c
 QRAkIFVEdLUxgVJyWCKB6OrNoBp4xw2P62tnp/jXiexn2vMoR3orMfQB/dyI0ZWQ/aFV6w0cY+OtNp
 oPZlHvTGTsDLWPUYXTvCBt+/yIf8kFv3tfJBkDi+vqguI/2izncscAwdoRaikoxoeTW2v36o2ZoIQi
 7+9+S/E3i0qG7HD+eeTo5lPNcY+X5iebSZrbfy473oPM84qjNJ/14gvRaSGpwPSwpRfwLbvhww5OvL
 vQodjHG/luggNlg2n/p/636eMBcjN2iMddikJ9Z1H5IFGmrJVSIUAmA6JDuU6ioGLWwZd3rM4Jhp8h
 Hhp+CF1/uiIqSEMT4dKMRbN542ROQ8FZhquz1JYlIybV7d2b0w1fAr16XJ9FFWoYtLXO/2nRDb857R
 UqpAAamr1dz15MFeDNChtMGzMoqL4lTRg7FiSX9TQ5jdq+FyFg9TuMQfy8QQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_023638_234547_F9E5F705 
X-CRM114-Status: UNSURE (   6.97  )
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

On newer SoCs, the random number generator can require a power-domain to
operate, add it as optional.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
index afa52af442a7..f03b87e1b01c 100644
--- a/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
@@ -26,6 +26,9 @@ properties:
     items:
       - const: core
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-c80f594e8a2b

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
