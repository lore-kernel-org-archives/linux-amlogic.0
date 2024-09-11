Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F5BEE498E
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Py0GHPWo8+Kje+Cn87oTVnK9ESUqVvHMNW5gl4WBNdE=; b=nsOZCQZztxBlqL
	SpBJaocDKUhCtkD4sZjQvk/LbKMuDYUU2mMI5m9ntwZjOlaeFSaBbDUowreubqsOEHMvgt2Og5SDc
	Xc8+KSYmLMZjLjB0AhWmjsV1zeyVmoKzF010i8JFwvWUWC3gt/HzeD8AHp1NXsNdD21s2/UYyPQV0
	CklEAy5LMLpkEqN9pPiyPfSRtTMVwJDkll7qwVlTN2ijRbCz3yTVuZNs+/csOORsqszqQl+Fr4qgr
	VhFwnLUo5/67q+3O4tvhNY09IEbUB9oT7ZGl2DNqqzcEVy7b7CZILRALtO7DnXFMasUjkATHO8TjR
	8n5o+e9PTLOOb3I02lRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKT8-000000093gD-06s9;
	Wed, 11 Sep 2024 10:21:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS1-000000093IX-1WOW
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso21942765e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049992; x=1726654792; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBgjfArNf+tQB+Y+xGC4IVMaqVJgesZk0uQdlU6G5BU=;
        b=D3o4DH/injf8evp4qMOS1Guafe6LX2zNUKcHdLKJuakOHTqhbXdn+vmkgIhXnwaGTW
         iAFoOLSToKE//DpjdaNhL4po/Flbgsk0oVknz3eSkRhK82+bBLoah8DT5BBJ07LEf2Dg
         jKW7ceQB5GIAeP47eqp9rAWZmw6dqR5g0+vEPObXvCJJl/0JCpursWYuNHLHsYPUyVcU
         fejnaXGd/NXDTcS/yZF8TWHo5NZnPtNrJL8225uXFe3iyeVDWvVjc+dTf5SrB0spFnyo
         VKB5cHWU43BREfEWCQHsA90cvI2mn5mefJpdvr0FwfrXTbQJWi5OhSxuy+GJbspi/w1V
         Cunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049992; x=1726654792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBgjfArNf+tQB+Y+xGC4IVMaqVJgesZk0uQdlU6G5BU=;
        b=hP07m9W5SDvk0a/DNC+LfDaJV6syoPzE81edTbhQGc5g1voce9jepQBXzymsYQEWJG
         ZlOxiglSYX7+lMFcULDYEnM0CKXzmdL6FDBOGrNn4O/VMlT7y0PsLdBISqFGB1ZfVSgL
         nT/6v+94pWBoWGBUE7fM9MmBARi4FpUvcOeZFBc5oh98qV+TG+OybbdeLfgOJDoK/YkC
         ykyQBbbROx/kOPvpxAp3VpoJEqzRRrYOPKIbLXs0vfllxeIy+ApUnWLzl4cRoD2zAdL4
         4SvCbdtGINafrrk7g2g3QIxR3397yAiB59g2dTVXZgayGxePgy7MsgZ5WgAM35FPYeAA
         aDDg==
X-Forwarded-Encrypted: i=1; AJvYcCWrx1K5wIibK69eP/2gXp/GkMr3VnXg0/DV1AoneY479USE22EwFJThxthSJm+/FkviKbBCTynzDbt8aldc@lists.infradead.org
X-Gm-Message-State: AOJu0YwvQ/mKsZx5SAYfKPsKWDAdV1gtgn2Wr1SuUinhFGqbQzN8+SvI
	hzzS5lUoLPfNga5vONqDsMmxB5wJ1ZJRBJIyWQ6Ixg8AsU/OZ9HWU5Tz9OmZieEgSdGNewRukQR
	/
X-Google-Smtp-Source: AGHT+IFYI8jlKZGzuY9u0CzpCYUOu0Q2y8gcsagmmfBF8UnzIwxzWy4tYxCAqseqj8eP2N/gabzuoA==
X-Received: by 2002:a05:600c:b59:b0:42c:a574:636b with SMTP id 5b1f17b1804b1-42ca57465b7mr101265895e9.35.1726049991854;
        Wed, 11 Sep 2024 03:19:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:51 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:41 +0200
Subject: [PATCH 2/7] ARM: dts: amlogic: meson8: fix soc thermal-zone node
 name
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-2-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1398;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/2vnnsIqoXR4kLDR4lD5f7Rp0h0KrZ6Snh9OaBx6MNA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7CHzdAvd2vsCT27hxXjR9CtXlSV33H6GDjtIHv
 AoJv+bmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwgAKCRB33NvayMhJ0fRaEA
 CK2wLy7M6gYdXygENp7KDfVBUAT6UCoKjtUO+zkWFOnyYd4p0drrjlhZ3KrcBC12El9rKp9/9fWA0u
 M5XjCcBLj3EXh5s9q10wieofIaodBR8EyPcBu7oxNqyS4aPWSHIKjq8xBoPt83v0Xlc4R6VUj5bd5S
 3ctS7jltV6ve8VuMVv+K+5Mt7759MRQudjRhdcAC4dGzkdwQe7127eLCiKyP5u++6tNmBs1kRtQUL6
 YOR4Qc5omv46SwwRFfpo02ELLlTcZEmHnPYgPWVjbYLxJbS43m7Fssgy8+e6PpG7YhneHLLpedytUN
 OOtkF0HQHKZtgO/wggaSLH86RhT4dzpBD8mJWxETYTsIv5jodtlrThwpLda4d2Fv6sjv7Fas6JFwB9
 twjBHmYuVA+OWZKLgfvnG1PcqMmLkP7lFyJ5kaPb8X1JDayLPBr4cMo4pmRqgAXNd48H4fyFgoKyno
 W2QK7EM5HA0oenY7vIrndXRmvb9Oh1yZARIIufVv/YHJu00QwGUw7RsBWzaKHTexSIQaUWuQjkJf9t
 pgVh6ixmzEYw64EHtv+wn28nKJtygaRSwsDoDexcBY/p+v83o3dP9CrHCn9JgGEqm9eCeQ2LBlYsxr
 NospTK3tgudXbmRL/6XORdu0d6hi5szAlw2cyoXfgj7bcdHdZ7lRcnzm1lmw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031953_438030_964048C4 
X-CRM114-Status: GOOD (  11.41  )
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

Use proper name for the soc thermal, fixing:
thermal-zones: 'soc' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index f57be9ae150f..06174d8df789 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -196,7 +196,7 @@ power-firmware@4f00000 {
 	};
 
 	thermal-zones {
-		soc {
+		soc-thermal {
 			polling-delay-passive = <250>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 			thermal-sensors = <&thermal_sensor>;
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 2d9d24d3a95d..a3669025d8da 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -173,7 +173,7 @@ hwrom@0 {
 	};
 
 	thermal-zones {
-		soc {
+		soc-thermal {
 			polling-delay-passive = <250>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 			thermal-sensors = <&thermal_sensor>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
