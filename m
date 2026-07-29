Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54442C54F55
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2026 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JIaMNtdvwWT4Hqw1T5ZcMt7OctG2MVJspNnmmqxzog=; b=1VeNuEluu0XRaN
	tzn6F5txdzvhhvra6OF+YrOyAwS5ULUz6ID3PYY9GMPEJydwoBof5+XgZ4RQu69sy+fAZ3f1A0tV6
	29FfC/5QsIYAgYp12bwNDHdi5mlCMMrB1gnrBnjztKTz+d3i8jsgmBViHba+wcHMwupGKd/cyZDTW
	Q8Shc157RuJ/5hOW1xNp2T5G09uFQiFn8f1tXv8mUnlmRfqEE70DbCIoJNQfhEFNE3Teq72CZSy23
	XppDjsz+Rlisl4f6BYfNoMAkJjWmo7DPd+6unySKqAoLnVOU4/daTCLNCGSZHhHsqkPmahBFjyqvs
	9AVnCe8H8rWlF4/iZ89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008DmM-21EK;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51V-00000008DhZ-1noM
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f6609c657so539599f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334359; x=1785939159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=pRKn9Ca6LQhPPuxU3aZWk+JCo1NuL/xjwRdy2H45aFQdC+aRjn0JDBiVRcZ8mDfbjp
         n3EM1A0AUT1w2NcdEFr41rSeIcgdxZgah4owc6WqamnC1drz3KwwQJ9JYGfvV9ZP8UxT
         pOythnWnjSOC5QcqCNNVs05k90bEqG8DCpYYOIFJ/t7srgK9GvsPwC2GB0xIcY39Towh
         umORa8IsAvPodqE1PV6m3sdQYY9boQnEMnKh8g7FIva0smWQWBdTTN1LFhDozvZ3sDHQ
         JisLH/VoLWl7G3k4HMQgjWQ24gq+IDJgi5ar6uJaYSEBTD60GIgUXB0xMLPuFT/K9J7+
         8LLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334359; x=1785939159;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKo0PbduxVqaCMeHxby+gQYFixdrgfyKcUIaMfXcM0Q=;
        b=U+8/RbcOIFJtDIMkZ0yvDMARI+SJWsapvg+OZYIPkPBZudMIV+hatGLlrhKgO6/al6
         w+IvDic1E0Rpr2FXe/9R0GwxBHDq7/wwD6mJ9Y3ljUCJVVhCkA2UokIDz4aFpxEqAaBh
         a8PTNxHym5VGoW/9jd0abiFVDKd4WjSaSGoPEXnqyytsnCaaSqr6aVUOveWab5Paxq2z
         ubwNvtjxNI90muFBjH+YNMuD7KTtadGKEkrdoyM0qstJlLZognfVSujeh0GPx1mkMHN+
         9PR1vZhCeYyLLTaEo7Wt7HB0w6hRVxg4ouLzhgCecM2+6izAQUefHfQm7wscsIq0MajY
         uY6g==
X-Forwarded-Encrypted: i=1; AHgh+RqPqIsswWmMLg/lBVxZG5XIy19lgvDuuCyeOjuH/eOihVB70QbtIwUFRzxHYDwioFzyg3ji3hPoukejI45C@lists.infradead.org
X-Gm-Message-State: AOJu0YzOrnpdX1sLznrN7/HOnkEALpe7L19fP7JYaj0pPKfGQyak+M0r
	2rDcVq4f1eRHYtC/PH2tKYAfCMKgFZpUgnHIA3h0A8wbOkrGMDxi4RXe
X-Gm-Gg: AR+sD13AT/xFTVFkyMQndKSwiotUo/bWPtrk1VyrYxi5DkZBwR8B6M94qjggxwuHtw5
	VBPtd0dIYr631qaPn5gDcrMHDMmNFwIBpJ5+l7o0NVazIEY/+a1hdjv9ZmlG9dJzqd8mHmA+3lY
	OzvZpZ/fL6zIKK458q51z2df6opP/F72WxKl1jGO78kknNWQitdiI7wYepftZhL90zrm37tGTrm
	pY/hDh5qZ2BWtQP1yWU68kTs/qi7V+qrPYOGXWlcBE7sY1VtHxnvcQKLQdx6mZFMltuF5dSBSPy
	v0npHFPZKn2IFSG687CwZQeRe+a8TBOdf2cxpc4bsAzUi0kLwy2EX4ETse8RjM0tMzj33WSPp3K
	PJtWYC0jzhku4kRx+KH2V7JQRJ/PqTbW+eIk9awaYb6DlIp5UmKmcXr3ycOHet0q7+t+2eP5w5e
	JLKjpreJyt1hv13Bs3v22pBRHLvr5YSsQbWhnGUJMFXbCpVwTps1XEnG8Q+S5eUxUPeL+V6YArR
	dA0dQ/Rbkp9hZ9vxWiUiF27nfh+H2kg
X-Received: by 2002:a05:6000:4918:b0:47f:5a97:2a5d with SMTP id ffacd0b85a97d-47fb1e5cd25mr8567174f8f.11.1785334359421;
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:39 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Wed, 29 Jul 2026 16:12:33 +0200
Message-ID: <20260729141234.65037-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071241_472259_2D339196 
X-CRM114-Status: UNSURE (   7.55  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
