Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9639EC25B76
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hqOGuBrJFHkGkeH/sCCyfl5e9jBh6EvQsgI3CdMKqiA=; b=a6/kA3cfEwo0Z6
	9T05FdfI9/y4l0nE5L9252H9yqTMWrXPZufdeu9UiCPntgFrwvM3J5ZELLOqviB4sMpz0JHjyBFiS
	JA48fhfs6WGALgLcl8Q9S/Z8DVxdnV35RIjqWU/I0Tc6FmETO10pk6svrUjBMHbvf20DZhoEuaqO+
	/auRFGw/TR5UpzdS5jxlrD/ot0cV3qE22ZOp07D6tQcvCXmF8WFNcCZV+N4HJFw5GXs20bfjiX+xp
	rzWzRDQBXdsfviptUxfO90DtXqISUU+mGL+wwNm/Ev2AttDY7xjIEsn8spJOHn0ER5dpLs6ZfHNNw
	bBEBgAAS/lZgW0ZqSdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn2m-00000005QlO-1W2I;
	Wed, 05 Jun 2024 09:34:56 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEn2i-00000005Qiu-2GAO
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Jun 2024 09:34:54 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2eacd7e7ad7so1882381fa.3
        for <linux-amlogic@lists.infradead.org>; Wed, 05 Jun 2024 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717580088; x=1718184888; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcCIMAk/UPmF2QOWtKC+NjAHfooYSjfuFRNn5zlzBig=;
        b=FPD4Kr+tGSHIyWh+RVcVZ20V/njdNtcOdqWfxpxDWV98laahtQpmeOZUUyT8IelXEq
         wCGv9qO4oX4Qj3VS9AqW7Wl8HcjYTTRtv/EHwOUaIXmYw0TVw0AlUG0S4X2AAUXhSEhS
         UxAw4KXyNp9DziuHIneAZG3aH+MOqUcxonMZbcOtd6Mn6uMKymY88ZjinGhqZcP7ep+O
         d4O26Iyy6jX8tAX4pwvi1bpS8pyyIKA691IsoMHwrDvpg0fObhLTtJqj/a7lmyBhOuMo
         dLuWiUnqeXLHWd08Q3nSULtouZuTDAN35TRU3jE6+Gt0n7FwjPjmoAQFC06BhTfELnDB
         zI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717580088; x=1718184888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcCIMAk/UPmF2QOWtKC+NjAHfooYSjfuFRNn5zlzBig=;
        b=DY51QJomqKJsY2GJk+WY4ZZnQrs3zlv7r/InrAy2A7ASECSWAIlTsp3wPIW5kVwl4a
         SwCmyMVFHt9gFPPG/Cvov8zmgzVxE1Yf4RHvWABAuXe7XyZThc4ypXlfLFxrMmPYJ7u/
         Y57l/9Rqc4Ps+MkunIrjYNWIjrmcO5spvo3MY45EdFBGctvcifo44oKB30pKYh9TFkK0
         a4pmW0iavJpvfXDOL4UebTlJJtttwY3dbvxvYZ8TcCZ7vriandOJxwUCp8Rw0vkNaIbM
         RLcnEx2lyhU/kZmhEZz+fmw4Sno13gSK2UiDcLfXI98Ot/W56zSF1J3uz5UMkBIfYnRq
         eW8g==
X-Forwarded-Encrypted: i=1; AJvYcCUdrZlMUvKsY6UF+/h/0lj9JEbOEzpxgpIxh/8n9UIwQbHxYTC6Wh/rTaURSZJF5oOHfOr5UBcI69Nd10VRwKb0MYTY8w/2akRIvCGHVF1nkDY=
X-Gm-Message-State: AOJu0YxKAnozXQViqzJzYhYRvx/T75GEOElx7hek0pBNVq9eK9nNBQZI
	S5vU0Wk0V9FZdb7U5kgAAY36cVi0TpyQ+8EZPduJniyM+MX3SdeaO5Tm8Z6RB3I=
X-Google-Smtp-Source: AGHT+IFrG+jNVJ8h9d5eB5hGA5iRr6gghB4XBEaPt4CsQhQbvd8pdG/9ny1ye/OC2oDLUbpTZTMJpw==
X-Received: by 2002:a05:651c:19aa:b0:2ea:7d8f:b0a with SMTP id 38308e7fff4ca-2eac776f5d4mr13032741fa.0.1717580088298;
        Wed, 05 Jun 2024 02:34:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062eda6sm13963300f8f.86.2024.06.05.02.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 02:34:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 11:34:46 +0200
Subject: [PATCH] dt-bindings: mmc: meson-gx: add optional power-domains
MIME-Version: 1.0
Message-Id: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org>
X-B4-Tracking: v=1; b=H4sIADUxYGYC/x2M3QrCMAxGX2Xk2kBXZnG+inhR11gDtinN/IGxd
 zd49XHgO2cDpc6kcB426PRmZakG42GA5RFrJuRkDN75yQV3xFUaLxjLU7Ltq+naKRa8cU1cs+K
 dv6TY5EMdk5TIVbEUM+YphdOYPIUZrN46/a8Wv1z3/QfmnwjfiQAAAA==
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xBAm8wTcfqGX3dIxsqtVeoTa9bDUYS6PYfrGXcdiaYQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYDE3gykIcqg7w/K2xquhdS/1vZnPmbjX3Y1R46+s
 F/TOW+qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmAxNwAKCRB33NvayMhJ0d5iEA
 DBCg+egVU6ZccVQoRXOvbCGcVAN8f/NB5weY5GF9MW68KPHZMyE7DWMMG1kK+XQsOrDXR0etcrl0KE
 W0iNASKvlLDMTO5q8F15f9M+hevwA7qRJFlpC7vSLkhAI4FPiHynJnvIveQqZSxjbs8yYLFB335h8F
 HbrgD5ZGSbg+b58zuXf+luckfwxwbqkJvu1Xn/CWakTfFhfwu/epU/ADGbWA9RaoJyP/+JBh+MivVQ
 rY4a9fMB+2jrMBHVi97o90Bw5uSYUR6ZuFdnlkv205aOKB+uHYXIiJ7oyG6PRgvQ873G7tkUy43q2+
 3z42YOFmh5jDLbOYxykW4IARtcavA5RvCRzD9d+pLpls4KYm/al/O+0f+A/7oZ3/4bIxp2q9J47NzE
 6eIilGwm0184FzaVPQ1ym7ILE01R5bUwNS8uiJNdcZ92jeh3o6bAX5fjBeqzISVQ7IFl+lW0eHC1UK
 myOpjfI0q8UisbwMBQTxxNZ8p1Wc744sYZHUXLnYQ1ek518alCCdbX5HdYscFg6JbhyZ1L4dziHqG1
 4tc9RBkoMGAGaj3DiFQiO5jaBxUkWYvsKjWe4ajMTsmePQ88jndkb8Eqgm0jkeKV7zCDi3QuXZfhCD
 HcEr9bs+fBbHzR1QFy0AKK+pojNcr7WpOLBVA0liaLFQ2cYiDUmAq/Oi2mmg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_023452_618444_803D3574 
X-CRM114-Status: UNSURE (   7.76  )
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

On newer SoCs, the MMC controller can require a power-domain to operate,
add it as optional.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
index bc403ae9e5d9..57646575a13f 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx-mmc.yaml
@@ -51,6 +51,9 @@ properties:
       set when controller's internal DMA engine cannot access the DRAM memory,
       like on the G12A dedicated SDIO controller.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-a94d681d2e69

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
