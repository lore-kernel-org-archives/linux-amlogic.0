Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91272C27C78
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCUYtqz8PScNoZETEGPS0Y5ULbvWMVRYxgE/6TnZKcc=; b=d7RbUJvc3bXu7K
	/Z6D7rvAkid01rIaWF91VwQMsDm0fa2trY+6n8nKZEVOqD6mhbheHXWP5jwcioickvKOmBDs1XTHs
	ZpQ9yLF9uBBMZzPWrVFJ6yQIZMzN1ljD/FAYhu8ml14FFLgt2IamR/VtfMn5ypKXCv+/g6Ij/PuM0
	3unSfsfWhLCC+ohVLm2BEvcGwN9rH/ZlQOkXEwSVXzxwRJTpwykRPhUo7LclcHA2mrwWbWlw4GRhI
	cYgV4zk7IQuAl2fnB5hyTf4aD2b4m7KIc1x+YN3q4uuPLCS2epxCkKQRQBqtl3FrMexGC/xKSwV9i
	e9USbUEohjstUTNuaLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL19O-0000000CBhf-3afe;
	Sat, 22 Jun 2024 13:51:30 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL19I-0000000CBg8-3toh;
	Sat, 22 Jun 2024 13:51:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57d1679ee6eso5414712a12.1;
        Sat, 22 Jun 2024 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719064282; x=1719669082; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7m/4TgcK/46+XohDU829/0NUNXJCTGCTV5XM9hCUlVI=;
        b=m7S7ZgAm4Rx1EJ7gppNJlB7vwTb96sqJJ7gWIE3SLpiwTtRcd487Rnj9bZ1K0ei0c8
         2DlQbiOuxo0zoWqOb9YVVzoW6m3uV9jReDqii84kgtK+OW54h2bksB83tY2KqWMnAO2+
         6DCAJ7sUL0DeiXJBn8c8dazWRtEGnH6xRp0v5Yg4nZLGEnRFvppJrQ8IZtVvGJObwbHn
         E8BAJ7JMKi/Ppg52wZIVK/f59Lek/mGGFc9WEeXBUyPMmtVc+KM1Y7kbIIMwbur/qm2x
         7LArhjbaqwE/HUsWeF5cGtIEXS81vcov08gFnHrLGIxS4DBdb2NOO13YI0LlJJq+z55i
         N9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064282; x=1719669082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7m/4TgcK/46+XohDU829/0NUNXJCTGCTV5XM9hCUlVI=;
        b=lh6/tyNdUhJ9E3Sd0Yons9w9p+qwlTYSnMaqKv66uMeEme6bU+ShENDl8DSYGat44w
         EUFVkDD6YneFYmRANQVubL2bGKg4VKCtSahx/wjxBT829FXj27vqigbUS/LwmWZUDCCS
         C1o6pS2miUD9xOu9XmXulEcdDPNeUPv43vG+sxVlkHJTUrRbUfZ81kw8cxQm29T8ucff
         170jvFPkFGrtwongVqKBzWRvFWyPVA8KZUQKGfMNZKvT7a4JYY/7ISmYwABMhjLavbYS
         /YGZ/G8iO74a0H2+Q/UZtWWappfIuf5omlM5LyDmnZYv5ih2+pqWSF2ktWa3Rnu9KX+F
         RO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrpzW3s5MYi8Jq0HcORCkzTznP39cJQHp0/ovo4MUu3k5MrlOdOcxwuwTJ+5hI6NW/aSrKXF+11AAO5SLKlDGm+Rz6kEhE3d+r4T8OIWhTyVNxintAq2Gr2sxXkiDlFKQlfAZqALcqL4L3OCHpS2QXTSD9bRGL+A==
X-Gm-Message-State: AOJu0YxnDzxmtAzZmR14N/5g+Nk8kmBVwnx8s1kfRoSC7sy93sWo5+2+
	IAywnNUawVjF8U7nkC6o2RPxcfC0CxpsN50jdr3i+NV7k9YaSseo
X-Google-Smtp-Source: AGHT+IGl8/QbmuwmI7VAEScIvWWlg3EjsJaT9RlaUARyv+fkqsaP/e2hjjAPn6yVnGn46bqlGpDVOg==
X-Received: by 2002:a17:907:c30a:b0:a6f:4b45:ff6c with SMTP id a640c23a62f3a-a702760c68dmr109293266b.19.1719064282324;
        Sat, 22 Jun 2024 06:51:22 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf428bc0sm199398866b.8.2024.06.22.06.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 06:51:21 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add OSMC Vero 4K
Date: Sat, 22 Jun 2024 13:51:16 +0000
Message-Id: <20240622135117.2608890-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_065124_994975_A5B63A8E 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sam Nazarko <email@samnazarko.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the OSMC Vero 4K Linux-based STB

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- No changes

 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 77f8dfa86e6a..9b84a18cf41f 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -91,6 +91,7 @@ properties:
               - libretech,aml-s905x-cc
               - libretech,aml-s905x-cc-v2
               - nexbox,a95x
+              - osmc,vero4k
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
